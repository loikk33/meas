clc; clear; close all;

% Parameters
N = 1000;
n = 0:N-1; % Sample indices

% 1. Generate Gaussian White Noise
% randn(1, N) creates a vector with Mean = 0 and Variance = 1
x_noise = randn(1, N);

% 2. Frequency Domain Analysis
X_noise = fft(x_noise);
mag = abs(X_noise);
phs = angle(X_noise);

% 3. Plotting
figure('Name', 'Gaussian White Noise Analysis', 'Color', 'w');

% Time Domain Plot
subplot(3, 1, 1);
plot(n, x_noise, 'Color', [0.2 0.5 0.8]);
title('Time Domain: Gaussian White Noise (randn)');
xlabel('Sample Number (n)');
ylabel('Amplitude');
grid on;

% Frequency Domain: Magnitude
subplot(3, 1, 2);
plot(0:N-1, mag, 'Color', [0.8 0.2 0.2]);
title('DFT Magnitude (Logarithmic Scale)');
xlabel('Frequency (bin)');
ylabel('|X(k)|');
xlim([0 N]);
grid on;

% Frequency Domain: Phase
subplot(3, 1, 3);
plot(0:N-1, phs, 'MarkerSize', 4, 'Color', [0.4 0.4 0.4]);
title('DFT Phase');
xlabel('Frequency (bin)');
ylabel('Phase (rad)');
xlim([0 N]);
ylim([-pi pi]);
grid on;