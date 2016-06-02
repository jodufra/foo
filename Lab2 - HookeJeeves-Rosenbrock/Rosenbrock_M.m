function [ x1_opt, x2_opt ] = Rosenbrock_M(x, direction, s, alpha, contraction, Nmax )
%ROSENBROCK_M Summary of this function goes here
%   Detailed explanation goes here

%Verify inputs
if(alpha <= 1)
    error('alpha <= 1');
elseif(contraction <= 0 || contraction >= 1 )
    error('contraction <= 0 || contraction >= 1');
elseif(Nmax <= 0)
    error('Nmax <= 0');
end


%Initiation of the algorithm
i = 1;
n = 2;
d = cell(n, Nmax);
d(:) = { direction(:,1)};
d(1:end, 1:2:end) = {direction(:,2)};
lambda(1:n, 1:Nmax) = 0;
p(1:n, 1:Nmax) = 0;
x_(1:n, 1:Nmax) = 0;
xB = x;


while (i < Nmax)
    for j = 1 : n
        if(fn(xB + (s(j, i)*d{j, i})') < fn(xB))
            xB = xB + (s(j, i)*d{j, i})';
            lambda(j, i+1) = lambda(j, i) + s(j, i);
            s(j, i+1) = alpha*s(j, i);
        else
            s(j, i+1) = -contraction*s(j, i);
            p(j, i+1) = p(j, i) + 1;
        end
    end
    
    i = i + 1;
    x_(:, i) = xB;
    
    for j = 1 : n
        if(p(j, i) ~= 0 && lambda(j, i)~= 0)
            D = GramSchmidt_M(d(:,i:i+1), lambda, i);
            d{j, i} = D(:, 1);
            d{j, i+1} = D(:, 2);
            
            for jj = 1 : n
                lambda(jj, i) = 0;
                p(jj, i) = 0;
                s(jj, i) = s(jj, 1);
            end
        end
    end
end

x1_opt = x_(1, i);
x2_opt = x_(2, i);
return
end

