clear all, close all, clc
a=imread('carro1.jpg');
%a=rgb2gray(a);
b=a;
ee=strel('square', 3);
for i=1:10
    a=imerode(a, ee);
    figure(1);
    imshow(a);
    pause(1);
end

for i=1:10
    b=imdilate(b, ee);
    figure(1);
    imshow(b);
    pause(1);
end
