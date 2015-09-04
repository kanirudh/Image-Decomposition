function [ output ] = matrixGradient( input )
%matrixGradient Calculates the gradient of the matrix of input grayscale matrix
%   
[M,N] = size(input);
output = zeros(M,N,2);

for m = 1:M-1
   output(m,:,1) = input(m+1,:)- input(m,:);
end

for n = 1:N-1
    output(:,n,2) = input(:,n+1) - input(:,n);
end

end % function