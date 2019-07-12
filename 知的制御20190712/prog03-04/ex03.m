clear
close all

%% 設問１：状態空間モデル
%% 倒立振子の状態空間モデル(MIMOモデル)

m=0.023;    % Mass
J=3.20e-4;	% Inertia moment
L=0.2;		% Length
mu=2.74e-5;	% Damping coefficient
zeta=240;   % Physical parameter of DC motor
xi=90;		% Physical parameter of DC motor
g=9.81;     % Gravity accel.

p1=m*L/(J+m*L*L); p2=mu/(J+m*L*L);

A=[0 0 1 0;0 0 0 1;0 0 -zeta 0; 0 p1*g p1*zeta -p2];
B=[0;0;xi;-p1*xi];
C=[1 0 0 0;0 1 0 0];
D=[0;0];

% 状態空間モデルを作成し、状態、入力、出力に名前を付ける
states = {'z' 'th' 'dz' 'dth'}
inputs = {'cart'}
outputs ={'z','th'} 

sys_mimo = ss(A,B,C,D,'statename',states,...
                     'inputname',inputs,...
                     'outputname',outputs);
% sys_mimoと入力することで、LTIモデルを表示
sys_mimo

% 関数tfを使って、伝達関数表現を導出
sys_mimo_tf = tf(sys_mimo)
                 
%% 設問２： 制御系の安定性: 状態方程式中の行列 A の固有値（極）を調べる
p1 = eig(sys_mimo.a)

% 固有値の複素平面上への表示
figure(1)
plot(real(p1),imag(p1),'*'), grid on

%% 設問３：可制御性
% 可制御性: 与えられた状態空間モデル(制御対象) が制御ができるかどうか という性質を表すもの
Uc = ctrb(sys_mimo.a,sys_mimo.b)
Uc_rank =rank(Uc); 

%% 設問４：極配置法による状態フィードバックゲインの設計
% acker: SISO極配置
% estim: エスティメータゲインを設定して、状態エスティメータを作成
% place: MIMO 極配置
% reg  : 状態フィードバックとエスティメータゲインを設定して、出力フィードバック補償器を作成 
% 【注意事項】
% 重根を配置する 
% 弱い可制御性、可観測性に極を移動させます。これには、一般に、高いゲインを必要とします。すなわち、外乱に非常に敏感な全閉ループ固有構造を作成することになります。 

P1 = [ ];  
Kp1 = place(A,B,P1)

%% 数値シミュレーション
x0 = [0;0.1;0;0];       % 初期状態
t = 0.0:0.005:5.0;      % シミュレーション時間

% シミュレーション結果の表示
figure(2)
initial(A-B*Kp1,B,C,D,x0,t),grid on;

% 閉ループ系の極配置の表示
figure(3)


%% 設問５：最適レギュレータ法による状態フィードバックゲインの設計
Q =
r =
KL1 = 

% シミュレーション結果の表示
figure(4)


% 閉ループ系の極配置の表示
figure(5)


%% 設問６：可観測性
% 可観測性: 状態が推定できるかどうかに関連した性質
Uo = 
Uo_rank =  

