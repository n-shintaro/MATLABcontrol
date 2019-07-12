clear
close all

%% シミュレーション用パラメータ
t = 0:0.01:2;
w = logspace(-1,3,100);

%% 制御対象のパラメータ
M = 0.390;  % アームの質量
J = 0.0712; % 慣性モーメント
c = 0.695;  % 軸の粘性摩擦係数
l = 0.204;  % アームの軸から重心までの距離
g = 9.81;   % 重力加速度

%% 伝達関数の定義
num = [J c M*l*g];  
den = [1];
sys = tf(num,den);

%% 補償機のゲイン
Kp1 = 1;
Kp2 = 5.8;
Kp3 = 20;

%% 問題1: ゲイン余裕、位相余裕
figure(1)   % Kp1 = 1

figure(2)   % Kp2 = 5.8

figure(3)   % Kp3 = 20


%% フィードバックシステム
sysT1 = ;
sysS1 = 1-sysT1;
GainT1 = ;
GainS1 = ;

sysT2 = ;
sysS2 = 1-sysT2;
GainT2 = ;
GainS2 = ;

sysT3 = ;
sysS3 = 1-sysT3;
GainT3 = ;
GainS3 = ;

%% 問題2: ステップ応答
figure(4);
step(sysT1,sysT2,sysT3,t)
legend('Kp=1','Kp=5.8','Kp=20')

%% 問題3: 感度関数
figure(5)
semilogx(w,GainS1,w,GainS2,w,GainS3); grid;
xlabel('frequency [rad/s]')
ylabel('Gain [dB]')
legend('Kp=1','Kp=5.8','Kp=20')

%% 問題4: 相補感度関数
figure(6)
semilogx(w,GainT1,w,GainT2,w,GainT3); grid;
xlabel('frequency [rad/s]')
ylabel('Gain [dB]')
legend('Kp=1','Kp=5.8','Kp=20')