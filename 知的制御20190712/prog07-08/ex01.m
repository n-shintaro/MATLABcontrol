%% 適応的ノイズキャンセル（Adaptive Noise Cancellation）
clear
close all

%% 入力とターゲットを定義
time = 1:0.01:10;
X = sin(sin(time).*time*10);
Xseq = con2seq(X);
Tseq = con2seq(2*[0 X(1:(end-1))] + X);

figure(1)
plot(time,cat(2,Xseq{:}),time,cat(2,Tseq{:}),'r--'), grid on;
title('Input and Target Signals')
xlabel('Time')
legend({'Input','Target'})

%% ネットワークの構築
% net = newlin([-3 3],1,[0 1],0.1);
net=linearlayer([0 1 2 3]);
net=configure(net,0,0);


%% ネットワークの訓練
[net,Y,E]=adapt(net,Xseq,Tseq);


%% 訓練した結果を表示-/*
figure(2)
plot(time,cat(2,Y{:}),'b', time,cat(2,Tseq{:}),'r--', time,cat(2,E{:}),'g',[1 10],[0 0],'k'), grid on;
xlabel('Time')
legend({'Output','Target','Error'})