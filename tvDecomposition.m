function [ u,v ] = tvDecomposition( image,epsilon )
%tvDecomposition Peform total variation decomposition of a gray scale image
%   Using Chambolle Projection Algorithm in the following paper 
%   J.-F. Aujol, G. Aubert, L. Blanc-Feraud, A. Chambolle, Image decomposition
%   into a bounded variation component and an oscillating component, Journal of
%   Mathematical Imaging and Vision 22 (2005)
%   Author : Anirudh Kumar Agrawal


[M,N] = size(image);
f = image;
%f = im2double(image);
u2 = zeros(M,N);
v2 = zeros(M,N);

%epsilon = 300.0;
iteration = 0;
error = 2*epsilon;
lambda = 1.0;
mu = 100.0;
tau = 0.125;

while  error > epsilon
    v1 = v2;
    u1 = u2;
    v2 = chambolleProjection(f - u1,tau,mu);
    u2 = f - v2 - chambolleProjection(f - v2,tau,lambda);
    iteration = iteration + 1;
    error = max( norm(u2(:) - u1(:), 1) , norm(v2(:) - v1(:), 1));
    %error  = max(modGradient(matrixGradient(u2 - u1)),modGradient(matrixGradient(v2 - v1)));
    fprintf('Decomposition iteration %d and error %f\n',iteration, error);
end    

u = u2;
v = v2;

end % function