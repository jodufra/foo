function [ x1_opt, x2_opt ] = SteepestD_M( xv,yv,accuracy,Nmax )
%STEEPEST Summary of this function goes here
%   Detailed explanation goes here
syms y x;
f=symfun(x^2 + y^2 - cos(2.5 * pi * x) - cos(2.5 * pi * y) + 2,[x,y]); %here you declare the 2 variable function.
g=gradient(f);
x0=[xv yv]';
for i=1:Nmax
    d=-g(x0(1),x0(2));
    d=double(d);%evaluate d(i)
    %Evaluate h(i)
    a=symfun(f(x0(1)+d(1)*x,x0(2)+d(2)*x),x);
    b=matlabFunction(a);
    h=fminbnd(b,-1e20,1e20);
    xnex=x0+h*d;%x(i+1)=x(i)+h(i)*d(i)
    %i=i+1
    if norm(xnex-x0)<accuracy
        break;
    else
        x0=xnex;
        
    end
    %
end
        x1_opt=xnex(1);
        x2_opt=xnex(2);

end

