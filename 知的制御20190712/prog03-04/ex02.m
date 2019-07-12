% �����F
% �w�Дԍ��F

clear
close all

%% �ݖ�P�F��ԋ�ԃ��f���̍쐬�A�܂��̓��f������ԋ�ԃ��f���ɕϊ�
sys_tf=tf([100],[1 1 100]);
sys=ss(sys_tf);
%% �ݖ�Q�F����n�̈��萫: ��ԕ��������̍s�� A �̌ŗL�l�i�Ɂj�𒲂ׂ�p1=
p1=eig(sys.a)
figure(1)
plot(real(p1),imag(p1),'k*')
legend('sys')
%% �ݖ�R�F���䐫 %%
% ���䐫: �^����ꂽ��ԋ�ԃ��f��(����Ώ�) �����䂪�ł��邩�ǂ��� �Ƃ���������\������
rank(ctrb(sys.a,sys.b))


%% �ݖ�S�FLQ �œK���Q�C��K �̐݌v
% LQRY: �o�͂ɏd�݂�^�������`2���`�����M�����[�^��݌v
% K = lqry(sys,10,1) % u = -Kx�́AJ(u)���ŏ��ɂ���
Q=diag([10 1]);
r=1;
%���U�n��LQR��lqr
K=lqr(sys.a,sys.b,Q,r)

%% �ݖ�T�F���[�v�n�̌ŗL�l(��)�𒲂ׁA����n�̈��萫��]�����Ȃ���
figure(2)
plot(real(p1),imag(p1),'k*'),grid on;hold on;
plot(eig(sys.a-sys.b*K),'r*'),grid on;
legend('sys','clsys')

%% �ݖ�U�F�ϑ���
% �ϑ���: ��Ԃ�����ł��邩�ǂ����Ɋ֘A��������
rank(obsv(sys.a,sys.c))
