%% �ÓI�ȃl�b�g���[�N�ł̃o�b�`�^�P��
clear
close all

%% ���`�w(�j���[����)�̐ݒ�
% net = newlin([1 3;1 3],1,0,0.01);	% �j���[�����̓��o��
net=linearlayer % �l�b�g���[�N�̍쐬
net= configure(net,[0;0],[0]);  % �l�b�g���[�N�̍\��

net.IW{1,1} = [0 0];                % �d�݂̏�����
net.b{1} = 0;                       % �o�C�A�X�̏�����

% adapt���g�����ÓI�ȃl�b�g���[�N�̃o�b�`�^�P���ł́A���̓x�N�g���͓����x�N�g������Ȃ�1�̍s��ɐݒ肳��Ȃ���΂Ȃ�܂���B 
X = [1 2 2 3; 2 1 3 1];             % ���̘͂A���f�[�^��
T = [4 4 9 2];                      % �^�[�Q�b�g�̘A���f�[�^��


%% train�́A���͂̌`���Ɋ֌W�Ȃ���Ƀo�b�`�^�P�����s��

%net.IW{1,1} = [0 0];                % �d�݂̏�����
%net.b{1} = 0;                       % �o�C�A�X�̏�����
net.trainParam.epochs = 10000           % �w�K�񐔂�ݒ�
net = train(net,X,T);               % �l�b�g���[�N�̃o�b�`�^�P��

                         % �l�b�g���[�N�̏o��
                         % �l�b�g���[�N�G���[
 net.IW{1,1}                        % �P����̏d�݂̊m�F
 net.b{1}                        % �P����̃o�C�A�X�̊m�F

Y =  sim(net,X)                   % �P����̃l�b�g���[�N�̃V�~�����[�V����