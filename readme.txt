完成人：尉文硕
学号：202428013826018

1.方程要求：

equation:  u_t = u_xx, 0<t, 0<x<1
x grid points:  Jx, t grid points:  Nt
boundary conditions:  u(0,t) = 0,  u(1,t) = 0
original value:  u(x,0) = u0(x)

2.文件构成：

HW1
-Explicit.m   #显式求解方法
-Implicit.m   #隐式求解方法
-Theta.m   #theta求解方法
-ExplicitFigure2D.fig   #numerical solutions at t = 0.001, t = 0.025, and t = 0.05
-ImplicitFigure2D.fig
-ThetaFigure2D.fig
-ExplicitFigure3D.fig   #figure solutions at 0<t<0.1, 0<x<1
-ImplicitFigure3D.fig
-ThetaFigure3D.fig

3.参数设置

三种方法参数设置均采用∆x = 0.05, ∆t = 0.001
