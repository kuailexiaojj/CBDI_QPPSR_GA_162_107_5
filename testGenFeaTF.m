% ���������
% ������ȡ����genFeatureTF�Ĳ����ļ�
% ������2021.10���ͣ��������¶��������������
% �������ַ������˵����http://khsci.com/docs/index.php/2021/10/30/genfea/
clear all
versionTest;% �������л������
%% 1.���ɷ����ź�
fs = 200;  %����Ƶ��
t = 1/fs:1/fs:1;  %ʱ��������
Data = 1*cos(2*pi*200*t)+(2*randn(size(t)));  %���ɷ�������
%% 2.����genFeature�������������ֵ
featureNamesCell = {'max','min','mean','peak','arv','var','std','kurtosis',...
               'skewness','rms','waveformF','peakF','impulseF','clearanceF',...
               'FC','MSF','RMSF','VF','RVF',...
               'SKMean','SKStd','SKSkewness','SKKurtosis'};%Ҫ����������ȡ���������ƣ����Ը���ʵ����Ҫ����ɾ�������µ�����ע��ƴд��ȷ
fea = genFeatureTF(Data,fs,featureNamesCell);  %����genFeature���������������ȡ�����������ֵ�ᱣ����fea�����
                                             %fea�����ĳ��Ⱥ�featureNamesCell��ָ����������һ�£���˳��һһ��Ӧ
                                             %����������ɺ���MATLAB�Ĺ�������˫��fea���������Բ鿴��õľ�����ֵ

% function fea = genFeatureTF(data,fs,featureNamesCell)                                           
% ʱ��Ƶ������㷨���ź�������ȡ����
% ���룺
% data����������ȡ��ʱ���źţ������Ƕ�ά���ݣ�ά��Ϊm*n������mΪ����������nΪÿ�����ݵĳ��ȡ���ÿ������Ϊһ�顣���з��򲻿ɳ���
% fs������Ƶ�ʣ��������ȡƵ��������fsֵ��������Ϊ1
% featureNamesCell�������������ȡ���������ƣ��ñ���Ϊcell���ͣ����а�������������Ϊ�ַ���������������Ҫ���±��б��У�
% Ŀǰ֧�ֵ�������2022.5.23����23�֣���
% max �����ֵ
% min ����Сֵ
% mean ��ƽ��ֵ
% peak �����ֵ
% arv  ������ƽ��ֵ
% var  ������
% std  ����׼��
% kurtosis  ���Ͷ�
% skewness  ��ƫ��
% rms       ��������
% waveformF ����������
% peakF     ����ֵ����
% impulseF  ����������
% clearanceF��ԣ������
% FC������Ƶ��
% MSF������Ƶ��
% RMSF��������Ƶ��
% VF��Ƶ�ʷ���
% RVF��Ƶ�ʱ�׼��
% SKMean�����Ͷȵľ�ֵ
% SKStd�����Ͷȵı�׼��
% SKSkewness�����Ͷȵ�ƫ��
% SKKurtosis�����Ͷȵ��Ͷ�
% 
% �����
% fea������data������ֵ���飬������ֵ˳����featureNamesCellһһ��Ӧ
%% ������������룺
% ���������ĺ����ļ�Ϊp�ļ������Ա����ã����޷��鿴���롣
% �����������ȫ��Ϊm�ļ���m�ļ����Բ鿴Դ�벢�����޸ģ���ͼ��ˮӡ
% �����潫��������¸������͵�������

% �����Ҫ��װ�õĺ�����Դ�룬�����������ӣ������棩��ȡ��
% http://khsci.com/docs/index.php/2021/10/30/genfea/
% ��̲��ף���л֧��~

%% �����������Ҫ���£�
% 20230212 �Ż��˴��룬�����������ȡ���Ͷ���ص��������򲻻��ٽ������Ͷȼ��㣬����˳������Ч�ʡ�
% 20220913 ����Ҫ��������3��������med ����λ����rs ������ֵ��rmsa ��������ֵ��
% 20220520 ����Ҫ���������ĸ������� SKMean�����Ͷȵľ�ֵ��SKStd�����Ͷȵı�׼�SKSkewness�����Ͷȵ�ƫ�ȡ�SKKurtosis�����Ͷȵ��Ͷ�
% 20220302 �Ż��˶�ά������ȡ�Ĳ��ִ���
% 20220224 �޸��˶�ά����������ȡʱ��ȡ�ٲ��������ᱨ����bug
% 20211206 �Ż����ִ��룬���ô�����ά����������ȡ
% 20211204 ����Ҫ��1.�޸���һά���ݵ���ʱΪ�������ᱨ����bug��2.�޸��˵Ͱ汾MATLAB�򿪳��������ַ����������bug��3.����������������û��ѡ�ý����ټ��㣬�����߳�������Ч�ʡ�
% 20211121 �޸��˶�ά����������ȡ�Ĳ���bug
% 20211102 ֧�ֵ����ά����
% 20211031 ��ɳ�����루������������ڰ汾��
function versionTest
% ��ȡMATLAB�汾
versionStr = version('-release');
versionYear = str2double(versionStr(1:4));

% �ж�MATLAB�汾�Ƿ�Ϊ2022a������
if (versionYear < 2022)
    % ����汾���ͣ�������ʾ��
    warndlg('�ô�����ʹ��MATLAB 2022�����°汾����', '�汾����');
end
end