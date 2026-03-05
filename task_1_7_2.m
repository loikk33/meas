clc; clear; close all;

N = 1000;
fs = 100;               % Sampling frequency (Hz)
n = 0:N-1;              % Sample index
t = n/fs;               % Time vector (seconds)
n2 = n*fs/N;

x_white = randn(1, N);

% Order 5, 2dB ripple, Passband edge at 5Hz
Wp = 5 / (fs/2);        % Normalized frequency [0, 1]
[b, a] = cheby1(5, 2, Wp);

y_filtered = filter(b, a, x_white);

Y = fft(y_filtered);
mag = abs(Y);
phs = angle(Y);

figure('Name', 'Filtered Random Noise', 'Color', 'w');

% Time Domain (Samples)
subplot(3, 1, 1);
plot(n, y_filtered, 'Color', [0.2 0.6 0.4]);
title('Time Domain: Filtered Noise (Low-pass 5Hz)');
xlabel('Sample Number (n)');
ylabel('Amplitude');
grid on;

% Frequency Domain: Magnitude (Bins)
subplot(3, 1, 2);
plot(n2, mag, 'r');
title('DFT Magnitude');
xlabel('Frequency (bin)');
ylabel('|Y(k)|');
xlim([0 100]); 
grid on;

% Frequency Domain: Phase 
subplot(3, 1, 3);
plot(n2, phs, 'Color', [0.5 0.5 0.5]);
title('DFT Phase');
xlabel('Frequency (bin)');
ylabel('Phase (rad)');
xlim([0 100]);
grid on;