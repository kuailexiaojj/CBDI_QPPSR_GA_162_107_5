 clear all;close all;
clc 
fs=5;
Ts=1/fs; 
h=1/fs;   %时间步长 
t=0:Ts:4000*Ts;
%a3=2.8;b3=2.9;c3=3;h1=1;%可行
%a3=2.6;b3=2.8;c3=3;h1=1;
U0=1;r=0.25;m=2;p=2;e=1;
s=0.5*sin(2*pi*0.01*t);
x1=ASDP_lgkt(U0,r,m,p,e,h,s);
plot(t,x1)
hold on
s=1*sin(2*pi*0.01*t);
x1=ASDP_lgkt(U0,r,m,p,e,h,s);
plot(t,x1)
hold on
s=1.5*sin(2*pi*0.01*t);
x1=ASDP_lgkt(U0,r,m,p,e,h,s);
plot(t,x1)
hold on
s=10*sin(2*pi*0.01*t);
x1=ASDP_lgkt(U0,r,m,p,e,h,s);
plot(t,x1)

ylim([-6 6])    
legend('A=0.3','A=1','A=1.5','A=2')
% am=0:0.1:10;
% % a3=0.65;b3=1;c3=1.3;h1=1;t=25;
% a3=1.1;b3=1.8;c3=1.9;h1=1;t=25;h=1/5;
% U0=1;r=0.1;m=2;p=2;e=-1;
% a=2;b=3;c=1;
% s=am.*sin(2*pi*0.01*t);
% x1=QSRlgkt(a3,b3,c3,h1,h,s);
% plot(am,x1,'m-.p','LineWidth',1.5)
% hold on
% x2=ASDP_lgkt(U0,r,m,p,e,h,s);
% plot(am,x2,'c-.o','LineWidth',1.5)
% hold on
% b1=0.5;
% x2=accuracysanwenlgkt(a,b,c,h,s);
% plot(am,x2,'b-.s','LineWidth',1.5)
% h2=legend('CQSR','QPPSR','CTSR');
% set(h2,'Interpreter','latex')