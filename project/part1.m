%Written by Ayberk SUNAL
%Istanbul Bilgi University


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART1 A
figure,
subplot(3,2,1)
imshow('p1a.png');
title('original image')

%reads the image
image = imread('p1a.png');
%image level is [0-255]so we can reverse the levels
%example: 0->255 1->254 255->0 
L = 256;
newImage = (L-1)-image;

subplot(3,2,2)
imshow(newImage);
title('Image negative -> S = L - 1 - r')
%title('transformed')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PART1 B
subplot(3,2,3)
imshow('p1b.png')
title('original image')

B = imread('p1b.png');
%only copy the red values
B2 = B(:,:,1);
%rotate them 180 degrees
B2 = imrotate(B2,180);
%combine with green and blue values
B(:,:,1) = B2;

subplot(3,2,4)
imshow(B);
title('Red rotated')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART1 C

A=imread('p1c.jpg');
r=double(A);
G=2.00;%Gamma =2.00
C=1;
S=C*(r.^G);
Temp=255/(C*(255.^G));
%display image range [0 255]
S1=uint8(Temp*S);

h1=subplot(3,2,5);
imshow(A);
title('original image')
h2=subplot(3,2,6);
imshow(S1);
linkaxes([h2,h1])
title('Gamma corrected Image -> S = cr^\gamma  \gamma = 2.00 c = 1')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%