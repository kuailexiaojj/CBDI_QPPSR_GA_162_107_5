clear all;close all;clc
fs=25600;
fsr=5;
Ts=1/fs;
h=1/fsr;%时间步长，二次样频率
t=0:Ts:19999*Ts;
z1=importdata('z.mat');


a=1.1797;b=2.1919;c=3.110;h1=0.01;
a5=a.^2;b5=b.^2;c5=c.^2;
%U0=2.7775;r=8.8195;m=2.0786;p=2.1867;e1=4.6214;%CBDI
%U0=2.95563;r=72.3106;m=3.80041;p=2.19748;e1=5.01;%PMV
%U0=2.95563;r=10.3106;m=3.80041;p=2.27748;e1=4.81;%NF
U0=3.3747;r=6.6495;m=3.617;p=2.0914;e1=2.69682;%NF
a1=1.5;b1=1.8;c1=0.6;
%N=4096;
x11=z1(1:20000);
% %三值噪声
% q=0.1;tao=1/200;taocor=2;tend=10;
% a3=0.5;b3=0;c3=-a3;
% D1=taocor*(a3^2*q+b3^2*(1-2*q)+c3^2*q-(a3*q+b3*(1-2*q)+c3*q)^2)
% t1=0:tao:(length(t)-1)*tao;
% noise = trichotomous1(q,tao,taocor,t1,a3,b3,c3);
% figure(5)
% plot(t1,noise)
D=0.3;
noise1=sqrt(2*D)*randn(size(t));

%levy
noise2=sqrt(2*0.01)*rasd(length(t),1.6,0,1,0);
 x1=noise2+x11';

y1=hilbert(x1);
yIn1=abs(y1);
y1=yIn1-mean(y1);

x=ASDP_lgkt(U0,r,m,p,e1,h,y1);
xx=QSRlgkt(a5,b5,c5,h1,h,y1);
xxx=lgkt0(a1,b1,c1,h,y1);

xa=ASDP_lgkt(U0,r,m,p,e1,h,x1);
xxa=QSRlgkt(a5,b5,c5,h1,h,x1);
xxxa=lgkt0(a1,b1,c1,h,x1);
[psd1, f] = pwelch(xa, [], [], [], fs);
[psd2, ~] = pwelch(xxa, [], [], [], fs);
[psd3, ~] = pwelch(xxxa, [], [], [], fs);
RZV_values1 = RZV(xa);RZV_values2 = RZV(xxa);RZV_values3 = RZV(xxxa);
PMV_values1 = PMV(xa)
PMV_values2 = PMV(xxa);PMV_values3 = PMV(xxxa);
kurtosis_values1 = kurtosis(psd1);kurtosis_values2 = kurtosis(psd2);kurtosis_values3 = kurtosis(psd3);
CBDI1=log(kurtosis_values1)./(PMV_values1.*exp(RZV_values1/2))
CBDI2=log(kurtosis_values2)./(PMV_values2.*exp(RZV_values2/2))
CBDI3=log(kurtosis_values3)./(PMV_values3.*exp(RZV_values3/2))
%% 输入信号
ff=fs*(1:10000)/20000; 

y00=fft(x1,20000); 
py00=y00.*conj(y00)/20000;
po00=py00(1:10000);

y0=fft(y1,20000); 
py0=y0.*conj(y0)/20000;
po0=py0(1:10000);

%% 输出信号 
y11=fft(x,20000); 
py1=y11.*conj(y11)/20000;
po1=py1(2:10001);
y111=fft(xa,20000); 
py11=y111.*conj(y111)/20000;
po11=py11(2:10001);

y2=fft(xx,20000); 
py2=y2.*conj(y2)/20000;
po2=py2(2:10001);
y22=fft(xxa,20000); 
py22=y22.*conj(y22)/20000;
po22=py22(2:10001);

y3=fft(xxx,20000); 
py3=y3.*conj(y3)/20000;
po3=py3(2:10001);
y33=fft(xxxa,20000); 
py33=y33.*conj(y33)/20000;
po33=py33(2:10001);

% figure('name', 'IN');set(gcf,'color','white');
% subplot(2,2,1);plot(t,x1,'k');
% xlim([0 0.3])
% xlabel('t/s');ylabel('Amplitude');
% subplot(2,2,2);plot(t,y1,'k');
% xlim([0 0.3])
% xlabel('t/s');ylabel('Amplitude');
% subplot(2,2,3);plot(ff,po00,'k');
% xlim([0 3000]);
% xlabel('f/Hz');ylabel('Amplitude');
% subplot(2,2,4);plot(ff,po0,'k');
% xlim([0 3000]);ylim([0 10])
% xlabel('f/Hz');ylabel('Amplitude');
% 
% 
% %% 输出频谱
% figure('name', 'QPPSR');set(gcf,'color','white');
% subplot(2,2,1);plot(t,xxa,'k');xlim([0 0.1]);
% xlabel('t/s');ylabel('Amplitude');
% subplot(2,2,2);plot(t,x,'k');xlim([0 0.1]);
% xlabel('t/s');ylabel('Amplitude');
% subplot(2,2,3);plot(ff,po11,'k');xlim([10 3000]);
% xlabel('f/Hz');ylabel('Amplitude');
% subplot(2,2,4);plot(ff,po1,'k');xlim([10 3000]);
% xlabel('f/Hz');ylabel('Amplitude');
% 
% figure('name', 'CQSR');set(gcf,'color','white');
% subplot(2,2,1);plot(t,xa,'k');xlim([0 0.1]);
% xlabel('t/s');ylabel('Amplitude');
% subplot(2,2,2);plot(t,xx,'k');xlim([0 0.1]);
% xlabel('t/s');ylabel('Amplitude');
% subplot(2,2,3);plot(ff,po22,'k');xlim([10 3000]);
% xlabel('f/Hz');ylabel('Amplitude');
% subplot(2,2,4);plot(ff,po2,'k');xlim([10 3000]);
% xlabel('f/Hz');ylabel('Amplitude');
% 
% figure('name', 'CTSR');set(gcf,'color','white');
% subplot(2,2,1);plot(t,xxxa,'k');xlim([0 0.1]);
% xlabel('t/s');ylabel('Amplitude');
% subplot(2,2,2);plot(t,xxx,'k');xlim([0 0.1]);
% xlabel('t/s');ylabel('Amplitude');
% subplot(2,2,3);plot(ff,po33,'k');xlim([10 3000]);
% xlabel('f/Hz');ylabel('Amplitude');
% subplot(2,2,4);plot(ff,po3,'k');xlim([10 3000]);
% xlabel('f/Hz');ylabel('Amplitude');
% figure('name', 'ALL');set(gcf,'color','white');

subplot(2,2,1);plot(ff,po0,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(a)','Fontname', 'Times New Roman','FontSize',12);

subplot(2,2,2);plot(ff,po1,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(b)','Fontname', 'Times New Roman','FontSize',12);
subplot(2,2,3);plot(ff,po2,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(c)','Fontname', 'Times New Roman','FontSize',12);
subplot(2,2,4);plot(ff,po3,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(d)','Fontname', 'Times New Roman','FontSize',12);
ff0=find(ff==107.52);
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)))
SNRout1 =10*log10( po1(ff0)/(sum(po1)-po1(ff0)))
SNRout2 =10*log10( po2(ff0)/(sum(po2)-po2(ff0)))
SNRout3 =10*log10( po3(ff0)/(sum(po3)-po3(ff0)))
SNRG1=SNRout1-SNRin
SNRG2=SNRout2-SNRin
SNRG3=SNRout3-SNRin