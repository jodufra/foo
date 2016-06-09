function [ symf ] = f_sym(  )
%F_SYM Summary of this function goes here
%   Detailed explanation goes here

syms y x;
symf = symfun(x.^2 + y.^2 - cos(2.5 * pi .* x) - cos(2.5 * pi .* y) + 2, [x y]);
end

