% 定义问题的参数
alpha = 1; % 热扩散系数
v_x = 1; % x方向速度
v_y = 1; % y方向速度

% 定义空间和时间网格
x = linspace(0, 1, 100);
y = linspace(0, 1, 100);
t = linspace(0, 1, 100); % 时间步长更多，动画更平滑

% 创建 PDE 模型
model = createpde();

% 定义几何形状
geometryFromEdges(model, @squareg);

% 定义 PDE 系数
specifyCoefficients(model, 'm', 0, 'd', 1, 'c', alpha, 'a', 0, 'f', 0);

% 定义初始条件
u0 = @(location) sin(pi*location.x) .* sin(pi*location.y);
setInitialConditions(model, u0);

% 定义边界条件
applyBoundaryCondition(model, 'dirichlet', 'edge', 1:4, 'u', 0);

% 定义源项
f = @(location, state) sin(pi*location.x) .* sin(pi*location.y) .* exp(-state.time);
specifyCoefficients(model, 'm', 0, 'd', 1, 'c', alpha, 'a', 0, 'f', f);

% 生成网格
generateMesh(model, 'Hmax', 0.05);

% 求解 PDE
result = solvepde(model, t);

% 提取解
u = result.NodalSolution;

% 创建动态图
figure;
for i = 1:length(t)
    % 绘制当前时间步的解
    pdeplot(model, 'XYData', u(:, i), 'ZData', u(:, i), 'ColorMap', 'jet');
    title(['t = ', num2str(t(i))]);
    axis([0 1 0 1 -1 1]); % 设置坐标轴范围
    drawnow; % 立即更新图形
    pause(0.05); % 控制动画速度
end