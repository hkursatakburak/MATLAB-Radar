function [snr_linear,snr_dB] = radar_snr(Pt, Gt_dB, Gr_dB, f, R, sigma, L_dB, B, T, F_dB)
%RADAR_SNR Summary of this function goes here
Gt = 10^(Gt_dB/10);
Gr = 10^(Gr_dB/10);
L = 10^(L_dB/10);
F = 10^(F_dB/10);
c = 3e8;
lambda = c / f;

%Now we are writing radar eq%

Pr = (Pt * Gt * Gr * sigma * (lambda)^2)/((4*pi)^3 * R^4 * L );

%Noise eq%
k = 1.38e-23;
Pn = k * B * T * F;

%SNR Eq last step%

snr_linear = Pr / Pn;
snr_dB = 10 * log10(snr_linear);
end

