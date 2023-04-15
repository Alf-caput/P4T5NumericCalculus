function x = Tridiagonal(A,b)
% Función que busca la solución de un sistema de ecuaciones por el método
% de Thomas.

% INPUTS:
% A = matriz de coeficientes del sistema de ecuaciones que debe de ser
% tridiagonal
% b = vector fila de términos independientes (es la columna traspuesta)

% OUTPUTS:
% x = vector columna solución del sistema de ecuaciones

    % Obtener los tamaños de la matriz y del vector
    n = length(b);
    
    % Inicializar los vectores necesarios para el algoritmo
    c = zeros(n-1,1);
    d = zeros(n,1);
    x = zeros(n,1);
    
    % Algoritmo de Thomas para resolver el sistema tridiagonal
    c(1) = A(1,2)/A(1,1);
    d(1) = b(1)/A(1,1);
    
    for i = 2:n-1
        c(i) = A(i,i+1)/(A(i,i) - A(i,i-1)*c(i-1));
    end
    
    d(2) = (b(2) - A(2,1)*d(1))/(A(2,2) - A(2,1)*c(1));
    
    for i = 3:n
        d(i) = (b(i) - A(i,i-1)*d(i-1))/(A(i,i) - A(i,i-1)*c(i-1));
    end
    
    x(n) = d(n);
    
    for i = n-1:-1:1
        x(i) = d(i) - c(i)*x(i+1);
    end
    
    end
