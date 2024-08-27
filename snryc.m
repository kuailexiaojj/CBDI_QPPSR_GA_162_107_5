function snroutyc = snryc(x,NN,ff0)
%Ä¿±êº¯Êý
fs=5;
yy=fft(x,NN);
py=yy.*conj(yy)/NN;
ff=fs.*(0:NN/2)/NN;
f0=find(ff==ff0);
[S,f]=max(abs(py));
k=f-ff0;

if abs(k)~=0 
    for i=1:2
    py(i)=0;
    end
    S=py(f0);
end
N=sum(py(2:NN/2+1))-S;
snroutyc =abs(10*log10(S/N));
end
