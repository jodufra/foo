function [ x1_opt, x2_opt ] = HookeJeeves_EM( x1, x2, s, alpha, accuracy, coeficient, a, Nmax )
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
    x = TrialStage_N(s, [x1B x2B], a);
    x1 = x(1);
    x2 = x(2);
    z = F_E(x1, x2, a, coeficient);
    zB = F_E(x1B, x2B, a, coeficient);
    if(z < zB)
        j = 0;
        z = F_E(x1, x2, a, coeficient);
        zB = F_E(x1B, x2B, a, coeficient);
        while(z < zB && j < Nmax)
            x1_B = x1B;
            x2_B = x2B;
            x1B = x1;
            x2B = x2;
            zB = z;
            %Working stage
            x1 = 2 * x1B - x1_B;
            x2 = 2 * x2B - x2_B;
            x = TrialStage_N(s, [x1 x2], a);
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