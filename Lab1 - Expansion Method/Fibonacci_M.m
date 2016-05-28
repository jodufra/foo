function [ xopt ] = Fibonacci_M(minl,maxl,Nmax,accuracy)
%Fibonacci_M Finds the minimal value of function f(x) within interval [minl, maxl], accuracy of solution e > 0, maximal number of iteration Nmax.
%   Detailed explanation goes here
%

%Finds the index k for fibonnanci sequence.
k=1;
while phi_n(k) <= ((maxl-minl)/accuracy)
    if k > Nmax
        error('Maximun iterations Reached. No solution.')
    else
        k = k+1;
    end
end

%Initiation of the algorithm
a = zeros(1, Nmax);
b = zeros(1, Nmax);
c = zeros(1, Nmax);
d = zeros(1, Nmax);

a(1)= minl;
b(1)= maxl;
c(1)= b(1)-((phi_n(k-1)/phi_n(k))*(b(1)-a(1)));
d(1)= a(1)+b(1)-c(1);

%Narrowing in the algorithm.
for i=0:k-4
    ii = i + 1; % For matlab array access that start at index 1 instead of 0
    if f(c(ii))<f(d(ii))
        a(ii+1)=a(ii);
        b(ii+1)=d(ii);
    else
        b(ii+1)=b(ii);
        a(ii+1)=c(ii);
    end
    c(ii+1)=b(ii+1)-((phi_n(k-i-2))/(phi_n(k-i-1)))*(b(ii+1)-a(ii+1));
    d(ii+1)=a(ii+1)+b(ii+1)-c(ii+1);
end

xopt = c((k-3) + 1);
return

