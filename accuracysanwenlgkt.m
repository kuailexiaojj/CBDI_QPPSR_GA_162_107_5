function x=accuracysanwenlgkt(a,b,c,h,x1)
x=zeros(1,length(x1));
for i=1:length(x1)-1
        if abs(x(i))>3
        x(i)=sign(x(i))*3;
        end
    k1=(-a.*x(i)+b.*x(i).^3-c.*x(i).^5+x1(i));
    k2=(-a.*(x(i)+k1.*h/2)+b.*(x(i)+k1.*h/2).^3-c.*(x(i)+k1.*h/2).^5+x1(i)+h/2);
    k3=(-a.*(x(i)+k2.*h/2)+b.*(x(i)+k2.*h/2).^3-c.*(x(i)+k2.*h/2).^5+x1(i)+h/2);
    k4=(-a.*(x(i)+k3.*h)+b.*(x(i)+k3.*h).^3-c.*(x(i)+k3.*h).^5+x1(i)+h);
    x(i+1)=x(i)+h.*(k1+2*k2+2*k3+k4)/6;
end
end