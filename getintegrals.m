% integrand1= @(xbarstar) getintegrand1(xbarstar,abar,Bimax);
% I1=integral(integrand1,0,1);
% 
% 
% for m=1:length(lambda)
%     integrand2= @(xbarstar) getintegrand2(xbarstar,abar,Bimax,lambda,m);
%     I2(m)=integral(integrand2,0,1);
% end
% 
% for m=1:length(lambda)
%     for n=1:length(lambda)
%         integrand3= @(xbarstar) getintegrand3(xbarstar,abar,Bimax,lambda,m,n);
%         I3(m,n)=integral(integrand3,0,1);
%         I3a(m,n)=integral(integrand3,0,abar);
%     end
% end





%% Explciit expressions to determine integrals - *Faster*

I1=Bimax*abar;

for m=1:length(lambda)
    integrand2= @(xbarstar) getintegrand2(xbarstar,abar,Bimax,lambda,m);
    I2(m)=Bimax*sin(lambda(m)*abar)/lambda(m);
end


for m=1:length(lambda)
    for n=1:length(lambda)
        if (m==n)
            I3(m,n)=Bimax*(2*lambda(m)*abar+sin(2*lambda(m)*abar))/(4*lambda(m));
        else
            I3(m,n)=Bimax*(lambda(m)*sin(lambda(m)*abar)*cos(lambda(n)*abar)-lambda(n)*cos(lambda(m)*abar)*sin(lambda(n)*abar))/((lambda(m))^2-(lambda(n))^2);
        end
    end

end