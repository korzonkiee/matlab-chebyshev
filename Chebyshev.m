function [x, k] = Chebyshev(polynomialCoeffs, rootApprox, tolerance, maxIterations)
    
% [x, k] = Chebyshev(polynomialCoeffs, rootApprox, tolerance, maxIterations)
% 
% polynomialCoeffs - Coefficient of the given polynomial
% rootApprox - approximation of the root to find
% tolerance - algorithm's tolerance
% maxIterations - maximum number of iterations
%
% Finding a root of polynomial w(x) = p(1)x^n + ... + p(n)x + p(n + 1)
% by the Chebyszev method

dx = tolerance + 1;
k = 0;

while abs(dx) > tolerance && k <= maxIterations
    
    [w, dw, dww] = Horner(polynomialCoeffs, rootApprox);
    
    if dw == 0
        error('Cannot divide by zero!');
    end
    
    dx = w / dw;
    y = rootApprox - dx;
    
    x = y - w^2*dww/(2*(dw)^3);
    k = k + 1;
    rootApprox = x;
    
end
end
