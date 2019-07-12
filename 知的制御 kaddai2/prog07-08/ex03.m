clear
close all

%% Elmanネットワーク
[X,T] = simpleseries_dataset;%Matlab用意されているデータセットを読み込む
net=elmannet(1:2,10)% ネットワークの作成
[Xs,Xi,Ai,Ts]=preparets(net,X,T);%学習用の入力およびターゲットの時系列データの準備
net = train(net,Xs,Ts,Xi,Ai);
view(net)
Y = net(Xs,Xi,Ai);
perf = perform(net,Ts,Y)

figure(1)
plot(cell2mat(T(1,3:100)), 'k-o'), grid on; hold on;
plot(cell2mat(Y),'r-*'), grid on;
legend('dataset','nn')

%% 時間遅れニューラル ネットワーク
Xnew = X(81:100);
X = X(1:80);
T = T(1:80);

net=timedelaynet(1:2,10)% ネットワークの作成
[Xs,Xi,Ai,Ts]=preparets(net,X,T);%学習用の入力およびターゲットの時系列データの準備
% ネットワークの構成
net = train(net,Xs,Ts,Xi,Ai);
view(net) %ネットワークの構成を表示


[Y,Xf,Af] = net(Xs,Xi,Ai);
perf = perform(net,Ts,Y);

[netc,Xic,Aic] = closeloop(net,Xf,Af);
view(netc)

figure(2)
plot(cell2mat(T(1,3:80)), 'k-o'), grid on; hold on;
plot(cell2mat(Y),'r-*'), grid on;
legend('dataset','nn')

%% 層再帰型ニューラル ネットワーク
net=layrecnet(1:2,10)% ネットワークの作成
[Xs,Xi,Ai,Ts]=preparets(net,X,T);%学習用の入力およびターゲットの時系列データの準備

net = train(net,Xs,Ts,Xi,Ai);
view(net)
Y = net(Xs,Xi,Ai);
perf = perform(net,Y,Ts)

figure(3)
plot(cell2mat(T(1,3:80)), 'k-o'), grid on; hold on;
plot(cell2mat(Y),'r-*'), grid on;
legend('dataset','nn')

