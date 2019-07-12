% prog03_01.m

clear
close all

%% 伝達関数の形状を確認しなさい
%% purelin
figure(1)   
data=2.0;
threshold = 0.5;
plot(-data:0.01:data, purelin(-data:0.01:data,threshold),'r','linewidth',3);
axis([-data data -data data]);grid

%% hardlim
figure(2)
data=2.0;
threshold = 0.5;
plot(-data:0.01:data,hardlim(-data:0.01:data,threshold),'r','linewidth',3);
axis([-data data -data data]);grid

%% logsig
figure(3) 
data=2.0;
threshold = 0.5;
plot(-data:0.01:data,logsig(-data:0.01:data,threshold),'r','linewidth',3);
axis([-data data -data data]);grid

%% tansig
figure(4) 
data=2.0;
threshold = 0.5;
plot(-data:0.01:data,tansig(-data:0.01:data,threshold),'r','linewidth',3);
axis([-data data -data data]);grid

%% softmax
% a = softmax(n) = exp(n)/sum(exp(n))
figure(5) 
n = [0.5; 1; -0.5; 0.5];
a = softmax(n);
subplot(2,1,1), bar(n), ylabel('n'), grid on;
subplot(2,1,2), bar(a), ylabel('a'), grid on;