function [p, Er, s] = PoliMulti(x, y, m)
% Función que calcula el polinomio de ajuste para un conjunto de puntos.
% El algoritmo utilizado es el Método de mínimos cuadrados.
% Inputs:
%   x, y = vectores fila coordenadas de los puntos dados (eje X y eje Y)
%   m = grado del polinomio de ajuste
% Outputs:
%   p = vector fila de coeficientes del polinomio de ajuste ordenados de 
%   mayor a menor potencia de x
%   Er = error total
%   s = error estándar de la estimación
% El error total se calcula como la suma de diferencias al cuadrado entre 
% los valores de y reales y los obtenidos al evaluar el polinomio de ajuste.
% El error estándar de la estimación se calcula como la raíz cuadrada de el
% error total dividido por el número de puntos menos el grado del polinomio
% menos uno.
    n = numel(x);
    if n ~= numel(y)
        disp('Error: A cada valor de x se debe corresponder un valor de y')
    else
        if n <= m
            disp('Error: El grado del polinomio de ajuste puede ser como mucho igual al número de puntos - 1')
        else
            % Para calcular los coeficientes del polinomio de grado m
            % debemos resolver el sistema de ecuaciones normales del ajuste
            % por mínimos cuadrados
            % La matriz del sistema tiene 2*m + 1 sumatorios repartidos en
            % la diagonal y subdiagonales secundarias
            % (Trabajaremos con diagonales y subdiagonales principales para
            % luego rotar y obtener las secundarias)
            % El sumatorio para la diagonal secundaria:
            A = diag(zeros(1, m+1) + sum(x.^m));
            % Los 2*m sumatorios restantes de las subdiagonales secundarias
            for i = 1: m
                A = A + diag(zeros(1, i) + sum(x.^(i-1)), -m+i-1);
                A = A + diag(zeros(1, i) + sum(x.^(2*m-i+1)), m-i+1);
            end
            % Por la forma en que hemos elegido el orden de los
            % coeficientes del polinomio resultante rotamos la matriz
            A = rot90(A, 2);
            % Calculamos ahora el vector columna de términos independientes
            % Tenemos m+1 términos independientes
            b = zeros(m+1, 1);
            for i = 1: m+1
                b(i) = sum(y.*x.^(i-1));
            end
            % Resolviendo el sistema A*p = b obtenemos los coeficientes del
            % polinomio que ajusta el conjunto de puntos
            p = (A \ b)'; % Lo transponemos para que sea vector fila
            % Se calcula el error
            Er = 0;
            for i=1: m+1
                Er = Er + (y(i) - polyval(p, x(i)))^2;
            end
            % Se calcula el error estándar de la estimación
            s = sqrt(Er/(n-m-1));
        end
    end
end