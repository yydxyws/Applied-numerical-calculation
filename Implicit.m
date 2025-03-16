% 隐式方法求解

X = 1; % x区间长度
T = 0.1; % t区间长度
Jx = 20; % x区间步数
Nt = 100; % t区间步数
dx = X / Jx; %x空间步长
dt = T / Nt; %t时间步长

x = (0 : Jx) * dx;
t = (0 : Nt) * dt;
u = zeros(Jx+1, Nt+1); 

for j = 1 :  Jx+1  % 初始条件（分段函数）
    if j <= (Jx+1)/2
        u(j,1) = 2 * x(j);
    else
        u(j,1) = 2 - 2 * x(j);
    end
end

for n = 1 : Nt+1 %边界条件
    u(1, n) = 0;
    u(Jx+1, n) = 0;
end


A = sparse(Jx+1, Jx+1); % 构建三层时间格式的矩阵
A(1, 1) = 1; 
A(Jx+1, Jx+1) = 1; 
for i = 2 : Jx
    A(i, i-1) = - dt / (dx^2);
    A(i, i) = 1 + 2 *  dt / (dx^2);
    A(i, i+1) = - dt / (dx^2);
end


for m = 1 : Nt  % 隐式求解公式
    b = u(:, m);
    b(1) = 0; % 边界条件
    b(Jx+1) = 0; % 边界条件
    u(:, m+1) = A \ b; % 求解线性方程组
end

t_values = [0.001, 0.025, 0.05]; %t值索引
t_indices = zeros(size(t_values));
for i = 1 : length(t_values)
    [~, t_indices(i)] = min(abs(t - t_values(i)));
end

figure(1); % 3D绘图
mesh(x, t, u');
xlabel('x');
ylabel('t');
zlabel('u');
title(' Implicit Scheme');

figure(2); % 2D绘图
for i = 1 : length(t_values)
    subplot(length(t_values), 1, i);
    plot(x, u(:, t_indices(i)), 'DisplayName', sprintf('t = %.3f', t(t_indices(i))));
    xlabel('x');
    ylabel('u');
    title(sprintf('Numerical Solution at t = %.3f', t(t_indices(i))));
    legend show;
end