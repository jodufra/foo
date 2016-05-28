function [minl, maxl] = Expansion_M(alpha, Nmax)
%Expansion_M Pre-determines the interval [minl, maxl], where the minimum of function f(x) is located.
%   Detailed explanation goes here
%

%Initiation of the algorithm
i = 1;
x = zeros(1, Nmax);
x(1) = -10 + 20 * rand(1);
x(2) = x(1) + 0.10;

if(f(x(1)) == f(x(2)))
    minl = x(1);
    maxl = x(2);
    if(minl > maxl)
        min_max_aux = minl;
        minl = maxl;
        maxl = min_max_aux;
    end
    return;
end

if(f(x(2)) > f(x(1)))
    %x(2) = - x(2); %alteration
    x(2) = 2*x(1)-x(2);
    if(f(x(2)) >= f(x(1)))
        minl = x(1);
        maxl = x(2);
        if(minl > maxl)
            min_max_aux = minl;
            minl = maxl;
            maxl = min_max_aux;
        end
        return
    end
end

while(true)
    if(i > Nmax)
        error('The interval was not found within the limit of iterations!');
    end
    i = i+1;
    x(i+1) = (alpha^i)*(x(2)-x(1))+x(i);
    if(f(x(i)) <= f(x(i+1)))
        break
    end
end

if(x(i-1) < x(i+1))
    minl = x(i-1);
    maxl = x(i+1);
else
    minl = x(i+1);
    maxl = x(i-1);
end

if(minl > maxl)
    min_max_aux = minl;
    minl = maxl;
    maxl = min_max_aux;
end
return

