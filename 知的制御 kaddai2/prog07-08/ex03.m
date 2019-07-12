clear
close all

%% Elman�l�b�g���[�N
[X,T] = simpleseries_dataset;%Matlab�p�ӂ���Ă���f�[�^�Z�b�g��ǂݍ���
net=elmannet(1:2,10)% �l�b�g���[�N�̍쐬
[Xs,Xi,Ai,Ts]=preparets(net,X,T);%�w�K�p�̓��͂���у^�[�Q�b�g�̎��n��f�[�^�̏���
net = train(net,Xs,Ts,Xi,Ai);
view(net)
Y = net(Xs,Xi,Ai);
perf = perform(net,Ts,Y)

figure(1)
plot(cell2mat(T(1,3:100)), 'k-o'), grid on; hold on;
plot(cell2mat(Y),'r-*'), grid on;
legend('dataset','nn')

%% ���Ԓx��j���[���� �l�b�g���[�N
Xnew = X(81:100);
X = X(1:80);
T = T(1:80);

net=timedelaynet(1:2,10)% �l�b�g���[�N�̍쐬
[Xs,Xi,Ai,Ts]=preparets(net,X,T);%�w�K�p�̓��͂���у^�[�Q�b�g�̎��n��f�[�^�̏���
% �l�b�g���[�N�̍\��
net = train(net,Xs,Ts,Xi,Ai);
view(net) %�l�b�g���[�N�̍\����\��


[Y,Xf,Af] = net(Xs,Xi,Ai);
perf = perform(net,Ts,Y);

[netc,Xic,Aic] = closeloop(net,Xf,Af);
view(netc)

figure(2)
plot(cell2mat(T(1,3:80)), 'k-o'), grid on; hold on;
plot(cell2mat(Y),'r-*'), grid on;
legend('dataset','nn')

%% �w�ċA�^�j���[���� �l�b�g���[�N
net=layrecnet(1:2,10)% �l�b�g���[�N�̍쐬
[Xs,Xi,Ai,Ts]=preparets(net,X,T);%�w�K�p�̓��͂���у^�[�Q�b�g�̎��n��f�[�^�̏���

net = train(net,Xs,Ts,Xi,Ai);
view(net)
Y = net(Xs,Xi,Ai);
perf = perform(net,Y,Ts)

figure(3)
plot(cell2mat(T(1,3:80)), 'k-o'), grid on; hold on;
plot(cell2mat(Y),'r-*'), grid on;
legend('dataset','nn')

