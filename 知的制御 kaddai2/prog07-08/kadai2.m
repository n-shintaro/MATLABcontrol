clear all
clc
%% data�̓ǂݍ���
Xnn=zeros(388,4);
Tnn=zeros(388,2);
data=csvread('data.csv');
for i=1:388
    Xnn(i,:)=[data(i,1),data(i,2),data(i+1,1),data(i+1,2)];
    Tnn(i,:)=data(i+2,:);
end
%% network�̍\��
net=layrecnet(1:2,10)% �l�b�g���[�N�̍쐬
net.trainParam.show = 1000;
net.trainParam.lr = 0.001;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-10;
net= train(net, Xnn', Tnn');
view(net);
%% �V�~�����[�V����
Ynn = sim(net,Xnn');
figure(1)
plot(1:388,Ynn-Tnn')%���t�M����NN�̏o��(�������)���r
%% �P�����ʂ̕ۑ�
save nn_controller.mat