%ABOUT:THIS PROGRAM DEALS WITH FINDING THE MSE(mean square error)and PSNR(peak signal to noise ratio)
%FOR IMAGE INTERPOLATED USING FREQUENCY DOMAIN INTERPOLATION.
%AUTHOR:DHRUV KALARIA
%VERSION:1.1.0
%RUN COMPATIBILITY:MATLAB 7.5.0

org1x = imread('tif_1x.tif');
org2x = imread('tif_2x.tif');
org4x = imread('tif_4x.tif');


org1xt = double(org1x);
org2xt = double(org2x);
org4xt = double(org4x);

forg1x = fft2(org1x);
forg2x = fft2(org2x);
%pl=0.3*log10(forg1x+1);
%figure;imshow(pl)

double a;
double b;

a=imresize(org2x,2,'bicubic');
imshow(a);
at=double(a);
sc=fft2(at);
pl=0.3*log10(sc+1);
figure;imshow(pl)

%imshow(sc);

for i=1:64
    for j=1:64
        m=2*(i-1)+1;
        n=2*(j-1)+1;
        
        fact1 = forg2x(m,n)/forg1x(i,j);
        fact2 = forg2x(m+1,n)/forg1x(i,j);
        fact3 = forg2x(m,n+1)/forg1x(i,j);
        fact4 = forg2x(m+1,n+1)/forg1x(i,j);
        
        x=4*(i-1)+1;
        y=4*(j-1)+1;
        b(x,y) = forg2x(m,n)*fact1;
        b(x,y+1) = forg2x(m,n)*fact2;
        b(x+1,y) = forg2x(m,n)*fact3;
        b(x+1,y+1) = forg2x(m,n)*fact4;
        
        b(x,y+2) = forg2x(m,n+1)*fact1;
        b(x,y+3) = forg2x(m,n+1)*fact2;
        b(x+1,y+2) = forg2x(m,n+1)*fact3;
        b(x+1,y+3) = forg2x(m,n+1)*fact4;
        
        b(x+2,y) = forg2x(m+1,n)*fact1;
        b(x+2,y+1) = forg2x(m+1,n)*fact2;
        b(x+3,y) = forg2x(m+1,n)*fact3;
        b(x+3,y+1) = forg2x(m+1,n)*fact4;
        
        b(x+2,y+2) = forg2x(m+1,n+1)*fact1;
        b(x+2,y+3) = forg2x(m+1,n+1)*fact2;
        b(x+3,y+2) = forg2x(m+1,n+1)*fact3;
        b(x+3,y+3) = forg2x(m+1,n+1)*fact4;
    end
end


for e=1:1:256
    for f=1:1:256
        if (e*f) < ((512)^2)
            b(e,f)=sc(e,f);
        end
    end
end

new4x=ifft2(b);
pl1=0.3*log10(b+1);
figure;imshow(pl1)

new4x=abs(new4x);
new4x1=uint8(new4x);
subplot(1,2,2);
imshow(new4x1);
title('using fft');
subplot(1,2,1);
imshow(org4x);
title('original')


mse = (norm(new4x-org4xt,2))/(norm(org4xt,2));
psnr=20*log10(255/sqrt(mse));