org1x = imread('cameraman_1x.tif');
org2x = imread('cameraman_2x.tif');
org4x = imread('cameraman_4x.tif');
org1xt = double(org1x);
org2xt = double(org2x);
org4xt = double(org4x);

forg1x = dct2(org1xt);
forg2x = dct2(org2xt);


double a;
double b;

a=imresize(org2x,2,'bicubic');
imshow(a);
at=double(a);
sc=dct2(at);
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

new4x=idct2(b);
new4x=abs(new4x);
new4x1=uint8(new4x);
subplot(1,2,1);
imshow(new4x1);
title('using dct');
subplot(1,2,2);
imshow(org4x);
title('original')


mse = (norm(new4x-org4xt,2))/(norm(org4xt,2));
psnr=20*log10(255/sqrt(mse));