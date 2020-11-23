clear;
clc;

N = 10;
t_max = 25;    % ms
t_pulse = 1;    % ms
T1 = 10;        % ms
T2 = 5;        % ms
delta_theta = pi/2; % 90 deg
w1 = delta_theta/t_pulse;
t1 = linspace(0,t_pulse,100);
t2 = linspace(0,t_max,2501);
w0 = 4*pi;     % KHz

M0 = [0 0 1]';
M1 = forced_procession_lab(t1,M0,w0,w1);
M2 = free_procession_euler(t2,M1(:,end),T1,T2,w0);
dummy = zeros(size(t1));
emf = [dummy,diff(M2(1,:))/(t2(2)-t2(1))];

for i = 1:N-1
    M1 = forced_procession_lab(t1,M2(:,end),w0,w1);
    M2 = free_procession_euler(t2,M1(:,end),T1,T2,w0);
    emf = [emf,dummy,diff(M2(1,:))/(t2(2)-t2(1))];
end

t=linspace(0,(t_pulse+t_max)*N,length(emf));
fig = figure;plot(t,emf);
xlabel('Time (ms)');
ylabel('Signal (a.u.)');
axis tight;
save_pdf(fig,'figure4.1.pdf');