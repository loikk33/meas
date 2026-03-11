clc; clear; close all;

fs = 16000;            
N1 = 4000;              
N2 = 40 * N1;          
target_rms = 0.5;       

x_noise = randn(1, N2);

current_rms = std(x_noise);
x_final = x_noise * (target_rms / current_rms);

t = (0:N2-1)/fs;       
f_axis = (0:N2/2) * (fs/N2); 

figure('Color', 'w', 'Name', 'Aperiodic Noise Signal');

% Time Domain (Zoomed to show 0.1s of noise)
subplot(2,1,1);
plot(t, x_final);
title(['Aperiodic Noise (N_2 = 160,000, RMS = ', num2str(target_rms*1000), ' mV)']);
xlabel('Time (s)'); ylabel('Amplitude (V)');
xlim([0 0.1]); 
grid on;

% Frequency Domain (Magnitude Spectrum)
subplot(2,1,2);
X_mag = abs(fft(x_final));
plot(f_axis, X_mag(1:N2/2+1), 'Color', [0.7 0.7 0.7]); 
title('Magnitude Spectrum (Aperiodic White Noise)');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
grid on;

% Verification
fprintf('Signal Duration: %.1f seconds\n', N2/fs);
fprintf('Measured RMS: %.4f V\n', std(x_final));