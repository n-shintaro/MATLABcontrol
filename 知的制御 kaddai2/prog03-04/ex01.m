clear
close all

%% DCモータの状態空間モデル(SISOモデル)
R  = 2.0   % オーム
L  = 0.5   % Henrys
Km = 0.015 % トルク定数
Kb = 0.015 % emf 定数
Kf = 0.2   % Nms
J  = 0.02  % kg.m^2/s^2

A = [-R/L -Kb/L; Km/J -Kf/J]
B = [1/L; 0];
C = [0 1];
D = [0];

% 設問１：状態空間モデルの作成
sys_dc =ss(A,B,C,D)

% 設問２
% 伝達関数表現
sys_tf = tf(sys_dc)

% 零点/ 極/ ゲイン表現
sys_zpk = zpk(sys_dc)

% 周波数応答モデル
% frd: 周波数応答データモデルへの変換または作成
% SYS = FRD(RESPONSE,FREQS) は、FREQS の周波数点での応答データ RESPONSE をもつFRD モデル SYS を作成
sys_frd = frd(sys_dc,0.5:10)

% 設問３
K = [0.1 0.15 0.2]; % Several values for Km and Kb
A1 = [-R/L -K(1)/L; K(1)/J -Kf/J];
A2 = [-R/L -K(2)/L; K(2)/J -Kf/J];
A3 = [-R/L -K(3)/L; K(3)/J -Kf/J];
sys_lti(:,:,1)= ss(A1,B,C,D);
sys_lti(:,:,2)= ss(A2,B,C,D);
sys_lti(:,:,3)= ss(A3,B,C,D);

% ステップ応答
figure(1)
step(sys_lti),grid on;

% 設問４
% 離散DCモータモデル
%TSの幅によって精度が異なる
%自分が観測した領域の10倍
Ts = 0.001;   %時間刻み
sysd = c2d(sys_dc,Ts);

% 連続システムと離散システムの比較
% ステップ応答
figure(2)
step(sys_dc,'r--',sysd,'b-'), grid on;
legend('sysc','sysd')
% ボード線図
figure(3)
bode(sys_dc,'r--',sysd,'b-'), grid on;
legend('sysc','sysd')

sisotool(sys_dc),grid on;