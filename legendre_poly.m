function P = legendre_poly(n, x)
% Computes the Legendre polynomial P_n(x) using recurrence relation
P0 = ones(size(x));
if n == 0
    P = P0;
    return;
end
P1 = x;
if n == 1
    P = P1;
    return;
end
P_prev = P0;
P_curr = P1;
for k = 2:n
    P_next = ((2*k - 1).*x.*P_curr - (k - 1)*P_prev)/k;
    P_prev = P_curr;
    P_curr = P_next;
end
P = P_curr;
end
