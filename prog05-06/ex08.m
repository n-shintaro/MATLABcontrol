%% ���I�ȃl�b�g���[�N�ł̃o�b�`�^�P��
clear
close all

%% ���`�w(�j���[����)�̐ݒ�
% net = newlin([-1 1],1,[0 1],0.02);  % �j���[�����̓��o��, �w�K���0.02�ɐݒ�
net=linearlayer([0 1],0.01); % �l�b�g���[�N�̍쐬
net= configure(net,[0],[0]); % �l�b�g���[�N�̍\��
net.IW{1,1}=[0 0];                  % �d�݂̏�����
net.biasConnect=0;                  % �o�C�A�X�̏�����
net.trainParam.epochs = 10000;          % �w�K��

Xi = {1};                           % �x���̏�����Ԃ̐ݒ�
X = {2 3 4};                        % ���̘͂A���f�[�^��
T = {3 5 7};                        % �^�[�Q�b�g�̘A���f�[�^��

net=train(net,X,T,Xi);              % �l�b�g���[�N�̃o�b�`�^�P��

                         % �P����̏d�݂̊m�F
                         % �P����̃o�C�A�X�̊m�F

X = {1 2 3 4};
Y =sim(net,X)                     % �P����̃l�b�g���[�N�̃V�~�����[�V����