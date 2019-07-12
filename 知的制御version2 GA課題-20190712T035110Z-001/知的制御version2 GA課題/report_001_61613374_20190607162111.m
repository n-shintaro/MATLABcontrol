%% 61613374 中岡慎太郎
clear
close all

%% ばね・マス・ダンパ系のパラメータ
m = 10;
c = 20;
k = 100;

%% 問題2: 伝達関数の定義
num = [1];
den = [m c k];
sys = tf(num,den)

%% 問題3: 極と零点の計算
p =pole(sys)                       % 極の計算
z =tzero(sys)                       % 零点の計算

figure(1)
 pzmap(sys),grid on;                         % 極と零点をプロット

%% 問題4: ステップ応答
figure(2)
step(sys),grid on;

%% 問題5:インパルス応答
figure(3)
impulse(sys),grid on;

%% 問題6
figure(4)
bode(sys),grid on;
figure(5)
margin(sys),grid on;