%% ���I�ȃl�b�g���[�N�ł̒����^�P��

clear
close all

%% ���`�w(�j���[����)�̐ݒ�
% net = newlin([-1 1],1,[0 1],0.1);   % �j���[�����̓��o��, �w�K��: 0.1
net=linearlayer([0 1],0.1) ; % �l�b�g���[�N�̍쐬
net= configure(net,[0],[0]); % �l�b�g���[�N�̍\��



net.IW{1,1} = [0 0];         % �d�݂̏�����
net.biasConnect = 0;         % �o�C�A�X�̏�����
Xi ={1} ;                       % �x���̏��������̐ݒ�
X ={2 3 4} ;                        % ���̘͂A���f�[�^��
T ={3 5 7} ;                        % �^�[�Q�b�g�̘A���f�[�^��
[net,y,e,pf] = adapt(net,X,T,Xi)

y                         % �l�b�g���[�N�̏o��
e                         % �l�b�g���[�N�G���[
net.IW{1,1}                         % �P����̏d�݂̊m�F
