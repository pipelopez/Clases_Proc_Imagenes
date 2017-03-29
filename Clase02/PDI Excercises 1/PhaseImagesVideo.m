a = imread('GoT.png');
b = imread('superMeat.jpeg');
b = imresize(b,0.65);
[filA,colA, cap] = size(b);
a = imresize(a,[filA,colA]);
v = VideoWriter('testvideo.avi');
v.FrameRate = 60;

open(v);
for i=0:0.05:1
    c = a*i+b*(1-i);
    figure(1)
    imshow(c);
    impixelinfo;
    pause(0.001);
    writeVideo(v,c);
end
for i=0:0.05:1
    c = b*i+a*(1-i);
    figure(1)
    imshow(c);
    impixelinfo;
    pause(0.001);
    writeVideo(v,c);
end
close(v);
