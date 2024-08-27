function pop = initialization(pop)
%种群初始化

pop.individual = rand(pop.size,5);%3,4,5
pop.individual(:,1) = pop.individual(:,1)*5+0.01;%CTSR:[0.01,5.01],[0.01,2.01]
pop.individual(:,2) = pop.individual(:,2)*100+0.01;%CTSR:[0.01,5.01],[0.1,2.1]
pop.individual(:,3) = pop.individual(:,3)*5+0.01;%CTSR:[0.01,5.01],[0.01,1.01]
pop.individual(:,4) = pop.individual(:,4)*5+0.01;%lambda:[0.01,2.01]
  pop.individual(:,5) = pop.individual(:,5)*5+0.01;
 % pop.individual(:,6) = pop.individual(:,6)*0.5+0.01;
pop.solution = pop.individual;%种群的个体即为解
pop.obj = fun(pop.solution);%计算目标函数值

%------------------------------------------------------------

n = find(pop.obj == max(pop.obj),1);%当前种群最优解下标

%记录最优二进制个体和实数解，以及最佳及平均目标函数值
pop.bestIndividual = pop.individual(n,:);
pop.bestSolution = pop.solution(n,:);
pop.perfom(1) = max(pop.obj);
end
