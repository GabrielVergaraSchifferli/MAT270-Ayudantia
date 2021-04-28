function [raiz, iter, tcpu] = PuntoFijo(f,x0,tol,maxiter)
iter = 0;
% x_{n+1} = f(x_n)
x1 = f(x0); % x1 = x_n+1 y  x_0 = x_n
tic;
while (abs(x1 - x0) > tol)&&(iter < maxiter)
    x0 = x1;
    x1 = f(x0);
    iter = iter +1;
end
raiz = x1;
tcpu = toc;
end
