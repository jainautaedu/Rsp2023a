for n=1:Nmax
    lambda(n)=n*pi;
end


for n=1:Nmax
    pn(n)=-(Bisink*cosh(lambda(n)*Bbar)+lambda(n)*sinh(lambda(n)*Bbar))/(Bisink*sinh(lambda(n)*Bbar)+lambda(n)*cosh(lambda(n)*Bbar));
end


