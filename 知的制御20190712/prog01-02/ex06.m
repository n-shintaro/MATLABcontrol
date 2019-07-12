clear
close all

%% �V�~�����[�V�����p�p�����[�^
t = 0:0.01:2;
w = logspace(-1,3,100);

%% ����Ώۂ̃p�����[�^
M = 0.390;  % �A�[���̎���
J = 0.0712; % �������[�����g
c = 0.695;  % ���̔S�����C�W��
l = 0.204;  % �A�[���̎�����d�S�܂ł̋���
g = 9.81;   % �d�͉����x

%% �`�B�֐��̒�`
num = [J c M*l*g];  
den = [1];
sys = tf(num,den);

%% �⏞�@�̃Q�C��
Kp1 = 1;
Kp2 = 5.8;
Kp3 = 20;

%% ���1: �Q�C���]�T�A�ʑ��]�T
figure(1)   % Kp1 = 1

figure(2)   % Kp2 = 5.8

figure(3)   % Kp3 = 20


%% �t�B�[�h�o�b�N�V�X�e��
sysT1 = ;
sysS1 = 1-sysT1;
GainT1 = ;
GainS1 = ;

sysT2 = ;
sysS2 = 1-sysT2;
GainT2 = ;
GainS2 = ;

sysT3 = ;
sysS3 = 1-sysT3;
GainT3 = ;
GainS3 = ;

%% ���2: �X�e�b�v����
figure(4);
step(sysT1,sysT2,sysT3,t)
legend('Kp=1','Kp=5.8','Kp=20')

%% ���3: ���x�֐�
figure(5)
semilogx(w,GainS1,w,GainS2,w,GainS3); grid;
xlabel('frequency [rad/s]')
ylabel('Gain [dB]')
legend('Kp=1','Kp=5.8','Kp=20')

%% ���4: ���⊴�x�֐�
figure(6)
semilogx(w,GainT1,w,GainT2,w,GainT3); grid;
xlabel('frequency [rad/s]')
ylabel('Gain [dB]')
legend('Kp=1','Kp=5.8','Kp=20')