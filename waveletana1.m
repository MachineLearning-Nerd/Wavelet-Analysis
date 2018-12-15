clc 
clear all
close all



%% Morlet Wavelet functions
lb = -4;% lower bound
ub = 4;% uper bound
n = 1000; % number of points
x = linspace(lb,ub,n);
y = exp(((-1)*(x.^2))./2).*cos(5*x);
figure,plot(x,y,'LineWidth',2)
% title(['Morlet Wavelet']);
title('Morlet Wavelet $$\psi(t) = e^{\frac{-x^2}{2}} \cos(5x)$$','interpreter','latex')


%% 
% % visualize the scaling function and wavelet
[phi,psi,xval] = wavefun('sym4',10);
figure,
plot(xval,psi,'LineWidth',2); title('Symlet Wavelet');