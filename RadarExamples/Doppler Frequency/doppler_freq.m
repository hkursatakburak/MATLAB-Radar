function [f_doppler,wavelength] = doppler_freq(f_c,v_target,angle)
%Algoritma: 1) fonksiyonu tanımla f_c , v , angle,
%           2) ışık hızını tanımla ve dalga boyunu hesapla
%           3) açıyı radyana çevir çünkü matlab radyan hesabı yapar
%           4) doppler frekansını hesapla 
%           5) command Windowda sonuçları döndürmeye hazır


c = 3e8; % ışık hızını girdim %
wavelength = c/f_c; %lambda yı hesapladım %
theta = deg2rad(angle); % matlab radyan cisnden hesap yaptığı için dereceyi radyana çevirdim %
f_doppler = (2 * v_target * cos(theta)) / wavelength; % doppler formulü ile hesaplama yapıldı %
end

