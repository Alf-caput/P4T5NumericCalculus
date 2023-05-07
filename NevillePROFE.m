function yint = NevillePROFE(x, y,xint)
% Calcula el punto de interpolación mediante el método de Neville. 
% Variables de entrada:
% x, y vectores con las coordenadas de los puntos de datos
% xint : punto donde se quiere interpolar
% yint :  valor interpolado
% Este algoritmo trabaja con la matriz unidimensional yn, que inicialmente
% contiene los valores de y de los datos (la segunda columna de la tabla). 
% Cada paso por el bucle for calcula los términos de la siguiente columna 
% de la tabla, que sobrescriben los elementos anteriores de yn. 
% Al final del procedimiento, yn contiene los términos diagonales de la tabla. 
% El valor interpolado (evaluado en xint) que pasa por todos los puntos 
% de datos es yint, el primer elemento de yn.
n = length(x);
yn = y;
for k = 1:n-1
    yn(1:n-k) = ((xint - x(k+1:n)).*yn(1:n-k)+ (x(1:n-k) - xint).*yn(2:n-k+1))./(x(1:n-k) - x(k+1:n));
end
yint = yn(1);
end