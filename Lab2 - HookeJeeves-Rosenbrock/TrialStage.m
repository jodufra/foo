function [ x1B, x2B ]  =  TrialStage(s, x1, x2)
%TrialStage Summary of this function goes here
%   Detailed explanation goes here

x1T = x1 + s;
x2T = x2 + 0;

if f(x1T, x2T) < f(x1, x2)
    x1B = x1T;
    x2B = x2T;
    return
else
    x1T = x1 - s;
    x2T = x2 + 0;
end

if f(x1T, x2T) < f(x1, x2)
    x1B = x1T;
    x2B = x2T;
    return
else
    x1T = x1 + 0;
    x2T = x2 + s;
end

if f(x1T, x2T) < f(x1, x2)
    x1B = x1T;
    x2B = x2T;
    return
else
    x1T = x1 + 0;
    x2T = x2 - s;
end

if f(x1T, x2T) < f(x1, x2)
    x1B = x1T;
    x2B = x2T;
    return
else
    x1B = x1;
    x2B = x2;
end
return
end