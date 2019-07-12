%% �K���I�m�C�Y�L�����Z���iAdaptive Noise Cancellation�j
clear
close all

%% ���͂ƃ^�[�Q�b�g���`
time = 1:0.01:10;
X = sin(sin(time).*time*10);
Xseq = con2seq(X);
Tseq = con2seq(2*[0 X(1:(end-1))] + X);

figure(1)
plot(time,cat(2,Xseq{:}),time,cat(2,Tseq{:}),'r--'), grid on;
title('Input and Target Signals')
xlabel('Time')
legend({'Input','Target'})

%% �l�b�g���[�N�̍\�z
% net = newlin([-3 3],1,[0 1],0.1);
net=linearlayer([0 1 2 3]);
net=configure(net,0,0);


%% �l�b�g���[�N�̌P��
[net,Y,E]=adapt(net,Xseq,Tseq);


%% �P���������ʂ�\��-/*
figure(2)
plot(time,cat(2,Y{:}),'b', time,cat(2,Tseq{:}),'r--', time,cat(2,E{:}),'g',[1 10],[0 0],'k'), grid on;
xlabel('Time')
legend({'Output','Target','Error'})