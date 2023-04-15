function x = Tridiagonal(A,b)
% Función que busca la solución de un sistema de ecuaciones por el método
% de Thomas.

% INPUTS:
% A = matriz de coeficientes del sistema de ecuaciones
% b = vector fila de términos independientes (es la columna traspuesta)

% OUTPUTS:
% x = vector columna solución del sistema de ecuaciones

    N=length(b); % Números de filas del vector independiente

    % Vectores auxiliares
    d=zeros(N,1);
    u=zeros(N-1,1);
    l=zeros(N,1);

    if isbanded(A,1 ,1) % Se comprueba que la matriz es tridiagonal 
        for i=1:N % Bucle que guarda las diagonales en un vector
            d(i)=A(i,i); % Diagonal principal 
            if i<=N-1
                u(i)=A(i,i+1); % Diagonal superior
            end
            if i>=2
                l(i)=A(i,i-1); % Diagonal inferior
            end
        end
        % Matrices auxiliares
        u_prima=zeros(N-1,1);
        b_prima=zeros(N-1,1);
        b_prima2=zeros(N,1);
        % Coeficientes de la primera fila
        u_prima(1)=u(1)/d(1);
        b_prima(1)=b(1)/d(1);
        % Se normalizan las filas y se restan con las del pivote anterior
        for i=2:N-1
            u_prima(i)=u(i)/(d(i)-l(i)*u_prima(i-1));
            b_prima(i)=(b(i)-l(i)*b_prima(i-1))/(d(i)-l(i)*u_prima(i-1));
        end 
        b_prima2(1)=b_prima(1); 
        for i= 2:N
            b_prima2(i)=(b(i)-l(i)*b_prima(i-1))/(d(i)-l(i)*u_prima(i-1));
        end   
        % Sustitución hacia atrás.
        x=b_prima2;
        i=N-1;
        while i>=1
            x(i)= (b_prima2(i)-u_prima(i)*x(i+1));
            i=i-1;
        end
        x=x*100;% Se pasa de metros a centímetros 
    else 
        disp('No se pudo realizar el algoritmo, matriz no tridiagonal')
    end
end
