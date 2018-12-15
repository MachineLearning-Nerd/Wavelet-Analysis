clc
clear all
close all

% Load electrical signal  
load leleccum; 
% Just select some part of the signal.
indexs = 2000:3450;
signal = leleccum(indexs);
% Do wavelet decomposition of the signal. 
ndecomposition = 3; 
wname = 'db3'; 
% wavedec do multilevel one dimensional wavelet ananlysis.
% First argument is signal, specified as a real-valued vector.
% Second argument is the n: Level of decomposition, specified as a positive integer. 
% Third argument is the name of the wavelet, specified as a character vector.
[c,l] = wavedec(signal,ndecomposition,wname);
% Compress using a fixed threshold. 
% wdencmp is used for the des-noising and compression of the signal.
thr = 35; 
keepapp = 1;
[compressed_signal,cxd,lxd,PERF0,PERFL2] = wdencmp('gbl',c,l,wname,ndecomposition,thr,'h',keepapp);

subplot(211)
plot(signal); title('Original Signal');
subplot(212)
plot(compressed_signal); title('Compressed Signal');

disp(PERF0)
disp(PERFL2)

% These returned values tell, respectively, what percentage of the wavelet
% coefficients was set to zero and what percentage of the image’s energy was
% preserved in the compression process.
% Note that, even though the compressed image is constructed from only about
% half as many nonzero wavelet coefficients as the original, there is almost no
% detectable deterioration in the data quality.