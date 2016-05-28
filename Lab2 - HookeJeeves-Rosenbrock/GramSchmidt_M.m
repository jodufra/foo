function [ D ] = GramSchmidt_M( d, lambda, i )
%GRAMSCHMIDT_M Summary of this function goes here
%   Detailed explanation goes here

D(1:2,1:2) = 0;
Q = d*[lambda(1, i + 1) 0; lambda(2, i + 1) lambda(2, i + 1)];

v = Q(:,1);
D(:,1) = v / norm(v);

v = Q(:,2) - (Q(:,2)' * D(:,1)) * D(:,1);
D(:,2) = v / norm(v);
return
end
