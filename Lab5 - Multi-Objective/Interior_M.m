function [ x_opt ] = Interior_M( x, c, accuracy, scalling, alfa, Nmax )
%EXTERIOR_M Summary of this function goes here
%   Detailed explanation goes here

i = 1;
n = 2;
x_(1:Nmax, 1:n) = 0;
x_(1,:) = x;
while i < Nmax
    i = i + 1;
    x_(i,:) = HookeJeeves_IM( x_(i-1,1), x_(i-1,2), 0.5, 0.5, 1e-4, c, alfa, Nmax * Nmax );
    c = scalling*c;
    if(abs( x_(i,:) - x_(i-1,:)) < accuracy)
        break;
    end
end
x_opt = x_(i,:);
end

