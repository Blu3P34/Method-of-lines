function out = Simpson(M)
    out = zeros(1,M);
    for i = 1:M
        if i == 1 || i == M
            out(i) = 1/3;
        elseif mod(i,2) == 0
            out(i) = 4/3;
        else 
            out(i) = 2/3;
        end
    end
end