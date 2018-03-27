%Fits entry file
%Matlab Project

import matlab.io.*
% gets file from a given file name
filename = input('Enter file name (including extention): ', 's');

magnification = input('Enter image magnification: ');

imMat=imread(filename);
% shows the original image
%figure, imshow(imMat)
% makes background stars dissapears for galaxies
imMat=imgaussfilt(imMat,3);
%figure, imshow(imMat)
% turns it into a black and white photo
level=graythresh(imMat);
BW=im2bw(imMat,level);
imshow(BW);
% only keeps the largest object
BW2 = bwareafilt(BW, 1);
figure, imshow(BW2)

sizeobj = getsize(BW2, magnification);

%numObj=bwconncomp(BW);
%val = max(numObj.PixelIdxList)

%BW=bwareaopen(BW,5000);x
%figure, imshow(BW);
%figure, imshow(imMat);
%subplot(1,2,1), imshow(imMat);
%subplot(1,2,2), imshow(BW);