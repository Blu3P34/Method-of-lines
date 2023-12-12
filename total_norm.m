function out = total_norm(u,x,t,M)
    nor = zeros(M+1,1);
    for i = 1:M+1
        nor(i) = norm(abs(u( :,i) - sol(x(i),t)), Inf);
    end
    out = norm(nor, Inf);
end