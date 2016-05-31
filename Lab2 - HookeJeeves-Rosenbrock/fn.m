function [ z ] = f( d )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    l = length(d)/2;
    x = d(:, 1:l);
    y = d(:, l+1:end);
    z = x.^2 + y.^2 - cos(2.5 .* pi .* x) - cos(2.5 .* pi .* y) + 2;
end
