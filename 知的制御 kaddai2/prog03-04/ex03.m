clear
close all

%% �ݖ�P�F��ԋ�ԃ��f��
%% �|���U�q�̏�ԋ�ԃ��f��(MIMO���f��)

m=0.023;    % Mass
J=3.20e-4;	% Inertia moment
L=0.2;		% Length
mu=2.74e-5;	% Damping coefficient
zeta=240;   % Physical parameter of DC motor
xi=90;		% Physical parameter of DC motor
g=9.81;     % Gravity accel.

p1=m*L/(J+m*L*L); p2=mu/(J+m*L*L);

A=[0 0 1 0;0 0 0 1;0 0 -zeta 0; 0 p1*g p1*zeta -p2];
B=[0;0;xi;-p1*xi];
C=[1 0 0 0;0 1 0 0];
D=[0;0];

% ��ԋ�ԃ��f�����쐬���A��ԁA���́A�o�͂ɖ��O��t����
states = {'z' 'th' 'dz' 'dth'}
inputs = {'cart'}
outputs ={'z','th'} 

sys_mimo = ss(A,B,C,D,'statename',states,...
                     'inputname',inputs,...
                     'outputname',outputs);
% sys_mimo�Ɠ��͂��邱�ƂŁALTI���f����\��
sys_mimo

% �֐�tf���g���āA�`�B�֐��\���𓱏o
sys_mimo_tf = tf(sys_mimo)
                 
%% �ݖ�Q�F ����n�̈��萫: ��ԕ��������̍s�� A �̌ŗL�l�i�Ɂj�𒲂ׂ�
p1 = eig(sys_mimo.a)

% �ŗL�l�̕��f���ʏ�ւ̕\��
figure(1)
plot(real(p1),imag(p1),'*'), grid on

%% �ݖ�R�F���䐫
% ���䐫: �^����ꂽ��ԋ�ԃ��f��(����Ώ�) �����䂪�ł��邩�ǂ��� �Ƃ���������\������
Uc = ctrb(sys_mimo.a,sys_mimo.b)
Uc_rank =rank(Uc); 

%% �ݖ�S�F�ɔz�u�@�ɂ���ԃt�B�[�h�o�b�N�Q�C���̐݌v
% acker: SISO�ɔz�u
% estim: �G�X�e�B���[�^�Q�C����ݒ肵�āA��ԃG�X�e�B���[�^���쐬
% place: MIMO �ɔz�u
% reg  : ��ԃt�B�[�h�o�b�N�ƃG�X�e�B���[�^�Q�C����ݒ肵�āA�o�̓t�B�[�h�o�b�N�⏞����쐬 
% �y���ӎ����z
% �d����z�u���� 
% �ア���䐫�A�ϑ����ɋɂ��ړ������܂��B����ɂ́A��ʂɁA�����Q�C����K�v�Ƃ��܂��B���Ȃ킿�A�O���ɔ��ɕq���ȑS���[�v�ŗL�\�����쐬���邱�ƂɂȂ�܂��B 

P1 = [ ];  
Kp1 = place(A,B,P1)

%% ���l�V�~�����[�V����
x0 = [0;0.1;0;0];       % �������
t = 0.0:0.005:5.0;      % �V�~�����[�V��������

% �V�~�����[�V�������ʂ̕\��
figure(2)
initial(A-B*Kp1,B,C,D,x0,t),grid on;

% ���[�v�n�̋ɔz�u�̕\��
figure(3)


%% �ݖ�T�F�œK���M�����[�^�@�ɂ���ԃt�B�[�h�o�b�N�Q�C���̐݌v
Q =
r =
KL1 = 

% �V�~�����[�V�������ʂ̕\��
figure(4)


% ���[�v�n�̋ɔz�u�̕\��
figure(5)


%% �ݖ�U�F�ϑ���
% �ϑ���: ��Ԃ�����ł��邩�ǂ����Ɋ֘A��������
Uo = 
Uo_rank =  

