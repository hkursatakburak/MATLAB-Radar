xk = [1 2 3 4 5 6];
k = 2;
x = linspace(min(xk), max(xk), 1000);
y = ones(size(x));

for ii = 1:length(xk)
    if ii ~= k
        y = y.*(x-xk(ii))./((xk(k)-xk(ii)));
    end
end

figure;
plot(x,y);
grid on;