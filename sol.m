function out = sol(x,t)
    out = cos(pi*x)*sin(pi*t);
end

% 1. cos(pi*x)*sin(pi*t)
% 2. 1/2*(cos(pi*(x + t)) + cos(pi*(x - t)))
% 3. x*t.*exp(-(x + t))
% 4. (x.^5 + x.^3 - x.^2)*(t.^2 - t)