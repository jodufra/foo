function [ u ] = f2( x )
%F2 Deflection of the beam
% 

P = 1000; % 1 KN
E = 207*(10^9); % 207 GPa

len = length(x)/2;
l = x(:, 1:len);
d = x(:, len+1:end);

u = (64 * P .* l.^3) ./ (3 * E * pi .* d.^4);
end

