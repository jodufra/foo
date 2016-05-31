function [ x1B, x2B ]  =  TrialStage(s, x1, x2)
%TrialStage Summary of this function goes here
%   Detailed explanation goes here

if f(x1 + s, x2) < f(x1, x2)
    x1B = x1 + s;
    x2B = x2;
elseif f(x1 - s, x2) < f(x1, x2)
    x1B = x1 - s;
    x2B = x2;
elseif f(x1, x2 + s) < f(x1, x2)
    x1B = x1;
    x2B = x2 + s;
elseif f(x1, x2 - s) < f(x1, x2)
    x1B = x1;
    x2B = x2 - s;
else
    x1B = x1;
    x2B = x2;
end

return
end