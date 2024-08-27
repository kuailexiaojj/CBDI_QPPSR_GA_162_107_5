tic
clear all
close all

pop.size = 500;%��Ⱥ��ģ
pop.cr = 0.4;%�������
pop.mr = 0.3;%�������
pop.ma = 1;

pop = initialization(pop);%��ʼ����Ⱥ
for i = 1:200 %200
    fprintf('%d\n',i)  %��ʾ��������
    pop=newPop(pop,i);
    %������һ����Ⱥ
    %���»��Ƶ�ֵ��ͼ

% %        CTSR
%        a1=pop.bestSolution(end,1);
%        b1=pop.bestSolution(end,2);
%                                                                                                                                                                                                                        
%        c1=pop.bestSolution(end,3);

%QPPSR
       U0=pop.bestSolution(end,1);
       r=pop.bestSolution(end,2);
       m=pop.bestSolution(end,3);
       p=pop.bestSolution(end,4);
       e=pop.bestSolution(end,5);

  % %        CQSR
  %      a3=pop.bestSolution(end,1);
  %      b3=pop.bestSolution(end,2);
  %      c3=pop.bestSolution(end,3);     
  %      h1=pop.bestSolution(end,4);

end
%% ����������
plot(1:i,pop.perfom-0.02,'r','LineWidth',1.2);
title('Evolutionary process');
xlabel('Number of iterations');
ylabel('Objective function');
%% ��ʾ�Ż����
disp(['���Ž⣺',num2str(pop.perfom(end))])
disp(['���Ų�����',num2str(pop.bestIndividual)])
toc