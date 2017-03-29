clear all; close all; clc
a=imread('carro.jpg');
a=imresize(a,0.2);
[fil,col,cap]=size(a);
% a1=imread('carro_2.jpg');
% a1=imresize(a1,[fil,col]);
% a=[a,a1];
figure(1);
imshow(a);
b=componentes(a);
figure(1);
imshow(b);
impixelinfo
[bn,s,y,b,c]=componentes2(a);
figure(1);
imshow([bn,s,y;b,c,c]);

min1=min(s,y); %aclara la placa
figure(3);
imshow(min1);
impixelinfo;

%con el comando >>a=impixelinfo podemos señalar en la imagen los pixeles
%grises y presionamos enter, luego esto nos da el valor gris y ahora por
%debajo de ese color volvemos todo en cero para umbralizar.
pix=impixel;
min1(min1<min(pix(:)))=0;
min1(min1>0)=255;
figure(4);
imshow(min1);
impixelinfo

%con esto convertimos a color nuevamente lo que quedó, es decir la placa
min1=[min1,min1,min1];
min1=reshape(min1,[fil,col,cap]);
a(min1==0)=0;
figure(5);
imshow(a);
impixelinfo
imwrite(a,'placa_3.bmp');


