function [] = TestWilkinson(polynomialCoeffs, rootApprox, tolerance, maxIterations)
    hold on
    
    interval = linspace(0, 20, 10000);
    y = [];
    
    roots = 1:20;
    
    for index = 1:length(interval)
        [x, k] = Chebyshev(polynomialCoeffs, interval(index), tolerance, maxIterations);
        y = [y, min(abs(roots - x))];
    end
    
    plot(interval, y);
    
    hold off
end
