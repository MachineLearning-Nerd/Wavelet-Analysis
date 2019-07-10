# Wavelet-Analysis
This repository is built for the more understanding of the wavelets and their transform using MATLAB. 
# WAVELETS OVERVIEW
The fundamental idea behind wavelets is to analyze according to scale. Indeed, some researchers in the wavelet field feel that, by using wavelets, one is adopting a whole new mindset or perspective in processing data.

Wavelets are functions that satisfy certain mathematical requirements and are used in representing data or other functions. This idea is not new. Approximation using superposition of functions has existed since the early 1800’s, when Joseph Fourier discovered that he could superpose sines and cosines to represent other functions. However, in wavelet analysis, the scale that we use to look at data plays a special role. Wavelet algorithms process data at different scales or resolutions. If we look at a signal with a large “window,” we would notice gross features. Similarly, if we look at a signal with a small “window,” we would notice small features. The result in wavelet analysis is to see both the forest and the trees, so to speak.

This makes wavelets interesting and useful. For many decades, scientists have wanted more appropriate functions than the sines and cosines which comprise the bases of Fourier analysis, to approximate choppy signals (1). By their definition, these functions are non-local (and stretch out to infinity). They therefore do a very poor job in approximating sharp spikes. But with wavelet analysis, we can use approximating functions that are contained neatly in finite domains. Wavelets are well-suited for approximating data with sharp discontinuities.

# Files:
> waveletana1.m 

This file will show you how to plot different wavelets. 

> analysis1D.m 

This file will shows you how to denoise the signal as well as how to decompose the signal into the multi levels.

> wavelet_data_compression.m 

This files shows how to compress the data with the goos acccuracy. 

## Link for the Blog:
https://www.peopleperhour.com/web/aHR0cDovL2ludGVsbGlnZW50b25saW5ldG9vbHMuY29tL2Jsb2cvMjAxOC8xMi8xOS93YXZlbGV0LWRlbm9pc2luZy13aXRoLWRhdWJlY2hpZXMtd2F2ZWxldC8%3D

