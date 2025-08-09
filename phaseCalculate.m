function phase_deg = phaseCalculate(x1, x2)
% Faz farkı hesaplayan fonksiyon

    if length(x1) ~= length(x2)
        error("sinyal uzunlukları aynı olmalı")
    end

    X1 = fft(x1);
    X2 = fft(x2);

    [~, idx] = max(abs(X1));

    phi1 = angle(X1(idx));
    phi2 = angle(X2(idx));

    phi_rad = phi2 - phi1;
    phase_deg = rad2deg(phi_rad);
    phase_deg = mod(phase_deg + 180, 360) - 180;

end
