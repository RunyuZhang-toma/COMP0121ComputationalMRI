function [A] = lorentizian_rand(n,w0,Delta,delta_w0)
M = 10;
A = [];
for ii = 1:n
    while(1)
        y = w0+delta_w0*2*(rand(1)-0.5);
        u = rand(1);
        if u<(1/(pi*Delta+pi*(y-w0)^2/Delta))/M/y
            A = [A, y];
            break;
        else
            continue;
        end
    end
end
end