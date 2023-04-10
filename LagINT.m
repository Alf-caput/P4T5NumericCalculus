function Yint = LagINT(x,y,Xint)
% Función que devuelve la imagen de un punto 
% Inputs:
%   x, y = vectores fila coordenadas de los puntos dados (eje X y eje Y)
%   Xint = coordenada x del punto a interpolar
% Outputs:
%   Yint = valor interpolado en el punto Xint
    % Inicialización de variables
    n = length(x); 
    L = ones(n, 1); 
    Yint = 0;
    % Se calculan las funciones de Lagrange evaluadas en Xint
    for i = 1:n
        for j = 1:n
            if i~=j
                L(i) = L(i) * (Xint-x(j))/(x(i)-x(j));
            end
        end
    end
    % Realizando el sumatorio de yi*Li con Li evaluadas en Xint se obtiene 
    % el valor interpolado de y en Xint
    for i = 1:n
        Yint = Yint + y(i)*L(i);
    end
end 