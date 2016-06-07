function [ m ] = f1( x )
%F1 Mass of the beam
%

p = 7800; % 7800 kg / m^3

len = length(x)/2;
l = x(:, 1:len);
d = x(:, len+1:end);

m = p .* ((pi .* d.^2) ./ 4) .* l;

end

