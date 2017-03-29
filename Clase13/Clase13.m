clear all, close all, clc
for i=1:198
    imagen=(['.\1_Fotos\carro(', num2str(i), ').jpg']);
    a=imread(imagen);
    %figure(1);
    imshow(a);
    title(['Imagen original']);
    [fil, col, cap]=size(a);
    fil_m=floor(0.4*fil);
    col_m=floor(0.3*col);
    fil_x=floor(0.8*fil);
    col_x=floor(0.6*col);
    b=a(fil_m:fil_x,col_m:col_x,:);
    figure(2);
    imagen=(['.\2_Placa_recortada\placa(', num2str(i), ').jpg']);
    imshow(b);
    title(['Imagen recortada', num2str(i)]);
    imwrite
    pause
end
    