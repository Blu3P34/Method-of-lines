function abs_error(u,t,M)
    tiledlayout(2,2);
    for i = 1:4
        nexttile;
        error = abs( u(:,M*i/4+1) - sol(i/4,t) );
        plot(t, error)
        title('x = ' + string(i/4))
    end
end