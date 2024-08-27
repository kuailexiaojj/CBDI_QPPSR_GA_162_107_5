%v1=2*m-sqrt(b1.\a1) v2=2*m-v1
function x=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,x1)
x=zeros(1,length(x1));
for i=1:length(x1)-1
   % if abs(x(i))>3
   %       x(i)=sign(x(i))*3;
   % end
    if x(i)<-v1
        k1=h*(b2+x1(i));
        k2=h*(b2+x1(i));
        k3=h*(b2+x1(i+1));
        k4=h*(b2+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    elseif x(i)>=-v1 && x(i)<-m
        k1=h*(-b2+x1(i));
        k2=h*(-b2+x1(i));
        k3=h*(-b2+x1(i+1));
        k4=h*(-b2+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    elseif x(i)>=-m && x(i)<-v2
        k1=h*(b2+x1(i));
        k2=h*(b2+x1(i));
        k3=h*(b2+x1(i+1));
        k4=h*(b2+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    elseif abs(x(i))<=v2
        k1=h*(a1*x(i)-b1*x(i).^3+x1(i));
        k2=h*(a1*(x(i)+k1/2)-b1*(x(i)+k1/2).^3+x1(i));
        k3=h*(a1*(x(i)+k2/2)-b1*(x(i)+k2/2).^3+x1(i+1));
        k4=h*(a1*(x(i)+k3)-b1*(x(i)+k3).^3+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);  
     elseif x(i)>v2 && x(i)<=m
        k1=h*(-b2+x1(i));
        k2=h*(-b2+x1(i));
        k3=h*(-b2+x1(i+1));
        k4=h*(-b2+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
     elseif x(i)>m && x(i)<=v1
        k1=h*(b2+x1(i));
        k2=h*(b2+x1(i));
        k3=h*(b2+x1(i+1));
        k4=h*(b2+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
      elseif v1<x(i)
        k1=h*(-b2+x1(i));
        k2=h*(-b2+x1(i));
        k3=h*(-b2+x1(i+1));
        k4=h*(-b2+x1(i+1));
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4); 
    end
end