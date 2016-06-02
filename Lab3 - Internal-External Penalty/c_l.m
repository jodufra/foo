function [ X ] = c_l( x )
%LC Summary of this function goes here
%   Detailed explanation goes here
% 
% A.*x <= b
% 
% -x1+1<=0 <=> -x1<=-1
% -x2+1<=0 <=> -x2<=-1
% 
%      x1  x2
% A = [-1  0 ]
%     [ 0 -1 ]
% b = [-1]
%     [-1]
% 

X = -x + 1;

end

