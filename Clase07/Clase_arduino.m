clear all, close all, clc
%arduino
a = arduino('COM4', 'Uno');
ledPin ='D13';
writeDigitalPin(a, ledPin, 0);
writeDigitalPin(a, ledPin, 1);
writeDigitalPin(a, ledPin, 0);