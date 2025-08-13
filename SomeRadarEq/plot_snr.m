function plot_snr(Pt, Gt_dB, Gr_dB, f, sigma, L_dB, B, T, F_dB)
    % SNR'yi menzile göre plotlayan fonksiyon
    c = 3e8;
    k = 1.38e-23;

    Gt = 10^(Gt_dB/10);
    Gr = 10^(Gr_dB/10);
    L = 10^(L_dB/10);
    F = 10^(F_dB/10);

    lambda = c / f;

    R = linspace(1e3, 50e3, 200); % metre cinsinden menzil

    Pr = (Pt .* Gt .* Gr .* sigma .* (lambda.^2)) ./ ((4*pi).^3 .* (R.^4) .* L);
    Pn = k * B * T * F;
    snr_dB = 10 * log10(Pr ./ Pn);

    plot(R/1000, snr_dB, 'LineWidth', 2);
    xlabel('Menzil (km)');
    ylabel('SNR (dB)');
    title('Menzile Göre SNR');
    grid on;
end