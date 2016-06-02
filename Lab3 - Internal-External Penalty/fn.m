function [ z ] = fn( d )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(d);
z = Inf(m , n/2);
for i = 1 : m
    for j = 1 : n/2
        x = d(i, j);
        y = d(i, j*2);
        
        cl = c_l([x y]);
        cnl = c_nl(x, y);
        if(numel(cl(cl > 0)) == 0 && cnl <= 0)
            z(i,j) = (sin(pi.*sqrt(((x./pi)).^(2)+((y./pi)).^(2))))./(pi.*sqrt(((x./pi)).^(2)+((y./pi).^2)));
        end
    end
end


end
