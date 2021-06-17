%% 1 interpolación polinómica ayudantía 6

%%  (x , sin(x)) x = 0:1:10
x0 = -1:0.01:11;
y0 = sin(x0);
x = 0:1:10;
p5 = polyfit(x, sin(x),5);
p10 = polyfit(x, sin(x), 10);


figure = figure;
hold on
plot(x0,y0, '--','LineWidth', 1) % la función sin(x)
plot(x,sin(x),'x','MarkerSize',15) % los puntos
plot(x0,polyval(p5,x0),'LineWidth',1) % plinomio grado5
plot(x0,polyval(p10,x0),'LineWidth',1) % grado 10
grid on
grid minor
legend('Sin(x)','Dots','p5','p10')

%% f(x) = 1/(1+ x^2), -5:5
x1 = -5:5;
f1 = 1./(1+ x1.^2);
f = @(x) 1./(1+x.^2);
f6 = polyfit(x1,f1,6);
f10 = polyfit(x1,f1,10);

figure2 = figure;
hold on
plot(-5.1:0.01:5.1,f(-5.1:0.01:5.1), '--','LineWidth', 1)
plot(x1,f1,'x','MarkerSize',15)
plot(-5.1:0.01:5.1,polyval(f6,-5.1:0.01:5.1),'LineWidth',1)
plot(-5.1:0.01:5.1,polyval(f10,-5.1:0.01:5.1),'LineWidth',1)
grid on
grid minor
legend('f(x) = 1/(1+x^2)','Dots','p6','p10')

%% Spline

S=spline(x1,f1,-5.1:0.01:5.1);



figure3 = figure;
hold on
plot(-5.1:0.01:5.1,f(-5.1:0.01:5.1), '--','LineWidth', 1)
plot(-5.1:0.01:5.1, S, 'LineWidth',1)
plot(x1,f1,'xb','MarkerSize',15)
grid on
grid minor
legend('f(x) = 1/(1+x^2)','Dots','Spline')





%% pieza 


A = matfile('pieza.mat'); %asigna el structure del archivo a una matriz 
figure4 = figure;
plot(A.x1,A.y1,'-k',A.x2,A.y2,'-k',A.x3,A.y3,'-k') %grafico de DATOS


s1=spline(A.x1,A.y1); %spline de cada curva
s2=spline(A.x2,A.y2);
s3=spline(A.x3,A.y3);


abcd1=s1.coefs; %guarda matriz de coeficientes del spline
abcd2=s2.coefs; 
abcd3=s3.coefs;


xx1=A.x1'; %obtiene los vectores de datos y los ordena en columnas
xx2=A.x2';
xx3=A.x3';

% spline: S_i(x) =a_i*(x - x_i)^3 + b_i*(x - x_i)^2 + c_i*(x - x_i) + d_i
hold on;
for i=1:length(xx1)-1 %obtencion funcion por tramos 1
    xs(i,:)=xx1(i):0.001:xx1(i+1);
    q1(i,:)=abcd1(i,1)*(xs(i,:)-xx1(i)).^3+abcd1(i,2)*(xs(i,:)-xx1(i)).^2+abcd1(i,3)*(xs(i,:)-xx1(i))+abcd1(i,4);
    plot(xs(i,:),q1(i,:),'LineWidth', 2)
end
for i=1:length(xx2)-1 %obtencion funcion por tramos 2
    xs2(i,:)=xx2(i):0.001:xx2(i+1);
    q2(i,:)=abcd2(i,1)*(xs2(i,:)-xx2(i)).^3+abcd2(i,2)*(xs2(i,:)-xx2(i)).^2+abcd2(i,3)*(xs2(i,:)-xx2(i))+abcd2(i,4);
    plot(xs2(i,:),q2(i,:),'LineWidth', 2)
end
for i=1:length(xx3)-1 %obtencion funcion por tramos 3
    xs3(i,:)=xx3(i):0.001:xx3(i+1);
    q3(i,:)=abcd3(i,1)*(xs3(i,:)-xx3(i)).^3+abcd3(i,2)*(xs3(i,:)-xx3(i)).^2+abcd3(i,3)*(xs3(i,:)-xx3(i))+abcd3(i,4);
    plot(xs3(i,:),q3(i,:),'LineWidth', 2)
end
axis([-1 0.5 -0.6 1]) %para que no se corran los ejes

%% Espiral

A = matfile('espiral.mat');
xx=A.x';
yy=A.y';
h=figure;
plot(xx,yy,'-k')


%splines POR SEPARADO en 4 tramos
xx1=A.x(1,1:5);
yy1=A.y(1,1:5);
xx2=A.x(1,5:9);
yy2=A.y(1,5:9);
xx3=A.x(1,9:13);
yy3=A.y(1,9:13);
xx4=A.x(1,13:17);
yy4=A.y(1,13:17);

s1=spline(xx1,yy1,xx1(1):-0.001:xx1(5)); %spline de cada curva
s2=spline(xx2,yy2);
s3=spline(xx3,yy3);
s4=spline(xx4,yy4);


s1=spline(xx1,yy1); %spline de cada curva
s2=spline(xx2,yy2);
s3=spline(xx3,yy3);
s4=spline(xx4,yy4);



abcd1=s1.coefs; %guarda matriz de coeficientes del spline
abcd2=s2.coefs; 
abcd3=s3.coefs; 
abcd4=s4.coefs; 

%Funciones y gráficos
% spline: S_i(x) =a_i*(x - x_i)^3 + b_i*(x - x_i)^2 + c_i*(x - x_i) + d_i
hold on;
for i=1:length(xx1)-1 %obtencion funcion por tramos 1
    xs(i,:)=xx1(i):-0.01:xx1(i+1);
    q1(i,:)=abcd1(i,1)*(xs(i,:)-xx1(i)).^3+abcd1(i,2)*(xs(i,:)-xx1(i)).^2+abcd1(i,3)*(xs(i,:)-xx1(i))+abcd1(i,4);
    plot(xs(i,:),q1(i,:),'LineWidth', 2)
end


for i=1:length(xx2)-1 %obtencion funcion por tramos 2
    xs2(i,:)=xx2(i):0.001:xx2(i+1);
    q2(i,:)=abcd2(i,1)*(xs2(i,:)-xx2(i)).^3+abcd2(i,2)*(xs2(i,:)-xx2(i)).^2+abcd2(i,3)*(xs2(i,:)-xx2(i))+abcd2(i,4);
    plot(xs2(i,:),q2(i,:),'LineWidth', 2)
end
for i=1:length(xx3)-1 %obtencion funcion por tramos 3
    xs3(i,:)=xx3(i):0.001:xx3(i+1);
    q3(i,:)=abcd3(i,1)*(xs3(i,:)-xx3(i)).^3+abcd3(i,2)*(xs3(i,:)-xx3(i)).^2+abcd3(i,3)*(xs3(i,:)-xx3(i))+abcd3(i,4);
    plot(xs3(i,:),q3(i,:),'LineWidth', 2)
end





