function [M] = free_procession_euler(t,M0,T1,T2,w0)

M_temp = M0;
M = [M0];

dt = t(2)-t(1);

rhs = @(M,T1,T2,M0)-M.*[1;1;0]/T2+[0;0;(norm(M0)-M(3))/T1];

for ii = 2:length(t)
    % update M using Euler method
    M_temp = M_temp + dt*rhs(M_temp,T1,T2,M0);
    theta_z = w0*t(ii);    % CW
    M(:,ii) = rotz(theta_z)*M_temp;
end

end

