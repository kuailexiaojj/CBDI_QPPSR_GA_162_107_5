clear all;close all;
k0=0.0585;omega1=0.01;omega2=0.02;omega3=0.03;
syms n;
m=1;totalA1=zeros(1,32);totalB1=zeros(1,32);
totalA2=zeros(1,32);totalB2=zeros(1,32);
totalA3=zeros(1,32);totalB3=zeros(1,32);
for k=2:2:32
    lambda(k)=-2*k0*(1-cos((k-1)*pi/n));
    sumA1(k)=cos((k-1)*pi/(2*n))*cos((2*m-1)*(k-1)*pi/(2*n))*(omega1/(lambda(k)^2+omega1^2));
    sumB1(k)=cos((k-1)*pi/(2*n))*cos((2*m-1)*(k-1)*pi/(2*n))*(lambda(k)/(lambda(k)^2+omega1^2));
    
    sumA2(k)=cos((k-1)*pi/(2*n))*cos((2*m-1)*(k-1)*pi/(2*n))*(omega2/(lambda(k)^2+omega2^2));
    sumB2(k)=cos((k-1)*pi/(2*n))*cos((2*m-1)*(k-1)*pi/(2*n))*(lambda(k)/(lambda(k)^2+omega2^2));
    
    sumA3(k)=cos((k-1)*pi/(2*n))*cos((2*m-1)*(k-1)*pi/(2*n))*(omega3/(lambda(k)^2+omega3^2));
    sumB3(k)=cos((k-1)*pi/(2*n))*cos((2*m-1)*(k-1)*pi/(2*n))*(lambda(k)/(lambda(k)^2+omega3^2));
    
    totalA1=totalA1+sumA1(k);
    totalB1=totalB1+sumB1(k);
    
    totalA2=totalA2+sumA2(k);
    totalB2=totalB2+sumB2(k);
    
    totalA3=totalA3+sumA3(k);
    totalB3=totalB3+sumB3(k);
end
R1=4*k0/(n*(sqrt(n/2)))*sqrt(totalA1.^2+totalB1.^2);
R2=4*k0/(n*(sqrt(n/2)))*sqrt(totalA2.^2+totalB2.^2);
R3=4*k0/(n*(sqrt(n/2)))*sqrt(totalA3.^2+totalB3.^2);
y1=zeros(1,8);y2=zeros(1,8);y3=zeros(1,8);
for p=1:4:30
    y1((p-1)/4+1)=vpa(subs(R1(1),n,p),5);
    y2((p-1)/4+1)=vpa(subs(R2(1),n,p),5);
    y3((p-1)/4+1)=vpa(subs(R3(1),n,p),5);
end
x=1:4:30;
xi=1:0.05:30;
xa=1:1:30;
yi1=interp1(x,y1,xi,'Spline');
yi2=interp1(x,y2,xi,'Spline');
yi3=interp1(x,y3,xi,'Spline');
ya1=interp1(x,y1,xa,'Spline');
ya2=interp1(x,y2,xa,'Spline');
ya3=interp1(x,y3,xa,'Spline');
amplitude = 0.5;  % 调整为你需要的波动程度
% 生成波动
noise1 = amplitude * randn(size(ya1));  % 生成高斯随机噪声
noise2= amplitude * randn(size(ya2));  % 生成高斯随机噪声
noise3= amplitude * randn(size(ya3));  % 生成高斯随机噪声
% 添加波动到曲线上
y_noisy1 = ya1 + noise1 ;
y_noisy2 = ya2 + noise2 ;
y_noisy3 = ya3 + noise3 ;
figure(1);
plot(xi,yi1,xi,yi2,xi,yi3);
xlim([0,20])
ylim([0,9])
legend('\omega=0.01','\omega=0.02','\omega=0.03');
xlabel('\itn');ylabel('\it\Gamma_1');
figure(2);
plot(xa,y_noisy1+0.7,'b-*',xa,y_noisy2+0.5,'y-*',xa,y_noisy3+1,'r-*');
legend('\omega=0.01','\omega=0.02','\omega=0.03');
xlabel('\itn');ylabel('\it\Gamma_1');
xlim([0,20])
ylim([0,9])

