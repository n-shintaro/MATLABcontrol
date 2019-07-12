% ga_main_program.m

clear
close all
global  bound rng
%% �p�����[�^�̏������@Initializing parameters
pops=10;                      % �̐� population size
maxgen=100;                   % ���㐔 maximum generation �i�I�������̈�j
crossp=0.8;                   % �����m�� crossover probability
mutatep=0.35;                 % �ˑR�ψيm�� mutation probability
%�ǂ������Ă��悢
bound=[-1 1;-1 1];
%bound =
%    -1     1
%    -1     1
numvar=size(bound,1);         % ���F�̂̒��� chromosome length (number of variables)
% numvar = 2
rng=(bound(:,2)-bound(:,1))'; % �ϐ��͈̔� variable range
% rng = 2  2

%.................population initialization.................

pop=zeros(pops,numvar);       % �̂̏����� pop = initial population
%�l���̂ɓ����@���������t����K�v������
%pop�͌̌Q
pop(:,1:numvar)=(ones(pops,1)*rng).*(rand(pops,numvar))+(ones(pops,1)*bound(:,1)'); % �̂̐���

%%
%......................����̊J�n start generation......................
for it=1:maxgen
     fpop=multipeak(pop);% �֐�multipeak�̌Ăяo���Afpop:�K���x
%�K���x���ő�̂���G���[�g�ɂ���
    [cs,inds]=max(fpop); % �G���[�g for elitism, cs:maximum value, inds: max index
%�G���[�g��bchrom�ɕۑ�
    bchrom=pop(inds,:);  % �G���[�g�̒l�̊i�[ size(pop)=10 2�̒�����fpop�̒l���ő�ƂȂ�̂�bchrom�Ɋi�[
      
    % �I��........tournamet selection
    toursize=5;              % tournament size
    % 5�l�̃v���[���[�������_���ɑI��œK���x���ő�̂��̂�I�����g�[�i�����g�헪
    
    players=ceil(pops*rand(pops,toursize));     % CEIL:���̖���������ւ̊ۂ�
    % pops*rand(pops,toursize)��10�~5�̍s��𗐐��ŕԂ�
    scores=fpop(players);%�I�����ꂽplayer�̓K���x��scores�Ɋi�[
    
    [a,m]=max(scores');

    % a(size: 1, pops): �e�s�̍ő�l�Cm(size: 1, pops): �C���f�b�N�X
    pind=zeros(1,pops);

    for i=1:pops
        pind(i)=players(i,m(i));    % �e�s�̍ő�l��pind�Ɋi�[
        parent(i,:)=pop(pind(i),:); % �e�̑I��
    end
    
    % ����...............crossover
    %cross�͊m��
    child=cross(parent,crossp); 

    % �ˑR�ψ�................mutation
    pop=mutate(child,mutatep);
     %�w�K���ʂ�`�悷�邽��figure�Q�ɕK�v�ȏ��
    mm=multipeak(pop);              % �e�l��mm�Ɋi�[
    maxf(it)=max(mm);               % �ő�l��maxf�Ɋi�[
    meanf(it)=mean(mm);             % MEAN: �z��̕��ϒl
    
    [bfit,bind]=max(mm);  % bfit=best fitness & bind=best fitness index
    bsol=pop(bind,:);
    
    % �}�̍쐬.....................plotting 3D surface....................
    %figure1(71-86�s��)
    [x,y]=meshgrid([-1:0.05:1]);
    r=sqrt(x.^2+y.^2);
    s=sqrt((x-0.5).^2+y.^2);
    ss=sqrt((x-0.8).^2+y.^2);
    fff=exp(-2*r.^2)+2*exp(-1000*s.^2)+3*exp(-1000*ss.^2);
    cla
    mesh(x,y,fff),hold on
    % �e�̂̒l���v���b�g....................plot all the points.............................
    plot3( pop(:,1),pop(:,2),mm,'r+');
    % �K���x�̍����̂̒l���v���b�g...................plot the optimum point.........................
    plot3( bsol(1),bsol(2),bfit,'md');%hold on
    axis([-1.5 ,1.5,-1.5 ,1.5])
    xlabel(bsol(1))
    ylabel(bsol(2))
    zlabel(bfit)
    title(['Generation=',num2str(it)])
    pause(0)
    %................................elitism.......................
   %�G���[�g�����Ƃɖ߂�
    pop(inds,:)=bchrom;         % �G���[�g�ۑ��@
    %�Ō�̓G���[�g�����݂̂�ۑ�����΂����̂�bchrom��ۑ��˕ۑ��������F�̂𐶐����f���Ƃ��ė��p
    %bchrom��������������̂݃f�[�^�Ƃ��ĕۑ�������������
    %..............................................................
end
disp(['x=',num2str(bsol(1))])       %  NUM2STR   ���l�𕶎���ɕϊ�
disp(['y=',num2str(bsol(2))])
disp(['z=',num2str(bfit)])
%...............................End generation.........................
figure, plot(maxf), hold on, plot(meanf,'r-');
xlabel('generation')
ylabel('fitness')
title('fitness preogress')
legend('maximum fintness','meanftness')
