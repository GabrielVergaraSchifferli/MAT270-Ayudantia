%% rsolución trapecios y simpson
h = 0.55;
x = -4:h:1.5;
f = @(x)1/sqrt(2*pi)*exp(-0.5*x.^2);
trapecio = h/2*(f(x(1) + 2*sum(f(x(2:end-1))) + f(x(end))));
simpson = h/3*(    f(x(1)) + 4*sum(f(x(2:2:end-1))) + 2*sum(f(x(3:2:end-2))) + f(x(end)));
valor = integral(f,-inf,1.5);

%% resolución edo
v0 = 20;
R = 250*10^3;
C = 4*10^(-4);
V = @(x) v0*exp(-x/(R*C));


%Euler(fun, y0, x0, a,b,N)
F = @(t,v) -v/(R*C);
t = 0:1e-3:3;
[y2,x2] = Euler(F, v0, 0, 0,1000,1e4);
y1 = V(x2);

figure1 = figure;
hold on
plot(x2,y1,'LineWidth',2)
plot(x2,y2,'LineWidth',2)
grid on
grid minor
legend('real','Euler')


r = @(t) R*(50*( (1- exp(-t/10) - (t/10)*exp(-t/10))/(t + 1e-6/10)) + 1);
F2 = @(t,v) -v/(r(t)*C);

h = 1e2;
[y2,x2] = Euler(F, v0, 0, 0,1000,h);
y1 = V(x2);
[y3,x3] = Euler(F2, v0, 0, 0,1000,h);
[y4,x4] = RK2( F2,v0,0,1000,h);
figure1 = figure;
hold on
plot(x2,y1,'LineWidth',2)
plot(x2,y2,'LineWidth',2)
plot(x2,y3,'LineWidth',2)
plot(x2,y4,'LineWidth',2)
grid on
grid minor
legend('real','Euler','resitencia variable- E', 'RK2')




