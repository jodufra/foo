function [ x1_opt, x2_opt ] = HookeJeeves_IM( x1, x2, s, alpha, accuracy, coeficient, Nmax )
%HOOKEJEEVES_M Summary of this function goes here
%   Detailed explanation goes here

%Verify inputs
if(s < 0)
    error('s < 0');
elseif(alpha >= 1)
    error('alpha >= 1');
elseif(accuracy < 0)
    error('accuracy < 0');
elseif(Nmax <= 0)
    error('Nmax <= 0');
end

i = 0;
while s > accuracy && i < Nmax
    %Trial stage
    x1B = x1;
    x2B = x2;
    x = TrialStage_N(s, [x1B x2B]);
    x1 = x(1);
    x2 = x(2);
    if(F_I(x1, x2, coeficient) < F_I(x1B, x2B, coeficient))
        j = 0;
        while(F_I(x1, x2, coeficient) < F_I(x1B, x2B, coeficient) && j < Nmax)
            x1_B = x1B;
            x2_B = x2B;
            x1B = x1;
            x2B = x2;
            %Working stage
            x1 = 2 * x1B - x1_B;
            x2 = 2 * x2B - x2_B;
            x = TrialStage_N(s, [x1 x2]);
            x1 = x(1);
            x2 = x(2);
            j = j + 1;
        end
        x1 = x1B;
        x2 = x2B;
    else
        s = alpha .* s;
    end
    i = i + 1;
end

x1_opt = x1;
x2_opt = x2;
return
end