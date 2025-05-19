%% Main script demonstrating polynomial approximations
%  Approximates two sample functions using Legendre and Chebyshev
%  polynomials up to degree 7.  Coefficients and RMS errors are printed
%  and the approximations are plotted.

clc; clear;

% Sample functions
f = @(x) 1 ./ (1 + x.^2);            % defined on [-5,5]
g = @(x) sin(x) + cos(2*x);          % defined on [0, pi]

% Intervals for the two functions
intF = [-5, 5];
intG = [0, pi];

% Map from [-1,1] to [a,b]
transform = @(t, a, b) ((b - a)/2) .* t + (b + a)/2;

n_values = 1:7;                 % polynomial degrees
x_plot  = linspace(-1, 1, 500); % evaluation points on [-1,1]

%% Legendre approximation of f on [-5,5]
figure(1); clf; hold on;
plot(transform(x_plot, intF(1), intF(2)), f(transform(x_plot, intF(1), intF(2))), ...
    'k', 'LineWidth', 1.5, 'DisplayName', 'Exact');
for n = n_values
    coeff = legendre_approx(@(t) f(transform(t, intF(1), intF(2))), n);
    approx = zeros(size(x_plot));
    for k = 0:n
        approx = approx + coeff(k+1) * legendre_poly(k, x_plot);
    end
    plot(transform(x_plot, intF(1), intF(2)), approx, 'DisplayName', ['n = ', num2str(n)]);
    rms = rms_error(@(t) f(transform(t, intF(1), intF(2))), ...
                    @(t) polyval_legendre(coeff, t));
    fprintf('Legendre coeffs for f, n=%d: ', n); fprintf('%g ', coeff); fprintf('\n');
    fprintf('  RMS error: %.3e\n', rms);
end
hold off; legend show; title('Legendre approximation of f on [-5,5]');

%% Chebyshev approximation of f on [-5,5]
figure(2); clf; hold on;
plot(transform(x_plot, intF(1), intF(2)), f(transform(x_plot, intF(1), intF(2))), ...
    'k', 'LineWidth', 1.5, 'DisplayName', 'Exact');
for n = n_values
    coeff = chebyshev_approx(@(t) f(transform(t, intF(1), intF(2))), n);
    approx = zeros(size(x_plot));
    for k = 0:n
        approx = approx + coeff(k+1) * chebyshev_poly(k, x_plot);
    end
    plot(transform(x_plot, intF(1), intF(2)), approx, 'DisplayName', ['n = ', num2str(n)]);
    rms = rms_error(@(t) f(transform(t, intF(1), intF(2))), ...
                    @(t) polyval_chebyshev(coeff, t), @(x) 1./sqrt(1 - x.^2), pi);
    fprintf('Chebyshev coeffs for f, n=%d: ', n); fprintf('%g ', coeff); fprintf('\n');
    fprintf('  RMS error: %.3e\n', rms);
end
hold off; legend show; title('Chebyshev approximation of f on [-5,5]');

%% Legendre approximation of g on [0, \pi]
figure(3); clf; hold on;
plot(transform(x_plot, intG(1), intG(2)), g(transform(x_plot, intG(1), intG(2))), ...
    'k', 'LineWidth', 1.5, 'DisplayName', 'Exact');
for n = n_values
    coeff = legendre_approx(@(t) g(transform(t, intG(1), intG(2))), n);
    approx = zeros(size(x_plot));
    for k = 0:n
        approx = approx + coeff(k+1) * legendre_poly(k, x_plot);
    end
    plot(transform(x_plot, intG(1), intG(2)), approx, 'DisplayName', ['n = ', num2str(n)]);
    rms = rms_error(@(t) g(transform(t, intG(1), intG(2))), ...
                    @(t) polyval_legendre(coeff, t));
    fprintf('Legendre coeffs for g, n=%d: ', n); fprintf('%g ', coeff); fprintf('\n');
    fprintf('  RMS error: %.3e\n', rms);
end
hold off; legend show; title('Legendre approximation of g on [0, \pi]');

%% Chebyshev approximation of g on [0, \pi]
figure(4); clf; hold on;
plot(transform(x_plot, intG(1), intG(2)), g(transform(x_plot, intG(1), intG(2))), ...
    'k', 'LineWidth', 1.5, 'DisplayName', 'Exact');
for n = n_values
    coeff = chebyshev_approx(@(t) g(transform(t, intG(1), intG(2))), n);
    approx = zeros(size(x_plot));
    for k = 0:n
        approx = approx + coeff(k+1) * chebyshev_poly(k, x_plot);
    end
    plot(transform(x_plot, intG(1), intG(2)), approx, 'DisplayName', ['n = ', num2str(n)]);
    rms = rms_error(@(t) g(transform(t, intG(1), intG(2))), ...
                    @(t) polyval_chebyshev(coeff, t), @(x) 1./sqrt(1 - x.^2), pi);
    fprintf('Chebyshev coeffs for g, n=%d: ', n); fprintf('%g ', coeff); fprintf('\n');
    fprintf('  RMS error: %.3e\n', rms);
end
hold off; legend show; title('Chebyshev approximation of g on [0, \pi]');
