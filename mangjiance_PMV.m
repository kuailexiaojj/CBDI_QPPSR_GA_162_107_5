clear all; clc

fs = 25600;fsr=5;
Ts = 1/fs;
N = 20000;
h = 1/fsr;
A = 0.1;
f0 = 0.01;

a1 = 0.5;
b1 = 1.2;
v = 0.45;
r = 1;
c = 1.5;
e = 0.005;
D=0.5;

t=0:Ts:(N-1)*Ts;
noise1=sqrt(2*D)*randn(size(t));
%t = linspace(0, Ts, (N-1)*Ts);
%s = A*cos(2*pi*f0.*t);
%g = linspace(0.01, 15, 50);
%average_difference_values = zeros(size(g));
z1=importdata('z.mat');
x11=z1(1:20000);
%for n = 1:length(g)
    x = x11' + noise1;
    y1=hilbert(x);
yIn1=abs(y1);
y1=yIn1-mean(y1);
    x2 = TDUPQSRlgkt(a1, b1, v, r, c, e, h, y1);
    x1=TDUPQSRlgkt(a1, b1, v, r, c, e, h, x);
ff=fs*(1:10000)/20000; 

y00=fft(x2,20000); 
py00=y00.*conj(y00)/20000;
po00=py00(2:10001);
%x3=sin(2*pi*107.52*t);
y3=PMV(x1)%PMV
y4=RZV(x1)%RZV
[pxx, f] = pwelch(x1, [], [], [], fs);
y5=kurtosis(pxx)
y6=y5.*(1./(y3.*y4))
y7=calculateVarianceIndicator(x1)
% figure(4);
% plot(t,x3)

 
figure(1);
plot(t,x11)
figure(2);
plot(t,x1)
figure(3);
plot(ff,po00);xlim([10 3000]); 
xlim([0 3000]);
xlabel('f/Hz');
ylabel('Amplitude');
ff0=find(ff==107.52);
SNRout1 =10*log10( po00(ff0)/(sum(po00)-po00(ff0)))
% plot(g, average_difference_values, 'y-*', 'Linewidth', 2);
% xlabel('g');
% ylabel('Average Difference');
% title('Evaluation Metric');
