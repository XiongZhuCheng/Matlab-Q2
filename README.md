# Polynomial Approximation with Legendre and Chebyshev Polynomials

This project approximates univariate functions on `[-1,1]` using Legendre and Chebyshev polynomial expansions.  Numerical integration relies on the composite Simpson rule.

## Files
- `legendre_poly.m` – evaluates the Legendre polynomial \(P_n(x)\) via recurrence.
- `chebyshev_poly.m` – evaluates the Chebyshev polynomial \(T_n(x)\) via recurrence.
- `simpson.m` – composite Simpson integration helper.
- `legendre_approx.m` – computes coefficients of the Legendre expansion.
- `chebyshev_approx.m` – computes coefficients of the Chebyshev expansion.
- `main.m` – script that demonstrates the approximations for sample functions and different polynomial degrees.

## Usage
Run `main.m` in MATLAB or Octave to reproduce the figures.  The script prints the
Legendre and Chebyshev coefficients as well as the root-mean-square error of each
approximation.
