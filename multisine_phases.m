clc; close all;
% Parameters
N = 500;
K = 60;                 % Number of excited bins (1 to 30)
X1 = zeros(1, N);        % Initialize frequency vector
%% constant phase
% Frequency Domain Signal
for k = 1:K              
    rand_phi = rand * 2 * pi;
    val1 = (1 / 2) * exp(1i * rand_phi); 
    
    X1(k + 1) = val1;            
    X1(N - k + 1) = conj(val1);
end

x_rand = ifft(X1); %samples
amplitude1 = abs(X1);
phase1 = angle(X1);

% --- Crest Factor Computation ---
peak_val1 = max(abs(x_rand));          
rms_val1 = sqrt(mean(x_rand.^2));     
CF_rand = peak_val1 / rms_val1;     
fprintf('Crest Factor (Random Phase): %.4f\n', CF_rand);
figure;

% Time Domain (Sample Number)
subplot(3,1,1);
plot(0:N-1, x_rand);
title('Random phase Multisine in time domain');
xlabel('Sample Number (n)');
ylabel('Amplitude');
grid on;

% Frequency Domain Magnitude (Bin Number)
subplot(3,1,2);
stem(0:N-1, amplitude1, 'Marker', 'none');
title('Random Phase DFT Magnitude');
xlabel('Frequency (bin)');
ylabel('|X(k)|');
xlim([0 N]); 
grid on;

% Frequency Domain Phase (Bin Number)
subplot(3,1,3);
stem(0:N-1, phase1, 'Marker', 'none');
title('Random phase DFT Phase');
xlabel('Frequency (bin)');
ylabel('Phase (rad)');
xlim([0 N]);
grid on;

%% schroeder phase

% Frequency Domain Signal
X2 = zeros(1, N);
for k = 1:K             
    phi_schroeder = (k .* (k + 1) * pi) / K;
    val2 = (1 / 2) * exp(1i * phi_schroeder); 
    
    X2(k + 1) = val2;            
    X2(N - k + 1) = conj(val2);
end

x_schr = ifft(X2); %samples
amplitude2 = abs(X2);
phase2 = angle(X2);

% --- Crest Factor Computation ---
peak_val2 = max(abs(x_schr));          
rms_val2 = sqrt(mean(x_schr.^2));     
CF_schroeder = peak_val2 / rms_val2;     
fprintf('Crest Factor (Schroeder Phase): %.4f\n', CF_schroeder);

figure;

% Time Domain (Sample Number)
subplot(3,1,1);
plot(0:N-1, x_schr);
title('schroeder phase Multisine in time domain');
xlabel('Sample Number (n)');
ylabel('Amplitude');
grid on;

% Frequency Domain Magnitude (Bin Number)
subplot(3,1,2);
stem(0:N-1, amplitude2, 'Marker', 'none');
title('Schroeder Phase DFT Magnitude');
xlabel('Frequency (bin)');
ylabel('|X(k)|');
xlim([0 N]); 
grid on;

% Frequency Domain Phase (Bin Number)
subplot(3,1,3);
stem(0:N-1, phase2, 'Marker', 'none');
title('Schroeder phase DFT Phase');
xlabel('Frequency (bin)');
ylabel('Phase (rad)');
xlim([0 N]);
grid on;

%% linear phase

% Frequency Domain Signal
X3 = zeros(1, N);
for k = 1:K             
    phi_linear = k*pi;
    val3 = (1 / 2) * exp(1i * phi_linear); 
    
    X3(k + 1) = val3;            
    X3(N - k + 1) = conj(val3);
end

x_linear = ifft(X3); %samples
amplitude3 = abs(X3);
phase3 = angle(X3);

% --- Crest Factor Computation ---
peak_val3 = max(abs(x_linear));          
rms_val3 = sqrt(mean(x_linear.^2));     
CF_linear = peak_val3 / rms_val3;     
fprintf('Crest Factor (Linear Phase): %.4f\n', CF_linear);

figure;

% Time Domain (Sample Number)
subplot(3,1,1);
plot(0:N-1, x_linear);
title('Linear phase Multisine in time domain');
xlabel('Sample Number (n)');
ylabel('Amplitude');
grid on;

% Frequency Domain Magnitude (Bin Number)
subplot(3,1,2);
stem(0:N-1, amplitude3, 'Marker', 'none');
title('Linear Phase DFT Magnitude');
xlabel('Frequency (bin)');
ylabel('|X(k)|');
xlim([0 N]); 
grid on;

% Frequency Domain Phase (Bin Number)
subplot(3,1,3);
stem(0:N-1, phase3, 'Marker', 'none');
title('Linear phase DFT Phase');
xlabel('Frequency (bin)');
ylabel('Phase (rad)');
xlim([0 N]);
grid on;

%% constant phase

% Frequency Domain Signal
X4 = zeros(1, N);
for k = 1:K             
    phi_const = k;
    val4 = (1 / 2) * exp(1i * phi_const); 
    
    X4(k + 1) = val4;            
    X4(N - k + 1) = conj(val4);
end

x_const = ifft(X4); %samples
amplitude4 = abs(X4);
phase4 = angle(X4);

% --- Crest Factor Computation ---
peak_val4 = max(abs(x_const));          
rms_val4 = sqrt(mean(x_const.^2));     
CF_const = peak_val4 / rms_val4;     
fprintf('Crest Factor (Constant Phase): %.4f\n', CF_const);

figure;

% Time Domain (Sample Number)
subplot(3,1,1);
plot(0:N-1, x_const);
title('Constant phase Multisine in time domain');
xlabel('Sample Number (n)');
ylabel('Amplitude');
grid on;

% Frequency Domain Magnitude (Bin Number)
subplot(3,1,2);
stem(0:N-1, amplitude4, 'Marker', 'none');
title('Constant Phase DFT Magnitude');
xlabel('Frequency (bin)');
ylabel('|X(k)|');
xlim([0 N]); 
grid on;

% Frequency Domain Phase (Bin Number)
subplot(3,1,3);
stem(0:N-1, phase4, 'Marker', 'none');
title('Constant phase DFT Phase');
xlabel('Frequency (bin)');
ylabel('Phase (rad)');
xlim([0 N]);
grid on;