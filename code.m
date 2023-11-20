% K-Means Clustering
clc;
clear all;

subplot(2,2,1)
im = imread('img.png');
imshow(im)
title('a')

subplot(2,2,2)
imhist(im)
title('b')

% performing histogram equalization
subplot(2,2,3)
J = histeq(im);
imshow(J)
title('c')

subplot(2,2,4)
imhist(J)
title('d')

%Remove gaussian noise (IE random noise in image)
subplot(2,1,1)
imshow(J)
title('Image after histogram equalizaton')

% Degree of smoothin set it to be larger than the variance of the noise
subplot(2,1,2)
patch = imcrop(J,[170, 35, 50 50]);
patchVar = std2(patch)^2;
DoS = 2*patchVar;
% apply bilateral filter
I = imbilatfilt(J,DoS);
imshow(I)
title(['Degree of Smoothing: ',num2str(DoS)])

subplot_tight(2,2,1, [0.1,0.1]);
imshow(I)
title('a')

subplot(2,2,2)
%perform k means clustering.
[L,Centers] = imsegkmeans(I,2);
B = labeloverlay(I,L);
imshow(B)
title('b')

% binary image
subplot(2,2,3)
BW = imbinarize(L);
imshow(BW)
title('c')

%apply convex hull method
l=imclearborder(BW);
l = bwareafilt(l,2);
l = imfill(l,'holes');
%imshow(l,[]);


subplot(2,2,4)
k=bwconvhull(l,'objects');
imshow(k);
title('d')


%Threshhold Method
clc;
close all;
imtool close all;
workspace;
format long g;
format compact;
fontSize = 10;

userpath (’C: / Users/Math6346CovidProjectData fullFileName = fullfile ( ’ 00006473. png ’ );


[ pixelCount , grayLevels ] = imhist( grayImage ) ;
% of the rest of the histogram when plotted. Zero out these bins so 
pixelCount( 1 ) = 0;




