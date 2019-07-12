%% 61613374 �����T���Y
clear
close all

%% �΂ˁE�}�X�E�_���p�n�̃p�����[�^
m = 10;
c = 20;
k = 100;

%% ���2: �`�B�֐��̒�`
num = [1];
den = [m c k];
sys = tf(num,den)

%% ���3: �ɂƗ�_�̌v�Z
p =pole(sys)                       % �ɂ̌v�Z
z =tzero(sys)                       % ��_�̌v�Z

figure(1)
 pzmap(sys),grid on;                         % �ɂƗ�_���v���b�g

%% ���4: �X�e�b�v����
figure(2)
step(sys),grid on;

%% ���5:�C���p���X����
figure(3)
impulse(sys),grid on;

%% ���6
figure(4)
bode(sys),grid on;
figure(5)
margin(sys),grid on;