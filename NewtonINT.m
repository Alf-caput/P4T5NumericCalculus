function Yint = NewtonINT(x, y, Xint)
% Función que evalua en un punto el polinomio interpolador de Newton para
% un conjunto de puntos.
% El algoritmo utilizado es el polinomio interpolador de Newton.
% Input:
%   x = vector fila de coordenadas x de los puntos de datos
%   y = vector fila de coordenadas y de los puntos de datos
%   Xint = coordenada x del punto a interpolar
% Output:
%   Yint = valor interpolado en el punto Xint
    n = length(x);
    % Se calculan las diferencias divididas iniciales
    F(:, 1) = y;
    % Y a parir de esas en un proceso recursivo se obtienen las demás
    for i = 2:n
        for j = 2:i
            F(i,j) = (F(i,j-1) - F(i-1,j-1))/(x(i)-x(i-j+1));
        end
    end
    % Se calcula el valor interpolado utilizando el polinomio de Newton
    Yint = 0;
    for i = 1:n
        prod = 1;
        for j = 1:i-1
            prod = prod * (Xint - x(j));
        end
        Yint = Yint + F(i,i) * prod;
    end
end