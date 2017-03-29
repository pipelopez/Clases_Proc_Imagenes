clear all, close all, clc
arduino = arduino('COM3');

a=videoinput('winvideo',1,'MJPG_1280x720');
b=1;
%%while b>0
  %  c=getsnapshot(a);
  % figure(1);
   % imshow(c);
   % pause(0.0001);
%end
h=[];
while b>0
    c=getsnapshot(a);
    c=imresize(c,0.2);
    d=getsnapshot(a);
    d=imresize(d,0.2);
    e=d-c;
    f=sum(e(:));%coja datos y vealos como vector
    h=[h,f];
    figure(1);
    imshow(e);
    title(['Diferencia= ',num2str(f)]);
    pause(0.001);

    if f>1000000
       writeDigitalPin(arduino,'D4',1); 
       writeDigitalPin(arduino,'D2',0);
       writeDigitalPin(arduino,'D3',0);
    else if f>700000
            writeDigitalPin(arduino,'D3',1);
            writeDigitalPin(arduino,'D2',0);
            writeDigitalPin(arduino,'D4',0);
        else if f>400000
                writeDigitalPin(arduino,'D2',1);
                writeDigitalPin(arduino,'D4',0);
                writeDigitalPin(arduino,'D3',0);
            end
        end    
    end
    if f<=400000
        writeDigitalPin(arduino,'D2',0);
        writeDigitalPin(arduino,'D3',0);
        writeDigitalPin(arduino,'D4',0);
    end    
end

%%
figure(2);
plot(h);