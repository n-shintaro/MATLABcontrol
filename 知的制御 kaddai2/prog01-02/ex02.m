% 分子・分母多項式を定義
num = [1 1];
den =[1 2 1];      

% 伝達関数の構成
sys = tf(num,den);

% 周波数応答の計算
% 時間の設定
t1 = 0:1:400;
t2 = 0:0.05:60;

u1 = sin(0.1 * t1);
u2 = sin(t2);

figure(3)
subplot(221), plot(t1,u1),grid on;
subplot(222), lsim(sys,u1,t1),grid on;
subplot(223), plot(t2,u2),grid on;
subplot(224), lsim(sys,u2,t2),grid on;

% ボード線図
figure(4)
bode(sys),grid on;

figure(5)
margin(sys),grid on;

% ナイキスト線図
figure(6)
nyquist(sys),grid on;