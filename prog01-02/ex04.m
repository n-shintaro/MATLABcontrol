clear
close all

% 制御対象の伝達関数の定義: sys
num = [1];    den = [1 3.5 3.5 1];      % 分子・分母多項式を定義
sys = tf(num,den);                       % 伝達関数の構成

% 制御対象を含む閉ループフィードバックシステム: sys1
sys1 = feedback(sys,1);
pole(sys1);
Kp =11.25;                              % 自励振動状態となるKpを探索
% インパルス応答
figure(1)
impulse(feedback(Kp*sys,1)),grid

% PID制御系の伝達関数の定義: sys2
%周期がP0
P0=3.34;%自励振動状態の周期
Kp = Kp*0.6;
TI =P0*0.5; 
TD = P0*0.125;
% 分子・分母多項式を定義
num2 = Kp*[(TI*TD) TI 1];
den2 = [TI 0];
C = tf(num2,den2);                   % PID制御器の伝達関数の構成

% 一巡伝達関数
L = series(sys,C);
% フィードバックシステム
sys2 =feedback(L,1);

% 極と零点の計算（制御対象:sys）
p = pole(sys);                       % 極の計算
z = tzero(sys);                      % 零点の計算

% 極と零点の図示
figure(2)
pzmap(sys,sys1,sys2),grid on;                       % 極と零点をプロット
legend('sys','sys1','sys2');
title('Pole-Zero Map');
xlabel('Real Axis');
ylabel('Imaginary Axis');

% インパルス応答の図示(PID制御系:sys2)
figure(3)
impulse(sys,sys1,sys2), grid
legend('sys','sys1','sys2');
title('Impulse Response');
xlabel('Time');
ylabel('Amplitude');

% 制御系の評価
% ①ナイキスト線図，安定余裕
figure(4)
nyquist(sys,sys1,sys2),grid on
legend('sys','sys1','sys2');

% ②ステップ応答
figure(6)
step(sys,sys1,sys2),grid on
legend('sys','sys1','sys2');
