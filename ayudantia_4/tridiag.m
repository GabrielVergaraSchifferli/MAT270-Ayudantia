function [A] = tridiag(a,b,c,n)
A = zeros(n);
for i=1:n
    A(i,i) = a;
    for j= 1:n
        if i == j-1
            A(i,j) = b;
        end
        if i == j+1
            A(i,j) = c;
        end
    end
end
