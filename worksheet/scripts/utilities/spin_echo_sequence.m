function [t,emf] = spin_echo_sequence(N,M0,TE,w0,t_pulse,T1,T2,type)
if nargin == 7
    type = "CP";
end
tau = TE/2;     % ms
delta_theta1 = pi/2;	% 90 deg
if type == "CP"
    delta_theta2 = pi;      % 180 deg
elseif type =="H"
    delta_theta2 = pi/2;      % 90 deg
end
t1 = linspace(0,t_pulse,100);
t2 = linspace(0,tau,1001);
t3 = t1;
t4 = linspace(0,TE,2001);

M1 = forced_procession(t1,M0,w0,t_pulse,delta_theta1,'x');
M2 = free_procession_euler(t2,M1(:,end),T1,T2,w0);
M3 = forced_procession(t3,M2(:,end),w0,t_pulse,delta_theta2,'y');
M4 = free_procession_euler(t4,M3(:,end),T1,T2,w0);
dummy = zeros(size(t1));
emf = [dummy,diff(M2(1,:))/(t2(2)-t2(1)),dummy,diff(M4(1,:))/(t4(2)-t4(1))];

for i = 1:N-1
    M3 = forced_procession(t3,M4(:,end),w0,t_pulse,delta_theta2,'y');
    M4 = free_procession_euler(t4,M3(:,end),T1,T2,w0);
    emf = [emf,dummy,diff(M4(1,:))/(t4(2)-t4(1))];
end

t=linspace(0,t_pulse+tau+(t_pulse+TE)*N,length(emf));

function [M] = forced_procession(t,M0,w0,t_pulse,delta_theta,dir)
    w1 = delta_theta/t_pulse;
    M = forced_procession_lab(t,M0,w0,w1,dir);
end

end