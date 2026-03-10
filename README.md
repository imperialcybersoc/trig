# trig

Let $\mathrm{a} = 0.021615425644724543...$, $f = \mathrm{bytes\\_to\\_long(\texttt{flag})}$

$$
\begin{aligned}
a
&= \sin{f} + \sin{2f} \\
&= \sin{f} + 2\sin{f}\cos{f} \\
&= \sin{f} + 2\sin{f}\sqrt{1-\sin^2{f}} \\
&\implies a - \sin{f} = 2\sin{f}\sqrt{1 - \sin^2{f}} \\
&\implies a^2-2a\sin{f}+\sin^2{f}=4\sin^2{f}(1-\sin^2{f}) \\
&\implies 4\sin^4{f} - 3\sin^2 - 2a\sin{f} + a^2 = 0
\end{aligned}
$$

Solve for $s = \sin{f}$ using numerical methods and also find $\theta = \arcsin{s}$

Since $\sin{f} = \sin{\pi - f}$, we check both cases

$f \approx 2k\pi + \theta$, approximate due to floating point errors

Let $S = 2^{2048}$, then $2k\pi S + \theta S$, then $k(2\pi S) - fS + \theta S \approx 0$

$$
v = k \begin{bmatrix} 2\pi S \\ 0 \\ 0 \end{bmatrix} + f \begin{bmatrix} -S \\ 1 \\ 0 \end{bmatrix} + \begin{bmatrix} \theta S \\ 0 \\ 1 \end{bmatrix} = \begin{bmatrix} (k(2\pi S) - fS + \theta S \\ f \\ 1 \end{bmatrix} \approx \begin{bmatrix} 0 \\ f \\ 1 \end{bmatrix}
$$

$$
L = \begin{bmatrix} 
2\pi S & 0 & 0 \\ 
-S & 1 & 0 \\ 
\theta S & 0 & 1 
\end{bmatrix}
$$

$\vec{v}$ is a small vector in the lattice $L$, so use $\texttt{LLL}$ to find it

We scale by $S$ to make $\vec{v}$ short relative to the basis vectors
