clear
close all

% �`�B�֐��̒�`
num = [1 1];    den = [1 1 1];  % ���q�E���ꑽ�������`
sys = tf(num,den);                   % �`�B�֐��̍\��

% �ɂƗ�_�̌v�Z
p = pole(sys)                       % �ɂ̌v�Z
z = tzero(sys)                      % ��_�̌v�Z

% �ɂƗ�_�̐}��
pzmap(sys)                          % �ɂƗ�_���v���b�g
title('Pole-Zero Map');
xlabel('Real Axis');
ylabel('Imaginary Axis');

% ���[�v���g���`�B�֐��̓����l�̌v�Z
w=logspace(-1,1,500);            % ���W�A��/�b�Ŏw�肵�����g���x�N�g��

figure(2)
 [mag,phase,w] =bode(num,den,w);            % Bode ���}���v�Z�A�쐬
                                     % mag: �Q�C��, phase: �x�P�ʂł̈ʑ��̉���, w: ���g���̃x�N�g��
 semilogx(w,mag)                                 
% xlabel('Frequency(rad/sec)');
% ylabel('Magnitude');
[y,L]=max(mag);
w_list=find(mag<0.707);
wb =w(w_list(1))        % �o���h��(band width)
Mp =y        % �s�[�N�Q�C��(peak gain)
%y=getPeakGain(sys)�ł�OK
Mpfunction=getPeakGain(sys)
wp =w(L)        % ���U���g��(resonance frequency)