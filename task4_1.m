%% Lab 4: Frequency Analysis of a Nonlinear System
fs = 200;           
T = 2;              
N = fs * T;         
t = (0:N-1)/fs;    

f1 = 4; 
f2 = 11;
u = cos(2*pi*f1*t) + cos(2*pi*f2*t);

% y(t) = u(t) - 0.5*u(t)^3 - 0.25*u(t)^4
y = u - 0.5*(u.^3) - 0.25*(u.^4);

Y = fft(y);
Y_mag = abs(Y)/N; 
freq_axis = (0:N-1) * (fs)/N; 
figure;
stem(freq_axis, Y_mag, 'filled', 'MarkerSize', 4);
grid on;
xlim([0 50]); 
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Output Spectrum of Nonlinear System (u - 0.5u^3 - 0.25u^4)');