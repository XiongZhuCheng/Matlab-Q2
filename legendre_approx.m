function c = legendre_approx(f, n)
% Compute coefficients for the Legendre polynomial approximation
c = zeros(n+1, 1);
for k = 0:n
    integrand = @(x) f(x) .* legendre_poly(k, x);
    c(k+1) = (2*k + 1)/2 * simpson(integrand, -1, 1, 100);
end
end
