function [ I ] = sim13( f,a,b,n )
%asumiendo que n es par
h=(b-a)/n;
sumpar=0;
sumimpar=0;
for i=2:n
    xi=a+h*(i-1);
    if(mod(i,2)==0)
        sumpar=sumpar+f(xi);
    end
    if(mod(i,2)~=0)
        sumimpar=sumimpar+f(xi);
    end
end
I=(h/3)*(f(a)+f(b)+sumpar*4+sumimpar*2);

