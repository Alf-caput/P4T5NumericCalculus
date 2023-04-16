xx = linspace(min(T), max(T));
n = length(xx);
yy = zeros(1, n);
for i = 1: n
    yy(i) = SplineCub(T, h, xx(i));
end
plot(xx, yy, 'b-');
hold on
plot(T, h, 'r.', MarkerSize=10);
% Documentación y ajustes del gráfico
title("Spline con polinomios de Lagrange");
xlabel('$\mathit{T}$ $\mathit{x}$ $10^{3}$ $\mathit{(K)}$','Interpreter','latex','FontSize',8);
ylabel('$\mathit{h}$ (MJ/kg)','Interpreter','latex','FontSize',8);
leyenda = legend("Interpolación","Puntos iniciales","Location","northwest");
grid
hold on
