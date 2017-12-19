%Written by Ayberk SUNAL
%Istanbul Bilgi University

%reads the image to equalize the histogram_Hin
image = imread('p2.jpg');
%convert the image RGB to B/W if it's RGB
if(1 < size(image,3) )
    image = rgb2gray(image);
end;
row_number =size(image,1); %row
column_number = size(image,2);%col

%size of the image 
% 8x8 image has 64 pixels
NM = row_number * column_number;
% to store number of using time of each level
histogram_Hin = zeros([1 256]);
% to store cumulative histogram levels
cumulative_histogram = zeros([1 256]);
% to store equalized histogram levels(Result)
equalized_image = zeros([row_number column_number]);
%to store equalized histogram levels
equalized_hist = zeros([1 256]);
%to calculate cumulative levels
temporary_number = 0;


%levels the number of using of each level
% if there is same level increases one time
for r = 1:column_number
    for c = 1:row_number
        for level = 1:256
            if(image(r,c) == level-1)
                histogram_Hin(level) = histogram_Hin(level) + 1;
                break;
            end
        end
    end
end


%stores using times of levels cumulatively
for level = 1:256
    temporary_number = temporary_number + histogram_Hin(level);
    cumulative_histogram(level) = temporary_number;
end


% (LEVEL*(L-1)) / EQ_LEVEL)
for level = 1:256
    equalized_hist(level) = cumulative_histogram(level) ;
    equalized_hist(level) = equalized_hist(level) / ((NM) );
    equalized_hist(level) = round(equalized_hist(level) * 255);
end


% changes the old levels with the equalized levels
for r = 1:column_number
    for c = 1:row_number
        for level = 1:256
            if(image(r,c) == (level-1))
                    equalized_image(r,c) = equalized_hist(level);
                break;
               
            end
        end
    end
end

subplot(2,2,1)
imshow(image);
title('Unequalized image')
subplot(2,2,2);
imshow(uint8(equalized_image));
title('Equalized image');
subplot(2,2,3);
imhist(image);
title('histogram (Hin) equalized image');
H = uint8(equalized_image);
subplot(2,2,4);
imhist(H);
title('histogram_Hin of histogram_Hin equalized image');

