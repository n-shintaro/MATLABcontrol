clear
close all

%% 分子・分母多項式を定義
b1 =1 ;
a0 =1;
a1 =1 ;
num = [b1 1];        % 分子多項式の係数
den = [1 a1 a0];     % 分母多項式の係数     

%% 伝達関数の構成
sys = tf(num,den);

%% 極の計算
p = pole(sys);

%% 零点の計算
z = tzero(sys);

%% 極と零点をプロット
figure(1);
pzmap(sys),grid on;

%% ステップ応答、インパルス応答
figure(2)
% ステップ応答の図示
% stepino ：ステップ応答の特性を出力
subplot(211), step(sys),grid on;

% インパルス応答の図示
subplot(212), impulse(sys),grid on;

%% 零点
b1=-2;
num = [b1 1];
sys1 = tf(num,den);
z1=tzero(sys);
b1=1;
num = [b1 1];
sys2 = tf(num,den);
z2=tzero(sys);
b1=2;
num = [b1 1];
sys3 = tf(num,den);
z3=tzero(sys);
b1=10;
num = [b1 1];
sys4 = tf(num,den);
z4=tzero(sys);
figure(3)
subplot(411),step(sys1),grid on;
subplot(412),step(sys2),grid on;
subplot(413),step(sys3),grid on; 
subplot(414),step(sys4),grid on;
%% 先生の回答
t=0:0.01:10;
b1=[-2 1 2 10]';
fig=4;

for i=1:4
     num=[b1(i,1) 1];
     den=[1 2 1];
     sys(i)=tf(num,den);
     figure(fig)
     pzmap(sys(i)),grid on;
     y(:,i)=step(sys(i),t);
     fig=fig+1;
end
figure(fig)
plot(t,y);grid on;
legend('a=-2','a=1','a=2','a=10');