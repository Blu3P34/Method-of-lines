function out = norm_analysis(u,t,M)
    nor = zeros(10,1);
    for i = 1:10
        nor(i) = norm(abs(u( :,M*i/10+1) - sol(i/10,t)), Inf);
    end
    out = nor;
end