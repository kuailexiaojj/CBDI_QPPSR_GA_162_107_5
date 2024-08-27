function Y=SNR(X,N)
    yy=fft(X,N);
    py=yy.*conj(yy)/N; 
    if(max(py)==py(9))
      Bwout=0; 
        Swout=0;
        for i=1:N/2+1
             Bwout=py(i)+Bwout; 
             if(py(i)>Swout) 
                Swout=py(i); 
             end 
        end 
        Bwout=(Bwout-Swout); 
       Y=10*log(Swout/Bwout)/log(10);
     else          
     Bwout=sum(py)-py(9); 
     Y=10*log(py(9)/Bwout)/log(10);
    end
end