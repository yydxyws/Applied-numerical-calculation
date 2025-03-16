



\paragraph{热对流方程}描述了流体中热量或物质的输运过程，结合了对流和扩散效应。其一般形式为：

\[
\frac{\partial u}{\partial t} + \mathbf{v} \cdot \nabla u = \alpha \nabla^2 u + f
\]

其中：
\( u(\mathbf{x}, t) \) 是标量场（如温度或浓度），
\( \mathbf{v}(\mathbf{x}, t) \) 是流速场，
\( \alpha \) 是扩散系数，
\( f(\mathbf{x}, t) \) 是源项。

定义域：
\[
[0,1]\times[0,1]
\]

边界条件：
\[
u(0, y, t) = u(1, y, t) = u(x, 0, t) = u(x, 1, t) = 0
\]

初始条件：
\[
u(x, y, 0) = f(x, y)
\]

\paragraph{1.无源项、无对流的二维热传导方程(二维热传导方程)}

\[
\frac{\partial u}{\partial t} = \alpha \left( \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} \right)
\]

解析解：
\[
u(x, y, t) = \sum_{n=1}^{\infty} \sum_{m=1}^{\infty} A_{nm} \sin(n \pi x) \sin(m \pi y) e^{-\alpha (n^2 + m^2) \pi^2 t}
\]
\[
A_{nm} = 4 \int_0^1 \int_0^1 f(x, y) \sin(n \pi x) \sin(m \pi y) \, dx \, dy
\]

\paragraph{Example：}

假设初始条件为：
\[
f(x, y) = \sin(\pi x) \sin(\pi y)
\]
则系数 \( A_{nm} \) 为：
\[
A_{11} = 4 \int_0^1 \int_0^1 \sin(\pi x) \sin(\pi y) \sin(\pi x) \sin(\pi y) \, dx \, dy = 1
\]
其余 \( A_{nm} = 0 \)。因此，解析解为：
\[
u(x, y, t) = \sin(\pi x) \sin(\pi y) e^{-2 \alpha \pi^2 t}
\]


\paragraph{2.无源项、有对流的二维热对流方程：}
\[
\frac{\partial u}{\partial t} + v_x \frac{\partial u}{\partial x} + v_y \frac{\partial u}{\partial y} = \alpha \left( \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} \right)
\]

解析解:
\[
u(x, y, t) = \sum_{n=1}^\infty \sum_{m=1}^\infty A_{nm} \sin(n \pi x) \sin(m \pi y) e^{-\left( \alpha (n^2 \pi^2 + m^2 \pi^2) + i (v_x n \pi + v_y m \pi) \right) t}
\]
\[
  A_{nm} = 4 \int_0^1 \int_0^1 f(x, y) \sin(n \pi x) \sin(m \pi y) \, dx \, dy
  \]

\paragraph{Example：}

假设初始条件为：
\[
f(x, y) = \sin(\pi x) \sin(\pi y)
\]

则傅里叶系数为：
\[
A_{11} = 4 \int_0^1 \int_0^1 \sin(\pi x) \sin(\pi y) \cdot \sin(\pi x) \sin(\pi y) \, dx \, dy = 1
\]
其余系数 \( A_{nm} = 0 \)（因为初始条件只包含一个模态）。

解析解为：
\[
u(x, y, t) = \sin(\pi x) \sin(\pi y) e^{-\left( \alpha (\pi^2 + \pi^2) + i (v_x \pi + v_y \pi) \right) t}
\]






\paragraph{3. 有源项的二维稳态热对流方程：}
\[
v_x \frac{\partial u}{\partial x} + v_y \frac{\partial u}{\partial y} = \alpha \left( \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} \right) + f(x, y)
\]



将解 \( u(x, y) \) 和源项 \( f(x, y) \) 展开为双重傅里叶正弦级数：
\[
u(x, y) = \sum_{n=1}^\infty \sum_{m=1}^\infty A_{nm} \sin(n \pi x) \sin(m \pi y)
\]
\[
f(x, y) = \sum_{n=1}^\infty \sum_{m=1}^\infty B_{nm} \sin(n \pi x) \sin(m \pi y)
\]

\[
B_{nm} = 4 \int_0^1 \int_0^1 f(x, y) \sin(n \pi x) \sin(m \pi y) \, dx \, dy
\]

将傅里叶级数代入原方程，利用正交性得到：
\[
v_x \left( \sum_{n=1}^\infty \sum_{m=1}^\infty A_{nm} n \pi \cos(n \pi x) \sin(m \pi y) \right) + v_y \left( \sum_{n=1}^\infty \sum_{m=1}^\infty A_{nm} m \pi \sin(n \pi x) \cos(m \pi y) \right)
\]
\[
= \alpha \left( \sum_{n=1}^\infty \sum_{m=1}^\infty A_{nm} (n^2 \pi^2 + m^2 \pi^2) \sin(n \pi x) \sin(m \pi y) \right) + \sum_{n=1}^\infty \sum_{m=1}^\infty B_{nm} \sin(n \pi x) \sin(m \pi y)
\]

通过正交性，可以得到系数 \( A_{nm} \) 的方程：
\[
i (v_x n \pi + v_y m \pi) A_{nm} + \alpha (n^2 \pi^2 + m^2 \pi^2) A_{nm} = B_{nm}
\]

