function getintegrand1=getintegrand1(xbarstar,abar,Bimax)

for ii=1:length(xbarstar)
    getintegrand1(ii)=Bi0(xbarstar(ii),abar,Bimax);
end
end
