function [ F ] = F_I( x1, x2, a, c )
%F Summary of this function goes here
%   Detailed explanation goes here

% F = f_normal([x1 x2]) - c .* ((1 ./ c_l(x1)) + (1 ./ c_l(x2)) + (1 ./ c_nl(x1, x2, a)));
g1 = log(-c_l(x1))/log(exp(1));
g2 = log(-c_l(x2))/log(exp(1));
g3 = log(-c_nl(x1, x2, a))/log(exp(1));
F = f_normal([x1 x2]) - c .* ( g1 + g2 + g3 );

end

