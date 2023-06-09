function yint = Neville (x,y,xint)
% Función que obtiene el valor interpolado de un punto.
% El método utilizado es el algoritmo de interpolación de Neville.
% INPUT:
%   x = vector columna de los datos del eje X
%   y = vector columna de los datos del eje Y
%   xint = valor que se interpolará
% OUTPUT:
%   yint = valor de interpolación

    % Tamaño de la matriz posterior donde se guardarán los valores de cada polinomio de grado k
    n = length(x); 
    % Matriz donde se almacenarán los valores obtenidos
    P = zeros(n); 
    % Se añade a la matriz lo valores del vector 'y' para empezar a sacar el resto de valores
    P(:,1)=y; 
    
    % Se empieza en 2 ya que k=1 son las imágenes de f(x)
    for k = 2:n
        % De esta forma obtendremos los valores de manera escalonada 
        for i = 1:n-k+1
            % Se calcula el valor interpolado de xint para cada polinomio de grado k
            P(i,k) = ((xint - x(i+k-1))*P(i,k-1) + (x(i) - xint)*P(i+1,k-1))/(x(i) - x(i+k-1));
        end
    end
    % Valor de interpolación
    yint=P(1,n);
end
