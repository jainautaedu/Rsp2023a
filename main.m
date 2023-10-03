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

figure; hold on
plot(abarvec,Rspvec,'r--','LineWidth',2)


p=polyfit(abarvec,Rspvec,3);
for i=1:imax
    Rspfitvec(i)=p(1)*(abarvec(i))^3+p(2)*(abarvec(i))^2+p(3)*abarvec(i)+p(4);
    percenterrorvec(i)=abs(Rspvec(i)-Rspfitvec(i))/Rspvec(i)*100;
end


%figure; hold on
plot(abarvec,Rspvec,'b-','LineWidth',2)
plot(abarvec,Rspfitvec,'b--','LineWidth',2)

maxerror=max(percenterrorvec(1:90))
flip(p)'


















y0=Rspvec;
y1=Rspfitvec;
dy = y0-y1 ; % error 
abs_dy = abs(y0-y1) ;   % absolute error 
relerr = abs(y0-y1)./y0 ;  % relative error 
pererr = abs(y0-y1)./y0*100 ;   % percentage error 
mean_err = mean(abs(y0-y1)) ;    % mean absolute error 
MSE = mean((y0-y1).^2) ;        % Mean square error 
RMSE = sqrt(mean((y0-y1).^2)) ; % Root mean square error 










for i=1:imax
    abarvec(i)=abarmin+(abarmax-abarmin)*(i-1)/(imax-1);
    abar=abarvec(i);
    Rsp4121(i)=2*Rsp_comp(abar,Bbar,Bisink);
    i
end

% 
% for i=1:imax
%     abarvec(i)=abarmin+(abarmax-abarmin)*(i-1)/(imax-1);
%     abar=abarvec(i);
%     Rsp4122(i)=Rsp_comp2(abar,Bbar,Bisink);
%     i
% end


figure; hold on
plot(abarvec,Rspvec,'r-','LineWidth',2)




%% Plot theta vs zbar

xbar=0.0;
imax=101;
zbarmax=Bbar;

for i=1:imax
    zbarvec(i)=zbarmax*(i-1)/(imax-1);
    thetavec(i)=theta(xbar,zbarvec(i),lambda,abar,Bbar,Bisink,pn,cn,czero);
end

figure; hold on
plot(zbarvec,thetavec,'r--')




%% Plot theta vs xbar at top

zbar=0.0;
imax=101;
xbarmax=1;
eps=0.0001;

for i=1:imax
    xbarvec(i)=xbarmax*(i-1)/(imax-1);
    thetavec(i)=theta(xbarvec(i),zbar,lambda,abar,Bbar,Bisink,pn,cn,czero);
    fluxvec(i)=(theta(xbarvec(i),eps,lambda,abar,Bbar,Bisink,pn,cn,czero)-theta(xbarvec(i),zbar,lambda,abar,Bbar,Bisink,pn,cn,czero))/eps;
end

figure; hold on
plot(xbarvec,thetavec,'c-')
%plot(xbarvec,fluxvec,'k-')

