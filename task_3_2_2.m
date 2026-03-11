clc; clear; close all;

fs = 16000;   
N1 = 4000;              % Samples per period
df = fs / N1;          
f_start = 4;            
f_stop = 1000;          
target_rms = 0.5;       % 500 mV

k_start = f_start / df; % Bin 1
k_stop = f_stop / df;   % Bin 250
k_idx = k_start:k_stop;
K = length(k_idx);      

phi_schroeder = ( (1:K) .* ((1:K) + 1) * pi ) / K;

X = zeros(1, N1);
for j = 1:K
    k = k_idx(j);
    val = exp(1i * phi_schroeder(j));
    X(k + 1) = val; 
end

x = 2 * real(ifft(X, 'symmetric')); 

x_final = x * (target_rms / std(x));

% 6. Plotting and Verification
fprintf('Frequency Resolution: %.1f Hz\n', df);
fprintf('Crest Factor: %.4f\n', max(abs(x_final)) / std(x_final));

figure('Color', 'w');
t = (0:N1-1)/fs;

subplot(2,1,1);
plot(t, x_final);
title('Schroeder Multisine');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(2,1,2);
f_axis = (0:N1/2) * df;
X_mag = abs(fft(x_final));
stem(f_axis(1:k_stop+10), X_mag(1:k_stop+10), 'Marker', 'none');
title('Magnitude Spectrum');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
grid on;