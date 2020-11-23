function [M] = forced_procession_rot(t,M0,w1)
% rotation frame
M = [];
for tt = t
    % update M
    theta = w1*tt;  % CW
    M = [M,rotx(theta)*M0];
end

end

