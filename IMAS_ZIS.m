clear all;clc
% % 定义参数
% frequency = 1 / 0.2; % 周期为0.2，对应频率为1/0.2
% time = linspace(0, 2, 1000); % 时间范围从0到2，生成1000个点
% 
% % 生成余弦波形
% cosine_wave = cos(2 * pi * frequency * time);
% 
% % 将（0.6，1.4）范围的值设为0
% cosine_wave(time >= 0.6 & time <= 1.4) = 0;
% 
% % 绘制图形
% plot(time, cosine_wave);
% xlabel('Time');
% ylabel('Amplitude');
% title('Cosine Wave with Gap');
% 定义参数
frequency = 1 / 0.3; % 周期为0.2，对应频率为1/0.2
time = linspace(0, 2.5, 1000); % 时间范围从0到2，生成1000个点

% 生成余弦波形
cosine_wave = 0.5*sin(2 * pi * frequency * time);

% 将（0.6，1.4）范围的线段分割成两部分
index1 = time >= 0 & time < 0.9;
index2 = time > 1.5 & time <= 2.4;
index_gap = time >= 0.9 & time <= 1.5;

% 绘制图形，分割线段处插入NaN以实现断开效果
plot(time(index1), cosine_wave(index1), 'b');
hold on;
plot(time(index2), cosine_wave(index2), 'b');
plot(time(index_gap), NaN(size(time(index_gap))), 'r'); % 插入NaN，使线段断开

% 在y=0处插入虚线
line([0, 2.4], [0, 0], 'LineStyle', '--', 'Color', 'k');

%hold off;
xlim([0,2.4])
ylim([-0.8,0.8])
xlabel('Time');
ylabel('Amplitude');
title('Cosine Wave with Gap and Dashed Line at y=0');
zero_crossings = find(diff(sign(cosine_wave)) ~= 0);
points_to_mark = 0:0.15:2.4;
for point = points_to_mark
    plot(point, 0, 'ro', 'MarkerSize', 8);
end


hold on;

% 在过零点处标记点并添加文本
for i = 1:length(zero_crossings)
    index = zero_crossings(i);
    text(time(index), cosine_wave(index), ['  ' num2str(index)], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
end


hold off;