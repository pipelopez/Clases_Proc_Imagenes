clear all; close all, clc;
%imaqhwinfo('winvideo',1)%
a=videoinput('winvideo',1,'MJPG_1280x720');
%preview(a);%
b=getsnapshot(a);
b=imresize(b,0.5);
c=rgb2gray(b); %convierte la imagen a blanco y negro
figure(1);
imshow(b);
impixelinfo;
[fil,col]=size(c);
c=[c,c,c];
figure(2);
imshow(c);
impixelinfo;
c=reshape(c,[fil col 3]);
figure(3);
imshow(c);
impixelinfo;
%con este for hara que la imagen original se le vaya aumentando el brillo
%si lo hacesmos con +i y se va convirtiendo en negro con -i
for i=1:5:255
    figure(4);
    imshow(b-i);
    title(['sumando ', num2str(i)]);
    pause(0.1);
end