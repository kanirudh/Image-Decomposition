close all;clc;
barbara = imread('barbara.png');
lena = imread('lena_gray_512.tif');
imagef = double(lena);
[u,v] = tvDecomposition(imagef,2000);
% figure;imshow(im2uint8(v));
% figure;imshow(im2uint8(u));
figure;imshow(uint8(v));print('texture_lena','-dpng');
figure;imshow(uint8(u));print('structure_lena','-dpng');
save 'lena.mat'