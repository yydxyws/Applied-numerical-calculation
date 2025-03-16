完成人：Wenshuo Yu


HW2文件构成与函数解释：



-HW2_1    #Problem 1
    -ADI.m     
        #定义数值求解ADI方法的函数function ADI(Lx, Ly, Nx, Ny, dt, t_steps, T_max, x1, y1, x2, y2, a, circle_radius, circle_center)，包括定义变量接口、求解步骤执行、求解结果绘制等
    -main.m   
        #设置参数并调用求解函数function ADI(Lx, Ly, Nx, Ny, dt, t_steps, T_max, x1, y1, x2, y2, a, circle_radius, circle_center)
    -HW2_1_1.fig   #t=0
    -HW2_1_1.jpg
    -HW2_1_2.fig  #t=0.005
    -HW2_1_2.jpg
    -HW2_1_3.fig   #t=0.02
    -HW2_1_3.jpg
    -HW2_1_4.fig   #t=0.05
    -HW2_1_4.jpg

-HW2_2_and_2_3  #Problem 2 and 3
    -main.m
        #设置参数并调用求解函数function ADI(Lx, Ly, Nx, Ny, dt, t_steps, T_max, x1, y1, x2, y2, a, circle_radius, circle_center)
    -upwind.m
        #定义数值求解upwind方法的函数function u1 = upwind(L, T, dx, dt, x_range)，包括定义变量接口、求解步骤执行、求解结果绘制等
    -LaxWendroff.m
        #定义数值求解LaxWendroff方法的函数function u2 = LaxWendroff(L, T, dx, dt, x_range)，包括定义变量接口、求解步骤执行、求解结果绘制等
    -upwind.fig
    -upwind.jpg
    -LaxWendroff.jpg
    -LaxWendroff.fig