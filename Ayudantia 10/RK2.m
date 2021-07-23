function [ Y,X ] = RK2( f,y0,a,b,N )
h=(b-a)/N;
X = zeros(1, N+1);
Y = zeros(1, N+1);
X(1)=a;
k1=h*f(X(1),y0);
k2=h*f(X(1)+h,y0+k1);
Y(1)=y0+0.5*(k1+k2);
for i=2:N+1
    k1=h*f(X(i-1),Y(i-1));
    k2=h*f(X(i-1)+h,Y(i-1)+k1);
    Y(i)=Y(i-1)+0.5*(k1+k2);
    X(i)=X(i-1)+h;
end
