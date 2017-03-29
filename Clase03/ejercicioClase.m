clear all, close all, clc
a=imread('images1.jpg');
b=imread('Paisaje-Natural.jpg');
[fil,col,cap]=size(a);%cuantas filas y columnas tiene a
b=imresize(b,[fil,col]);%redimensionar imagenes del mismo tamaño%
[x,y,z] = size(a)
x1=0;
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
    
    if x1 == 0
        b(x-i:x,1:(i*razon) + sumar,:)=a(1:i+1,y-(i*razon)+ 1 - sumar:y,:);
        %b(x-i:x,1:(i*razon)+sumar,:)=a(x-i:x,1:(i*razon)+sumar,:);
    else
        b(1:(i*razon) + sumar,x-i:x,:)=a(y-(i*razon)+ 1 - sumar:y,1:i+1,:);
    end
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