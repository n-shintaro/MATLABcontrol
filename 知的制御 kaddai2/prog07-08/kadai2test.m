clear
close all

%% ŒP—ûŒ‹‰Ê‚Ì“Ç‚İ‚İ
load nn_controller.mat
data=csvread('test.csv');
Xnn=zeros(255,4);
Tnn=zeros(255,2);
for i=1:255
    Xnn(i,:)=[data(i,1),data(i,2),data(i+1,1),data(i+1,2)];
    Tnn(i,:)=data(i+2,:);
end
Ynn = sim(net,Xnn');
figure(1)
T=1:255;
grid on
figure(1)
plot(T,Ynn(1,:),T,Tnn(:,1)')
% figure(2)
% plot(T,Tnn(:,1)')
