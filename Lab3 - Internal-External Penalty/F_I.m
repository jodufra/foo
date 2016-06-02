function [ F ] = F( x1, x2, c )
%F Summary of this function goes here
%   Detailed explanation goes here

F = fn([x1 x2]) - c * ((1 / c_l(x1)) + (1 / c_l(x2)) + (1 / c_nl(x1, x2)));

end

