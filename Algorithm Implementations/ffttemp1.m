%@BOUT:THIS PROGRAM DEALS WITH FINDING THE MSE and PSNR(mean square error and peak signal to noise ratio) FOR THE
%INTERPOLATED IMAGE USING FREQUENCY DOMAIN INTERPOLATION.
%DEVELOPER:DREAMZZZ TECHNOLOGY
%VERSION:1.1.0
%RUN COMPATIBILITY:MATLAB 7.5.0
%IMAGE TYPE SUPPORTED:*.BMP,*.JPG,*.PNG,*.TIF


org1x = imread('png_1x.png');
org2x = imread('png_2x.png');
org4x = imread('png_4x.png');
org1xt = double(org1x);
org2xt = double(org2x);
org4xt = double(org4x);

forg1x = fft2(org1xt);
forg2x = fft2(org2xt);


double a;
double b;

a=imresize(org2x,2,'bicubic');
imshow(a);
at=double(a);
sc=fft2(at);
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
new4x=abs(new4x);
new4x1=uint8(new4x);
subplot(1,2,1);
imshow(new4x1);
title('using fft');
subplot(1,2,2);
imshow(org4x);
title('original')

[m n]=size(new4x)
double r;
r=0;
double s;
s=0;

for i=1:m
    for j=1:n
        r=(r+abs((a(i,j)-new4x(i,j))));
        s=(s+a(i,j));
    end
end
mae_bicub=r/s;


mse = (norm(new4x-org4xt,2))/(norm(org4xt,2));
psnr=20*log10(255/sqrt(mse));
