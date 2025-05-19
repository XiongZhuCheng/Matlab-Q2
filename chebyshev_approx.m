function a = chebyshev_approx(f, n)
% 计算 Chebyshev 多项式逼近的系数
a = zeros(n+1, 1);
w = @(x) 1 ./ sqrt(1 - x.^2);
for k = 0:n
    integrand = @(x) f(x) .* chebyshev_poly(k, x) .* w(x);
    if k == 0
        a(k+1) = (1/pi) * simpson(integrand, -1, 1, 100);
    else
        a(k+1) = (2/pi) * simpson(integrand, -1, 1, 100);
    end
end
end
