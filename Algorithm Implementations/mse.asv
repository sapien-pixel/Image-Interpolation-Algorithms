%@BOUT:THIS PROGRAM DEALS WITH FINDING THE MSE and PSNR(mean square error and peak signal to noise ratio) FOR THE
%INTERPOLATED IMAGE USING SPATIAL DOMAIN INTERPOLATION.
%DEVELOPER:DREAMZZZ TECHNOLOGY
%VERSION:1.1.0
%RUN COMPATIBILITY:MATLAB 7.5.0

a=imread('jpg_1x.jpg');
a=rgb2gray(a);
figure;imshow(a);
a=double(a);


b=imread('jpg_2x.jpg');
b=rgb2gray(b);
figure;imshow(b)
b=double(b);

y=imresize(a,2,'nearest');
y=double(y);
mse_nr=(norm(y-b,2))/(norm(b,2));
psnr_nr=20*log10(255/sqrt(mse_nr));


y=imresize(a,2,'bilinear');
y=double(y);
mse_bil=(norm(y-b,2))/(norm(b,2));
psnr_bil=20*log10(255/sqrt(mse_bil));

y=imresize(a,2,'bicubic');
y=double(y);
mse_bic=(norm(y-b,2))/(norm(b,2));
psnr_bic=20*log10(255/sqrt(mse_bic));

PLOT();
