clear
close all

%% 入力データ X とターゲットデータ T を定義
x = [-1 -1 2 2;0 5 0 5]; 
t = [-1 -1 1 1];

%% フィードフォワードネットワークを作成 
% net=newff(minmax(x),[10,1],{'tansig','purelin'},'traingd');
net=feedforwardnet(10);%引数は隠れ層のニューロンの数
%net=configure(net,0,0);

%% デフォルト訓練パラメータのうちいくつかを変更
net.trainParam.show = 50; 		% 進行を表示する間のエポック数
net.trainParam.lr = 0.01;       % 学習比
net.trainParam.epochs = 1000;     % 学習回数
net.trainParam.goal = 1e-5;     % 誤差の目標値

%% ネットワークの訓練
 	% tr: 訓練記録
[net1,tr]=train(net,x,t);
view(net1)
%% 訓練されたネットワークでシミュレート
y = sim(net1,x)

figure(1)
plot3(x(1,:),x(2,:),t,'ro'),hold on
plot3(x(1,:),x(2,:),y,'*'),grid on
xlabel('x1');ylabel('x2');zlabel('y');

i = 1;
j = 1;
for i=1:1:30
    x1 = -0.1*i+2.0;
    for j=1:1:50
        x2 = -0.1*j+5.0;
        X1(i,j) = x1;
        X2(i,j) = x2;
        Y(i,j) = sim(net1,[x1; x2]);
    end
end

% Y = sim(net,X)

figure(2)
plot3(X1,X2,Y,'*'),grid on
xlabel('x1');ylabel('x2');zlabel('y');