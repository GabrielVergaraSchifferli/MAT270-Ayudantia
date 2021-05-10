function [ A ] = trid( n,a,b,c )
%Crea matriz tridiagonal con a,b,c de tamaño N
%   Detailed explanation goes here

A=zeros(n,n);
for i=1:n
    for j=1:n
        if (i==j)
            A(i,j)=a;
        end
        if(i-1==j)
            A(i,j)=c;
        end
        if(i==j-1)
            A(i,j)=b;
        end
    end
end
end
