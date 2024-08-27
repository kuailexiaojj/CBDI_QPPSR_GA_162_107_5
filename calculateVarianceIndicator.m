function variance_indicator = calculateVarianceIndicator(signal)
    % 步骤 1: 计算过零点的个数 i
    crossing_points = find(signal(1:end-1).*signal(2:end) < 0);
    i = length(crossing_points);

    % 步骤 2: 将时域信号分成 i-1 个子段
    segments = cell(1, i-1);
    for k = 1:i-1
        segments{k} = signal(crossing_points(k):crossing_points(k+1));
    end

    % 步骤 3: 计算相邻零点交叉点的时间间隔 xn
    xn = zeros(1, i-1);
    for n = 1:i-1
        xn(n) = crossing_points(n+1) - crossing_points(n);
    end

    % 步骤 4: 计算序列 xn 的方差
    variance_indicator = var(xn);
end
