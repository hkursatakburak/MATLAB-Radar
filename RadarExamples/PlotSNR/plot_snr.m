function plot_snr(Pt, G_dB, f, sigma, B, T, F_dB, L_dB, R_min, R_max)

    % Sabitler
    k = 1.38e-23;
    c = 3e8;

    % dB → lineer dönüşüm
    G = 10^(G_dB / 10);
    F = 10^(F_dB / 10);
    L = 10^(L_dB / 10);
    lambda = c / f;

    % Mesafe vektörü (log aralıklı ya da doğrusal seçilebilir)
    R = linspace(R_min, R_max, 500);

    % SNR hesapla
    numerator = Pt * G^2 * lambda^2 * sigma;
    denominator = (4 * pi)^3 * k * T * B * F * L;
    SNR_linear = numerator ./ (denominator * R.^4);
    SNR_dB = 10 * log10(SNR_linear);

    % Grafik çizimi
    figure;
    plot(R / 1000, SNR_dB, 'b-', 'LineWidth', 2); % km cinsinden
    grid on;
    xlabel('Mesafe (km)');
    ylabel('SNR (dB)');
    title('Radar SNR vs. Mesafe');
    hold on;

    % Eşik çizgisi (örneğin 13 dB)
    yline(13, 'r--', 'SNR Eşiği = 13 dB', 'LineWidth', 1.5);
    legend('SNR', 'Tespit Eşiği', 'Location', 'northeast');
end


