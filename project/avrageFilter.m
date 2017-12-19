%Written by Ayberk SUNAL
%Istanbul Bilgi University

figure,
subplot(1,4,1)
imshow('cameraman.jpg');
title('Original Image')
subplot(1,4,2)
imshow('Gauss14.jpg');
title('Noised Image');
subplot(1,4,3)
filter = [1 1 1 ;1 1 1;1 1 1];
myfilter('Gauss14.jpg',filter);
title('Result of #myfilter')
subplot(1,4,4);
medfilt_image = imread('Gauss14.jpg');
imshow(medfilt2(medfilt_image));
title('Result of #medfilt2');




function resultMatrix = myfilter(image,filter)
%filter matrix MUST be 3X3!!!
%controls whether rgb or not
if(1 < size(image,3) )
    %if image is rgb converts it to B/W
    image = rgb2gray(image);
end;

I = imread(image);
[x,y] = size(I);
zeroFramedImage = padarray(I,[1 1],0,'both');

%create a zero frame to able to calculate the corners
resultMatrix = zeros(x,y,'uint8');
%sums the ach element of the filter matrix
total = 0;
for i=1:size(filter,1)
  for j=1:size(filter,2)
    total = total + filter(i,j);
  end
end

%apply the formula of filtering
%cross each element of filter with sliced part of the original matrix
a=1;
b=1;
for i = 2:x+1
    for j = 2:y+1
        sum = 0;
        for ii = i-1:i+1
            for jj = j-1:j+1
                %sums all crossed and divided values of 3x3 part of the matrix
                sum = sum +((filter(a,b) * zeroFramedImage(ii,jj))/total);
                b = b+1;
            end
            b = 1;
            a = a+1;
        end
        a=1;
        b=1;
        %replace the zero matrix value with result
        resultMatrix(i-1,j-1) = round(sum);
    end
end
%when I convert to unint8 I do
%loose all negative values!!!
resultMatrix = uint8(resultMatrix);
imshow(resultMatrix);
end
