fs = 10000; 
N = 4096;
k = 41; % Choosing the 41st bin near 100Hz
f_exc = k * fs / N; 
t = (0:N-1)/fs;
u = 1 * sin(2*pi*f_exc*t); 

save('input_sine.mat', 'u'); 