function Yint = NewtonINT(x, y, Xint)
% Función que interpola los puntos dados utilizando el polinomio de Newton
% Input:
%       x: vector de coordenadas x de los puntos de datos
%       y: vector de coordenadas y de los puntos de datos
%       Xint: coordenada x del punto a interpolar
% Output:
%       Yint: valor interpolado en el punto Xint


% Calcular las diferencias divididas iniciales
n = length(x);
for j = 1:n
    F(j,1) = y(j);
end
for i = 2:n
    for j = 2:i
        F(i,j) = (F(i,j-1) - F(i-1,j-1))/(x(i)-x(i-j+1));
    end
end

% Calcular el valor interpolado utilizando el polinomio de Newton
Yint = F(1,1);
for i = 2:n
    prod = 1;
    for j = 1:i-1
        prod = prod * (Xint - x(j));
    end
    Yint = Yint + F(i,i) * prod;
end
end