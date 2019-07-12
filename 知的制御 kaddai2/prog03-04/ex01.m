clear
close all

%% DC���[�^�̏�ԋ�ԃ��f��(SISO���f��)
R  = 2.0   % �I�[��
L  = 0.5   % Henrys
Km = 0.015 % �g���N�萔
Kb = 0.015 % emf �萔
Kf = 0.2   % Nms
J  = 0.02  % kg.m^2/s^2

A = [-R/L -Kb/L; Km/J -Kf/J]
B = [1/L; 0];
C = [0 1];
D = [0];

% �ݖ�P�F��ԋ�ԃ��f���̍쐬
sys_dc =ss(A,B,C,D)

% �ݖ�Q
% �`�B�֐��\��
sys_tf = tf(sys_dc)

% ��_/ ��/ �Q�C���\��
sys_zpk = zpk(sys_dc)

% ���g���������f��
% frd: ���g�������f�[�^���f���ւ̕ϊ��܂��͍쐬
% SYS = FRD(RESPONSE,FREQS) �́AFREQS �̎��g���_�ł̉����f�[�^ RESPONSE ������FRD ���f�� SYS ���쐬
sys_frd = frd(sys_dc,0.5:10)

% �ݖ�R
K = [0.1 0.15 0.2]; % Several values for Km and Kb
A1 = [-R/L -K(1)/L; K(1)/J -Kf/J];
A2 = [-R/L -K(2)/L; K(2)/J -Kf/J];
A3 = [-R/L -K(3)/L; K(3)/J -Kf/J];
sys_lti(:,:,1)= ss(A1,B,C,D);
sys_lti(:,:,2)= ss(A2,B,C,D);
sys_lti(:,:,3)= ss(A3,B,C,D);

% �X�e�b�v����
figure(1)
step(sys_lti),grid on;

% �ݖ�S
% ���UDC���[�^���f��
%TS�̕��ɂ���Đ��x���قȂ�
%�������ϑ������̈��10�{
Ts = 0.001;   %���ԍ���
sysd = c2d(sys_dc,Ts);

% �A���V�X�e���Ɨ��U�V�X�e���̔�r
% �X�e�b�v����
figure(2)
step(sys_dc,'r--',sysd,'b-'), grid on;
legend('sysc','sysd')
% �{�[�h���}
figure(3)
bode(sys_dc,'r--',sysd,'b-'), grid on;
legend('sysc','sysd')

sisotool(sys_dc),grid on;