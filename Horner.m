function [val, valp, valpp] = Horner( a, x )
%  y = a(1)*x^(n-1) + .... + a(n-1)*x + a(n)
%  Horner's scheme

    a = fliplr(a);

    n = max(size(a));
    w = a(n); p = w; r = p;
    
    for k = n-1:-1:3
        w = x * w + a(k);
        p = x * p + w;
        r = x * r + p;
    end
    
    w = x * w + a(2);
    p = x * p + w;
    w = x * w + a(1);
    
    val = w;
    valp = p;
    valpp = 2*r;
    
end
