clear all, close all, clc
a=imread('images1.jpg');
b=rgb2gray(a); %---b=a; Es para ponerlo en original a color con su negativo----%
b=a;
c=255-b;
figure(1); 
imshow([b,c]);
impixelinfo;
figure(1);
imshow(b);
pause(10);   
figure(1);
imshow(b+255);

%---- mirar qué hace imadjust ----%

%%---- fundido ----%%
b=imread('Paisaje-Natural.jpg');
[fil,col,cap]=size(a);%cuantas filas y columnas tiene a
b=imresize(b,[fil,col]);%redimensionar imagenes del mismo tamaño%
%fundido%
%%
for i=0:0.005:1
    c=a*i + b*(1-i);
    figure(2);
    imshow(c);
    title(['Porcentaje= ', num2str(i*100)]);
    pause(0.01); 
end

for i=0:0.005:1
    c=b*i + a*(1-i);
    figure(2);
    imshow(c);
    title(['Porcentaje= ', num2str(i*100)]);
    pause(0.01); 
end

%--- ejercicio: grabar como video ---%
%--- ejercicio: que una entre por una esquina y tape la otra---%

%%
clear all, close all, clc
a=imread('images1.jpg');
b=imread('Paisaje-Natural.jpg');
[fil,col,cap]=size(a);%cuantas filas y columnas tiene a
b=imresize(b,[fil,col]);%redimensionar imagenes del mismo tamaño%
[x,y,z] = size(a)
if y > x
    razon = floor(y/x);
else
    x1 = x;
    x = y;
    y = x1;
    razon = floor(y/x);
end
suma = 0;
sumar = 0;
modulo = (y/x) - razon;

v=VideoWriter('videoejemplo.avi');
v.FrameRate = 60;

open(v);
for i=1:1:x-1
    %for j=y:-1:1
    %b(x-i:x,1:i*razon,:)=a(x-i:x,1:i*razon,:);% barrido de imagen en diagonal
    if suma < 1
        suma = suma + modulo;
    end
    if suma >= 1
        sumar = sumar + 1;
        suma = suma - 1;
    end
    
    b(x-i:x,1:(i*razon) + sumar,:)=a(1:i+1,y-(i*razon)+ 1 - sumar:y,:);
    figure(2);
    imshow(b);
    title(['coordenada en x = ', num2str(i),', ','coordenada en y = ', num2str(x-i)]);
    pause(0.1);
    writeVideo(v,b);
    %end
end
b(1:x,1:y,:)=a(1:x,1:y,:);
figure(2);
imshow(b);
title(['coordenada en x = ', num2str(i),', ','coordenada en y = ', num2str(x-i)]);
pause(0.1);
writeVideo(v,b);

close(v);
