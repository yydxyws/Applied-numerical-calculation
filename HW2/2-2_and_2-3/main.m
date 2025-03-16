
% 设置输入参数
L = 1;  
T = 1;  
dx = 0.01;
dt = 0.01;
x_range = [0.2, 0.4];

% 调用求解函数
u1 = upwind(L, T, dx, dt, x_range);

% 绘制结果
figure(1);
x = linspace(0, L, L / dx + 1);
time_points = [0, 0.1, 0.5, 1];  % 要绘制的时间点

for k = 1:length(time_points)
    n = round(time_points(k) / dt) + 1;
    subplot(2, 2, k);
    plot(x, u1(:, n));
    title(['upwind: t = ' num2str(time_points(k))]);
    xlabel('x');
    ylabel('u(x, t)');
end

% 调用求解函数
u1 = LaxWendroff(L, T, dx, dt, x_range);

% 绘制结果
figure(2);
for k = 1:length(time_points)
    n = round(time_points(k) / dt) + 1;
    subplot(2, 2, k);
    plot(x, u1(:, n));
    title(['LaxWendroff: t = ' num2str(time_points(k))]);
    xlabel('x');
    ylabel('u(x, t)');
end