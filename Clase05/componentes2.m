function [bn,s,y,b,c]=componentes2(a)
    [fil,col,cap]=size(a);
    if cap==1;
        b=a;
        return;
    end
    rgb=normaliza(a);
    %b=rgb;
    hsi=rgb2hsv(a);
    hsi=normaliza(hsi);
    cform=makecform('srgb2cmyk')
    cmyk=applycform(a,cform);%pasar de 4 capas a tres
    k=cmyk(:,:,4);
    k=[k,k,k];
    cmy=cmyk(:,:,1:3);%el color negro no es importante se descarta la capa
    cmy=normaliza(cmy);
    
    cform=makecform('srgb2lab');
    lab=applycform(a,cform);
    lab2=lab;
    lab=normaliza(lab);
    cform=makecform('lab2lch');
    lch=applycform(lab2,cform);
    lch=normaliza(lch);
    %b=[rgb,hsi;cmy,k;lab,lch];  
    
    bn=rgb(:,(col*2+1):col*3);
    bn=255-bn;
    s=hsi(:,(col+1):col*2);
    y=cmy(:,(col*2+1):col*3);
    b=lab(:,(col*2+1):col*3);
    c=lch(:,(col+1):col*2);
  
    
    %b=[rgb;hsi];
end