function [ F ] = F_I( x1, x2, w, c )
%F Summary of this function goes here
%   Detailed explanation goes here


P = 1000; % 1 KN
h1 = (32 * P .* x1.^3) ./ (pi .* x2.^3);
h2 = f2([x1 x2]);

F = f([x1 x2], w) - c .* ((1 ./ h1) + (1 ./ h2));

end

