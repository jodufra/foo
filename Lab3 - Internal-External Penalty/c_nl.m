function [ c ] = c_nl( x1, x2 )
%C_NL Summary of this function goes here
%   Detailed explanation goes here
%
% sqrt( x1^2 + x2^2 ) - a <= 0 <=>  a^2 - x1^2 - x2^2 <= 0

a = 5;

c = sqrt(x1.^2 + x2.^2) - a;

end

