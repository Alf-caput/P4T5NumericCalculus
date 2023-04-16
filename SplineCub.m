function [Yint] = SplineCub(x,y,xint)
% Función para interpolar puntos con splines cúbicas, mediante polinomios
% de Lagrange. La función llama a la función Tridiagonal para 
% resolver el sistema con el que se obtienen los coeficientes de los polinomios 
% mediante el algoritmo de Thomas.
% INPUTS:
%   x    = vector fila que contiene las coordenadas x de los puntos de datos
%   y    = vector fila que contiene las coordenadas y de los puntos dados
%   xint = coordenada x del punto interpolado
% Nota: los puntos deben de estar ordenados en orden creciente según su
% coordenada x.
% OUTPUT:
%   Yint = valor y del punto interpolado
    % Cálculo de coeficientes
    n = length(x);
    % Inicialización de variables
    b = zeros(1, n-1);
    h = zeros(1, n-1);
    % Calculo de los vectores h y b
    for i = 1:n-1
        h(i) = x(i+1) - x(i);
        b(i) = 1/h(i) * (y(i+1) - y(i));
    end
    % Calculo de los vectores u y v
    u = ones(n, 1);
    v = zeros(n, 1);
    for i = 1:n-2
        u(i+1) = 2*(h(i) + h(i+1));
        v(i+1) = 6*(b(i+1) - b(i));
    end
    M = diag(u) + diag(h, 1) + diag(h, -1); 
    M(1, 2) = 0;
    M(n, n-1) = 0;

    % Resolución del sistema
    a = Tridiagonal(M, v);
    % Se obtiene el valor interpolado de y en Xint
    for i = 1:n-1
        if xint >= x(i) && xint <= x(i+1)
            break
        end
    end
    Yint = ...
        a(i)/(6*h(i))*(x(i+1)-xint)^3 + ...
        a(i+1)/(6*h(i))*(xint - x(i))^3 + ...
        (y(i)/h(i)-a(i)*h(i)/6)*(x(i+1) - xint) + ...
        (y(i+1)/h(i) - a(i+1)*h(i)/6)*(xint - x(i));
end