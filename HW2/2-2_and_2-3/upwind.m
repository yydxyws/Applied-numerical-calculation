
function u1 = upwind(L, T, dx, dt, x_range)
    % 计算网格点数
    Nx = L / dx + 1;
    Nt = T / dt + 1;

    % 初始化网格
    x = linspace(0, L, Nx);
    t = linspace(0, T, Nt);

    % 初始条件
    u1 = zeros(Nx, Nt);
    u1(:, 1) = (x >= x_range(1) & x <= x_range(2));

    % 边界条件
    u1(1, :) = 0;

    % 速度函数 a(x, t)
    a = @(x, t) (1 + x.^2) ./ (1 + 2*x*t + 2*x.^2 + x.^4);

    % 迎风差分法求解
    for n = 1:Nt-1
        for i = 2:Nx
            u1(i, n+1) = u1(i, n) - dt/dx * a(x(i), t(n)) * (u1(i, n) - u1(i-1, n));
        end
    end
end
