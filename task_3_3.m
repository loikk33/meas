clc; clear; close all;

fs = 16000;            
N1 = 4000;              
N2 = 40 * N1;          
target_rms = 0.5;       

x_noise = randn(1, N2);

current_rms = rms(x_noise);

x_final = x_noise * (target_rms / current_rms);

t = (0:N2-1)/fs;       
f_axis = (0:N2/2) * (fs/N2); 

figure('Color', 'w', 'Name', 'Aperiodic Noise Signal');

% Time Domain
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




save("signalapper3.mat", "x_final")
Lab_2_and_3_check_exc('signalapper3.mat');

[u,y] = ReadData('signalapper3_nonoise_acq.mat', N2, 1);
u_ap = reshape(u, [], 32);
y_ap = reshape(y, [], 32);

%% averaging time 
u_avrg = mean(u_ap,2);
y_avrg = mean(y_ap,2);
U_fft = fft(u_avrg);
Y_fft = fft(y_avrg);
H1 = Y_fft ./ U_fft;


%% avrreging dft
U_dft = fft(u_ap);
Y_dft = fft(y_ap);
U_avrg = mean(U_dft,2);
Y_avrg = mean(Y_dft,2);
H2 = Y_avrg ./ U_avrg;

%% avereging FRF
H_i = Y_dft ./ U_dft;
H3 = mean(H_i,2);



%% avereging autopower of input
S_YU = mean (Y_dft .* conj(U_dft),2);
S_UU = mean (U_dft .* conj(U_dft),2);
H4 = S_YU ./ S_UU;




%% avereging autopower of output
S_YY = mean (Y_dft .* conj(Y_dft),2);
S_UY = mean (U_dft .* conj(Y_dft),2);
H5 = S_YY ./ S_UY;


f = (0:N1/2-1)*(fs/N1);

figure
plot(f,20*log10(abs(H1(1:N1/2))),'y');
hold on
plot(f,20*log10(abs(H2(1:N1/2))),'r');
plot(f,20*log10(abs(H3(1:N1/2))),'b');
plot(f,20*log10(abs(H4(1:N1/2))),'m');
plot(f,20*log10(abs(H5(1:N1/2))),'k');
grid on
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
legend('H1','H2','H3','H4','H5')
