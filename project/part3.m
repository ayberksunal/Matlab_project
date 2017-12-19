%Written by Ayberk SUNAL
%Istanbul Bilgi University


%SALT AND PEPPER
image = imread('cameraman.jpg');
%add salt&pepper noise to image with 0.08 degree
noisedImage = imnoise(image,'salt & pepper',0.08);

figure,
subplot(1,4,2)
imshow(noisedImage);
double_img2D=double(noisedImage); 
SNR_Rate = snr(image, double_img2D);
title({'Salt & Pepper'; SNR_Rate});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%UNIFORM
A = -47;
B = 47;
image_for_uniform = imread('cameraman.jpg');
%creates noise
matrix_uniform = A + (B-A) * rand(size(image));
%adds original noised matrix to original image
noisy_image = double(image) + matrix_uniform;

subplot(1,4,3)
imshow(noisy_image./255), 
double_img2D_uniform=double(noisy_image); 
SNR_Rate_uniform = snr(image_for_uniform, double_img2D_uniform);
title({'Uniform';SNR_Rate_uniform });


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%GAUSSIAN
%I am interested in the values between [-2*sigma 2*sigma]
image_for_gaussian = imread('cameraman.jpg');
%the sigma = 27
G_var=(27/255)^2;
%creates noised image
Gauss14_v1 = imnoise(image_for_gaussian, 'gaussian', 0, G_var);
double_img2D_gaussian=double(Gauss14_v1); 
SNR_Rate_gaussian = snr(image_for_gaussian, double_img2D_gaussian);
subplot(1,4,4)
imshow(Gauss14_v1)
title({'Gaussian'; SNR_Rate_gaussian});

subplot(1,4,1)
imshow('cameraman.jpg');
title('Original');

