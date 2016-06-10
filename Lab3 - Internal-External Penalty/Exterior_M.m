function [ x_opt ] = Exterior_M( x, c, accuracy, alfa, Nmax )
%EXTERIOR_M Summary of this function goes here
%   Detailed explanation goes here

i = 1;
x_(1:Nmax, 1:2) = 0;
x_(1,:) = x;
func = @F_E;
while i < Nmax
    i = i + 1;
    x_(i,:) = HookeJeeves_M( x_(i-1,1), x_(i-1,2), 0.5, 0.5, 1e-5, c, alfa, func, 10000 );
    c = 2 * c;
    if(norm( x_(i,:) - x_(i-1,:)) < accuracy)
        break;
    end
end
x_opt = x_(i,:);
end

