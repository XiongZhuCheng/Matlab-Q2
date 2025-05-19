% 主程序
clc; clear;

% 定义函数
f = @(x) 1 ./ (1 + x.^2);
g = @(x) sin(x) + cos(2*x);

% 区间变换
transform = @(x, a, b) ((b - a) * x + (b + a)) / 2;

% 设置阶数
n_values = 1:7;
x_plot = linspace(-1, 1, 500);

% 逼近并绘图
for n = n_values
    % Legendre 逼近
    c = legendre_approx(f, n);
    P = zeros(size(x_plot));
    for k = 0:n
        P = P + c(k+1) * legendre_poly(k, x_plot);
    end
    figure(1);
    plot(transform(x_plot, -5, 5), f(transform(x_plot, -5, 5)), 'k', 'LineWidth', 1.5); hold on;
    plot(transform(x_plot, -5, 5), P, 'DisplayName', ['n = ', num2str(n)]);
    title('Legendre 多项式逼近');
    legend show;
    hold off;

    % Chebyshev 逼近
    a = chebyshev_approx(f, n);
    T = zeros(size(x_plot));
    for k = 0:n
        T = T + a(k+1) * chebyshev_poly(k, x_plot);
    end
    figure(2);
    plot(transform(x_plot, -5, 5), f(transform(x_plot, -5, 5)), 'k', 'LineWidth', 1.5); hold on;
    plot(transform(x_plot, -5, 5), T, 'DisplayName', ['n = ', num2str(n)]);
    title('Chebyshev 多项式逼近');
    legend show;
    hold off;
end
