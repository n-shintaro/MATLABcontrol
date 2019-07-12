clear
close all

%% ���̓f�[�^ X �ƃ^�[�Q�b�g�f�[�^ T ���`
x = [-1 -1 2 2;0 5 0 5]; 
t = [-1 -1 1 1];

%% �t�B�[�h�t�H���[�h�l�b�g���[�N���쐬 
% net=newff(minmax(x),[10,1],{'tansig','purelin'},'traingd');
net=feedforwardnet(10);%�����͉B��w�̃j���[�����̐�
%net=configure(net,0,0);

%% �f�t�H���g�P���p�����[�^�̂�����������ύX
net.trainParam.show = 50; 		% �i�s��\������Ԃ̃G�|�b�N��
net.trainParam.lr = 0.01;       % �w�K��
net.trainParam.epochs = 1000;     % �w�K��
net.trainParam.goal = 1e-5;     % �덷�̖ڕW�l

%% �l�b�g���[�N�̌P��
 	% tr: �P���L�^
[net1,tr]=train(net,x,t);
view(net1)
%% �P�����ꂽ�l�b�g���[�N�ŃV�~�����[�g
y = sim(net1,x)

figure(1)
plot3(x(1,:),x(2,:),t,'ro'),hold on
plot3(x(1,:),x(2,:),y,'*'),grid on
xlabel('x1');ylabel('x2');zlabel('y');

i = 1;
j = 1;
for i=1:1:30
    x1 = -0.1*i+2.0;
    for j=1:1:50
        x2 = -0.1*j+5.0;
        X1(i,j) = x1;
        X2(i,j) = x2;
        Y(i,j) = sim(net1,[x1; x2]);
    end
end

% Y = sim(net,X)

figure(2)
plot3(X1,X2,Y,'*'),grid on
xlabel('x1');ylabel('x2');zlabel('y');