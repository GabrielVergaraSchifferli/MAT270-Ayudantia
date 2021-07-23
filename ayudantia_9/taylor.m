function [ Y,X ] = taylor( f,fp,a,b,N,y0 )
X = zeros(1, N+1);
Y = zeros(1, N+1);
X(1)=a;
h=(b-a)/N;
Y(1)=y0+f(X(1),y0)*h+(h^2)*fp(X(1),y0)/2;
for i=2:N+1
    Y(i)=Y(i-1)+f(X(i-1),Y(i-1))*h+(h^2)*fp(X(i-1),Y(i-1))/2;
    X(i)=X(i-1)+h;
end
