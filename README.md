# Image-Interpolation-Algorithms
Implementation of various Image Interpolation Algorithms in Matlab  in Spatial and Frequency Domain

This project helps to undersand different types of image interpolations algorithms.
Image Interpolation can be processed in mainly 2 domains:
1. Spatial Domain or the pixel domain - considering an image as a matrix.
2. Frequency Domain - transform the image from original Spatial domain to Frequeny domain using FFT(Fast Fourier Transform)

Images can be roughly classified into 2 types:
1. Raster Images
2. Vector Images

Interpolating or de-interpolating/sampling a vector image does not lead to any loss in image quality and information.
But, it bocomes a hell lot of issue while dealing with Raster Images.

Many problems like aliasing, loss of sharpness, redundancy of information and many problems are introduced when scaling or
scaling out raster images.

In this study, I have tried to used differenct kinds of raster images like - .png,.jpg,.bmp and .tif formats and tried to apply
the spatial and frequency domain interpoltion.
Image quality is a very subjective thing, but I have tried to objectify based on following 3 metrics:

1. MAE - Mean Absolute Error - Lower the better
2. MSE - Mean Square Error - Lower the better
3. PSNR - Pseudo Signal to Noise Ration - Higher the better

The 3 most widely used Image Interpolation techniques are as follows and is taken into consideration- 
1. Nearest Neighbour Interpolation
2. Bilinear Interpolation
3. Bicubic Interpolation

In Spatial Domain Interpolation, bicubic Interpolation is better compared to Bilinear and Nearest neighbor. 
But bicubic Interpolation takes large time to compute as it deals with 16 components whereas nearest neighbor deals with 2 
and bilinear deals with 4 components resp.

If we go with freqency domain interpolation, we obtain a better result as compared to spatial domain interpolation but again
at higher operation cost.
