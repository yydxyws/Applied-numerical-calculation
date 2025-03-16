
% 设置输入参数
Lx = 1;   
Ly = 1;   
Nx = 51;  
Ny = 51;  
dt = 0.0001;  
t_steps = [0, 0.005, 0.02, 0.05];  
T_max = max(t_steps);

x1 = 0.14; y1 = 0.14;
x2 = 0.86; y2 = 0.86;
a = 156.25;  
circle_radius = 0.33;
circle_center = [0.5, 0.5];

% 调用 ADI 求解函数
ADI(Lx, Ly, Nx, Ny, dt, t_steps, T_max, x1, y1, x2, y2, a, circle_radius, circle_center);