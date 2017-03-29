clear all; close all; clc;

a = imread('darkT.jpg');
b = imread('darkT2.jpg');
b = imresize(b,0.65);
[filA,colA, ~] = size(b);
a = imresize(a,[filA,colA]);
[fil,col,cap]= size(a);
c = a;

for i=1:10:col
    if col-i<10 
        i=col;
    end
    x = col-i+1;
    y = floor(i*(fil/col));
    c(fil-y+1:fil,1:i,:) = b(1:y,x:col,:);
    figure(1)
    imshow(c);
    impixelinfo
end