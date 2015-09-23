%@BOUT:THIS FILE DEALS WITH PRINTING THE IMAGE ONTO THE SCREEN.
%DEVELOPER:DREAMZZZ TECHNOLOGY
%VERSION:1.1.0
%RUN COMPATIBILITY:MATLAB 7.5.0

function []=PLOT()
a=imread('jpg_1x.jpg');
b=imread('jpg_2x.jpg');

subplot(2,3,1)
imshow(a);
title('Original Image');

subplot(2,3,2)
imshow(b);
title('Resized image Image');

c=imresize(a,2,'nearest')
subplot(2,3,4)
imshow(c);
title('Nearest neighbour image')

d=imresize(a,2,'Bilinear')
subplot(2,3,5)
imshow(d);
title('Bilinear interpolated image')

e=imresize(a,2,'bicubic')
subplot(2,3,6)
imshow(e);
title('Bicubic interpolated image')