clear all, close all, clc
a=imread('casa.jpg');
a1=imresize(a,4, 'Method', 'box'); %con esta línea hago la imagen 4 veces más grande
b=imresize(a,0.25, 'Method', 'box');
c=imresize(b,16, 'Method', 'box');
figure(1);
imshow(a1);%podemos ver que se perdió información
figure(2);
imshow(c);
pause;

% for i=0:5:360
%     %con crop la recorta y la muestra siempre del mismo tamaño
%     %con bicubic se suaviza la línea dentada
%     a = imrotate(a, i,'crop', 'bicubic');%al hacer el crop sobre la misma imagen de forma recursiva la convierte en un círculo
%     figure(1);
%     imshow(a);%para que no sea recursivo se pone b en vez de a
%     pause(0.01);
% end
