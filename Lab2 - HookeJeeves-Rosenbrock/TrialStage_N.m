function [ xB ]  =  TrialStage_N(step, x)
%TrialStage Summary of this function goes here
%   Detailed explanation goes here

n = length(x);
dimSize = 2^(n-1) + 1;
xB = x;
fxB = fn(xB);
s = de2bi(0:dimSize);
s = s .* step;
for i = 1 : dimSize    
    x_B = x + s(i,:);
    fx_B = fn(x_B);
    if(fx_B < fxB)
        xB = x_B;
        fxB = fx_B;
    end
    
    x_B = x - s(i,:);
    fx_B = fn(x_B);
    if(fx_B < fxB)
        xB = x_B;
        fxB = fx_B;
    end
    
    s(i,:) = (2.* s(i,:)) - step;
    s(i,:) = s(i,:) / norm(s(i,:));
    x_B = x + s(i,:);
    fx_B = fn(x_B);
    if(fx_B < fxB)
        xB = x_B;
        fxB = fx_B;
    end
end

return
end