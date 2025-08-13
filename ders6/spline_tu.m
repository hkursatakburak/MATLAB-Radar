function [cozum_vektoru] = spline_tu(x,y,sinir_kosulu)
% n adet x-y ikilisinden gecen (n-1) adet cubic spline olusturan fonksiyon
% S_i = a_i + b_i*(x - x_i) + c_i*(x - x_i)^2 + d_i*(x - x_i)^3
% Girdiler
% x: data noktalarinin x eksen degerleri (boyut: 1xn)
% y: data noktalarinin y eksen degerleri (boyut: 1xn)
% sinir_kosulu: eger 1 ise dogal sinir kosulu, 1 degil ise not-a-knot sinir kosulunu kullan
% Ciktilar:
% soln_vec: a, b, c, d parametrelerini iceren vector =[a_1; a_2; ... a_(n-1); b_1; b_2 ... b_(n-1); c_1; c_2 ... c_(n-1); d_1; d_2; ... d_(n-1)] (boyut: 4*(n-1)x1)
% Ornek: 
% >> x=[1 2 3 4];
% >> y=[2 3 5 10];
% >> [cozum_vektoru]=spline_tu(x,y,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aytac Alparslan
% 07 Mayis 2024, Trakya Universitesi Edirne.

%% ODEV COZUMU ICIN $$$$ ISARETLI YERLERE GELMESI GEREKEN KODLARI YAZINIZ!!!

[x,ind_sort]=sort(x); % x vektorunu kucukten buyuge sirala
y=y(ind_sort); % siralanan x vektorune karsilik gelen y vektorunu olustur

n=length(x);
A=zeros(4*(n-1),4*(n-1)); % matris icin RAM'de yer ac
g=zeros(4*(n-1),1); % sag taraf vektoru icin RAM'de yer ac

%Spline'in sol tarafindaki sureklilikten gelen ilk denklemler
A(1,1)=1; 
g(1)=y(1);

%Spline'in sag tarafindaki sureklilikten gelen son denklemler
delx=x(end)-x(end-1);
A(2*(n-1),(n-1))=1;
A(2*(n-1),2*(n-1))=delx;
A(2*(n-1),3*(n-1))=delx^2;
A(2*(n-1),4*(n-1))=delx^3;  
g(2*(n-1))=y(end);


if sinir_kosulu == 1
    %dogal sinir kosulu (ikinci turevler ilk ve son noktalarda 0'a esit)
    A(end-1, 2*(n-1)+1)=1;
    g(end-1)=0;

    A(end,3*(n-1))=2;
    A(end,4*(n-1))=6*delx;
    g(end)=0;
    grafik_ismi = 'Dogal sinir kosulu ile Kubik Spline';
else
    %not-a-knot sinir kosulu (ucuncu turevler de ikinci ve sondan bir onceki noktalarda surekli)
    A(end-1, 3*(n-1)+1)=6;
    A(end-1, 3*(n-1)+2)=-6;
    g(end-1)=0;

    A(end,4*(n-1)-1)=6;
    A(end,4*(n-1))=-6;
    g(end)=0;
    grafik_ismi = 'Not-a-Knot sinir kosulu ile Kubik Spline';
end


for ii=1:n-2
    delx=x(ii+1)-x(ii);
    
    %Spline'in sol tarafindaki sureklilikten gelen denklemler
    A(ii+1,ii+1)= 1;
    g(ii+1)=y(ii+1);

    %Spline'in sag tarafindaki sureklilikten gelen denklemler
    A(n-1+ii,ii)=1;
    A(n-1+ii,n-1+ii)=delx;
    A(n-1+ii,2*(n-1)+ii)=delx^2;
    A(n-1+ii,3*(n-1)+ii)=delx^3;
    g(n-1+ii)=y(ii+1);

    % Birinci turevin surekliliginden gelen denklemler
    A(2*(n-1)+ii,(n-1)+ii)=1;
    A(2*(n-1)+ii,(n-1)+ii+1)=-1;
    A(2*(n-1)+ii,2*(n-1)+ii)=2*delx;
    A(2*(n-1)+ii,3*(n-1)+ii)=3*delx^2;

    % Ikinci turevin surekliliginden gelen denklemler
    A(3*(n-1)+ii-1,2*(n-1)+ii)=2;
    A(3*(n-1)+ii-1,2*(n-1)+ii+1)=-2;
    A(3*(n-1)+ii-1,3*(n-1)+ii)=6*delx;
    
end
cozum_vektoru=A\g; %cozum vektorunu bul
figure; %yeni figur ac
plot(x,y,'rx'); %veri noktalarini kirmizi carpi ile ciz
title(grafik_ismi); %grafik ismini sinir kosuluna gore yukarida belirtildigi gibi yerlestir
spline_cizici(cozum_vektoru,x,100); %derste elde ettigimiz spline cizici ile splinelari ciz
legend('Veri noktalari','Spline egrileri'); %grafige anahtar ekle
xlabel('x'); %x eksenine isim ver
ylabel('y'); %y eksenine isim ver
grid on; %kilavuz cuzgileri ekle
end



