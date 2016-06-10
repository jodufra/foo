function [ xB ]  =  TrialStage_N(step, x, func, a, c )
%TrialStage Summary of this function goes here
%   Detailed explanation goes here

n = length(x);
dimSize = 2^(n-1) + 1;
xB = x;
LEN = length(x);
len = LEN / 2;
fxB = func(xB(:, 1:len), xB(:, len+1:LEN), a, c);
s = de2bi(0:dimSize);
s = s .* step;
for i = 1 : dimSize
    x_B = x + s(i,:);
    fx_B = func(x_B(:, 1:len), x_B(:, len+1:LEN), a, c);
    if(fx_B < fxB)
        xB = x_B;
        fxB = fx_B;
    end
    
    x_B = x - s(i,:);
    fx_B = func(x_B(:, 1:len), x_B(:, len+1:LEN), a, c);
    if(fx_B < fxB)
        xB = x_B;
        fxB = fx_B;
    end
    
    s(i,:) = (2.* s(i,:)) - step;
    s(i,:) = s(i,:) / norm(s(i,:));
    
    x_B = x + s(i,:);
    fx_B = func(x_B(:, 1:len), x_B(:, len+1:LEN), a, c);
    if(fx_B < fxB)
        xB = x_B;
        fxB = fx_B;
    end
end

return
end