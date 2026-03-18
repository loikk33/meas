close all; clear; clc;
fs = 10000; 
N = 4096;
fres = fs/N;
f = (-N/2:N/2-1)*fres;
f_exc = 100;
bin_exc = round(f_exc*N/ fs);
f_exc2 = bin_exc*fres;

t = (0:N-1)/fs;
A_min = 0.05;
A_max = 3.5;
A_vec = logspace(log10(A_min),log10(A_max),10);
for ii = 1:10
    A = A_vec(ii);
    u = A * sin(2*pi*f_exc2*t);
    filename = sprintf('input_A%02d.mat',ii);
    save(filename, 'u')
end
%Lab_2_and_3_check_exc('signal4_2.mat');
input = zeros(N,10);
output = zeros(N,10);
Power_input = zeros(1,10);
Power_output = zeros(1,10);
figure;
for i = 1:10 
    [u,y] = ReadData(sprintf('input_acq_4_%d.mat',30 + i), N, 10);
    u = u(end-N+1: end);
    y = y(end-N+1: end);
    Power_output(i) = sum(y.^2)/N;
    Power_input(i)  = sum(u.^2)/N;
    U = fft(u)/N;
    Y = fft(y)/N;
   input(:,i) = U;
   output(:,i) = Y;
   subplot(5,2,i); plot(f,db(Y));
end
p_fit = polyfit(Power_input(1:3), Power_output(1:3),1);
p_lin = polyval(p_fit, Power_input);

figure; 
plot(10*log10(Power_input),10*log10(Power_output));
hold on ; 
plot(10*log10(Power_input), 10*log10(p_lin));

% compression qppear at 11.2 dB 

p_1db = 11.2;
p_1db = 10^(p_1db/10); % puissqnce non lineaire 
A_1db = sqrt(p_1db*2);
u_1db = A_1db * sin(2*pi*f_exc2*t);

save('signal_1db.mat',"u_1db");

[u,y] = ReadData('signal_1db_acq.mat', N, 10);
u = u(end-N+1: end);
y = y(end-N+1: end);
P_1db_output = sum(y.^2)/N;
P_1db_input  = sum(u.^2)/N;
db(P_1db_output)
db(P_1db_input)
diff = abs(db(P_1db_output) - db(P_1db_input));
disp(diff);