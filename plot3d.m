function plot3d(x,t,u)
    mesh(x,t,u)
    colorbar
    xlabel('x')
    ylabel('t')
    zlabel('v(x,t)')
    title('3d plot of v(x,t)');
end