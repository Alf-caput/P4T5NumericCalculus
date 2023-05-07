function x = Tridiagonal(A,b)
% Función que dada una matriz tridiagonal A y un vector de términos
% independientes b realiza el ALgoritmo de Thomas para resolver el sistema.
%
% Variables de entrada
%   A = matriz tridiagonal
%   b = vector columna
%
% Variables de salida
%   x = vector con las soluciones del sistema

% Cuerpo de la función:

% INICIALIZAMOS DATOS:
[F,~] = size(A);  % Calculamos la dimensión de la matriz
B = b;            % Guardamos en B los terminos indepepndientes

% COMPROBAMOS: isbanded() 
for i = 2:F
    d1 = diag(A,i);
    d2 = diag(A,-i);
    if norm(d1) + norm(d2) ~= 0 
        error(' A no es tridiagonal');
    end
end

% PASO 1:
d = diag(A);      % Guardamos la primera columna para tener el primer elemento guardado.
a = diag(A,1);
b = [0; diag(A,-1)];   % Vector que tendra primer elemento Nulo porque la dimension real es F-1.

% PASO 2:
a(1) = a(1) / d(1);    
B(1) = B(1) / d(1); 

% PASO 3:
for i = 2:F-1 
    a(i) = a(i) / (d(i) - b(i) * a(i-1));
    B(i) = (B(i) - b(i) * B(i-1)) / (d(i) - b(i) * a(i-1)); 
end

% PASO 4:
B(F) = (B(F) - b(F) * B(F-1))/(d(F) - b(F) * a(F-1));

% PASO 5:
x = zeros(F,1);

x(F) = B(F);
for i = F-1:-1:1
    x(i) = B(i) - a(i)*x(i+1);
end

end