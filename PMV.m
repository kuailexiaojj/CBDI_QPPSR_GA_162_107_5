function variance_indicator = PMV(signal)%Intervals Mean Amplitude Difference（IMAD） 
% 步骤 1: 计算过零点的个数 i
    crossing_points = find(signal(1:end-1).*signal(2:end) < 0);
    i = length(crossing_points);

    % 步骤 2: 将时域信号分段
    segments = cell(1, i-1);
    for k = 1:i-1
       segments{k} = signal(crossing_points(k):crossing_points(k+1));
    end

    % 步骤 3: 计算各时域子段的平均振幅 xk
    xk = zeros(1, i-1);
    for k = 1:i-1
        xk(k) = mean(segments{k});
    end

    % 步骤 4: 计算整个时域信号的平均振幅 Xmean
    Xmean = mean(signal);

    % 步骤 5: 计算差值，并在整个范围内取平均值
    difference = xk - Xmean;
     variance_indicator = mean(abs(difference));
    %variance_indicator = abs(mean(difference));
    %variance_indicator = var(abs(xk));