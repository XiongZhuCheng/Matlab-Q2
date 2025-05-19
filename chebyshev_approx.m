function a = chebyshev_approx(f, N)
% Computes coefficients a_n for Chebyshev polynomial approximation
a = zeros(N+1, 1);
for n = 0:N
    integrand = @(x) f(x) .* chebyshev_poly(n, x) ./ sqrt(1 - x.^2);
    if n == 0
        a(n+1) = (1/pi) * simpson(integrand, -1 + 1e-10, 1 - 1e-10, 1000);
    else
        a(n+1) = (2/pi) * simpson(integrand, -1 + 1e-10, 1 - 1e-10, 1000);
    end
end
end
