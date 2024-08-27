% 公开版代码
% 特征提取函数genFeatureTF的测试文件
% 本程序2021.10定型，后续更新都在完整版代码中
% 本代码地址及代码说明：http://khsci.com/docs/index.php/2021/10/30/genfea/
clear all
versionTest;% 代码运行环境监测
%% 1.生成仿真信号
fs = 200;  %采样频率
t = 1/fs:1/fs:1;  %时间轴数据
Data = 1*cos(2*pi*200*t)+(2*randn(size(t)));  %生成仿真数据
%% 2.调用genFeature函数，求出特征值
featureNamesCell = {'max','min','mean','peak','arv','var','std','kurtosis',...
               'skewness','rms','waveformF','peakF','impulseF','clearanceF',...
               'FC','MSF','RMSF','VF','RVF',...
               'SKMean','SKStd','SKSkewness','SKKurtosis'};%要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
fea = genFeatureTF(Data,fs,featureNamesCell);  %调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里，
                                             %fea变量的长度和featureNamesCell中指定的特征量一致，且顺序一一对应
                                             %程序运行完成后，在MATLAB的工作区，双击fea变量，可以查看求得的具体数值

% function fea = genFeatureTF(data,fs,featureNamesCell)                                           
% 时域、频域相关算法的信号特征提取函数
% 输入：
% data：待特征提取的时域信号，可以是二维数据，维度为m*n，其中m为数据组数，n为每组数据的长度。即每行数据为一组。行列方向不可出错
% fs：采样频率，如果不提取频域特征，fs值可以设置为1
% featureNamesCell：拟进行特征提取的特征名称，该变量为cell类型，其中包含的特征名称为字符串，特征名称需要在下边列表中：
% 目前支持的特征（2022.5.23，共23种）：
% max ：最大值
% min ：最小值
% mean ：平均值
% peak ：峰峰值
% arv  ：整流平均值
% var  ：方差
% std  ：标准差
% kurtosis  ：峭度
% skewness  ：偏度
% rms       ：均方根
% waveformF ：波形因子
% peakF     ：峰值因子
% impulseF  ：脉冲因子
% clearanceF：裕度因子
% FC：重心频率
% MSF：均方频率
% RMSF：均方根频率
% VF：频率方差
% RVF：频率标准差
% SKMean：谱峭度的均值
% SKStd：谱峭度的标准差
% SKSkewness：谱峭度的偏度
% SKKurtosis：谱峭度的峭度
% 
% 输出：
% fea：数据data的特征值数组，其特征值顺序与featureNamesCell一一对应
%% 关于完整版代码：
% 公开版代码的函数文件为p文件，可以被调用，但无法查看代码。
% 完整版代码中全部为m文件，m文件可以查看源码并自由修改，画图无水印
% 完整版将会持续更新更多类型的特征量

% 如果需要封装好的函数的源码，可在下述连接（完整版）获取：
% http://khsci.com/docs/index.php/2021/10/30/genfea/
% 编程不易，感谢支持~

%% 完整版代码重要更新：
% 20230212 优化了代码，现在如果不提取谱峭度相关的特征，则不会再进行谱峭度计算，提高了程序计算效率。
% 20220913 （重要）添加了3个特征：med ：中位数、rs ：均方值、rmsa ：方根幅值。
% 20220520 （重要）添加了四个特征： SKMean：谱峭度的均值、SKStd：谱峭度的标准差、SKSkewness：谱峭度的偏度、SKKurtosis：谱峭度的峭度
% 20220302 优化了二维特征提取的部分代码
% 20220224 修复了二维数据特征提取时提取少部分特征会报错的bug
% 20211206 优化部分代码，更好处理二维数据特征提取
% 20211204 （重要）1.修复了一维数据导入时为列向量会报错的bug；2.修复了低版本MATLAB打开程序中文字符出现乱码的bug；3.运算量大的特征如果没有选用将不再计算，大大提高程序运行效率。
% 20211121 修复了二维数据特征提取的部分bug
% 20211102 支持导入二维数据
% 20211031 完成初版代码（公开版代码所在版本）
function versionTest
% 获取MATLAB版本
versionStr = version('-release');
versionYear = str2double(versionStr(1:4));

% 判断MATLAB版本是否为2022a或以上
if (versionYear < 2022)
    % 如果版本过低，弹出提示框
    warndlg('该代码需使用MATLAB 2022及更新版本运行', '版本警告');
end
end