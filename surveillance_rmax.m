function R_max = surveillance_rmax(Pt, G_dB, f, sigma, Ts, B, T, F_dB, L_dB, omega_sr, snr_min_dB)
% surveillance_rmax - Gözetleme radarında maksimum tespit menzilini hesaplar

    % dB → lineer dönüşümler
    G = 10^(G_dB / 10);
    F = 10^(F_dB / 10);
    L = 10^(L_dB / 10);
    SNR = 10^(snr_min_dB / 10);

    % Sabitler
    k = 1.38e-23;
    c = 3e8;
    lambda = c / f;

    % Radar menzil denkleminden R_max
    numerator = Pt * G^2 * lambda^2 * sigma * Ts;
    denominator = (4*pi)^3 * k * T * B * F * L * omega_sr * SNR;

    R_max = (numerator / denominator)^(1/4);  % m cinsinden
end

