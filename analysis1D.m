clc
clear all
close all

% Analysis of the 1-D data.
% Load the electrical signal 
load leleccum; 
% Take a somepart of that signal.
s = leleccum(1:3920);
ls = length(s);

%% Performing A One-Step Wavelet Decomposition of a Signal.

% Perform a one-step decomposition of the signal using the db1 wavelet.

[cA1,cD1] = dwt(s,'db1');
% This generates the coefficients of the level 1 approximation (cA1) and detail
% (cD1).

% To construct the level 1 approximation and detail (A1 and D1) from the
% coefficients cA1 and cD1,

A1 = upcoef('a',cA1,'db1',1,ls);
D1 = upcoef('d',cD1,'db1',1,ls);

% To display the results of the level-one decomposition,
subplot(1,2,1); plot(A1); title('Approximation A1');axis square
subplot(1,2,2); plot(D1); title('Detail D1');axis square 

% To find the inverse transform, 
A0 = idwt(cA1,cD1,'db1',ls);

%% Performing a Multilevel Wavelet Decomposition of a Signal.
% To perform a level 3 decomposition of the signal
[C,L] = wavedec(s,3,'db1');

% The coefficients of all the components of a third-level decomposition (that is,
% the third-level approximation and the first three levels of detail) are
% returned concatenated into one vector, C. Vector L gives the lengths of each
% component.

% To extract the level 3 approximation coefficients from C
cA3 = appcoef(C,L,'db1',3);

% To extract the levels 3, 2, and 1 detail coefficients from C
cD3 = detcoef(C,L,3);
cD2 = detcoef(C,L,2);
cD1 = detcoef(C,L,1);

% To reconstruct the level 3 approximation from C,
A3 = wrcoef('a',C,L,'db1',3);

% To reconstruct the details at levels 1, 2 and 3,
D1 = wrcoef('d',C,L,'db1',1);
D2 = wrcoef('d',C,L,'db1',2);
D3 = wrcoef('d',C,L,'db1',3);

% To display the results of the level 3 decomposition
figure,
subplot(2,2,1); plot(A3); title('Approximation A3');axis square
subplot(2,2,2); plot(D1); title('Detail D1');axis square
subplot(2,2,3); plot(D2); title('Detail D2');axis square
subplot(2,2,4); plot(D3); title('Detail D3');axis square

% To reconstruct the original signal from the wavelet decomposition structure,
A0 = waverec(C,L,'db1');
figure,
plot(A0); title('Recovered Signal');
%% denoising of the signal
% Using wavelets to remove noise from a signal requires identifying which
% component or components contain the noise and then reconstructing the signal
% without those components.
% In this example, we note that successive approximations become less and less
% noisy as more and more high-frequency information is filtered out of the signal. 

% The level 3 approximation, A3, is quite clean as a comparison between it and
% the original signal shows.
figure,
subplot(2,1,1);plot(s);title('Original'); axis off
subplot(2,1,2);plot(A3);title('Level 3 Approximation');
axis off

% Of course, in discarding all the high-frequency information, we’ve also lost
% many of the original signal’s sharpest features.
% Optimal de-noising requires a more subtle approach called thresholding. This
% involves discarding only the portion of the details that exceeds a certain limit.

% Most of the noise occurs in the latter part of the signal, where the details
% show their greatest activity. What if we limited the strength of the details
% by restricting their maximum values? This would have the effect of cutting
% back the noise while leaving the details unaffected through most of their
% durations. But there’s a better way.

% Note that cD1, cD2, and cD3 are just MATLAB vectors, and we could directly
% manipulate each vector, setting each element to some fraction of the vectors’
% peak or average value. Then we could reconstruct new detail signals D1, D2,
% and D3 from the thresholded coefficients.


% To de-noise the signal, use the ddencmp command to calculate the default
% parameters and the wdencmp command to perform the actual de-noising, 

[thr,sorh,keepapp] = ddencmp('den','wv',s);
clean = wdencmp('gbl',C,L,'db1',3,thr,sorh,keepapp);

% To display both the original and de-noised signals,
subplot(2,1,1); plot(s(1:3920)); title('Original')
subplot(2,1,2); plot(clean(1:3920)); title('De-noised')

% We’ve plotted here only the noisy latter part of the signal. Notice how we’ve
% removed the noise without compromising the sharp detail of the original
% signal. This is a strength of wavelet analysis