function integral = simpson(f, a, b, n)
% Composite Simpson's rule for numerical integration
if mod(n, 2) ~= 0
    error('Number of subintervals n must be even.');
end
h = (b - a)/n;
x = a:h:b;
y = f(x);
integral = h/3 * (y(1) + 2*sum(y(3:2:end-2)) + 4*sum(y(2:2:end)) + y(end));
end
