function out = exact_sol(x,t)
    s = size(x);
    out = zeros(1,s(2));
    for i = 1:s(2)
        out(i) = sol(x(i),t);
    end
end