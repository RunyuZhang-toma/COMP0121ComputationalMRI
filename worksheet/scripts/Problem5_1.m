clear;
clc;

N = 3;
M0 = [0 0 1]';
TE = 15;            % ms
t_pulse = 1;        % ms
T1 = 20;            % ms
T2 = 15;            % ms

% generate a collection of isochromats, initially aligns and sums up tp M0
N_i = 1000;
m0 = M0/N_i;
w0 = 4*pi;          % KHz
delta_w0 = 0.05*w0;  % KHz
W0 = w0+delta_w0*2*(rand(1,N_i)-0.5);

emf_sum = 0;  
for w = W0
    [t,emf] = spin_echo_sequence(N,m0,TE,w,t_pulse,T1,T2);
    emf_sum = emf_sum + emf;
end
fig=figure();plot(t,emf_sum);
xlabel('Time (ms)');
ylabel('Signal (a.u.)');
axis tight;
save_pdf(fig,'figure5.1.pdf');