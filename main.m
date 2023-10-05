clear
format long
Nmax=150; % number of eigenvalues to be considered for SOV solution
N=Nmax;

abar=0.1;
Bbar=1.2;
Bisink=1000;
Bimax=1000;

getlambdas;
getintegrals;
getcn;

%dochecks;

imax=101;
abarmin=0.1;
abarmax=0.55;

for i=1:imax
    abarvec(i)=abarmin+(abarmax-abarmin)*(i-1)/(imax-1);
    abar=abarvec(i);
    getlambdas;
    getintegrals;
    getcn;

    Rspvec(i)=Rsp(czero,cn,pn,lambda,abar,Bbar,Bisink);
    i
end


p=polyfit(abarvec,Rspvec,3);
for i=1:imax
    Rspfitvec(i)=p(1)*(abarvec(i))^3+p(2)*(abarvec(i))^2+p(3)*abarvec(i)+p(4);
    percenterrorvec(i)=abs(Rspvec(i)-Rspfitvec(i))/Rspvec(i)*100;
end


%figure; hold on
plot(abarvec,Rspvec,'b-','LineWidth',2)
plot(abarvec,Rspfitvec,'b--','LineWidth',2)
legend('Solution','Fit');

maxerror=max(percenterrorvec(1:90));
flip(p)';
c0=p(4)
c1=p(3)
c2=p(2)
c3=p(1)












