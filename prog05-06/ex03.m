%% ���I�ȃl�b�g���[�N�ł̘A���I���͂��g�����V�~�����[�V����

clear
close all

%% ���`�w(�j���[����)�̐ݒ� 
% net = newlin([1 4],1,[0 1]);   % �j���[�����̓��o��

 
  
net=linearlayer([0 1],0.1)  % �l�b�g���[�N�̍쐬,��P������0�F�x���Ȃ� 1:�x������ �Ō�͊w�K��
net=configure(net,[0],[0]); % �l�b�g���[�N�̍\��
net.IW{1,1}=[1 2];           % �d�݂̐ݒ�
net.biasConnect = 0;    % �o�C�A�X�̐ݒ�

X ={1 2 3 4};                   % ���̓x�N�g���̐ݒ�

y =sim(net,X)                  % �V�~�����[�V����