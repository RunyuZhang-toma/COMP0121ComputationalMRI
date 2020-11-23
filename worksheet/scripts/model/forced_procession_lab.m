function [M] = forced_procession_lab(t,M0,w0,w1,dir)
% lab frame
M = [];
if nargin == 4
    dir = 'x';
end
for tt = t
    % update M
    theta_z = w0*tt;    % CW
    theta = w1*tt;    % CW
    if dir == 'x'
        R = rotx(theta);
    elseif dir == 'y'
        R = roty(theta);
    end
    Mt = rotz(theta_z)*R*M0;
    M = [M,Mt];
end

end

