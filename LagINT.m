function Yint = LagINT(x,y,Xint)
% Función que interpola los puntos dados utilizando el polinomio de Lagrange
% Inputs:
%   x = coordenada x de los puntos de datos
%   y = coordenada y de los puntos de datos
%   Xint = coordenada x del punto a interpolar
% Outputs:
%   Yint = valor interpolado en el punto Xint
    % Inicialización de variables
    n = length(x); 
    L = ones(n,1); 
    Yint = 0;
    % Calcular los coeficientes de Lagrange
    for i = 1:n
        for j = 1:n
            if i~=j
                L(i) = L(i) * (Xint-x(j))/(x(i)-x(j));
            end
        end
    end
    
    % Calcular el valor interpolado de y en Xint
    for i = 1:n
        Yint = Yint + y(i)*L(i);
    end
end 