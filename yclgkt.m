function x=yclgkt(a,b,e,tao,h,x1)
x0=1.056*b/a+1.2;
x=zeros(1,length(x1));
for i=1:length(x1)-1
    if x(i)<-1.2
        k1=h*(1+e*tao)*(e*x(i)-a*(x(i)+x0)+x1(i));
        k2=h*(1+e*tao)*(e*(x(i)+k1/2)-a*((x(i)+k1/2)+x0)+x1(i));
        k3=h*(1+e*tao)*(e*(x(i)+k2/2)-a*((x(i+1)+k2/2)+x0)+x1(i+1));
        k4=h*(1+e*tao)*(e*(x(i)+k3)-a*((x(i)+k3)+x0)+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    elseif x(i)>=-1.2 && x(i)<1.2
        k1=h*(1+e*tao)*(e*x(i)+2*b*x(i)^3-2*b*x(i)+x1(i));
        k2=h*(1+e*tao)*((e*(x(i)+k1/2)+2*b*(x(i)+k1/2)^3)-2*b*(x(i)+k1/2)+x1(i));
        k3=h*(1+e*tao)*((e*(x(i)+k2/2)+2*b*(x(i)+k2/2)^3)-2*b*(x(i)+k2/2)+x1(i+1));
        k4=h*(1+e*tao)*((e*(x(i)+k3)+2*b*(x(i)+k3)^3)-2*b*(x(i)+k3)+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
      elseif x(i)>=1.2
        k1=h*(1+e*tao)*(e*x(i)-a*(x(i)-x0)+x1(i));
        k2=h*(1+e*tao)*(e*(x(i)+k1/2)-a*((x(i)+k1/2)-x0)+x1(i));
        k3=h*(1+e*tao)*(e*(x(i)+k2/2)-a*((x(i+1)+k2/2)-x0)+x1(i+1));
        k4=h*(1+e*tao)*(e*(x(i)+k3)-a*((x(i)+k3)-x0)+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    end
end
end
 
