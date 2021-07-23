function [Y,X] = Euler(fun, y0, x0, a,b,N)
%fun = @(x,y) 3 + x - y
h = (b-a)/N;
X = zeros(1,N+1);
Y = zeros(1,N+1);
X(1) = x0;
Y(1) = y0;
for i=2:N+1
    Y(i) = Y(i-1) + h*fun(X(i-1),Y(i-1));
    X(i) = X(i-1) + h;
end
end