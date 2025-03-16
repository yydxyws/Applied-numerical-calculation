% 参数设置
alpha = 1; % 热扩散系数
v_x = 1; % x方向速度
v_y = 1; % y方向速度
Lx = 1; Ly = 1; % 空间域大小
T = 1; % 时间总长
Nx = 100; Ny = 100; Nt = 100; % 网格点数
dx = Lx / (Nx - 1); % x方向空间步长
dy = Ly / (Ny - 1); % y方向空间步长
dt = T / Nt; % 时间步长

% 初始化网格
x = linspace(0, Lx, Nx);
y = linspace(0, Ly, Ny);
t = linspace(0, T, Nt);
[X, Y] = meshgrid(x, y);

% 初始条件
u = sin(pi * X) .* sin(pi * Y);

% 动态图窗口
figure;
h = surf(X, Y, u);
title('t = 0');
xlabel('x');
ylabel('y');
zlabel('u');
zlim([-1, 1]);
colormap('jet');
shading interp;
cb = colorbar; % 添加图例
caxis([-1, 1]); % 初始颜色范围

% 系数矩阵构造
N = Nx * Ny; % 总未知数
A = sparse(N, N); % 稀疏矩阵存储

% 对流项和扩散项系数
cx = v_x * dt / (2 * dx);
cy = v_y * dt / (2 * dy);
dx2 = alpha * dt / dx^2;
dy2 = alpha * dt / dy^2;

% 填充系数矩阵
for i = 2:Nx-1
    for j = 2:Ny-1
        % 当前点索引
        idx = (j-1)*Nx + i;
        
        % 对流项（中心差分）
        A(idx, idx) = 1 + 2*dx2 + 2*dy2;
        A(idx, idx-1) = -cx - dx2; % 左
        A(idx, idx+1) = cx - dx2; % 右
        A(idx, idx-Nx) = -cy - dy2; % 下
        A(idx, idx+Nx) = cy - dy2; % 上
    end
end

% 边界条件（Dirichlet 边界）
for i = 1:Nx
    for j = [1, Ny]
        idx = (j-1)*Nx + i;
        A(idx, idx) = 1;
    end
end
for j = 1:Ny
    for i = [1, Nx]
        idx = (j-1)*Nx + i;
        A(idx, idx) = 1;
    end
end

% 时间步进
for k = 1:Nt
    % 右端项
    b = u(:);
    
    % 求解线性方程组
    u_next = A \ b;
    
    % 更新解
    u = reshape(u_next, Ny, Nx);
    
    % 更新动态图
    set(h, 'ZData', u);
    title(['t = ', num2str(t(k))]);
    
    % 动态更新图例范围
    clim([min(u(:)), max(u(:))]); % 根据当前解的范围调整颜色范围
    drawnow;
    pause(0.05); % 控制动画速度
end