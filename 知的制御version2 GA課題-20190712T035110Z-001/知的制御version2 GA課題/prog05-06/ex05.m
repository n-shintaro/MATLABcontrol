%% �ÓI�ȃl�b�g���[�N�ł̒����^�P��

clear
close all

%% ���`�w(�j���[����)�̐ݒ� 
% net = newlin([1 3;1 3],1,0,0);    % �j���[�����̓��o��
net=linearlayer ; % �l�b�g���[�N�̍쐬
net= configure(net,[0;0],[0]); % �l�b�g���[�N�̍\��

net.IW{1,1} =[0 0];                     % �d�݂̏�����
net.b{1} =0                        % �o�C�A�X�̏�����
X = {[1;2] [2;1] [2;3] [3;1]};      % ���̘͂A���f�[�^��
T = {4 5 7 7};                      % �^�[�Q�b�g�̘A���f�[�^��

net.inputWeights{1,1}.learnParam.lr=0.1;    % �d�݂̌P���Ɋւ��Ċw�K���0.1�ɐݒ�
net.biases{1,1}.learnParam.lr=0.1;          % �o�C�A�X�̌P���Ɋւ��Ċw�K���0.1�ɐݒ�
[net,y,e,pf] =adapt(net,X,T) ;      % �l�b�g���[�N�𒀎��I�ɌP��
 y                     % �l�b�g���[�N�̏o��
 e                     % �l�b�g���[�N�G���[
 net.IW{1,1}                     % �P����̏d�݂̊m�F
 net.b{1}                    % �P����̃o�C�A�X�̊m�F

  y1=sim(net,X)                    % �V�~�����[�V����