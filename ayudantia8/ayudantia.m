%% Ayudantía 8 INTEGRACIÓN NÚMERICA

%% regla trapezoidal
% grafico_trapezoidal(fun,a,b,N)
%1 trapezoidal(fun, a,b,N)
%
fun_1 = @(x) x.^2;
trapezoidal(fun_1, 0,3, 10);
trap = @(x) trapezoidal(fun_1, 0,3, x);
disc = [trap(10),trap(20),trap(40),trap(80)];

figure1 = figure;
grafico_trapezoidal(fun_1,0,3,500);
title('f(x) = x^2, N = 20')



trap2 = @(x) trapezoidal(@(y) exp(-y.^2), -1,1, x); % x = N intervalos

figure2 = figure;
grafico_trapezoidal(@(y) exp(-y.^2),-1,1,20);
title('f(x) = exp(-x^2), N = 20')



trap3 = @(x) trapezoidal(@(y) log(y) , 1,2, x);

figure3 = figure;
grafico_trapezoidal(@(y) log(y),1,2,10);
title('f(x) = log(x), N = 10')



trap4 = @(x) trapezoidal(@(y) sqrt(y) , 0,1, x);


figure4 = figure;
grafico_trapezoidal(@(y) sqrt(y),0,1,20);
title('f(x) = sqrt(x), N = 20')
%}
%% Regla de Simpson
%
fun1 = @(x) x.^2;
fun2 = @(x) exp(-x.^2);
fun3 = @(x) log(x);
fun4 = @(x) sqrt(x);
N = [10,20,40,80];

a = 0;
b = 3;
F1 = [sim13( fun1,a,b,N(1) ),sim13( fun1,a,b,N(2) ) ...
    sim13( fun1,a,b,N(3) ), sim13( fun1,a,b,N(4) )];

a = -1;
b = 1;
F2 = [sim13( fun2,a,b,N(1) ),sim13( fun2,a,b,N(2) ) ...
    sim13( fun2,a,b,N(3) ), sim13( fun2,a,b,N(4) )];


a = 1;
b = 2;
F3 = [sim13( fun3,a,b,N(1) ),sim13( fun3,a,b,N(2) ) ...
    sim13( fun3,a,b,N(3) ), sim13( fun3,a,b,N(4) )];


a = 0;
b = 1;
F4 = [sim13( fun4,a,b,N(1) ),sim13( fun4,a,b,N(2) ) ...
    sim13( fun4,a,b,N(3) ), sim13( fun4,a,b,N(4) )];


%}

%%  2
% considerando f(x) = exp(-x)
%
valor = integral(@(y) exp(-y.^2),0,1);

trap = @(x) trapezoidal(@(y) exp(-y.^2), 0,1, x);
trapecios = [trap(10),trap(20),trap(30),trap(40)...
             trap(50),trap(60),trap(70),trap(80)...
             trap(90),trap(100)];
error = trapecios - valor;

hold on;
N = 10:10:100;
NN = 1./(N.^2);
loglog(N,error);
loglog(N,NN);
xlabel('log(N)');
legend('log-error','1/N^2')
title('exp(-x^2)')
%% 3

valor = integral(@(y) sqrt(y),0,1);

trap = @(x) trapezoidal(@(y) sqrt(y), 0,1, x);
trapecios = [trap(10),trap(20),trap(30),trap(40)...
             trap(50),trap(60),trap(70),trap(80)...
             trap(90),trap(100)];
error = abs(trapecios - valor);

hold on;
N = 10:10:100;
NN = 1./(N.^2);
loglog(N,error);
loglog(N,NN);
xlabel('log(N)');
legend('log-error','1/N^2')
title('sqrt(x)')


%% ver error y = ch^\alpha -> log(y) = log(c) + alpha*log(h)

orden_conv = fitlm(log(error),log(1./(N))); 
coef = orden_conv.Coefficients.Estimate;

alpha = coef(2);
c = exp(coef(1));

%}



