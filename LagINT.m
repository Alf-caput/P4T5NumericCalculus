function Yint = LagINT(x,y,Xint)
% Función que interpola los puntos dados utilizando el polinomio de Lagrange
% Input:
%        x: coordenada x de los puntos de datos
%        y: coordenada y de los puntos de datos
%        Xint: coordenada x del punto a interpolar
% Output:
%        Yint: valor interpolado en el punto Xint

n = length(x); 
aux = ones(n,1); 
Yint = 0; 

% Calcular los coeficientes de Lagrange
for i = 1:n
    for j = 1:n
        if i~=j
            aux(i) = aux(i)*(Xint-x(j))/(x(i)-x(j));
        end
    end
end

% Calcular el valor interpolado de y en Xint
for i = 1:n
    Yint = Yint + y(i)*aux(i);
end
end 