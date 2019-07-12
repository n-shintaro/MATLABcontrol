clear
close all

%% ファイルの読み込み
load X.mat -ascii %状態量
load U.mat -ascii%制御入力
load Y.mat -ascii%観測量
load T.mat -ascii%時間

%% 読み込んだファイルの表示
figure(1)
plot(T,X)
grid on

figure(2)
plot(T,U)
grid on

figure(3)
plot(T,Y)
grid on

%% 訓練のための入力データとターゲットデータ
Xnn =X' ;%NNの入力データ
Tnn =U'; %NNへの教師信号(ターゲットデータ)


%% ニューロンモデル
% net = newff(minmax(Xnn),[4,size(Tnn,1)],{'tansig','purelin'},'traingd');
% ネットワークの作成
net=layrecnet(1:2,10);%引数は隠れ層のニューロンの数
%% 訓練パラメータ
net.trainParam.show = 100;
net.trainParam.lr = 0.001;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-10;
%% 訓練
net = train(net, Xnn, Tnn);
view(net)
%% シミュレーション
Ynn = sim(net,Xnn);%NNの出力（制御入力)

%% 訓練結果の表示
figure(4)
plot(T,Ynn-Tnn)%教師信号とNNの出力(制御入力)を比較
grid on

%% 訓練結果の保存
save nn_controller.mat