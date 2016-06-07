function [ F ] = F_E( x1, x2, a, c )
%F Summary of this function goes here
%   Detailed explanation goes here

F = fn([x1 x2], a) + c * (max(0, c_l(x1))^2 + max(0, c_l(x2))^2 + max(0, c_nl(x1, x2, a))^2);

end

