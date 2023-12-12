function out = ode_func2(t, u, l, M)
    %step size
    h = l/M;
    %number of ode
    R = M - 1;
    out = zeros(2*R, 1);
    
    x = linspace(0,1,M+1);
    c = Simpson(M+1);
    
    S = 0;
    for i = 1:R
        S = S + u(i+R)*c(i+1);
    end

    for i = 1:2*R
        if i == 1
            out(i) = ( g1(t) - 2*u(i+R) + u(i+R+1) )/h^2 + q(x(i+1),t);
        elseif i > 1 && i < R
            out(i) = ( u(i+R-1) - 2*u(i+R) + u(i+R+1) )/h^2 + q(x(i+1),t);
        elseif i == R
            out(i) = ( u(i+R-1) - 2*u(i+R) )/h^2 + 3*( g2(t)/h - g1(t)/3 - S )/h^2 + q(x(i+1),t);
        else 
            out(i) = u(i-R);
        end
    end
end
