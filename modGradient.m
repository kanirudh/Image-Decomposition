function [ output ] = modGradient( input )
%modGradient return the mod of the input Gradient Matrix
%   input : M x N x 2

input = input.^2;
input = sum(input,3).^(0.5);
output = sum(input(:));

end

