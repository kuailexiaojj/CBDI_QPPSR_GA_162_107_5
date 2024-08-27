clear all; clc
% 生成信号和噪声
fs=7;
Ts=1/fs;N=10000;
h=1/fs;   
t = linspace(0, (N-1)*Ts, N);  % 时间向量
%t = linspace(0, Ts, (N-1)*Ts);  % 时间向量
signal = 0.1*sin(2 * pi * 0.01 * t);  % 信号
%a1=0.5;b1=1.2;v=0.45;r=1;c=1.5;e=0.005;
U0=1;r=0.1;m=2;p=2;e=2;
snr_values = -10:0.1:20;  % 不同的信噪比值

RZV_values = zeros(size(snr_values));

% 计算峰度随信噪比的变化
for i = 1:length(snr_values)
    snr = snr_values(i);
    
    % 生成具有信噪比的噪声
    noise = randn(size(t)) / (10^(snr / 20));
     
    % 添加噪声到信号
    noisy_signal = signal + noise;
      %x2=TDUPQSRlgkt(a1,b1,v,r,c,e,h,noisy_signal);
      x2=ASDP_lgkt(U0,r,m,p,e,h,noisy_signal);
      x2_smooth=smooth(x2);
        
    % 计算峰度
    RZV_values(i) = RZV(x2);
end
% N=10000;
% for i=1:N
% eta1=smooth(RZV_values);
% % eta2=smooth(eta2);
% % eta3=smooth(eta3);
% % eta4=smooth(eta4);
% %eta5=smooth(eta5);
% % plot(D,eta1,D,eta2,D,eta3,D,eta4);
% end
% 绘制曲线
figure;
plot(snr_values,RZV_values,'*', 'LineWidth', 1);
% hold on;
% plot(snr_values,eta1)
xlabel('SNR_{out}','FontSize', 14,'Fontname', 'Times New Roman');
ylabel('RZV','FontSize', 14,'Fontname', 'Times New Roman');
title('');
xlim([-10,0])
grid on;