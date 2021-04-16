function [x1, x2] = ejemplo(a,b,c)
%% Argumentos:
% para ecuación cuadrática ax^2 + bx + c = 0;
% resuelve raíces
%Input:
%       a: coeficiente de x^2
%       b: coefciente de x
%       c: constante
%Output:
%       x1: raiz +
%       x2: raiz -
D = discriminante(a,b,c);
if D >=0  % si discriminante es positivo
x1 = (-b  +sqrt(D))/(2*a) ;
x2 =(-b  -sqrt(D))/(2*a) ;
else
    x1 = [];
    x2 = [];

end
end
%% se puede definir función interna para llamar dentro de función global
function [delta] = discriminante(a,b,c)
delta = b^2 -4*a*c;
end