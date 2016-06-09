function [ z ] = f( x,y )
%F Summary of this function goes here
%   Detailed explanation goes here

z = x.^2 + y.^2 - cos(2.5 * pi .* x) - cos(2.5 * pi .* y);
end

