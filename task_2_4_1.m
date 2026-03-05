clc; clear; close all;

fs = 8000;              
fres = 1;                
N = fs / fres;            % Number of samples (8000)
K = 500;                % Exciting from 1Hz to 500Hz
target_rms = 0.1;

X = zeros(1, N);
for k = 1:K             
    phi_schroeder = (k .* (k + 1) * pi) / K;
    val = (1 / 2) * exp(1i * phi_schroeder); 
    
    X(k + 1) = val;            
    X(N - k + 1) = conj(val);
end

x = ifft(X, 'symmetric'); 

current_rms = sqrt(mean(x.^2));
x_final = x * (target_rms / current_rms);

fprintf('Final RMS Value: %.4f V\n', sqrt(mean(x_final.^2)));

figure('Color', 'w');
subplot(3,1,1);
plot((0:N-1)/fs, x_final);
title('Schroeder Multisine');
xlabel('Time (s)'); ylabel('Voltage (V)');
grid on;

subplot(3,1,2);
f_axis = (0:N/2) * fres;
X_mag = abs(fft(x_final));
stem(f_axis(1:K+10), X_mag(1:K+10), 'Marker', 'none');
title('Magnitude Spectrum');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
grid on;

% Frequency Domain Phase (Bin Number)
subplot(3,1,3);
phase = angle(fft(x_final));
stem(0:N-1, phase, 'Marker', 'none');
title('Schroeder phase DFT Phase');
xlabel('Frequency (bin)');
ylabel('Phase (rad)');
xlim([0 400]);
grid on;