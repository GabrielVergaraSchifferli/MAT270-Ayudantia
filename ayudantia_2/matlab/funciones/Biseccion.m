function [raiz, iter, tcpu] = Biseccion(f,a,b,tol)
c = (a+b)/2;
iter = 0;
tic; % tic toc para medir tiempo
while (abs(f(c)) > tol)
    if (f(a)*f(c) <0) % sol esta en [a,c]
        b=c;
    end
    if (f(b)*f(c) < 0) % sol esta en [c,b]
        a=c;
    end
    c=(a+b)/2;
    iter = iter + 1;
end
raiz = c; % solución
tcpu = toc;
end