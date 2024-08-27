function kurt = calculate_kurtosis(X)%X为功率谱
    M = length(X);
    mean_X = mean(X);

    numerator = (2/M) * sum((X(1:M/2) - mean_X).^4);
    denominator = (2/M) * sum((X(1:M/2) - mean_X))^2;

    kurt = numerator / denominator;
end