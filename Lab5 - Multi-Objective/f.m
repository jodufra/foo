function [ z ] = f( x, w )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

z = w .* f1(x) + (1 - w) .* f2(x);
end
