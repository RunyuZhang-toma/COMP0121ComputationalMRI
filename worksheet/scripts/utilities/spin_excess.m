function [s] = spin_excess(B,T,gamma)
%Calculate spin excess
h = 6.626e-24;
k = 1.3805e-23;
s = exp(-h*gamma.*B/k./T);
end

