function [ output ] = matrixDivergence( input )
%matrixDivergence Returns the divergence of a matrix
%   input : M x N x 2
%   output: M x N

[M,N,d] = size(input);
if d ~= 2 
    warning('matrixDivergence : Check matrix dimensions');
end

%Initializing the divergence matrix
output = zeros(M,N);

output(1,:) = input(1,:,1);
for m = 2:M-1
    output(m,:) = input(m,:,1) - input(m-1,:,1);
end
output(M,:) = -1*input(M,:,1);

output(:,1) = output(:,1) + input(:,1,2);
for n = 2:N-1
    output(:,n) = output(:,n) + input(:,n,2) - input(:,n-1,2);
end
output(:,N) = output(:,N) - input(:,N,2);

end % function

