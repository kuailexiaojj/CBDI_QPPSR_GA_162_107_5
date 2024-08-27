clear all;clc
x=0:0.01:2;
y1=30*(0.25*sqrt(2)*exp(-1./(x))).*(0.01./x.^2);
y2=15*(pi*(1+2.56)*0.01)./(2*2.56*x.^2).*exp(-1./x);
plot(x,y1,'LineWidth',2);
hold on;
plot(x,y2,'LineWidth',2);
xlabel('D');
ylabel('SNR');
legend('经典双稳','非饱和双稳');
title('两种模型的比较');