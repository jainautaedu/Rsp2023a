function Rsp = Rsp(czero,cn,pn,lambda,abar,Bbar,Bisink)

sum=0;

for n=1:length(lambda)
    sum=sum+cn(n)*pn(n)*sin(lambda(n)*abar);
end

Rsp=-1/(czero*abar+sum)-(Bbar+1/Bisink);

end