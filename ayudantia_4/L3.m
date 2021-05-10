%% Laboratorio 3: Sistemas Lineales

clear 
close all ;
clc;

%% 1) 
% función para construír matriz tridiagonal de orden n:
% A = tridiag(a,b,c,n)


%% 2) 
n = 10;
a = 4;
b = 1;
c = 1;

A = trid( n,a,b,c );
det(A)
rank(A)
issymmetric(A) % 1 en caso de ser simetrica, 0 en caso contrario
% Es comun encontrar que para matrices simétricas, producto de
% operaciones "pierden" su simetría, en ese caso si se conoce que A es
% simétrica se puede realizar A = (A + A')/2 para forzar la simetría.

%% 3)
b = normrnd(5,3,n,1);

x = A\b;

[L U P] = lu(A);
y = L\b;
xx = U\y;

P - eye(n);
A - L*U;

%% 4)

r1 = b - A*x;
r2 = b - A*xx;

norm(r1);
norm(r2);


%% 5) 

B = rand(n,n);
b = rand(n,1);
rank(B);


% si rank(B) == n

if rank(B) == n
    x = B\b;
    [L U P] = lu(B);
    xx = U\(L\(P*b));
    P*B - L*U;
end

%% 6) Para solucionar AX = B , con B matriz

% iterar hasta encontrar una matriz no singular
N1 = 1e2;
N2 = 2*N1;
A = rand(N1);
while rank(A)~= N1 
        A = rand(N1);
end

B = rand(N1,N2); 

tic 
X = A\B;
t1 = toc

Y = zeros(size(X)); % asignar espacio de memoria

tic
for i=1:N2
    Y(:,i) = A\B(:,i);
end
t2 = toc

%paralelizando ( iniciar parallel pool antes de ingresar a tic )
tic
parfor i=1:N2
    Y(:,i) = A\B(:,i);
end
toc


% vectorizando el sistema: Vec[A] = A(:); se tiene que Vec[AXB] = (B'
% kronecker A)Vec[X]
% entonces AXB = C => Vec[AXB] = Vec[C] => kron(B',A)Vec[X] = Vec[C]
% considerando C = B, B = id
tic
Vx = (kron(eye(N2),A)\B(:));
vX = reshape(Vx,N1,N2);
t3 = toc

tic
XX = inv(A)*B;
t4 = toc
norm(X - XX)

%% 7)

nn = 100:10:1000;

t1 = zeros(size(nn));
t2 = zeros(size(nn));
c = 1;

for n = nn
    A = rand(n);
    while rank(A)~= n 
        A = rand(n);
    end
    y = ones(n,1);
    tic;
    x = inv(A)*y;
    tx = toc;
    t1(c) = tx;
    tic;
    x = A\y;
    tx = toc;
    t2(c) = tx;
    c = c+1;
end

plot(nn,t1,'*-',nn, t2, 'o-')
legend('inv(A)y','A\y')    
    
%%  Método de Jacobi

% Deben definir A (matriz diagonal dominante) y b del ejercicio 1
% deben ingresar una variable tol=
% deben ingresar el numero maximo de iteraciones maxit=
n = 10;
a = 4;
b = 1;
c = 1;
A = trid( 10,a,b,c );

N=diag(diag(A)); % Jacobi
%N=tril(A); % Gauss-Seidel comentar N de Jacobi
P=N-A;
x=zeros(n,1);
corr=1;
errest=1;
iter=1;
tol = 1e-6;
maxit = 1000;
while errest>tol & iter<maxit
iter=iter+1;
x0=x;
corr0=corr;
x=N\(P*x0+b);
corr=norm(x-x0,inf);
normest=corr/corr0;
if normest>=1
error('norma de la matriz de iteracion > 1')
end
errest=normest/(1-normest)*corr;
end
disp('numero de iteraciones')
iter

%% Método Gauss - Seidel

N=tril(A); % Gauss-Seidel comentar N de Jacobi
P=N-A;
x=zeros(n,1);
corr=1;
errest=1;
iter=1;
tol = 1e-6;
maxit = 1000;
while errest>tol & iter<maxit
iter=iter+1;
x0=x;
corr0=corr;
x=N\(P*x0+b);
corr=norm(x-x0,inf);
normest=corr/corr0;
if normest>=1
error('norma de la matriz de iteracion > 1')
end
errest=normest/(1-normest)*corr;
end
disp('numero de iteraciones')
iter