function getintegrand2=getintegrand2(xbarstar,abar,Bimax,lambda,m)
    
for ii=1:length(xbarstar)
        getintegrand2(ii)=Bi0(xbarstar(ii),abar,Bimax)*cos(lambda(m)*xbarstar(ii));
end

end
