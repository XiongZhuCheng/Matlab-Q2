function err = rms_error(f, approx, weight, norm_const)
%RMS_ERROR Compute the root-mean-square error of an approximation on [-1,1].
%
%   ERR = RMS_ERROR(F, APPROX) computes the unweighted RMS error of the
%   function handle APPROX with respect to F using the composite Simpson rule
%   on [-1,1].
%
%   ERR = RMS_ERROR(F, APPROX, WEIGHT, NORM_CONST) allows specifying a weight
%   function and normalization constant.  The integral is
%   1/NORM_CONST * \int_{-1}^{1} (F(x)-APPROX(x))^2 * WEIGHT(x) dx.

if nargin < 3 || isempty(weight)
    weight = @(x) ones(size(x));
end
if nargin < 4
    norm_const = 2; % length of interval for unweighted L2
end
integrand = @(x) (f(x) - approx(x)).^2 .* weight(x);
err = sqrt(simpson(integrand, -1, 1, 200) / norm_const);
end
