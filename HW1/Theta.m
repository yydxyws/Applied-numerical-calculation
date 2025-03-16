% θ-method 求解


X = 1; % x区间长度
T = 0.1; % t区间长度
Jx = 20; % x区间步数
Nt = 100; % t区间步数
theta = 0.5; % θ-method 参数

dx = X / Jx; %取值范围
dt = T / Nt;
x = (0 : Jx) * dx;
t = (0 : Nt) * dt;

% 初始条件（分段函数）
u = zeros(Jx+1, Nt+1);
for k = 1 : Jx+1
    if k <= (Jx+1)/2
        u(k,1) = 2 * x(k);
    else
        u(k,1) = 2 - 2 * x(k);
    end
end

% 边界条件
for p = 1 : Nt+1
    u(1, p) = 0;
    u(Jx+1, p) = 0;
end

% 构建 θ-method 的矩阵
A = sparse(Jx+1, Jx+1);
A(1, 1) = 1; % 边界条件
A(Jx+1, Jx+1) = 1; % 边界条件
for i = 2 : Jx
    A(i, i-1) = -theta * dt / (dx^2);
    A(i, i) = 1 + 2 * theta * dt / (dx^2);
    A(i, i+1) = -theta * dt / (dx^2);
end

for m = 1 : Nt % θ-method求解公式
    b = u(:, m);
    b(1) = 0; % 边界条件
    b(Jx+1) = 0; % 边界条件
    for i = 2 : Jx
        b(i) = u(i, m) + (1 - theta) * dt / (dx^2) * (u(i+1, m) - 2*u(i, m) + u(i-1, m));
    end
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
title(' Theta Scheme');

figure(2); % 2D绘图
for i = 1 : length(t_values)
    subplot(length(t_values), 1, i);
    plot(x, u(:, t_indices(i)), 'DisplayName', sprintf('t = %.3f', t(t_indices(i))));
    xlabel('x');
    ylabel('u');
    title(sprintf('Numerical Solution at t = %.3f', t(t_indices(i))));
    legend show;
end