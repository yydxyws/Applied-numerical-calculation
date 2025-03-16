% 创建 PDE 模型
model = createpde();

% 定义几何形状（单位正方形）
R1 = [3,4,0,1,1,0,0,0,1,1]';
g = geometryFromEdges(model,decsg(R1));

% 指定 PDE 系数
vx = 1; % x方向速度
vy = 1; % y方向速度
alpha = 1; % 热扩散系数
c = -alpha; % 扩散项系数
a = 0; % 对流项系数
f = @(location,state) sin(pi*location.x) .* sin(pi*location.y); % 源项

specifyCoefficients(model,'m',0,'d',0,'c',c,'a',a,'f',f);

% 应用边界条件
applyBoundaryCondition(model,'dirichlet','Edge',1:4,'u',0);

% 生成网格
generateMesh(model,'Hmax',0.05);

% 求解 PDE
result = solvepde(model);

% 绘制 3D 数值解
u = result.NodalSolution;
pdeplot(model,'XYData',u,'ZData',u);
title('2D Steady-State Heat Convection with Source Term');
xlabel('x');
ylabel('y');
zlabel('u');