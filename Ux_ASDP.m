%非线性周期可形变势函数 nonlinear periodic deformable potential NPDP  A novel blind detection method based on quasi-periodic potential stochastic resonance and its application for bearing fault diagnosis
%非对称可形变势函数 asymmetric deformable potential ASDP
%Ar=U0.*((1-(r.^2)).^2);m=2;p=2;e=-1;0<r<1;
%分子、分母、系数 numerator  denominator   coefficient(a-U,b-r,c-e,d-m,e-p)
m1=2;m2=2;m3=2;
p1=2;p2=2;p3=2;
e1=2;e2=0;e3=-2;
U0=1;U1=1;U2=1;
r=0.25;r1=0.25;r2=0.25;

Ar=U0.*(1-(r.^2)).*(1-(r.^2));
Ar1=U1.*(1-(r1.^2)).*(1-(r1.^2));
Ar2=U2.*(1-(r2.^2)).*(1-(r2.^2));

x=-20:0.2:20;
numerator=Ar.*(1+e1.*cos(x));
denominator=1+r.^2+2.*r.*cos(x./m1);
U_xr=numerator./(power(denominator,p1));

numerator1=Ar1.*(1+e2.*cos(x));
denominator1=1+r1.^2+2.*r1.*cos(x./m2);
U_xr1=numerator1./(power(denominator1,p2));

numerator2=Ar2.*(1+e3.*cos(x));
denominator2=1+r2.^2+2.*r2.*cos(x./m3);
U_xr2=numerator2./(power(denominator2,p3));

figure(1);
plot(x,U_xr,'r','Linewidth',2);hold on;
plot(x,U_xr1,'-*g','Linewidth',2);hold on;
plot(x,U_xr2,':b','Linewidth',2);hold on;
% legend('r=0.1','r=0.4','r=0.8');
ylim([-1 7]);
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',12);
% title('asymmetric deformable potential');
xlabel('x','FontName','Times New Roman','FontSize',12,'FontAngle','italic');
ylabel('potential function','FontName','Times New Roman','FontSize',12);



