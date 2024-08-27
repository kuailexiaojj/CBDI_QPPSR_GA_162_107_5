%NPDP改变系统参数为非对称可形变势函数ASDP，四阶龙格库塔法   quasi-periodic potential 
function x=ASDP_lgkt(U0,r,m,p,e,h,x_in)
x=zeros(1,length(x_in));
Ar=U0.*(1-r.^2).*(1-r.^2);
for i=1:length(x_in)-1
    if abs(x(i))>2
        x(i)=sign(x(i))*2;%做SNR_D
    end
    % if abs(x(i))>2
    %     x(i)=sign(x(i))*2;%做CBDI_SNROUT
    % end
    denominator1=1+r.^2+2.*r.*cos(x(i)./m);
    numerator1=(1-e.*sin(x(i))).*power(denominator1,p)+p.*power(denominator1,(p-1)).*(2.*r.*sin(x(i)./m)./m).*(1+e.*cos(x(i)));
    k1=Ar.*numerator1./power(denominator1,(2.*p))+x_in(i);
    
    denominator2=1+r.^2+2.*r.*cos((x(i)+k1/2)./m);
    numerator2=(1-e.*sin((x(i)+k1/2))).*power(denominator2,p)+p.*power(denominator2,(p-1)).*(2.*r.*sin((x(i)+k1/2)./m)./m).*(1+e.*cos(x(i)+k1/2));
    k2=Ar.*numerator2./power(denominator2,(2.*p))+x_in(i);
    
    denominator3=1+r.^2+2.*r.*cos((x(i)+k2/2)./m);
    numerator3=(1-e.*sin((x(i)+k2/2))).*power(denominator3,p)+p.*power(denominator3,(p-1)).*(2.*r.*sin((x(i)+k2/2)./m)./m).*(1+e.*cos(x(i)+k2/2));
    k3=Ar.*numerator3./power(denominator3,(2.*p))+x_in(i+1);
    
    denominator4=1+r.^2+2.*r.*cos((x(i)+k3)./m);
    numerator4=(1-e.*sin((x(i)+k3))).*power(denominator4,p)+p.*power(denominator4,(p-1)).*(2.*r.*sin((x(i)+k3)./m)./m).*(1+e.*cos(x(i)+k3));
    k4=Ar.*numerator4./power(denominator4,(2.*p))+x_in(i+1);
    
    x(i+1)=x(i)+(1/6).*h.*(k1+2*k2+2*k3+k4);
    
end