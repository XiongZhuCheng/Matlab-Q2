% main.m
% Polynomial approximation using Legendre and Chebyshev polynomials

clear; clc; close all;

% Sample functions from Question 1 sub-questions 5 and 6
functions = {@(x) sin(pi*x), @(x) exp(x)};
func_names = {'sin(pi*x)', 'exp(x)'};

% Degrees to test
degrees = [3, 5, 7];

% Evaluation grid
x = linspace(-1, 1, 1000);

for idx = 1:numel(functions)
    f = functions{idx};
    fprintf('Approximating %s\n', func_names{idx});
    for deg = degrees
        fprintf('  Degree %d\n', deg);

        % Legendre approximation
        a_leg = legendre_approx(f, deg);
        y_leg = zeros(size(x));
        for n = 0:deg
            y_leg = y_leg + a_leg(n+1) * legendre_poly(n, x);
        end
        fprintf('    Legendre coefficients: ');
        fprintf('%g ', a_leg);
        fprintf('\n');

        % Chebyshev approximation
        a_cheb = chebyshev_approx(f, deg);
        y_cheb = zeros(size(x));
        for n = 0:deg
            y_cheb = y_cheb + a_cheb(n+1) * chebyshev_poly(n, x);
        end
        fprintf('    Chebyshev coefficients: ');
        fprintf('%g ', a_cheb);
        fprintf('\n');

        % True function values
        y_true = f(x);

        % Compute root-mean-square errors
        rmse_leg = sqrt(mean((y_leg - y_true).^2));
        rmse_cheb = sqrt(mean((y_cheb - y_true).^2));
        fprintf('    RMSE Legendre  : %.3e\n', rmse_leg);
        fprintf('    RMSE Chebyshev : %.3e\n', rmse_cheb);

        % Plot results
        figure;
        plot(x, y_true, 'k', 'LineWidth', 1.5); hold on;
        plot(x, y_leg, 'r--', 'LineWidth', 1.5);
        plot(x, y_cheb, 'b-.', 'LineWidth', 1.5);
        legend('Original', 'Legendre Approx.', 'Chebyshev Approx.');
        title(sprintf('%s approximation (degree %d)', func_names{idx}, deg));
        xlabel('x'); ylabel('f(x)'); grid on;
    end
end

fprintf('Done.\n');
