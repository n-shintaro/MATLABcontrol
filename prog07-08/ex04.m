clear
close all

%% 設問１：状態空間モデル
%% 倒立振子の状態空間モデル(MIMOモデル)

% m=0.023;      % Mass
% J=3.20e-4;	% Inertia moment
% L=0.2;		% Length
% mu=2.74e-5;	% Damping coefficient
% zeta=240;     % Physical parameter of DC motor
% xi=90;		% Physical parameter of DC motor
% g=9.81;       % Gravity accel.
% 
% p1=m*L/(J+m*L*L); p2=mu/(J+m*L*L);
% 
% A=[0 0 1 0;0 0 0 1;0 0 -zeta 0; 0 p1*g p1*zeta -p2];
% B=[0;0;xi;-p1*xi];
% C=[1 0 0 0;0 1 0 0];
% D=[0;0];

A=[0 0 1 0;0 0 0 1;0 0 -240 0;0 36.39 890.32 -0.022];
B=[0;0;90;-333.87];
C=[0 1 0 0;0 0 0 1];
D=[0;0];

% % 状態空間モデルを作成し、状態、入力、出力に名前を付ける
% states = {'x' 'th' 'dx' 'dth'};
% inputs = {'cart'};
% outputs = {'x' 'th'};
                
%% 設問５：最適レギュレータ法による状態フィードバックゲインの設計
% 閉ループ極
Q=diag([10,1,1,1]);
r=10;
K=lqr(A,B,Q,r);
eig(A-B*K)

%% 数値シミュレーション
x0=[0;0.5;0;0];%初期状態
t=0.0:0.005:1.5;
tsize = size(t,2);

sys = ss(A-B*K,B,C,D);
[Y,T,X] = initial(sys,x0,t);%数値シミュレーション
tsize = size(t,2);
for j=1:tsize
    U(j,1) = 0;
    for i=1:4
        U(j,1) = U(j,1) - K(1,i)*X(j,i);
    end
end

%% 結果の表示
figure(1)
plot(T,X)
legend('x', 'th', 'dx', 'dth');
xlabel('time [s]')
grid on

figure(2)
plot(T,U)
legend('input');
xlabel('time [s]')
grid on

figure(3)
plot(T,Y)
legend('th', 'dth');
xlabel('time [s]')
grid on

%% データの保存

save X.mat X -ascii %状態量
save U.mat U -ascii %制御入力
save Y.mat Y -ascii %観測量
save T.mat T -ascii %時間
