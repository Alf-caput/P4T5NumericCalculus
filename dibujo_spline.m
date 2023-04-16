n_puntos = 200;
xx = linspace(min(T), max(T), n_puntos);
yy = zeros(1, n_puntos);
for i = 1: n_puntos
    yy(i) = SplineCub(T, h, xx(i));
end
p1 = plot(xx, yy);
hold on
p2 = plot(T, h, '.', LineWidth=100);
legend([p1, p2], "Interpolación","Puntos iniciales","Location","northwest");
xlabel('$\mathit{T}$ $\mathit{x}$ $10^{3}$ $\mathit{(K)}$','Interpreter','latex','FontSize',8);
ylabel('$\mathit{h}$ (MJ/kg)','Interpreter','latex','FontSize',8);
title("Spline con polinomios de Lagrange");
hold on
