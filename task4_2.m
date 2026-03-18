close all; clear; clc;
fs = 10000; 
N = 4096;
fres = fs/N;
f_exc = 100;
bin_exc = round(f_exc*N/ fs);
f_exc2 = bin_exc*fres;

t = (0:N-1)/fs;
A = 1;
u = A * sin(2*pi*f_exc2*t); 
%amplitudes = logspace(log10(0.1), log10(1.1),10);

save("signal4_3.mat", "u")
%Lab_2_and_3_check_exc('signal4_2.mat');

%[u,y] = ReadData('signal4_3_acq.mat', N, 10);
% U = fft(u);
% Y = fft(y);