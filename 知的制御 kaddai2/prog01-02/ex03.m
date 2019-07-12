clear
close all

% 伝達関数の定義
num = [1 1];    den = [1 1 1];  % 分子・分母多項式を定義
sys = tf(num,den);                   % 伝達関数の構成

% 極と零点の計算
p = pole(sys)                       % 極の計算
z = tzero(sys)                      % 零点の計算

% 極と零点の図示
pzmap(sys)                          % 極と零点をプロット
title('Pole-Zero Map');
xlabel('Real Axis');
ylabel('Imaginary Axis');

% 閉ループ周波数伝達関数の特性値の計算
w=logspace(-1,1,500);            % ラジアン/秒で指定した周波数ベクトル

figure(2)
 [mag,phase,w] =bode(num,den,w);            % Bode 線図を計算、作成
                                     % mag: ゲイン, phase: 度単位での位相の応答, w: 周波数のベクトル
 semilogx(w,mag)                                 
% xlabel('Frequency(rad/sec)');
% ylabel('Magnitude');
[y,L]=max(mag);
w_list=find(mag<0.707);
wb =w(w_list(1))        % バンド幅(band width)
Mp =y        % ピークゲイン(peak gain)
%y=getPeakGain(sys)でもOK
Mpfunction=getPeakGain(sys)
wp =w(L)        % 共振周波数(resonance frequency)