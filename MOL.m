clear;
clc
format long e
l = 1;
M = 1000;
h = l/M;
T = 1/2; 
x = linspace(0,1,M+1);
t_span = [0 T];
S = Simpson(M+1);
c = S(2:M);
order = 4;

condition = zeros(2*M-2,0);
for i = 1:(2*M-2)
    if i <= M-1
        condition(i) = f2(x(i+1));
    else
        condition(i) = f1(x(i+1-M+1));
    end
end

if order == 2 
    [t,u] = ode89(@(t,u) ode_func2(t,u,l,M), t_span, condition);
else 
    [t,u] = ode89(@(t,u) ode_func4(t,u,l,M), t_span, condition);
end

u = u(:,M:2*M-2);
s = size(t);
u0 = zeros(s(1),1);
uM = zeros(s(1),1);
for i = 1:size(t)
    ut = u(i,:);
    u0(i) = g1(t(i));
    uM(i) = 3/h*( g2(t(i)) - 1/3*h*u0(i) - h*dot(ut,c) );
end

u = [u0 u uM];

%tiledlayout(1,2)
%nexttile
%for i = 1:10
%    plot(t,u(:,M/10*i+1))
%    hold on
%end
%xlabel('t')
%ylabel('v(x,t)')
%legend('x = 0.10','x = 0.20','x = 0.30','x = 0.40','x = 0.50','x = 0.60','x = 0.70','x = 0.80','x = 0.90','x = 1.00')
%title('v(x,t) using MOL')

%nexttile
%plot3d(x,t,u)


abs_error(u,t,M)

%error = error_analysis(u,t,M)

%nor1 = norm_analysis(u,t,M)

nor2 = total_norm(u,x,t,M)

