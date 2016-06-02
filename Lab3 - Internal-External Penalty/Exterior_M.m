function [ x_opt ] = Exterior_M( x, c, accuracy, Nmax )
%EXTERIOR_M Summary of this function goes here
%   Detailed explanation goes here

i = 1;
n = 2;
x_(1:Nmax, 1:n) = 0;
x_(1,:) = x;
while i < Nmax
    i = i + 1;
    x_(i,:) = HookeJeeves_EM( x_(i-1,1), x_(i-1,2), 0.5, 0.5, 1e-4, c, Nmax * Nmax );
    c = 2*c;
    if(abs( x_(i,:) - x_(i-1,:)) < accuracy)
        break;
    end
end
x_opt = x_(i,:);
end

