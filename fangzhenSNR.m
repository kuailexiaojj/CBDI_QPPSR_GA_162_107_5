clc;clear all;close all;

%  CoreNum=3; %调用的处理器个数
% if parpool('size')<=0  %之前没有打开
%     parpool('open','local',CoreNum);
% else  %之前已经打开
%     disp('matlab pool already started');
%  end

fs=5;
Ts=1/fs;N=10000;
h=1/fs;   
t=0:Ts:(N-1)*Ts;

A=0.1;

a1=1;b1=1.8;c1=0.6;
a=0.829;b=2.134;c=3.064;h1=1;%QSR此参数可行
% a=0.65;b=1;c=1.3;h1=1;
U0=1;r=0.5;m=2;p1=2;e=2;
f0=0.01;
a3=a.^2;b3=b.^2;c3=c.^2;
%a3=0.7;b3=1.7;c3=2;h1=1;



% s=0.1*cos(2*pi*f0.*t);%+0.2*cos(2*pi*0.03.*t)+0.2*cos(2*pi*0.05.*t);
% D=1;
% NN=5000;
% ff=fs.*(0:NN/2-1)/NN;
% ff0=find(ff==f0);   
% randn('state',500*sum(clock))
% noise=sqrt(2*D).*randn(1,length(s));


%% 绘制 Am(fo)-D 图像
s=A*cos(2*pi*f0.*t);
g=linspace(0.1,15,200);
% g=0:0.01:3;
p=0;pin=0;pout=0;
%  Am=zeros(1,length(g));
  mm=zeros(1,length(g));
  mn=zeros(1,length(g));
  Bm=zeros(1,length(g));
  mp=zeros(1,length(g));
%   Cm=zeros(1,length(g));


% noise1=sqrt(2*Q)*+++randn(1,length(s));
for n=1:length(g)
    flag=0;
    n
    for i=1:50
        x=s+sqrt(2*g(n))*randn(1,length(s));
%         x1=lgkt0(a,b,c,h,x);  
        x2=QSRlgkt(a3,b3,c3,h1,h,x);
        pin=SNR(x,N);
%         pout=SNR(x1,N);
        pout3=SNR(x2,N);
%         p=pout-pin;
          p3=pout3-pin;
            flag=flag+1;
%             mm(n)=mm(n)+p;
            
            mp(n)=mp(n)+p3;
    end
%        Bm(n)=mm(n)/flag;
       Cm(n)=mp(n)/flag;

end
for j=1:10
    
    Cm=smooth(Cm);
   
end

% Am=sum(Am1)/50;
figure(1);
% plot(g,Am,'r-.','Linewidth',2);hold on;
% 0plot(g,Bm,'g','Linewidth',2);
% plot(g,Bm,'b','Linewidth',2);
% hold on

plot(g,Cm,'y-*','Linewidth',2);
% plot(g,Bm,'b.-.');
% plot(g,abs(Cm),'b');
% plot(g,Cm,'b','Linewidth',2);
% legend('对称双稳','非对称双稳');

p=0;pin=0;pout=0;
%  Am=zeros(1,length(g));
  mm=zeros(1,length(g));
  mn=zeros(1,length(g));
  Bm=zeros(1,length(g));
  mp=zeros(1,length(g));
%   Cm=zeros(1,length(g));
   

% noise1=sqrt(2*Q)*+++randn(1,length(s));
for n=1:length(g)
    flag=0;
    n
    for i=1:50
        x=s+sqrt(2*g(n))*randn(1,length(s));
%         x1=lgkt0(a,b,c,h,x);  
       % x2=TDUPQSRlgkt(a1,b1,v,r,c,e,h,x);
        x2=ASDP_lgkt(U0,r,m,p1,e,h,x);
        pin=SNR(x,N);
%         pout=SNR(x1,N);
        pout3=SNR(x2,N);
%         p=pout-pin;
          p3=pout3-pin;
            flag=flag+1;
            
%             mm(n)=mm(n)+p;
            
            mp(n)=mp(n)+p3;
    end
%        Bm(n)=mm(n)/flag;
       Cm(n)=(mp(n)/flag)+2;
     
end
for j=1:10
    
    Cm=smooth(Cm);
   
end
% Am=sum(Am1)/50;
hold on
% plot(g,Am,'r-.','Linewidth',2);hold on;
% 0plot(g,Bm,'g','Linewidth',2);
% plot(g,Bm,'b','Linewidth',2);
% hold on
 plot(g,Cm,'b-*','Linewidth',3);



p=0;pin=0;pout=0;
%  Am=zeros(1,length(g));
  mm=zeros(1,length(g));
  mn=zeros(1,length(g));
  Bm=zeros(1,length(g));
  mp=zeros(1,length(g));
%   Cm=zeros(1,length(g));


% noise1=sqrt(2*Q)*+++randn(1,length(s));
for n=1:length(g)
    flag=0;
    n
    for i=1:50
        x=s+sqrt(2*g(n))*randn(1,length(s));
%         x1=lgkt0(a,b,c,h,x);  
        x2=accuracysanwenlgkt(a1,b1,c1,h,x);
        pin=SNR(x,N);
%         pout=SNR(x1,N);
        pout3=SNR(x2,N);
%         p=pout-pin;
          p3=pout3-pin;
            flag=flag+1;
%             mm(n)=mm(n)+p;
            
            mp(n)=mp(n)+p3;
    end
%        Bm(n)=mm(n)/flag;
       Cm(n)=mp(n)/flag;

end
for j=1:10
    
    Cm=smooth(Cm);
   
end
% Am=sum(Am1)/50;
hold on
% plot(g,Am,'r-.','Linewidth',2);hold on;
% 0plot(g,Bm,'g','Linewidth',2);
% plot(g,Bm,'b','Linewidth',2);
% hold on
plot(g,Cm,'c-*','Linewidth',2);
ylim([0,20])
 legend('CQSR','QPPSR','CTSR')