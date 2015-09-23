%@BOUT:THIS PROGRAM DEALS WITH FINDING THE MAE(mean absolute error) FOR THE
%INTERPOLATED IMAGE USING SPATIAL DOMAIN INTERPOLATION.
%DEVELOPER:DREAMZZZ TECHNOLOGY
%VERSION:1.1.0
%RUN COMPATIBILITY:MATLAB 7.5.0

a=imread('png_1x_resize.png');
a=double(a);
figure;imshow(a);

b=imread('png_2x_resize.png');
b=double(b);
figure;imshow(b)

y=imresize(a,2,'nearest')
y=double(y);
[m n]=size(y)
double r;
r=0;
double s;
s=0;

for i=1:m
    for j=1:n
        r=(r+abs((b(i,j)-y(i,j))));
        s=(s+b(i,j));
    end
end
mae_nr=r/s;

y=imresize(a,2,'bilinear')
y=double(y);
[m n]=size(y)
double r;
r=0;
double s;
s=0;

for i=1:m
    for j=1:n
        r=abs(r+(b(i,j)-y(i,j)));
        s=(s+b(i,j));
    end
end
mae_bilinear=r/s;

y=imresize(a,2,'bicubic')
y=double(y);
[m n]=size(y)
double r;
r=0;
double s;
s=0;

for i=1:m
    for j=1:n
        r=(r+abs((b(i,j)-y(i,j))));
        s=(s+b(i,j));
    end
end
mae_bicub=r/s;

PLOT();
