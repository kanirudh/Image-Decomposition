function [ pfinal ] = chambolleProjection( f,tau , lambda )
%chambolleProjection decomposes image into structural and textural
%component
%   Implements Chambolle iterative fixed point algorithm 
%   J.-F. Aujol, G. Aubert, L. Blanc-Feraud, A. Chambolle, Image decomposition
%   into a bounded variation component and an oscillating component, Journal of
%   Mathematical Imaging and Vision 22 (2005)
    
if tau > 1/8
    warning('tau greater than 1/8, setting equal to 1/8');
    tau = 1/8;
end

[M,N] = size(f);
p2 = zeros(M,N,2);

MAXN = 2000; % Maximum number of iterations

for i = 1:MAXN
    p1 = p2;
    temp = matrixGradient(matrixDivergence(p1) - f./lambda);
    modtemp(:,:,1) = sum(temp.^2,3).^(0.5);
    modtemp(:,:,1) = 1 + tau*modtemp(:,:,1);
    modtemp(:,:,2) = modtemp(:,:,1);
    p2 = (p1 + temp*tau)./modtemp;
end
fprintf('Final matrix gradient error in projection is %f\n',modGradient(p2-p1));

%Calculating the final matrix
pfinal = lambda*matrixDivergence(p2);

end % function