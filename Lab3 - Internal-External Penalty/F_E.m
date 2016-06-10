function [ F ] = F_E( x1, x2, a, c )
%F Summary of this function goes here
%   Detailed explanation goes here

g1 = max(0, g(x1)).^2;
g2 = max(0, g(x2)).^2;
g3 = max(0, h(x1, x2, a)).^2;
S = g1 + g2 + g3;
F = f([x1 x2]) + c .* S;

end

