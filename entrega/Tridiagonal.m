function x = Tridiagonal(A,B)
% Función que busca la solución de un sistema de ecuaciones por el método
% de Thomas.
% INPUTS:
% A = matriz de coeficientes del sistema de ecuaciones que debe de ser
% cuadrada y tridiagonal.
% B = vector columna de términos independientes 

% OUTPUTS:
% x = vector columna solución del sistema de ecuaciones
    % Primero verificamos que la matriz sea cuadrada y tridiagonal:
    [Z, F] = size(A);
    if Z~=F 
        disp('ERROR.La matriz no es cuadrada.');
        return
    end

    for i = 1:F
        for j = 1:F
            if abs(i-j) > 1 && A(i,j) ~= 0
                disp('ERROR.La matriz no es tridiagonal')
                return 
            end
        end
    end

    % Vector que contiene la diagonal de A
    d = diag(A);
    % Diagonal superior
    a = diag(A,1);
    % Diagonal inferior con el primer elemento 0 y el último A(F,F)
    b = zeros(F,1);
    b(2:F) = diag(A,-1);
    d(F) = A(F,F);

    % A prima 
    ap = zeros(F-1,1);
    ap(1) = a(1)/d(1);
    % B prima
    Bp = zeros(F,1);
    Bp(1) = B(1)/d(1);
    % B prima prima
    Bpp = zeros(F,1);

    for i=2:F-1
        ap(i) = a(i) / (d(i) - b(i)*ap(i-1));
        Bpp(i) = (B(i)-b(i)*Bp(i-1)) / (d(i)-b(i)*ap(i-1));
    end
    Bpp(F) = (B(F)-b(F)*Bp(F-1)) / (d(F) - b(F)*ap(F-1));
    
    x = zeros(F,1);
    x(F) = Bpp(F);

    % Hacemos sustitucion hacia atras
    for i=1:F-1
        x(F-i) = Bpp(F-i) - ap(F-i)*x(F-i+1);
    end


end