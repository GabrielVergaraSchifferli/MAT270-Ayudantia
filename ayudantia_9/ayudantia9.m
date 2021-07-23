%% 
f = @(x,y) x*y;
df = @(x,y) y;
a = 0;
b = 2;
N = [10, 50,100, 500];
y0 = 1;
x0 = 0;

sol = @(x) exp(x.^2./2);
t = 0:1e-3:2;

[Y1, X1] =  Taylor2(f,df, y0, x0, a,b,N(1));
[Y2, X2] =  Taylor2(f,df, y0, x0, a,b,N(2));
[Y3, X3] =  Taylor2(f,df, y0, x0, a,b,N(3));
[Y4, X4] =  Taylor2(f,df, y0, x0, a,b,N(4));


figura = figure;
hold on;
plot(X1,Y1,'--')
plot(X2,Y2,'--')
plot(X3,Y3,'--')
plot(X4,Y4,'--')
plot(t, sol(t),'LineWidth',2)

legend('10','50','100','500', 'sol')

e1 = Y1 - sol(X1);
e2 = Y2 - sol(X2);
e3 = Y3 - sol(X3);
e4 = Y4 - sol(X4);

E = [norm(e1), norm(e2), norm(e3), norm(e4)];
figura2 = figure;
plot(N,E)
% E = C h^3   ln(E) = ln(C) + 3 ln(h)

%% 
F = @(x,y) (5*x^2 - y)/(exp(x + y));
a = 0;
b = 1;
x0 = 0;
y0 = 1;
[Y1, X1] =  RK2( F,y0,a,b,N(1) );
[Y2, X2] =  RK2( F ,y0,a,b,N(2));
[Y3, X3] =  RK2( F,y0,a,b,N(3) );
[Y4, X4] =  RK2( F,y0,a,b,N(4) );
[Y5, X5] =  RK2( F,y0,a,b,1e6 ); % 'solución'
figura = figure;
hold on;
plot(X1,Y1,'--')
plot(X2,Y2,'--')
plot(X3,Y3,'--')
plot(X4,Y4,'--')
plot(X5,Y5,'LineWidth',2)
legend('10','50','100','500','sol')
