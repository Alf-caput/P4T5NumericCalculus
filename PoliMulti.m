function [p, Er, s] = PoliMulti(x, y, m)
% Función que calcula el polinomio de ajuste para un conjunto de puntos.
% El algoritmo utilizado es el Método de mínimos cuadrados.
% Inputs:
%   x, y = vectores fila coordenadas de los puntos dados (ejeX y ejeY)
%   m = grado del polinomio de ajuste
% Outputs:
%   p = vector fila de coeficientes del polinomio de ajuste ordenados de 
%   mayor a menor potencia de x
%   Er = error total
%   s = desviación estándar
% El error .........................
% Nota: el nº de puntos debe coincidir con el grado del polinomio.
    n = numel(x);
    if n ~= numel(y)
        disp('Error: A cada valor de x se debe corresponder un valor de y')
        return
    else
        if n < m
            disp('Error: El grado del polinomio de ajuste puede ser como mucho igual al número de puntos - 1')
        else
            % El número de sumatorios que hay que calcular es 2*m + 1
            % El sumatorio para la diagonal principal:
            A = diag(zeros(1, m+1) + sum(x.^m));
            % Los 2*m sumatorios restantes:
            for i = 1: m
                A = A + diag(zeros(1, i) + sum(x.^(i-1)), -m+i-1);
                A = A + diag(zeros(1, i) + sum(x.^(2*m-i+1)), m-i+1);
            end
            A = flipud(A);
        end
    end
end