function out = error_analysis(u,t,M)
    T = size(t);
    error = zeros(10,1);
    for i = 1:10
        error(i) = abs( u(T(1),M*i/10+1) - sol(i/10,t(T(1))) );
    end
    out = error;
end