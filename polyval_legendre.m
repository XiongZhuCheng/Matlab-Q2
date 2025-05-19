function y = polyval_legendre(c, x)
%POLYVAL_LEGENDRE Evaluate a Legendre series at x.
%   C is a column vector of coefficients such that the approximation is
%   sum_{k=0}^{N} C(k+1) * P_k(x).

n = numel(c) - 1;
y = zeros(size(x));
for k = 0:n
    y = y + c(k+1) * legendre_poly(k, x);
end
end
