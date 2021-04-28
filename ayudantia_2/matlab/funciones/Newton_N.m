function [raiz, iter, tcpu] = Newton_N(f, Df, x0, tol, maxiter)
iter=0;
corr = 1;
x1 = x0 -  inv(Df(x0))*f(x0);
tic;
while (norm(corr) > tol)&&(iter < maxiter)
    x0 = x1;
    corr =  - inv(Df(x0))*f(x0);
    x1 = x0 + corr;
    iter = iter +1 ;
end
raiz = x1;
tcpu = toc;
end