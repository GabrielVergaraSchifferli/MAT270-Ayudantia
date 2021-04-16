%% Comandos de consola
% clc : limpiar consola
% clear : limpia todas las variables del Workspace
% clear varibale :  limpira la variable "variable"

%% Formato de núemros
% formato de presentación de números 
format short
format long 
format short e
format long e
format short g
format long g

%% Asignación de variables y aritmética general

a = 1;
b = 2;
c = a^2 + b^2;
d = (a*b)^2;
e = a*b^2; % resolución de operaciónes usual
valor_pi = pi; % pi valor de constante global
%% funciones usuales
abs(-pi);
cos(pi/2);
sin(pi^2);
sqrt(pi^2);
exp(-0.1);
log(exp(1));

%% Vectores y matrices

vector_columna = [1 ; 2 ; 3 ; 4];
vector_fila = [1 , 2 , 3 , 4]; % separación con coma o espacio es equivalente
numeros = 1:10; % vector [1,2,3,4,...,10]
numeros2 = 1:0.5:5; % vector desde 1 hasta 5 con aumento de 0.5 = [1, 1,5 , 2 ,....,4.5,5] pu
numeros3 = 3:-0.4:1;

% transposición
vector_columna'; % operador ' es transposición
transpose(vector_columna); % otra forma de transponer
% operador ': es transpueto conjugado , .' es transpuesto en caso real son
% equivalentes.


A = [4,8,9; 2,0,-1;4,1,3]; 
A(1,2); % llamar coordenada (1,2) de matriz
A(:);  % vectorización de A = Vec[A] transforma la matriz a un vector acopando las columnas
A(:,1); % : llama todas las componentes -> (:,1) todas las filas de la columna 1
A(2,:); % : llama todas las componentes -> (2,:) todas las columnas de la fila 2
A(1:2,1); % otra forma de llamar entradas de matriz
A([1,3],:); % otra forma de llamar entradas de matriz

%transposición
A' ; % transpuesta conjgada
A.'; % transpuesta
transpose(A); % transpuesta


% determinante de una matriz
det(A);
% inversa de matriz
inv(A);

% para sistemas Ax = b, se puede solucionar utilizando x = A\b
b = [1;2;3];
x = A\b; % == inv(A)*b

%% Funciones para generación de matrices 
rows = 4;
cols = 5;
matriz_nula = zeros(rows,cols); % zeros crea matriz de ceros
matriz_unos = ones(rows,cols); % ones crea matriz de unos
D = diag([1,2,3,4,5]); % crea matriz diagonal con diagonal vector de entrada
d = diag(D); % si entrada de diag() es matriz retorna diagonal de matriz

blk = blkdiag(d,matriz_unos); % blkdiag() crea matriz diagonal por bloques



triu(blk); % triu(): triangular upper retorna triangular superior
tril(blk); % tril(): triangular lower retorna triangular inferior

%% tamaño de elementos

[fila, columna] = size(blk); % retorna 2 valores: tamaño de fila y columnas
size(blk,1); % retorna tamaño fila
size(blk,2); % retorna tamaño columna
length(1:10); % length() retorna tamaño 
numel(blk); % numel: retorna numero de elementos

%% descomposiciones matriciales

M = normrnd(7,1,6); % normrnd(mu, sigma, n) randomizado de normal con media mu y desviación estándar sigma tamaño n
S = cov(M); % matriz de covarianza
% help normrnd para mas info

help eig
[V,D,W] = eig(S); % retorna descomposición en valores propios de S
eigenvauels = eig(S); % retorna valores propios de S

help LU
[L, U , P] = lu(S); % descomposición LU

help QR
[Q, R , P] = qr(S); % descomposición QR

help chol
P = chol(S); % descomposción cholesky

help svd
[U S V] = svd(S);  % descomposición en valores singulares



%% funciones lógicas
c = 0;

for i = 1:10 % itera i en vector 1:10
    c = c+ i;
end
clear i % limpiamos variable i : queda guardada con el último valor establecido

% comparaciones: 
% == : igualdad
% <,> , >= , <= : desigualdad
% & : operador lógico "y"
% | : operador lógico "o"
% xor : operadro lógico "o" expluyente
valor_logico = (4 == 3) ; 
valor_logico2 = (4 == 3) &(4 > 3)  ; 
valor_logico3 = (4 <= 3) |(4 > 3)  ; 



%% gráficos
x = 0:0.01:10;
y1 = cos(x);
y2 = sin(x);

% grafico de x, y1
figura1 = figure;
plot(x,y1);

figura2 = figure;
plot(x,y1);
title('título ejemplo símbolo \lambda \Omega')
ylabel('eje y')
xlabel('eje x')
legend('f = cos(x)')
grid on
grid minor
ylim([-2,3])
xlim([-1,11])



% graficar más de una función
figura2 = figure;
hold on
plot(x,y1,'--','LineWidth',1);
plot(x,y2,'-.r','LineWidth',2);
title('sin and cos')
ylabel('eje y')
xlabel('eje x')
grid on
grid minor
legend('f = cos(x)','f = sin(x)')


% subgráficos
figura3 = figure;
subplot(2,1,1)
plot(x,y1);
legend('f = cos(x)')
grid on
grid minor
title('coseno')
subplot(2,1,2)
plot(x,y2,'green');
title('seno')
grid on
legend('f = sin(x)')
grid minor


%% Gráficas en 3D
x = 0:0.01:1;
y = 0:0.01:1;
z = zeros(numel(x),length(y));
for i=1:size(x,2)
    for j =1:numel(y)
        z(i,j) = sin(2*pi*x(1,i)) + sin(2*pi*y(1,j));
    end
end
figura3d = figure;
surf(x,y,z);
title('grafica 3d');
xlabel('eje x');
ylabel('eje y');
zlabel('eje z');
colorbar;
% gráfico de isolinea



figura_contronos = figure;
contourf(x,y,z);
title('figura isolíneas')


%% funciones anónimas

% sintaxis: f = @(x)

f1 = @(x) x^2;
f2 = @(x,y) x*y;
f1(3);
f2(2,4);

% de esta manera las funciones solo aceptan argumentos unidimensionales
% para que se apliquen para entradas de vectores o arreglos se debe cambiar
% las operaciones internas para que sean componente a componente.

f11 = @(x) x.^2;
f22 = @(x,y) x.*y;

f11([1;2;3;4])
f11([1,2,3,4])

f22([1;2;3;4],[1,2])
f22([1,2,3,4],[1;2])


% se pueden parametrizar funciones de esta forma
variable = 3;
f_param = @(x) f22(x,variable);
f_param(3)

%% funciones definidas en scripts
% al llamarla requiere estar en la misma dirección del script en ejecución
% si no están en la misma dirección se debe añadir.

% función para resolver ecuación cuadrática: retorna raíces 
[a,b] = ejemplo(5,1,-1);
