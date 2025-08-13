t = 0:0.001:1;
f = 5; % 5 Hz

x1 = 1 * cos(2*pi*f*t);           % A = 1, faz = 0
x2 = 2 * cos(2*pi*f*t);           % A = 2, faz = 0 (sadece genlik farkı)
x3 = 1 * cos(2*pi*f*t + pi/2);    % A = 1, faz farkı (π/2 radian = 90 derece)

figure;
plot(t, x1, 'b', 'LineWidth', 1.5); hold on;
plot(t, x2, 'r--', 'LineWidth', 1.5);
plot(t, x3, 'g-.', 'LineWidth', 1.5);
legend('x1: A=1, φ=0','x2: A=2, φ=0','x3: A=1, φ=π/2');
xlabel('Zaman (s)');
ylabel('Genlik');
title('Genlik ve Faz Farkı Gösterimi');
grid on;