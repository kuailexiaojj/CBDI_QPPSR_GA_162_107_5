function variance = RZV(signal)%Zero-Crossing Interval Similarity（ZIS）
%一个过零点之间的时间间隔
% 步骤 1: 计算过零点的个数 i
%crossing_points = find(signal(1:end-1).*signal(2:end) < 0);
crossing_points = find(diff(sign(signal)) ~= 0);
i = length(crossing_points);

% 步骤 2: 计算每个相邻过零点的时间间隔 xn
time_gaps = diff(crossing_points);
mean_time_gaps=mean(time_gaps);
g_m2=(time_gaps-mean_time_gaps).^2;
sum_x=sum(g_m2);
variance=10000/(sum_x./(i-2));
 %variance=sum_x./(i-2);
 

% 步骤 3: 计算序列 xn 的方差，方差即为评价指标的值
%variance = var(time_gaps);
% %两个过零点之间的时间间隔
% % 步骤 1: 计算过零点的个数 i
% crossing_points = find(signal(1:end-1).*signal(2:end) < 0);
% %i = length(crossing_points);
% 
% % 步骤 2: 计算每两个相邻过零点的时间间隔 xn
% time_gaps = diff(crossing_points);
% xn = time_gaps(1:2:end);
% 
% % 步骤 3: 计算序列 xn 的方差，方差即为评价指标的值
% variance = var(xn);
