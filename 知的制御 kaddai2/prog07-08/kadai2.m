clear all
clc
%% dataの読み込む
Xnn=zeros(388,4);
Tnn=zeros(388,2);
data=csvread('data.csv');
for i=1:388
    Xnn(i,:)=[data(i,1),data(i,2),data(i+1,1),data(i+1,2)];
    Tnn(i,:)=data(i+2,:);
end
%% networkの構成
net=layrecnet(1:2,10)% ネットワークの作成
net.trainParam.show = 1000;
net.trainParam.lr = 0.001;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-10;
net= train(net, Xnn', Tnn');
view(net);
%% シミュレーション
Ynn = sim(net,Xnn');
figure(1)
plot(1:388,Ynn-Tnn')%教師信号とNNの出力(制御入力)を比較
%% 訓練結果の保存
save nn_controller.mat