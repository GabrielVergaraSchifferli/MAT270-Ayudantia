function int = trapezoidal(fun, a,b,N)
h = (b-a)/N;
x = a + h*(1:N-1);
% x1 , x2 , x3 : xn = x1 + h*(n-1)
int = h*( (fun(a) + fun(b))/2  + sum(fun(x)));
end