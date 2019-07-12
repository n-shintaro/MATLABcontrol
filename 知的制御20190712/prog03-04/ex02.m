% 氏名：
% 学籍番号：

clear
close all

%% 設問１：状態空間モデルの作成、またはモデルを状態空間モデルに変換
sys_tf=tf([100],[1 1 100]);
sys=ss(sys_tf);
%% 設問２：制御系の安定性: 状態方程式中の行列 A の固有値（極）を調べるp1=
p1=eig(sys.a)
figure(1)
plot(real(p1),imag(p1),'k*')
legend('sys')
%% 設問３：可制御性 %%
% 可制御性: 与えられた状態空間モデル(制御対象) が制御ができるかどうか という性質を表すもの
rank(ctrb(sys.a,sys.b))


%% 設問４：LQ 最適化ゲインK の設計
% LQRY: 出力に重みを与えた線形2次形式レギュレータを設計
% K = lqry(sys,10,1) % u = -Kxは、J(u)を最小にする
Q=diag([10 1]);
r=1;
%離散系のLQRはlqr
K=lqr(sys.a,sys.b,Q,r)

%% 設問５：閉ループ系の固有値(極)を調べ、制御系の安定性を評価しなさい
figure(2)
plot(real(p1),imag(p1),'k*'),grid on;hold on;
plot(eig(sys.a-sys.b*K),'r*'),grid on;
legend('sys','clsys')

%% 設問６：可観測性
% 可観測性: 状態が推定できるかどうかに関連した性質
rank(obsv(sys.a,sys.c))
