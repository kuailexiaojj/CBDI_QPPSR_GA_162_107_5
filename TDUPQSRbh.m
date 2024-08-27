
 clear all;close all;
clc 
fs=5;
Ts=1/fs; 
h=1/fs;   %时间步长 
t=0:Ts:4000*Ts;
%a3=2.8;b3=2.9;c3=3;h1=1;%可行
figure(1)
a1=0.5;b1=0.4;v=0.45;r=1;c=0;e=0;
s=0.3*sin(2*pi*0.01*t);
x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
% x1=lgkt0(a1,b1,c1,h,s);
plot(t,x1)
hold on
s=1*sin(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
plot(t,x1)
hold on
s=1.5*sin(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
plot(t,x1)
hold on
s=2*sin(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
plot(t,x1)
ylim([-6 6]) 
legend('A=0.3','A=1','A=1.5','A=2')
figure(2)
a1=0.5;b1=1.2;v=0.45;r=1;c=0;e=0;
s=0.3*sin(2*pi*0.01*t);
x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
% x1=lgkt0(a1,b1,c1,h,s);
plot(t,x1)
hold on
s=1*sin(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
plot(t,x1)
hold on
s=1.5*sin(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
plot(t,x1)
hold on
s=2*sin(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
plot(t,x1)
ylim([-6 6])    
legend('A=0.3','A=1','A=1.5','A=2')