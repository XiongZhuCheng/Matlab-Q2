function a = legendre_approx(f, N)
% Computes coefficients a_n for Legendre polynomial approximation
a = zeros(N+1, 1);
for n = 0:N
    integrand = @(x) f(x) .* legendre_poly(n, x);
    a(n+1) = (2*n + 1)/2 * simpson(integrand, -1, 1, 1000);
end
end
