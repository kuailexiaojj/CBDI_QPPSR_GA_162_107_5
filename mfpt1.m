%%
%随着D变化t13和t75
clear all;clc;
a=0.3;b=1.6;c=1;
D=0.1:0.01:1;
p=sqrt((b-sqrt(b^2-4*a*c))/2*c);
d=a/2.*p.^2-b/4.*p.^4+c/6.*p.^6;
x11=sqrt((b+sqrt(b^2-4*a*c))/2*c)+sqrt((b-sqrt(b^2-4*a*c))/2*c);
x22=2*sqrt((b-sqrt(b^2-4*a*c))/2*c);
x33=sqrt((b-sqrt(b^2-4*a*c))/2*c);
x44=0;
x55=-x33;x66=-x22;x77=-x11;
udd=@(x) a-3*b*(x-p).^2+5*c*(x-p).^4;
t13=sqrt(abs(udd(x11)*udd(x22)))/2*pi*exp(-(x22-x11)./D);
plot(D, log(t13), 'k-o', 'LineWidth', 1, 'MarkerSize', 2, 'MarkerFaceColor', 'k');
hold on 

a=0.4;b=1.6;c=1;
D=0.1:0.01:1;
p=sqrt((b-sqrt(b^2-4*a*c))/2*c);
d=a/2.*p.^2-b/4.*p.^4+c/6.*p.^6;
x11=sqrt((b+sqrt(b^2-4*a*c))/2*c)+sqrt((b-sqrt(b^2-4*a*c))/2*c);
x22=2*sqrt((b-sqrt(b^2-4*a*c))/2*c);
x33=sqrt((b-sqrt(b^2-4*a*c))/2*c);
x44=0;
x55=-x33;x66=-x22;x77=-x11;
udd=@(x) a-3*b*(x-p).^2+5*c*(x-p).^4;
t13=sqrt(abs(udd(x11)*udd(x22)))/2*pi*exp(-(x22-x11)./D);
plot(D, log(t13), 'r-o', 'LineWidth', 1, 'MarkerSize', 2, 'MarkerFaceColor', 'r');


a=0.5;b=1.6;c=1;
D=0.1:0.01:1;
p=sqrt((b-sqrt(b^2-4*a*c))/2*c);
d=a/2.*p.^2-b/4.*p.^4+c/6.*p.^6;
x11=sqrt((b+sqrt(b^2-4*a*c))/2*c)+sqrt((b-sqrt(b^2-4*a*c))/2*c);
x22=2*sqrt((b-sqrt(b^2-4*a*c))/2*c);
x33=sqrt((b-sqrt(b^2-4*a*c))/2*c);
x44=0;
x55=-x33;x66=-x22;x77=-x11;
udd=@(x) a-3*b*(x-p).^2+5*c*(x-p).^4;
t13=sqrt(abs(udd(x11)*udd(x22)))/2*pi*exp(-(x22-x11)./D);
plot(D, log(t13), 'b-d', 'LineWidth', 1, 'MarkerSize', 2, 'MarkerFaceColor', 'b');

a=0.6;b=1.6;c=1;
D=0.1:0.01:1;
p=sqrt((b-sqrt(b^2-4*a*c))/2*c);
d=a/2.*p.^2-b/4.*p.^4+c/6.*p.^6;
x11=sqrt((b+sqrt(b^2-4*a*c))/2*c)+sqrt((b-sqrt(b^2-4*a*c))/2*c);
x22=2*sqrt((b-sqrt(b^2-4*a*c))/2*c);
x33=sqrt((b-sqrt(b^2-4*a*c))/2*c);
x44=0;
x55=-x33;x66=-x22;x77=-x11;
udd=@(x) a-3*b*(x-p).^2+5*c*(x-p).^4;
t13=sqrt(abs(udd(x11)*udd(x22)))/2*pi*exp(-(x22-x11)./D);
plot(D, log(t13), 'y-s', 'LineWidth', 1, 'MarkerSize', 2, 'MarkerFaceColor', 'y');
xlabel('D');
ylabel('lnT13 & lnT75');
legend('a=0.3','a=0.4','a=0.5','a=0.6','Location','best','Box','off','fontsize',10,'fontname','Times','FontAngle','italic');
%%
%随着D变化t35和t53
clear all;clc;
a=0.5;b=1.6;c=1;
D=0.1:0.01:1;
p=sqrt((b-sqrt(b^2-4*a*c))/2*c);
d=a/2.*p.^2-b/4.*p.^4+c/6.*p.^6;
x11=sqrt((b+sqrt(b^2-4*a*c))/2*c)+sqrt((b-sqrt(b^2-4*a*c))/2*c);
x22=2*sqrt((b-sqrt(b^2-4*a*c))/2*c);
x33=sqrt((b-sqrt(b^2-4*a*c))/2*c);
x44=0;
x55=-x33;x66=-x22;x77=-x11;
f1=@(x1,Dval) exp((-a./2.*(x1+p).^2+b./4.*(x1+p).^4-c./6.*(x1+p).^6)./Dval);
f2=@(x2,Dval) exp((-a/2*x2.^2+b/4*x2.^4-c/6*x2.^6+d)./Dval);
t35 = zeros(size(D));  
  
% 对每个D值进行积分  
for i = 1:length(D)  
    t35(i) = integral(@(x1) f1(x1, D(i)), -2*x55, -x55)*integral(@(x2) f2(x2, D(i)), -x55, x44);  
end  
  
% 绘图  
plot(D, t35);  
