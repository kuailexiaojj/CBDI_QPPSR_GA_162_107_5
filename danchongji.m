clear all 
clc 
fsr=5;
fs=100;
Ts=1/fs; 
h=1/fsr;   
t=0:Ts:30;
% p=0.3;u=0.15;k=0.4;r=2.71;
p=0.6;u=1.2;k=0.4;r=0.01;
% p1=0.5;u1=0.2;
p1=0.8;u1=1.2;
c=sqrt(u)+0.1;d=2*sqrt(u)+0.1;v=0.5;
D=0.02; 
A=0.5;
tau=0.1;
t0=3.3;
s=A*exp(-3*((t-t0)/tau).^2);
In=s+sqrt(2*D)*randn(size(t));
%% 通过系统输出
x=lgkt_jieduan(p,u,k,r,h,In);
% x=lgkt(p,u,k,r,h,In);
x1=lgkt00(p1,u1,h,In);%新型一维三稳
x2=lgkt0(c,d,v,h,In);%标准三稳
%% 输入信号的峭度指标
subplot(2,1,1)
plot(t,s,'k')
ylim([0 0.6])
xlabel('\itt/s','FontName','Times New Roman','FontSize',10.5)
ylabel('\itv(t)','FontName','Times New Roman','FontSize',10.5)
subplot(2,1,2)
plot(t,In,'k')     %输入时域信号波形
% title('输入信号') ;xlabel('t/s');ylabel('信号加噪声幅值');
xlabel('\itt/s','FontName','Times New Roman','FontSize',10.5)
ylabel('\itx_0(t)','FontName','Times New Roman','FontSize',10.5)
figure(2)
subplot(3,1,1)
plot(t,x,'k');
% xlabel('t') ;ylabel('信号加噪声幅值');title('输出信号加噪声时域图')
 Kw=kurtosis(x)
 correlation=corrcoef(x,s)
 Cosine_correlation=abs(dot(x,s)/(norm(x)*norm(s)))
 Weight_Kw=Kw*Cosine_correlation
 xlabel('\itt/s','FontName','Times New Roman','FontSize',10.5)
ylabel('\itx(t)','FontName','Times New Roman','FontSize',10.5)
subplot(3,1,2)
plot(t,x1,'k')
 Kw1=kurtosis(x1)
 correlation1=corrcoef(x1,s)
 Cosine_correlation1=abs(dot(x1,s)/(norm(x1)*norm(s)))
 Weight_Kw1=Kw1*Cosine_correlation1
 xlabel('\itt/s','FontName','Times New Roman','FontSize',10.5)
ylabel('\itx(t)','FontName','Times New Roman','FontSize',10.5)
subplot(3,1,3)
plot(t,x2,'k')
 Kw2=kurtosis(x2)
 correlation2=corrcoef(x2,s)
 Cosine_correlation2=abs(dot(x2-mean(x2)-mean(x2),s-mean(s))/(norm(x2-mean(x2))*norm(s-mean(s))))
 Weight_Kw2=Kw2*Cosine_correlation2
 xlabel('\itt/s','FontName','Times New Roman','FontSize',10.5)
ylabel('\itx(t)','FontName','Times New Roman','FontSize',10.5)
% clear all 
% clc 
% fs=5; 
% Ts=1/fs; 
% h=1/fs;   
% t=0:Ts:9999*Ts;
% p=0.3;u=0.15;k=0.05;r=1.71;
% D=0.02; 
% A=0.8;
% tau=1;
% t0=200;
% s=A*exp(-3*((t-t0)/tau).^2);
% In=s+sqrt(2*D)*randn(size(t));
% %% 预处理
% % x1=hilbert(In);
% % yIn=abs(x1);
% % In=yIn-mean(x1);
% x=lgkt(p,u,k,r,h,In);
% %输入信号的峭度指标
%  Kw_in=kurtosis(s)
% %  x1=x-mean(x);
% %  In1=In-mean(In);
% %  Cosine_correlation=abs(dot(x1,In1)/(norm(x1)*norm(In1)))
% %  Weight_Kw=Kw*Cosine_correlation
% % 输出信号的峭度指标
%  Kw=kurtosis(x)
%  correlation=corrcoef(x,s)
%  Cosine_correlation=abs(dot(x,s)/(norm(x)*norm(s)))
%  Weight_Kw=Kw*Cosine_correlation
% subplot(3,1,1)
% plot(t,s,'k')
% subplot(3,1,2)
% plot(t,In,'k')     %输入时域信号波形
% title('输入信号') ;xlabel('t/s');ylabel('信号加噪声幅值');
% subplot(3,1,3)
% plot(t,x,'k');
% xlabel('t') ;ylabel('信号加噪声幅值');title('输出信号加噪声时域图')