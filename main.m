% main.m
% Polynomial Approximation using Legendre and Chebyshev polynomials

clear; clc;

% Define test functions
f1 = @(x) sin(pi * x);
f2 = @(x) exp(x);

% Degrees to test
degrees = [3, 5, 7];

% Evaluation points
x = linspace(-1, 1, 1000);

for deg = degrees
    fprintf('Degree: %d\n', deg);
    
    % Legendre approximation
    a_leg = legendre_approx(f1, deg);
    y_leg = zeros(size(x));
    for n = 0:deg
        y_leg = y_leg + a_leg(n+1) * legendre_poly(n, x);
    end
    
    % Chebyshev approximation
    a_cheb = chebyshev_approx(f1, deg);
    y_cheb = zeros(size(x));
    for n = 0:deg
        y_cheb = y_cheb + a_cheb(n+1) * chebyshev_poly(n, x);
    end
    
    % Original function
    y_true = f1(x);
    
    % Plotting
    figure;
    plot(x, y_true, 'k', 'LineWidth', 1.5); hold on;
    plot(x, y_leg, 'r--', 'LineWidth', 1.5);
    plot(x, y_cheb, 'b-.', 'LineWidth', 1.5);
    legend('Original', 'Legendre Approx.', 'Chebyshev Approx.');
    title(sprintf('Function Approximation (Degree %d)', deg));
    xlabel('x'); ylabel('f(x)');
    grid on;
end
