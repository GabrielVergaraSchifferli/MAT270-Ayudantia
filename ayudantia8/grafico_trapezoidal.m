function []=grafico_trapezoidal(fun,a,b,N)
[val, X, Y] = trap(fun,a,b,N);
valor = integral(fun,a,b);
error = abs(val - valor);
errp = error/abs(valor)*100;

txt1 = ['Valor Integral: ',num2str(valor)];
txt2 = ['Regla Trapezoidal ',':',num2str(val)];
txt3 = ['Error Porcentual: ',num2str(errp),'%'];
texto = {txt1,txt2,txt3};
hold on;
area(X,Y,'FaceAlpha',0.2)
plot(X,Y,'.','LineWidth',1);
plot(a:1e-3:b,fun(a:1e-3:b),'LineWidth',1);
grid on;
grid minor;
xlabel('x')
ylabel('f(x)')
TextLocation(texto,'Location','best')
end

%%
function [int,X,Y] = trap(fun, a,b,N)
h = (b-a)/N;
x = a + h*(1:N-1);
X = a:h:b;
Y = fun(a:h:b);
int = h*( (fun(a) + fun(b))/2  + sum(fun(x)));
end
function hOut = TextLocation(textString,varargin)

l = legend(textString,varargin{:});
t = annotation('textbox');
t.String = textString;
t.Position = l.Position;
delete(l);
t.LineStyle = 'None';

if nargout
    hOut = t;
end
end