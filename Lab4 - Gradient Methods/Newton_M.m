function [ x1_opt, x2_opt ] = Newton_M(grad, hess, x1, x2, accuracy, Nmax )
%NEWTON_M Summary of this function goes here
%   Detailed explanation goes here

xA = [x1; x2];
for i = 1 : Nmax
    g = grad(xA(1), xA(2));
    h = hess(xA(1), xA(2)); %Evaluate hessian
    if norm(h) ==  Inf(1)
        error('Not invertible Matrix');
    end
    xB = xA - (h \ g); % xB = xA + h * g;
    if norm(xB - xA) < accuracy || norm(g) == 0
        break;
    else
        xA = xB;
    end
end
x1_opt = xB(1);
x2_opt = xB(2);

end