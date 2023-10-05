

%% Initialize matrix and vector

for n=1:Nmax+1
    bvec(n)=0;
end

for m=1:Nmax+1
    for n=1:Nmax+1
        Amat(m,n)=0;
    end
end


%%% Coefficients for first equation, corresponding to simply integrating

bvec(1)=-abar; % independent term in first equation
Amat(1,1)=1/Bimax+(Bbar+1/Bisink)*abar; % coeff of c0 in the first equation
%Amat(1,1)=(Bbar+1/Bisink)*abar; % coeff of c0 in the first equation

for  n=1:Nmax
    Amat(1,n+1)=-sin(lambda(n)*abar)/lambda(n); % coeff of cn in the first equation
end


%%% Coefficients for (m+1)th equation

for m=1:N
    bvec(m+1)=-sin(lambda(m)*abar)/lambda(m); % independent term in the (m+1)th equation
    Amat(m+1,1)=(Bbar+1/Bisink)*sin(lambda(m)*abar)/lambda(m); % coeff of c0 in the (m+1)th equation
    for  n=1:Nmax
        if (m==n)
            Amat(m+1,n+1)=-(2*lambda(m)*abar+sin(2*lambda(m)*abar))/(4*lambda(m));
        else
            Amat(m+1,n+1)=-(lambda(m)*sin(lambda(m)*abar)*cos(lambda(n)*abar)-lambda(n)*cos(lambda(m)*abar)*sin(lambda(n)*abar))/((lambda(m))^2-(lambda(n))^2);
        end
    end
    Amat(m+1,m+1)=Amat(m+1,m+1)+lambda(m)*pn(m)/(2*Bimax); % additional term for m=n
end

sol=inv(Amat)*bvec';
czero=sol(1);

for m=1:N
    cn(m)=sol(m+1);
end
 

% ORIGINAL


%% Initialize matrix and vector

for n=1:Nmax+1
    bvec(n)=0;
end

for m=1:Nmax+1
    for n=1:Nmax+1
        Amat(m,n)=0;
    end
end



%%% Coefficients for first equation, corresponding to simply integrating

bvec(1)=-I1; % independent term in first equation
Amat(1,1)=1+(Bbar+1/Bisink)*I1; % coeff of c0 in the first equation

for  n=1:Nmax
    Amat(1,n+1)=-I2(n); % coeff of cn in the first equation
end


%%% Coefficients for (m+1)th equation

for m=1:N
    bvec(m+1)=-I2(m); % independent term in the (m+1)th equation
    Amat(m+1,1)=(Bbar+1/Bisink)*I2(m); % coeff of c0 in the (m+1)th equation
    for  n=1:Nmax
            Amat(m+1,n+1)=-I3(m,n); % coeff of cn in the (m+1)th equation
    end
    Amat(m+1,m+1)=Amat(m+1,m+1)+lambda(m)*pn(m)/2; % additional term for m=n
end

sol=inv(Amat)*bvec';
czero=sol(1);

for m=1:N
    cn(m)=sol(m+1);
end

