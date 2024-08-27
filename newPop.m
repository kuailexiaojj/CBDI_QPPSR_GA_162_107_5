function pop = newPop(pop,i)

%选择算子产生新种群
pop = selection(pop);

%执行交叉和变异算子
pop = crossover(pop);
pop = mutation(pop);

%适应度评价（计算目标函数值）
pop.solution = pop.individual;
pop.obj = fun(pop.solution);

%随机将子代中某一个个体替换为最优解  即将最优解保存下来
t = ceil(rand*pop.size);
pop.individual(t,:) = pop.bestIndividual(end,:);
pop.solution(t,:) = pop.bestSolution(end,:);
pop.obj(1,t) = pop.perfom(end);

%------------------------------------------------------------
[s,n]=max(pop.obj);%当前种群最优解下标
% m=size(pop.bestSolution,1);
% e=m+1;

%记录最优二进制个体和实数解，以及最佳及平均目标函数值
pop.bestIndividual = pop.individual(n,:);
pop.bestSolution = pop.solution(n,:);
pop.perfom(i) = s;
end