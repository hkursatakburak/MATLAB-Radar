function range_resolution_gui_plot()
    % GUI penceresi oluşturuluyor
    fig = figure('Name','Radar Range Resolution', ...
        'Position',[300 300 550 400], 'NumberTitle','off', 'Resize','off');

    % --- Giriş Türü (Dropdown) ---
    uicontrol(fig, 'Style','text', 'String','Hesaplama Türü:', ...
        'Position',[30 340 120 25], 'FontSize',10, 'HorizontalAlignment','left');

    popup = uicontrol(fig, 'Style','popupmenu', ...
        'String',{'Pulse Width (τ)','Bandwidth (B)'}, ...
        'Position',[160 340 180 25]);

    % --- Değer Giriş Kutusu ---
    uicontrol(fig, 'Style','text', 'String','Değer Girin:', ...
        'Position',[30 300 120 25], 'FontSize',10, 'HorizontalAlignment','left');

    inputField = uicontrol(fig, 'Style','edit', ...
        'Position',[160 300 180 25], 'FontSize',10);

    % --- HESAPLA Butonu ---
    uicontrol(fig, 'Style','pushbutton', 'String','HESAPLA', ...
        'Position',[380 300 120 30], 'FontSize',11, ...
        'Callback',@calculate_callback);

    % --- Sonuç Metni ---
    resultText = uicontrol(fig, 'Style','text', ...
        'String','ΔR: --- m', ...
        'Position',[150 260 250 30], ...
        'FontSize',12, 'FontWeight','bold');

    % --- Grafik Alanı ---
    ax = axes(fig, 'Units','pixels', 'Position',[60 30 420 200]);

    % === Hesaplama ve Grafik ===
    function calculate_callback(~,~)
        c = 3e8; % ışık hızı
        val = str2double(get(inputField, 'String'));
        sel = get(popup, 'Value');

        % Girdi kontrolü
        if isnan(val) || val <= 0
            set(resultText,'String','Hatalı giriş!');
            return;
        end

        % Grafik verileri oluştur
        if sel == 1
            % τ seçildiyse
            tau_vals = linspace(0.1e-6, 5e-6, 200);
            delta_vals = (c .* tau_vals) / 2;

            deltaR = (c * val) / 2;
            plot(ax, tau_vals*1e6, delta_vals, 'b', 'LineWidth',2);
            hold(ax, 'on');
            plot(ax, val*1e6, deltaR, 'ro', 'MarkerSize',8, 'MarkerFaceColor','r');
            hold(ax, 'off');
            xlabel(ax, 'Pulse Width τ (μs)');
            ylabel(ax, 'Çözünürlük ΔR (m)');
            title(ax, 'τ vs. ΔR');
            grid(ax, 'on');

        else
            % Band genişliği seçildiyse
            B_vals = linspace(1e6, 50e6, 200);
            delta_vals = c ./ (2 .* B_vals);

            deltaR = c / (2 * val);
            plot(ax, B_vals/1e6, delta_vals, 'g', 'LineWidth',2);
            hold(ax, 'on');
            plot(ax, val/1e6, deltaR, 'ro', 'MarkerSize',8, 'MarkerFaceColor','r');
            hold(ax, 'off');
            xlabel(ax, 'Bant Genişliği B (MHz)');
            ylabel(ax, 'Çözünürlük ΔR (m)');
            title(ax, 'B vs. ΔR');
            grid(ax, 'on');
        end

        msg = sprintf('ΔR = %.2f m', deltaR);
        set(resultText,'String', msg);
    end
end

