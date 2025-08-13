function lagrange_interpolation(x, y)
% Girdi kontrolü
if length(x) ~= length(y)
    error('x ve y vektörlerinin uzunlukları eşit olmalıdır.');
end

% Lagrange polinomunu hesaplamak için symbolic işlemler
n = length(x) - 1;
syms t;
L = 0;

for i = 1:n+1
    Li = 1;
    for j = 1:n+1
        if j ~= i
            Li = Li * (t - x(j))/(x(i) - x(j));
        end
    end
    L = L + Li * y(i);
end

% Polinomu basitleştir
L = simplify(L);
% Çıktı
fprintf('Lagrange polinomu: \n');
disp(L);
% Grafiği çizdir
xx = linspace(min(x), max(x), 1000);
yy = double(subs(L, t, xx));

figure;
plot(xx, yy, 'b-', 'LineWidth', 2);
hold on;
plot(x, y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
xlabel('x');
ylabel('y');
title('Lagrange Polinomu İnterpolasyonu');
legend('Polinom', 'Verilen Noktalar', 'Location', 'Best');
grid on;
hold off;
end
x = [23 04 29 10 19 05];
y = [03 10 01 60 40 74];
lagrange_interpolation(x, y);
Lagrange polinomu:
(59401*t^5)/93366000 - (1621237*t^4)/31122000 + (2317493*t^3)/1436400 - (736896491*t^2)/31122000 +
(1517823337*t)/9336600 - 322139/910[1],[2]