求解系数 \( A_{nm} \)，解上述方程得到：
\[
A_{nm} = \frac{B_{nm}}{\alpha (n^2 \pi^2 + m^2 \pi^2) + i (v_x n \pi + v_y m \pi)}
\]

最终解析解为：
\[
u(x, y) = \sum_{n=1}^\infty \sum_{m=1}^\infty \frac{B_{nm}}{\alpha (n^2 \pi^2 + m^2 \pi^2) + i (v_x n \pi + v_y m \pi)} \sin(n \pi x) \sin(m \pi y)
\]

\paragraph{Example：}
假设源项为：
\[
f(x, y) = \sin(\pi x) \sin(\pi y)
\]

则傅里叶系数为：
\[
B_{11} = 4 \int_0^1 \int_0^1 \sin(\pi x) \sin(\pi y) \cdot \sin(\pi x) \sin(\pi y) \, dx \, dy = 1
\]
其余系数 \( B_{nm} = 0 \)。

解析解为：
\[
u(x, y) = \frac{1}{\alpha ( \pi^2 + \pi^2 ) + i (v_x \pi + v_y \pi)} \sin(\pi x) \sin(\pi y)
\]

\paragraph{4.有源项的二维非稳态热对流方程}
\[
\frac{\partial u}{\partial t} + v_x \frac{\partial u}{\partial x} + v_y \frac{\partial u}{\partial y} = \alpha \left( \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} \right) + f(x, y, t)
\]

解析解：

将解 \( u(x, y, t) \) 和源项 \( f(x, y, t) \) 展开为双重傅里叶正弦级数：
\[
u(x, y, t) = \sum_{n=1}^\infty \sum_{m=1}^\infty T_{nm}(t) \sin(n \pi x) \sin(m \pi y)
\]
\[
f(x, y, t) = \sum_{n=1}^\infty \sum_{m=1}^\infty F_{nm}(t) \sin(n \pi x) \sin(m \pi y)
\]

其中傅里叶系数 \( F_{nm}(t) \) 由源项决定：
\[
F_{nm}(t) = 4 \int_0^1 \int_0^1 f(x, y, t) \sin(n \pi x) \sin(m \pi y) \, dx \, dy
\]

将傅里叶级数代入原方程，利用正交性得到关于 \( T_{nm}(t) \) 的常微分方程：
\[
\frac{d T_{nm}(t)}{d t} + \left( \alpha (n^2 \pi^2 + m^2 \pi^2) + i (v_x n \pi + v_y m \pi) \right) T_{nm}(t) = F_{nm}(t)
\]

上述方程是一阶线性常微分方程，其解为：
\[
T_{nm}(t) = e^{-\left( \alpha (n^2 \pi^2 + m^2 \pi^2) + i (v_x n \pi + v_y m \pi) \right) t} \left( \int_0^t F_{nm}(\tau) e^{\left( \alpha (n^2 \pi^2 + m^2 \pi^2) + i (v_x n \pi + v_y m \pi) \right) \tau} \, d\tau + C_{nm} \right)
\]

初始条件 \( u(x, y, 0) = g(x, y) \) 的傅里叶级数展开为：
\[
g(x, y) = \sum_{n=1}^\infty \sum_{m=1}^\infty G_{nm} \sin(n \pi x) \sin(m \pi y)
\]
其中：
\[
G_{nm} = 4 \int_0^1 \int_0^1 g(x, y) \sin(n \pi x) \sin(m \pi y) \, dx \, dy
\]

因此，积分常数 \( C_{nm} \) 为：
\[
C_{nm} = G_{nm}
\]

最终解析解为：$$u(x, y, t) = \sum_{n=1,m=1}^\infty$$
\[
 \!\! \left[ e^{-\left( \alpha (n^2 \pi^2 + m^2 \pi^2) + i (v_x n \pi + v_y m \pi) \right) t} \!\left(\!\! \int_0^t F_{nm}(\tau) e^{\left( \alpha (n^2 \pi^2 + m^2 \pi^2) + i (v_x n \pi + v_y m \pi) \right) \tau} \, d\tau + G_{nm}\!\! \right)\!\! \right]\!\! \sin(n \pi x) \sin(m \pi y)
\]



\paragraph{Example:}
假设源项为：
\[
f(x, y, t) = \sin(\pi x) \sin(\pi y) e^{-t}
\]

初始条件为：
\[
g(x, y) = \sin(\pi x) \sin(\pi y)
\]

则傅里叶系数为：
\[
F_{11}(t) = e^{-t}, \quad G_{11} = 1
\]
其余系数 \( F_{nm}(t) = 0 \) 和 \( G_{nm} = 0 \)。

解析解为：
\[
u(x, y, t) = e^{-\left( \alpha (\pi^2 + \pi^2) + i (v_x \pi + v_y \pi) \right) t} \left( \int_0^t e^{-\tau} e^{\left( \alpha (\pi^2 + \pi^2) + i (v_x \pi + v_y \pi) \right) \tau} \, d\tau + 1 \right) \sin(\pi x) \sin(\pi y)
\]






