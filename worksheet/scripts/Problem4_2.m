clear;
clc;

N = 5;
T1 = 10;            % ms
TI = linspace(0,4,41)*T1*log(2);   % Invertion time
emf_p = [];
for ti = TI
    [emf_TI,~,~] = IR_sequence(N,ti);
    emf_p = [emf_p, emf_TI];
end
fig = figure;plot(TI/(T1*log(2)),emf_p);
xlabel('T_I (T_1ln2)');
ylabel('Signal(T_I) (a.u.)');
axis tight;
save_pdf(fig,'figure4.2.T1est.pdf');

TI_plot = [0.5*T1*log(2),1*T1*log(2),1.5*T1*log(2)];
for ii = 1:length(TI_plot)
    [emf_TI,t,emf] = IR_sequence(N,TI_plot(ii));
    fig = figure;plot(t,emf);
    xlabel('Time (ms)');
    ylabel('Signal (a.u.)');
    axis tight;
    save_pdf(fig,sprintf('figure4.2.%d.pdf',ii));
end

function [emf_TI,t,emf] = IR_sequence(N,TI)
    t_max = 25;     % ms
    t_pulse = 1; 	% ms
    T1 = 10;        % ms
    T2 = 5;         % ms

    delta_theta1 = pi;      % 180 deg
    delta_theta2 = pi/2;    % 90 deg
    t1 = linspace(0,t_pulse,100);
    t2 = linspace(0,TI,500);
    t3 = t1;
    t4 = linspace(0,t_max,2501);
    w0 = 4*pi;     % KHz

    M0 = [0 0 1]';
    M1 = forced_procession(t1,M0,w0,t_pulse,delta_theta1);
    M2 = free_procession_euler(t2,M1(:,end),T1,T2,w0);
    M3 = forced_procession(t3,M2(:,end),w0,t_pulse,delta_theta2);
    M4 = free_procession_euler(t4,M3(:,end),T1,T2,w0);
    dummy = [zeros(size(t1)),zeros(size(t2)),zeros(size(t3))];
    emf = [dummy,diff(M4(1,:))/(t4(2)-t4(1))];

    for i = 1:N-1
        M1 = forced_procession(t1,M4(:,end),w0,t_pulse,delta_theta1);
        M2 = free_procession_euler(t2,M1(:,end),T1,T2,w0);
        M3 = forced_procession(t3,M2(:,end),w0,t_pulse,delta_theta2);
        M4 = free_procession_euler(t4,M3(:,end),T1,T2,w0);
        emf = [emf,dummy,diff(M4(1,:))/(t4(2)-t4(1))];
    end
    
    t=linspace(0,(t_pulse+TI+t_pulse+t_max)*N,length(emf));
    emf_TI = max(emf);
end

function [M] = forced_procession(t,M0,w0,t_pulse,delta_theta)
    w1 = delta_theta/t_pulse;
    M = forced_procession_lab(t,M0,w0,w1);
end