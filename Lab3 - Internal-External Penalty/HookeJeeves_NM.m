function [ x_opt ] = HookeJeeves_NM(x, s, alpha, accuracy, Nmax )
%HOOKEJEEVES_M Summary of this function goes here
%   Detailed explanation goes here

%Verify inputs
if (s < 0)
    error('s < 0');
elseif (alpha >= 1)
    error('alpha >= 1');
elseif (accuracy < 0)
    error('accuracy < 0');
elseif (Nmax <= 0)
    error('Nmax <= 0');
end

i = 0;
while s > accuracy && i < Nmax
    %Trial stage
    xB = x;
    [x] = TrialStage_N(s, xB);
    
    if (fn(x) < fn(xB))
        j = 0;
        while(fn(x) < fn(xB) && j < Nmax)
            x_B = xB;
            xB = x;
            %Working stage
            x = 2 .* xB - x_B;
            [x] = TrialStage_N(s, x);
            j = j + 1;
        end
        x = xB;
    else
        s = alpha .* s;
    end
    i = i + 1;
end

x_opt = x;
return
end