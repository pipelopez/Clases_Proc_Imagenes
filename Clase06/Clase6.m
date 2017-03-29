%%Clase de sacar letras de una placa
clear all, close all, clc
a=imread('placa.jpg');
b=rgb2gray(a);
figure(1);
subplot 221;
imshow(b);
subplot 212;
imhist(b); %histograma inventario del número de pixeles 
% que tienen ese gris, muestra entre 0 y 255 cuantos pixeles 
% hay en un valor específico
impixelinfo
c=b;
c(c>100)=255; %esto es para binarizar
c(c<255)=0;
c=255-c; %invertir y qu e lo negro se vea blanco y viceversa
figure(3);
imshow(c);
e=c;
c=c'; %rotarla
figure(4);
imshow(c);
d=sum(c);
figure(5);
subplot 211;
imshow(c);
subplot 212;
plot(d);
f=e(140:180,:); %mostrar sólo envigado
figure(6);
imshow(f);
g=sum(f);
figure(7);
subplot 211;
imshow(f);
subplot 212;
plot(g);
h=f(:,120:148); %con esto muestro sólo la letra E de la palabra envigado
figure(8);
imshow(h);
%ganamos contraste al ecualizar (normalizar) el histograma
j=histeq(b);
figure(9);
subplot 221;
imshow(b);
subplot 222; 
imhist(b);
subplot 223;
imshow(j);
subplot 224;
imhist(j);
