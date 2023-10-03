function getcnintegrand1a=getcnintegrand1a(xistar,lambda,Lbar,alphabar1,n)

    for ii=1:length(xistar)
        getcnintegrand1a(ii)=cos(lambda(n)*(Lbar-xistar(ii))/sqrt(alphabar1));
    end
end

