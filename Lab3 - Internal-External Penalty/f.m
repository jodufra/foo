function [ z ] = f( d )
%F_NORMAL Summary of this function goes here
%   Detailed explanation goes here

l = length(d)/2;
x = d(:, 1:l);
y = d(:, l+1:end);
z = (sin(pi.*sqrt(((x./pi)).^(2)+((y./pi)).^(2))))./(pi.*sqrt(((x./pi)).^(2)+((y./pi).^2)));
end

