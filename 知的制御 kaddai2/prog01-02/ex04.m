clear
close all

% ����Ώۂ̓`�B�֐��̒�`: sys
num = [1];    den = [1 3.5 3.5 1];      % ���q�E���ꑽ�������`
sys = tf(num,den);                       % �`�B�֐��̍\��

% ����Ώۂ��܂ޕ��[�v�t�B�[�h�o�b�N�V�X�e��: sys1
sys1 = feedback(sys,1);
pole(sys1);
Kp =11.25;                              % ����U����ԂƂȂ�Kp��T��
% �C���p���X����
figure(1)
impulse(feedback(Kp*sys,1)),grid

% PID����n�̓`�B�֐��̒�`: sys2
%������P0
P0=3.34;%����U����Ԃ̎���
Kp = Kp*0.6;
TI =P0*0.5; 
TD = P0*0.125;
% ���q�E���ꑽ�������`
num2 = Kp*[(TI*TD) TI 1];
den2 = [TI 0];
C = tf(num2,den2);                   % PID�����̓`�B�֐��̍\��

% �ꏄ�`�B�֐�
L = series(sys,C);
% �t�B�[�h�o�b�N�V�X�e��
sys2 =feedback(L,1);

% �ɂƗ�_�̌v�Z�i����Ώ�:sys�j
p = pole(sys);                       % �ɂ̌v�Z
z = tzero(sys);                      % ��_�̌v�Z

% �ɂƗ�_�̐}��
figure(2)
pzmap(sys,sys1,sys2),grid on;                       % �ɂƗ�_���v���b�g
legend('sys','sys1','sys2');
title('Pole-Zero Map');
xlabel('Real Axis');
ylabel('Imaginary Axis');

% �C���p���X�����̐}��(PID����n:sys2)
figure(3)
impulse(sys,sys1,sys2), grid
legend('sys','sys1','sys2');
title('Impulse Response');
xlabel('Time');
ylabel('Amplitude');

% ����n�̕]��
% �@�i�C�L�X�g���}�C����]�T
figure(4)
nyquist(sys,sys1,sys2),grid on
legend('sys','sys1','sys2');

% �A�X�e�b�v����
figure(6)
step(sys,sys1,sys2),grid on
legend('sys','sys1','sys2');
