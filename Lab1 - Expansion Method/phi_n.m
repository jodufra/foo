function [ phi ] = phi_n( n )
%PHI_N Fibonacci sequence
%   Detailed explanation goes here
phi = (1/sqrt(5)).*(((1+sqrt(5))/2).^n-(((1-sqrt(5))/2).^n));

end

