
function u2 = LaxWendroff(L, T, dx, dt, x_range)
    % 计算网格点数
    Nx = L / dx + 1;
    Nt = T / dt + 1;

    % 初始化网格
    x = linspace(0, L, Nx);
    t = linspace(0, T, Nt);

    % 初始条件
    u2 = zeros(Nx, Nt);
    u2(:, 1) = (x >= x_range(1) & x <= x_range(2));

    % 边界条件
    u2(1, :) = 0;

    % 速度函数 a(x, t)
    a = @(x, t) (1 + x.^2) ./ (1 + 2*x*t + 2*x.^2 + x.^4);

    % Lax-Wendroff方法求解
    for n = 1:Nt-1
        for i = 2:Nx-1
            a_i = a(x(i), t(n));
            u2(i, n+1) = u2(i, n) - dt/(2*dx) * a_i * (u2(i+1, n) - u2(i-1, n)) ...
                    + (dt^2)/(2*(dx^2)) * a_i^2 * (u2(i+1, n) - 2*u2(i, n) + u2(i-1, n));
        end
        u2(end, n+1) = u2(end-1, n+1);
    end
end
