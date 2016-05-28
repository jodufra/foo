function [ xopt ] = GoldenR_M(minl,maxl,Nmax,accuracy)
%GoldenR_M Finds the minimal value of function f(x) within interval [minl, maxl], accuracy of solution e > 0, maximal number of iteration Nmax.
%   Detailed explanation goes here

%Initiation of the algorithm
i=1;
alpha=((sqrt(5)-1)/2);
a = zeros(1, Nmax);
b = zeros(1, Nmax);
c = zeros(1, Nmax);
d = zeros(1, Nmax);

a(1)= minl;
b(1)= maxl;
c(1)= b(1)-alpha*(b(1)-a(1));
d(1)= a(1)+alpha*(b(1)-a(1));

while (true)
    if (f(c(i))<f(d(i)))
        a(i+1)=a(i);
        b(i+1)=d(i);
        d(i+1)=c(i);
        c(i+1)=b(i+1)-(alpha*(b(i+1)-a(i+1)));
    else
        a(i+1)=c(i);
        b(i+1)=b(i);
        d(i+1)=a(i+1)+(alpha*(b(i+1)-a(i+1)));
        c(i+1)=d(i);
    end
    i=i+1;
    if (i>Nmax)
        error('i > Nmax');
    end
    if((b(i)-a(i)) < accuracy)
        break;
    end
end

xopt=((a(i)+b(i))/2);
return