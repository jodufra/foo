function [ xopt ] = Lagrange_M(minl,maxl,Nmax,accuracy,gamma)
%Lagrange_M 
%   Detailed explanation goes here

%Initiation of the algorithm
i=1;
a = zeros(1, Nmax);
b = zeros(1, Nmax);
c = zeros(1, Nmax);
d = zeros(1, Nmax);

a(i) = minl;
b(i) = maxl;
c(i) = ((a(i) + b(i)) / 2);

while (true)
    d(i)= (0.5)*(((f(a(i))*((c(i)^2 )-(b(i)^2 ))+ f(c(i))*((b(i)^2 )-(a(i)^2 ))+ f(b(i))*((a(i)^2 )-(c(i)^2 ))))/(f(a(i))*((c(i))-(b(i)))+ f(c(i))*((b(i))-(a(i)))+ f(b(i))*((a(i))-(c(i))) ));
    
    if(a(i) < d(i) && d(i) < c(i))
        if(f(d(i)) < f(c(i)))
            a(i+1) = a(i);
            c(i+1) = d(i);
            b(i+1) = c(i);
        else
            a(i+1) = d(i);
            c(i+1) = c(i);
            b(i+1) = b(i);
        end
    elseif(c(i) < d(i) && d(i) < b(i))
        if(f(d(i)) < f(c(i)))
            a(i+1) = c(i);
            c(i+1) = d(i);
            b(i+1) = b(i);
        else
            a(i+1) = a(i);
            c(i+1) = c(i);
            b(i+1) = d(i);
        end
    else
        error('Not convergent');
    end
    
    i = i+1;
    if(i > Nmax)
        error('Accuracy not achieved within max number of iterations');
    end
    
    if( (i < 3 && ((b(i)-a(i)) < accuracy)) || (i > 2 && (((b(i)-a(i)) < accuracy) || (abs(d(i-1)-d(i-2)) <= gamma))))
        break;
    end
end

xopt = d(i-1);
return

