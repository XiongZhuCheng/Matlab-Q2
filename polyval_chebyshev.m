function y = polyval_chebyshev(c, x)
%POLYVAL_CHEBYSHEV Evaluate a Chebyshev series at x.
%   C is a column vector of coefficients for sum_{k=0}^{N} C(k+1) * T_k(x).

n = numel(c) - 1;
y = zeros(size(x));
for k = 0:n
    y = y + c(k+1) * chebyshev_poly(k, x);
end
end
