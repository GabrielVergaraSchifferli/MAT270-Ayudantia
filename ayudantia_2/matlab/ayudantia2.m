addpath('funciones')
%% Problema 1: Bisección

a = 1e-6;
b = 6;
tol = 1e-8;
f1 = @(x) (exp(-x)*(x^2 + x + 1) -1)/x^2;

[raiz, iter, tcpu] = Biseccion(f1, a,b,tol);


%% Problema 2: Punto fijo
%mismas funciones f y g pero definidas simbolicamente:
% para f
max_it = 1e6;
x0 = 0; % initial guess
f=@(x) 1/sqrt(x^2+2);
g= @(x) log(1/(x^2+2));
[raiz_f, iter_f, tcpu_f] = PuntoFijo(f,x0,tol, max_it);
[raiz_g, iter_g, tcpu_g] = PuntoFijo(g,x0,tol, max_it);
% comaprando con bisección
f_b = @(x) f(x)-x;
[r_b, iter_b, tcpu_b] = Biseccion(f_b, 0,1,tol);


%% Problema 3: Newton R
syms x; % para definir funciones simbólicas se debe definir una variable simbólica
% en este caso definimos x como simbolica.
R1 = symfun(x^5  -12  + tan(x),x); % entrega valor simbolico ( no numérico )
% para obtener el valor numérico utilizar vpa(R1(x))
% parametrizamos la función
R1_p  = @(y) vpa(R1(y));
dR1 = diff(R1,x);
dR1_p = @(y) vpa(dR1(y));
% calculamos las derivadas simbolicas

R2 = symfun(x^5 +5*x + 8,x);
dR2 = diff(R2,x);
R2_p = @(y) vpa(R2(y));
dR2_p = @(y) vpa(dR2(y));


tol = 1e-8;
max_it = 1e6;
x0 = 0;
%[r1, iter_r1, tcpu_r1] = Newton(R1, dR1, x0, tol, max_it);

[r_1, iter_r1, tcpu_r1] = Newton(R1_p, dR1_p, x0, tol, max_it);
% también se puede entregar como parametrización directa
Newton(@(y)vpa(R1(y)), @(y)vpa(dR1(y)), x0, tol, max_it);

% o resolviendo con las derivadas explícitas
x0= -2;
r2 = @(x) x^5 +5*x + 8;
dr2 = @(x) 5*x^4 + 5;
[r_2s, iter_r2s, tcpu_r2s] = Newton(R2_p, dR2_p, x0, tol, max_it);
[r_2a, iter_r2a, tcpu_r2a] = Newton(r2, dr2, x0, tol, max_it);
% comparando con bisección
[r_bs, iter_bs, tcpu_bs] = Biseccion(R2, -2,8,tol); % función simbolica
[r_ba, iter_ba, tcpu_ba] = Biseccion(r2, -2,8,tol); % función anónima
% las funciónes simbólicas son lentas de evaluar
%% Problema 4: Newton R^n
syms x y
% también se pueden definir de la siguiente manera
F =[-exp(x^2)+8*x*sin(y),x+y-1];
DF = jacobian(F, [x y]);

x0 = [0.2 0.8];
tol = 1e-6;
max_it = 1e6;
% podemos calcular la derivada numéricamente:
F = @(x) [-exp(x(1)^2)+8*x(1)^2*sin(x(2)) ; x(1)+x(2)-1];
dt = 1e-6;
DF = @(x) [(F(x) - F(x + [dt 0]))./dt, (F(x) - F(x + [0 dt]))./dt];


Newton_N(F, DF, x0, tol, max_it)
[sol5,it5,t5]=Newton_N(F,DF,x0,max_it,tol);
sol5=eval(sol5);
%% Problema 5:  Aplicación en Bono
