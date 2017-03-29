%trabajo con formas
clear all, close all, clc
a=imread('placa_3.bmp');
aa=a;
[fil,col,cap]=size(a);
if cap>1;
    a=rgb2gray(a);
end

a=imclearborder(a);
[l,n]=bwlabel(a);
figure(1);
imagesc(l);
colormap('hot');
title(['numero objetos =', num2str(n)]);
impixelinfo

b=[];
for i=1:n
    c=a*0; %creo matriz igual a a con el mismo formato llena de ceros
    c(l==i)=255;
    area=sum(c(:))/255;
   % figure(2);
%     imshow(c);
%     title(['Area objeto =', num2str(area)]);
%     %pause%(1)
    b=[b,area];
end
% b;
%con esto buscamos que objeto de la imagen tiene mayor área
% figure(2);
% plot(b);

ind=max(b);
ind=find(b==ind);
d=a*0;
d(l==ind)=255;
figure(3);
imshow(d);

%fila minima y máxima y col min y max
[fil,col]=find(d>0);
f_m=min(fil(:));
f_M=max(fil(:));
c_m=min(col(:));
c_M=max(col(:));
e=aa(f_m:f_M,c_m:c_M,:);
figure(4);
imshow(e);
