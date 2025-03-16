
function ADI(Lx, Ly, Nx, Ny, dt, t_steps, T_max, x1, y1, x2, y2, a, circle_radius, circle_center)
    % 创建网格
    dx = Lx / (Nx - 1);
    dy = Ly / (Ny - 1);
    [x, y] = meshgrid(0:dx:Lx, 0:dy:Ly);

    % 初始条件 u(x, y, 0)
    u0 = zeros(Nx, Ny);
    for i = 1:Nx
        for j = 1:Ny
            dist1 = (x(i,j) - x1)^2 + (y(i,j) - y1)^2;
            dist2 = (x(i,j) - x2)^2 + (y(i,j) - y2)^2;
            u0(i,j) = max(0, 1 - a * dist1) + max(0, 1 - a * dist2);
        end
    end

    % 圆形区域边界条件
    is_inside_circle = (x - circle_center(1)).^2 + (y - circle_center(2)).^2 < circle_radius^2;

    % 初始化解和边界条件
    u = u0;
    u_boundary = zeros(Nx, Ny);

    % Peaceman-Rachford ADI 方法求解
    for t = 0:dt:T_max
        % 在 x 方向进行隐式求解
        u_x_step = u;
        for i = 2:Nx-1
            for j = 2:Ny-1
                u_x_step(i,j) = u(i,j) + dt * (u(i+1,j) - 2*u(i,j) + u(i-1,j)) / dx^2;
            end
        end

        % 在 y 方向进行隐式求解
        u_y_step = u_x_step;
        for i = 2:Nx-1
            for j = 2:Ny-1
                u_y_step(i,j) = u_x_step(i,j) + dt * (u_x_step(i,j+1) - 2*u_x_step(i,j) + u_x_step(i,j-1)) / dy^2;
            end
        end

        % 设置边界条件
        u_y_step(1, :) = u_boundary(1, :);
        u_y_step(Nx, :) = u_boundary(Nx, :);
        u_y_step(:, 1) = u_boundary(:, 1);
        u_y_step(:, Ny) = u_boundary(:, Ny);

        % 应用圆形区域的边界条件
        for i = 1:Nx
            for j = 1:Ny
                if is_inside_circle(i,j)
                    if x(i,j) + y(i,j) >= 1
                        u_y_step(i,j) = 0;  % Dirichlet 条件
                    end
                end
            end
        end

        % 更新解
        u = u_y_step;

        % 绘制指定时间点的解
        if ismember(t, t_steps)
            figure;
            surf(x, y, u);
            title(['Solution at t = ', num2str(t)]);
            xlabel('x');
            ylabel('y');
            zlabel('u(x,y,t)');
            colorbar;
            view(3);
        end
    end
end
