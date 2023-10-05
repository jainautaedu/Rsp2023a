function getintegrand3=getintegrand3(xbarstar,abar,Bimax,lambda,m,n)
    
for ii=1:length(xbarstar)
        getintegrand3(ii)=Bi0(xbarstar(ii),abar,Bimax)*cos(lambda(m)*xbarstar(ii))*cos(lambda(n)*xbarstar(ii));
end

end
