% 任意参数稳定分布数据产生
function Y=rasd(N,alpha,beta,sigma,miu)

% ----- 均匀分布 -----
% nuni=rand(1,N);
% U=(nuni*pi)-pi/2;
U=-0.5*pi+pi*rand(1,N);%(-π/2 π/2)的均匀分布
% U=linspace(-pi/2,pi/2,N);
% ----- 指数分布 -----
zhi=rand(1,N);
W=-log(zhi);
% W=exprnd(1,[1,N]);%均值为1的指数分布
B=atan(beta*tan(pi*alpha/2))/alpha;
L=(1+beta^2*(tan(pi*alpha/2))^2)^(1/(2*alpha));
if alpha~=1
%    X1=S(alpha,beta);
%    X1=cos(atan(beta*tan(pi*alpha/2)))^(-1/alpha);
   X1=L;
   X2=sin(alpha*(U+B))./((cos(U)).^(1/alpha));
   X3=(cos(U-alpha*(U+B))./W).^(1/alpha-1);
   X=X1.*X2.*X3;
else
    X=(2/pi)*( (pi/2+beta*U).*tan(U)-beta*log( 0.5*pi*W.*cos(U)./(pi/2+beta*U) ) );
end

if alpha==1
    Y=sigma*X+miu+(2/pi)*beta*sigma*log(sigma);
else
    Y=sigma*X+miu;
end
% function y=B(alpha,beta)
% y=atan(beta*tan(pi*alpha/2))/alpha;
% 
% function y=S(alpha,beta)
% % y=(1 + beta^2 * (tan(pi*alpha/2)) ^ 2  )^(1/(2*alpha));
% y=cos(atan(beta*tan(pi*alpha/2)))^(-1/alpha);
