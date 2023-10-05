function theta=theta(xbar,zbar,lambda,abar,Bbar,Bisink,pn,cn,czero)

sum=0;

for n=1:length(lambda)
    sum=sum+cn(n)*cos(lambda(n)*xbar)*(cosh(lambda(n)*zbar)+pn(n)*sinh(lambda(n)*zbar));
end

theta0=czero*(zbar-(Bbar+1/Bisink));
theta=sum+theta0;

end
