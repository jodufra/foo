function [ F ] = F_E( x1, x2, w, c )
%F Summary of this function goes here
%   Detailed explanation goes here

P = 1000; % 1 KN
h1 = (32 * P .* x1.^3) ./ (pi .* x2.^3);
h2 = f2([x1 x2]);

F = f([x1 x2], w) + c .* (h1.^2 + h2.^2);

end

