function [raiz, iter, tcpu] = Newton(f, Df, x0, tol, maxiter)
iter=0;
corr = 1;
x1 = x0 - f(x0)/Df(x0);
tic;
while (abs(corr) > tol)&&(iter < maxiter)
    x0 = x1;
    corr = -f(x0)/Df(x0);
    x1 = x0 + corr;
    iter = iter +1 ;
end
raiz = x1;
tcpu = toc;
end
