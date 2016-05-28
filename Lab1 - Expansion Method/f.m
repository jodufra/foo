function [ y ] = f( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    y = ((-cos(x)).*exp(-(x-2*pi).^2)+0.002.*(x.^2));
end