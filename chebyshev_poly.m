function T = chebyshev_poly(n, x)
% Computes the Chebyshev polynomial T_n(x) using recurrence relation
T0 = ones(size(x));
if n == 0
    T = T0;
    return;
end
T1 = x;
if n == 1
    T = T1;
    return;
end
T_prev = T0;
T_curr = T1;
for k = 2:n
    T_next = 2*x.*T_curr - T_prev;
    T_prev = T_curr;
    T_curr = T_next;
end
T = T_curr;
end
