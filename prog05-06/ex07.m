%% 静的なネットワークでのバッチ型訓練
clear
close all

%% 線形層(ニューロン)の設定
% net = newlin([1 3;1 3],1,0,0.01);	% ニューロンの入出力
net=linearlayer % ネットワークの作成
net= configure(net,[0;0],[0]);  % ネットワークの構成

net.IW{1,1} = [0 0];                % 重みの初期化
net.b{1} = 0;                       % バイアスの初期化

% adaptを使った静的なネットワークのバッチ型訓練では、入力ベクトルは同時ベクトルからなる1つの行列に設定されなければなりません。 
X = [1 2 2 3; 2 1 3 1];             % 入力の連続データ列
T = [4 4 9 2];                      % ターゲットの連続データ列


%% trainは、入力の形式に関係なく常にバッチ型訓練を行う

%net.IW{1,1} = [0 0];                % 重みの初期化
%net.b{1} = 0;                       % バイアスの初期化
net.trainParam.epochs = 10000           % 学習回数を設定
net = train(net,X,T);               % ネットワークのバッチ型訓練

                         % ネットワークの出力
                         % ネットワークエラー
 net.IW{1,1}                        % 訓練後の重みの確認
 net.b{1}                        % 訓練後のバイアスの確認

Y =  sim(net,X)                   % 訓練後のネットワークのシミュレーション