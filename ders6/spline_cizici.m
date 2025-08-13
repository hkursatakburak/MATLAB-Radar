function [] = spline_cizici(b,x,cozunurluk)
% derste buldugumuz b ile verilen bilinmeyen vektoru ve x verilerin x
% degerleri arasindaki Spline'lari cizen Matlab fonksiyonu. Her Spline icin
% cozunurluk degiskeni ile belirtilen sayida nokta kullanilarak cizim
% yapilacaktir.
spline_sayisi = length(x)-1;
hold on;
for ii = 1:spline_sayisi
    xx = linspace(x(ii),x(ii+1),cozunurluk);
    yy = b(ii) + b(ii+spline_sayisi) * (xx-x(ii)) + b(ii+2*spline_sayisi) * (xx-x(ii)).^2 + b(ii+3*spline_sayisi) * (xx-x(ii)).^3;
	plot(xx,yy);
end

