function T = chebyshev_poly(n, x)
% 生成第 n 阶 Chebyshev 多项式在点 x 处的值
T = zeros(n+1, length(x));
T(1, :) = 1;
if n == 0
    return;
end
T(2, :) = x;
for k = 2:n
    T(k+1, :) = 2 * x .* T(k, :) - T(k-1, :);
end
T = T(end, :);
end
