clear all;clc
% x=-10:0.01:10;
% y1=sin(2*x)+sin(3*x);
% y2=0*x;
% plot(x,y1,x,y2);
% 定义参数
Fs = 1000;          % 采样频率
T = 1;              % 信号持续时间
t = 0:1/Fs:T;       % 时间向量
f0 = 0.1;            % 起始频率
delta_f = 10;        % 频率变化率

% 生成线性调频信号
x = sin(2*pi*(f0 + delta_f*t).*t);
x1=0*t;
% 绘制信号图像
plot(t, x,t,x1);
xlabel('时间 (s)');
ylabel('幅度');
title('线性调频信号');