clear all;close all;clc
fs=12000;
fsr=5;
 fs1=25600;%xijiao
% N=10000;
Ts=1/fs;
Ts1=1/fs1;
h=1/fsr;%时间步长，二次样频率
t=0:Ts:9999*Ts;
t1=0:Ts:19999*Ts;
a=0.8797;b=2.3919;c=2.810;h1=0.1;
a3=a.^2;b3=b.^2;c3=c.^2;
%U0=4.57155;r=58.9692;m=3.94064;p=2.21062;e1=3.42376;%162HZCBDI
%U0=0.0466393;r=60.0729;m=0.344131;p=1.61906;e1=3.61588;%162HZPMV
%U0=0.926144;r=60.7884;m=2.01;p=2.01;e1=3.03248;%162HZMF
%U0=2.81706;r=85.753;m=3.25019;p=2.21643;e1=4.54458;%162HZRMS
%U0=4.40732;r=67.1607;m=3.29825;p=2.3104677;e1=3.81594;%162HZNF
U0=0.94851;r=4.894;m=3.5755;p=1.7611;e1=3.01;%162HZNF2
a1=2;b1=1.8;c1=0.6;
%N=4096;

 z=importdata('105.mat');%西储大学数据，105.mat是内圈数据，130.mat是外圈数据，系统参数需要调整
%   x2=z.X130_DE_time(1:10000);%驱动计数端的外圈故障数据1:10000
x2=z.X105_DE_time(10001:20000);%驱动计数端的内圈故障数据10001:20000
z1=importdata('z.mat');          %西交数据     107.52
x21=z1(1:20000);           %西交数据
D=0.5;
noise=sqrt(2*D)*randn(size(t));
noise1=sqrt(2*D)*randn(size(t1));
x1=noise+x2';
x11=noise1+x21';
y1=hilbert(x1);
yIn=abs(y1);
y1=yIn-mean(y1);
y111=hilbert(x11);
yIn=abs(y111);
y111=yIn-mean(y111);
xu=ASDP_lgkt(U0,r,m,p,e1,h,y1);
xc=QSRlgkt(a3,b3,c3,h1,h,y1);
xb=lgkt0(a1,b1,c1,h,y1);

xa=ASDP_lgkt(U0,r,m,p,e1,h,x1);
xxa=QSRlgkt(a3,b3,c3,h1,h,x1);
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
%% 频谱
% y0=fft(x1,10000); 
% py0=y0.*conj(y0)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po0=py0(2:5001);
%y0=fft(x1,10000);
y0=fft(x1,10000); 
py0=y0.*conj(y0)/10000;
ff=fs1*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po0=py0(2:5001);
y02=fft(y1,10000); 
py02=y02.*conj(y02)/10000;
ff=fs1*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po02=py02(2:5001);
%% 包络谱
% y01=fft(y1,10000);
% py01=y01.*conj(y01)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po01=py01(2:5001);

y2=fft(xc,10000);
py01=y2.*conj(y2)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po01=py01(2:5001);
y21=fft(xxa,10000);
py011=y21.*conj(y21)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po011=py011(2:5001);
%%
% y1=fft(x,10000); 
% py1=y1.*conj(y1)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po1=py1(2:5001);
y1=fft(xu,10000); 
py1=y1.*conj(y1)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po1=py1(2:5001);
y11=fft(xa,10000); 
py11=y11.*conj(y11)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po11=py11(2:5001);
%%
% y1=fft(x,10000); 
% py1=y1.*conj(y1)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po1=py1(2:5001);
y3=fft(xb,10000); 
py2=y3.*conj(y3)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po2=py2(2:5001);
y31=fft(xxxa,10000); 
py21=y31.*conj(y31)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po21=py21(2:5001);

%% 信噪比增益
ff0=find(ff==162);
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));
SNRout1 =10*log10( po1(ff0)/(sum(po1)-po1(ff0)));
SNRI1=SNRout1-SNRin;
SNRout2 =10*log10( po01(ff0)/(sum(po01)-po01(ff0)));
SNRI2=SNRout2-SNRin;
SNRout3 =10*log10( po2(ff0)/(sum(po2)-po2(ff0)));
SNRI3=SNRout3-SNRin;

SNRin
SNRout1
SNRout2
SNRout3
SNRI1
SNRI2
SNRI3


figure('name', 'IN');set(gcf,'color','white');
subplot(2,2,1);plot(t1,x11,'k');xlim([0 0.3])
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,2,2);plot(t1,y111,'k');xlim([0 0.3])
xlabel('t/s');ylabel('Amplitude');
subplot(2,2,3);plot(ff,po0,'k');xlim([0 3000]);
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
subplot(2,2,4);plot(ff,po02,'k');xlim([0 3000]);
xlabel('f/Hz');ylabel('Amplitude');
% subplot(3,1,3)
% plot(ff,po01,'k');xlim([0 6000]);
% xlabel('f/Hz');ylabel('Amplitude');
%%
figure('name', 'QPPSR');set(gcf,'color','white');
subplot(2,2,1);plot(t,xxa,'k');xlim([0 0.3]);
xlabel('t/s');ylabel('Amplitude');
subplot(2,2,2);plot(t,xu,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,2,3);plot(ff,po11,'k');xlim([0 3000]);
xlabel('f/Hz');ylabel('Amplitude');
subplot(2,2,4);plot(ff,po1,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
%%
figure('name', 'CQSR');set(gcf,'color','white');
subplot(2,2,1);plot(t,xa-0.5,'k');xlim([0 0.3]);
xlabel('t/s');ylabel('Amplitude');
subplot(2,2,2);plot(t,xc,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,2,3);plot(ff,po011,'k');xlim([0 3000]);
xlabel('f/Hz');ylabel('Amplitude');
subplot(2,2,4);plot(ff,po01,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
%%
figure('name', 'CTSR');set(gcf,'color','white');
subplot(2,2,1);plot(t,xxxa,'k');xlim([0 0.3]);
xlabel('t/s');ylabel('Amplitude');
subplot(2,2,2);plot(t,xb,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,2,3);plot(ff,po21,'k');xlim([0 3000]);
xlabel('f/Hz');ylabel('Amplitude');
subplot(2,2,4);plot(ff,po2,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
