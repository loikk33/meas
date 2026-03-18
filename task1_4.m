clc; close all;
% Parameters
N = 1000;
K = 30;                 % Number of excited bins (1 to 30)
X = zeros(1, N);        % Initialize frequency vector

% Frequency Domain Signal
for k = 1:K
    A = 1;              
    phi = rand * 2 * pi;
    val = (A / 2) * exp(1i * phi); 
    
    X(k + 1) = val;            
    X(N - k + 1) = conj(val);
end

x = ifft(X); %samples

amplitude = abs(X);
phase = angle(X);

figure;

% Time Domain (Sample Number)
subplot(3,1,1);
plot(0:N-1, x);
title('Multisine in time domain');
xlabel('Sample Number (n)');
ylabel('Amplitude');
grid on;

% Frequency Domain Magnitude (Bin Number)
subplot(3,1,2);
stem(0:N-1, amplitude, 'Marker', 'none');
title('DFT Magnitude');
xlabel('Frequency (bin)');
ylabel('|X(k)|');
xlim([0 N]); 
grid on;

% Frequency Domain Phase (Bin Number)
subplot(3,1,3);
stem(0:N-1, phase, 'Marker', 'none');
title('DFT Phase');
xlabel('Frequency (bin)');
ylabel('Phase (rad)');
xlim([0 N]);
grid on;