clear all; clc
% 生成信号和噪声   Comprehensive Blind Detection Indicator
fs=7;
Ts=1/fs;N=10000;
h=1/fs;   
t = linspace(0, (N-1)*Ts, N);  % 时间向量
%t = linspace(0, Ts, (N-1)*Ts);  % 时间向量
signal = 0.1*sin(2 * pi * 0.01 * t);  % 信号
%a1=0.5;b1=1.2;v=0.45;r=1;c=1.5;e=0.005;
U0=1;r=0.1;m=2;p=2;e=2;
snr_values = -10:0.1:20;  % 不同的信噪比值
kurtosis_values = zeros(size(snr_values));
PMV_values = zeros(size(snr_values));
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
        [psd, f] = pwelch(x2, [], [], [], fs);
    % 计算峰度
    kurtosis_values(i) = kurtosis(psd);
    PMV_values(i) = PMV(x2);
    RZV_values(i) = RZV(x2);
    median_kurtosis_values=median(kurtosis_values);
    median_PMV_values=median(PMV_values);
    median_RZV_values=median(RZV_values);
    new_index(i)=log(kurtosis_values(i))./(PMV_values(i).*exp(RZV_values(i)/2));
    %new_index(i)=(kurtosis_values(i).*median_PMV_values.*median_RZV_values)./(PMV_values(i).*RZV_values(i).*median_kurtosis_values);
    % new_index(i)=(kurtosis_values(i).*RZV_values(i))./PMV_values(i);
end

% 绘制曲线
figure;
plot(snr_values,new_index,'*', 'LineWidth', 1);
xlabel('SNR_{out}','FontSize', 14,'Fontname', 'Times New Roman');
ylabel('new index','FontSize', 14,'Fontname', 'Times New Roman');
title('');
xlim([-10,0])
grid on;