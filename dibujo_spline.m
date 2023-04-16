hold on
n_puntos = 200;
xx = linspace(min(T), max(T), n_puntos);
yy = zeros(1, n_puntos);
for i = 1: n_puntos
    yy(i) = SplineCub(T, h, xx(i));
end
plot(xx, yy)