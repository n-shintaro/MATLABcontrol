clear
close all

%% ���q�E���ꑽ�������`
b1 =1 ;
a0 =1;
a1 =1 ;
num = [b1 1];        % ���q�������̌W��
den = [1 a1 a0];     % ���ꑽ�����̌W��     

%% �`�B�֐��̍\��
sys = tf(num,den);

%% �ɂ̌v�Z
p = pole(sys);

%% ��_�̌v�Z
z = tzero(sys);

%% �ɂƗ�_���v���b�g
figure(1);
pzmap(sys),grid on;

%% �X�e�b�v�����A�C���p���X����
figure(2)
% �X�e�b�v�����̐}��
% stepino �F�X�e�b�v�����̓������o��
subplot(211), step(sys),grid on;

% �C���p���X�����̐}��
subplot(212), impulse(sys),grid on;

%% ��_
b1=-2;
num = [b1 1];
sys1 = tf(num,den);
z1=tzero(sys);
b1=1;
num = [b1 1];
sys2 = tf(num,den);
z2=tzero(sys);
b1=2;
num = [b1 1];
sys3 = tf(num,den);
z3=tzero(sys);
b1=10;
num = [b1 1];
sys4 = tf(num,den);
z4=tzero(sys);
figure(3)
subplot(411),step(sys1),grid on;
subplot(412),step(sys2),grid on;
subplot(413),step(sys3),grid on; 
subplot(414),step(sys4),grid on;
%% �搶�̉�
t=0:0.01:10;
b1=[-2 1 2 10]';
fig=4;

for i=1:4
     num=[b1(i,1) 1];
     den=[1 2 1];
     sys(i)=tf(num,den);
     figure(fig)
     pzmap(sys(i)),grid on;
     y(:,i)=step(sys(i),t);
     fig=fig+1;
end
figure(fig)
plot(t,y);grid on;
legend('a=-2','a=1','a=2','a=10');