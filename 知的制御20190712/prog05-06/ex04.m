clear
close all

% 2�v�f����Ȃ���̓x�N�g�������P�j���[����
% net = newp([-2 2;-2 2],1);
net=perceptron;  % �l�b�g���[�N�̍쐬(���`�̃l�b�g���[�N�A�������֐��������`)
net=configure(net,[0;0],[0]);  % �l�b�g���[�N�̍쐬,���́A�o��
  % �l�b�g���[�N�̍\��

% �Ȍ��ɂ��邽�߁A�o�C�A�X��0�ɐݒ肵�A�d�݂�1��-0.8�ɐݒ� 
net.b{1} = [0];
w = [1 -0.8];%���ϐ��ɓ��ꂽ���狁�߂�
net.IW{1,1} = w;
% inputweights = net.inputweights{1,1}
% biases = net.biases{1}

x = [1; 2];         % ����
t = [1];            % �^�[�Q�b�g

y = sim(net,x)      % �o�͂��v�Z
e = t-y             % �덷���v�Z

dw = learnp(w,x,[],[],[],[],e,[],[],[],[],[])     % �d�݂̕ω��� 

w = w + dw                                  % �X�V��̐V�����d��
net.IW{1,1} = w; %�X�V��̐V�����d�݂�p���ăl�b�g���[�N�̏d�݂��X�V
y1 = sim(net,x)      % �o�͂��v�Z
e = t-y1            % �덷���v�Z
