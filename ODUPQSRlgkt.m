function x=ODUPQSRlgkt(a1,b1,v,r,h,x1)
x=zeros(1,length(x1));
for i=1:length(x1)-1
    if abs(x(i))>3
        x(i)=sign(x(i))*3;
    end
   

 if x(i)<0
    k1=h*(-a1.*(x(i)+b1)+(2.*v./(r.^2)).*(x(i)+b1).*exp(-((x(i)+b1).^2)./r.^2)+x1(i));
    k2=h*(-a1.*(x(i)+k1/2+b1)+(2.*v./(r.^2)).*(x(i)+k1/2+b1).*exp(-((x(i)+k1/2+b1).^2)./r.^2)+x1(i));
    k3=h*(-a1.*(x(i)+k2/2+b1)+(2.*v./(r.^2)).*(x(i)+k2/2+b1).*exp(-((x(i)+k2/2+b1).^2)./r.^2)+x1(i+1));
    k4=h*(-a1.*(x(i)+k3+b1)+(2.*v./(r.^2)).*(x(i)+k3+b1).*exp(-((x(i)+k3+b1).^2)./r.^2)+x1(i+1));
    x(i+1)=x(i)+1/6*(k1+2*k2+2*k3+k4);
    
 else
    k1=h*(-a1.*(x(i)-b1)+(2.*v./(r.^2)).*(x(i)-b1).*exp(-((x(i)-b1).^2)./r.^2)+x1(i));
    k2=h*(-a1.*(x(i)+k1/2-b1)+(2.*v./(r.^2)).*(x(i)+k1/2-b1).*exp(-((x(i)+k1/2-b1).^2)./r.^2)+x1(i));
    k3=h*(-a1.*(x(i)+k2/2-b1)+(2.*v./(r.^2)).*(x(i)+k2/2-b1).*exp(-((x(i)+k2/2-b1).^2)./r.^2)+x1(i+1));
    k4=h*(-a1.*(x(i)+k3-b1)+(2.*v./(r.^2)).*(x(i)+k3-b1).*exp(-((x(i)+k3-b1).^2)./r.^2)+x1(i+1));
    x(i+1)=x(i)+1/6*(k1+2*k2+2*k3+k4);
    
end
end