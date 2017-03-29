clear all, close all, clc
a=imread('casa.jpg');
a1=imresize(a,4, 'Method', 'box'); %con esta l�nea hago la imagen 4 veces m�s grande
b=imresize(a,0.25, 'Method', 'box');
c=imresize(b,16, 'Method', 'box');
figure(1);
imshow(a1);%podemos ver que se perdi� informaci�n
figure(2);
imshow(c);
pause;

% for i=0:5:360
%     %con crop la recorta y la muestra siempre del mismo tama�o
%     %con bicubic se suaviza la l�nea dentada
%     a = imrotate(a, i,'crop', 'bicubic');%al hacer el crop sobre la misma imagen de forma recursiva la convierte en un c�rculo
%     figure(1);
%     imshow(a);%para que no sea recursivo se pone b en vez de a
%     pause(0.01);
% end
