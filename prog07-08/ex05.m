clear
close all

%% �t�@�C���̓ǂݍ���
load X.mat -ascii %��ԗ�
load U.mat -ascii%�������
load Y.mat -ascii%�ϑ���
load T.mat -ascii%����

%% �ǂݍ��񂾃t�@�C���̕\��
figure(1)
plot(T,X)
grid on

figure(2)
plot(T,U)
grid on

figure(3)
plot(T,Y)
grid on

%% �P���̂��߂̓��̓f�[�^�ƃ^�[�Q�b�g�f�[�^
Xnn =X' ;%NN�̓��̓f�[�^
Tnn =U'; %NN�ւ̋��t�M��(�^�[�Q�b�g�f�[�^)


%% �j���[�������f��
% net = newff(minmax(Xnn),[4,size(Tnn,1)],{'tansig','purelin'},'traingd');
% �l�b�g���[�N�̍쐬
net=layrecnet(1:2,10);%�����͉B��w�̃j���[�����̐�
%% �P���p�����[�^
net.trainParam.show = 100;
net.trainParam.lr = 0.001;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-10;
%% �P��
net = train(net, Xnn, Tnn);
view(net)
%% �V�~�����[�V����
Ynn = sim(net,Xnn);%NN�̏o�́i�������)

%% �P�����ʂ̕\��
figure(4)
plot(T,Ynn-Tnn)%���t�M����NN�̏o��(�������)���r
grid on

%% �P�����ʂ̕ۑ�
save nn_controller.mat