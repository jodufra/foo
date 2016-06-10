function [ F ] = F_I( x1, x2, a, c )
%F Summary of this function goes here
%   Detailed explanation goes here

g1 = 1 ./ g(x1);
g2 = 1 ./ g(x2);
g3 = 1 ./ h(x1, x2, a);
S = -(g1 + g2 + g3);
F = f([x1 x2]) + c .* S;

end

