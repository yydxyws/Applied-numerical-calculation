% 参数设置
h = 0.01; % 空间步长
x = 0:h:1; % x 方向网格
y = 0:h:1; % y 方向网格
N = length(x); % 网格点数
alpha = 1.0; % 热扩散系数
vx = 1.0; % x 方向流速
vy = 1.0; % y 方向流速

% 源项
[X, Y] = meshgrid(x, y);
f = sin(pi * X) .* sin(pi * Y);

% 初始化系数矩阵 A 和右端向量 b
A = sparse(N*N, N*N); % 稀疏矩阵
b = zeros(N*N, 1);

% 填充系数矩阵 A 和右端向量 b
for i = 2:N-1
    for j = 2:N-1
        % 网格点索引
        idx = (j-1)*N + i;
        
        % 扩散项
        A(idx, idx) = -2 * alpha / h^2 - 2 * alpha / h^2; % u_{i,j}
        A(idx, idx+1) = alpha / h^2; % u_{i+1,j}
        A(idx, idx-1) = alpha / h^2; % u_{i-1,j}
        A(idx, idx+N) = alpha / h^2; % u_{i,j+1}
        A(idx, idx-N) = alpha / h^2; % u_{i,j-1}
        
        % 对流项
        A(idx, idx+1) = A(idx, idx+1) + vx / (2*h); % u_{i+1,j}
        A(idx, idx-1) = A(idx, idx-1) - vx / (2*h); % u_{i-1,j}
        A(idx, idx+N) = A(idx, idx+N) + vy / (2*h); % u_{i,j+1}
        A(idx, idx-N) = A(idx, idx-N) - vy / (2*h); % u_{i,j-1}
        
        % 右端向量
        b(idx) = f(j, i);
    end
end

% 边界条件
for i = 1:N
    % 下边界 (j = 1)
    idx = (1-1)*N + i;
    A(idx, idx) = 1;
    b(idx) = 0;
    
    % 上边界 (j = N)
    idx = (N-1)*N + i;
    A(idx, idx) = 1;
    b(idx) = 0;
end

for j = 1:N
    % 左边界 (i = 1)
    idx = (j-1)*N + 1;
    A(idx, idx) = 1;
    b(idx) = 0;
    
    % 右边界 (i = N)
    idx = (j-1)*N + N;
    A(idx, idx) = 1;
    b(idx) = 0;
end

% 求解线性方程组
u = A \ b;

% 将解向量重塑为网格形式
u = reshape(u, N, N);

% 绘制 3D 数值解
figure;
surf(X, Y, u);
xlabel('x');
ylabel('y');
zlabel('u(x, y)');
title('Numerical solution of two-dimensional steady-state heat convection equation');
colorbar;