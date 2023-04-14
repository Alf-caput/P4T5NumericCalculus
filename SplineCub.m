function [Yint] = SplineCub(x,y,xint)
% Función para interpolar puntos con splines cúbicas, mediante polinomios
% de Lagrange.
% INPUTS:
%   x    = vector columna que contiene las coordenadas x de los puntos de datos
%   y    = vector columna que contiene las coordenadas y de los puntos dados
%   xint = coordenada x del punto interpolado
% OUTPUT:
%   Yint = valor y del punto interpolado
    % Calculo de coeficientes
    n = length(x);
    % Inicialización de variables
    a = zeros(n,1); % Incognitas del sistema
    b = zeros(n-1,1);
    h = zeros(n-1,1);
    u = zeros(n,1);
    u(1) = 1;
    u(n) = 1;
    v = null(n,1);
    v(1) = 0;
    v(n) = 0;
    M = zeros(n,n);
    % Calculo de la matriz tridiagonal M y del vector columna v de términos
    % independientes
    disp(x)
    for i = 1:n-1
        h(i) = x(i+1) - x(i);
        b(i) = 1/h(i) * (y(i+1) - y(i));
    end
    for j = 1:n-2
        u(j+1) = 2*(h(j) + h(j+1));
        v(j+1) = 6*(b(j+1) - b(j));
    end
    disp(u)
    M(1:n+1:end) = u;   % Diagonal principal
    M(2:n+1:end) = h;   % Diagonal superior
    M(1,2) = 0;
    M(n+1:n+1:end) = h; % Diagonal inferior
    M(n,n-1) = 0;
    disp(M)
    % Resolución del sistema
    a = Tridiagonal(M, v);
    
    % se obtiene el valor interpolado de y en Xint
    Yint = zeros(n,1);
    for i=1:n-2
        Yint(i) = a(i)/(6*h(i))*(x(i+1)-xint)^3 + a(i+1)/(6*h(i))*(xint - x(i))^3 + (y(i)/h(i)-(a(i)*h(i))/6)*(x(i+1) - xint) + (y(i+1)/h(i) - (a(i+1)*h(i))/6)*(xint - x(i));
    end

end
