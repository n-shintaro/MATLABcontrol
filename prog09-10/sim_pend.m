

%% ��ԋ�ԃ��f��
%% �|���U�q�̏�ԋ�ԃ��f��(MIMO���f��)
% ��ԁFstates = {'x' 'th' 'dx' 'dth'};
% ���́Finputs = {'cart'};
% �o�́Foutputs = {'x' 'th'};

% A=[0 0 1 0;0 0 0 1;0 0 -240 0;0 36.39 890.32 -0.022];
% B=[0;0;90;-333.87];
% C=[0 1 0 0;0 0 0 1];
% D=[0;0];

%% �œK���M�����[�^�@�ɂ���ԃt�B�[�h�o�b�N�Q�C���̐݌v
% Q=diag([10,1,1,1]);
% r=10;
% K=lqr(A,B,Q,r);
% eig(A-B*K)

%% ���l�V�~�����[�V����
dt = 0.005;
t=0.0:dt:5;
tsize = size(t,2);

X=[0;0.5;0;0];

for i=1:tsize

%     % LQR Controller
%     U = -K*X;

    % NN Controller
    u = 

    % Data Strage
%     X_data(:,i) = X;
%     U_data(1,i) = U;
%     u_data(1,i) = u;
%     time(i,1) = dt * i;
    
    % Runge-Kutta
    
end

%% ���ʂ̕\��
% figure(1)
% plot(time,X_data)
% legend('x', 'th', 'dx', 'dth');
% grid on
% 
% figure(2)
% subplot(311); plot(time,U_data);        
% xlabel('time');ylabel('input'); legend('LQR');   grid on
% subplot(312); plot(time,u_data);        
% xlabel('time');ylabel('input'); legend('NN');    grid on
% subplot(313); plot(time,U_data-u_data); 
% xlabel('time');ylabel('input'); legend('error'); grid on
% 
% figure(3)
% plot(time,U_data-u_data, time, U_data, time, u_data)
% xlabel('time');ylabel('input'); legend('error', 'LQR', 'NN'); grid on
