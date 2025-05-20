function P = legendre_poly(n, x)
% Evaluate the Legendre polynomial of degree n at points x
P = zeros(n+1, length(x));
P(1, :) = 1;
if n == 0
    return;
end
P(2, :) = x;
for k = 2:n
    P(k+1, :) = ((2*k - 1) .* x .* P(k, :) - (k - 1) * P(k-1, :)) / k;
end
P = P(end, :);
end
