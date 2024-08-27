function pop = selection(pop)
%选择函数
p = pop.obj/sum(pop.obj);%计算生存概率
pp = cumsum(p);%计算累计概率
for i = 1:pop.size
    r = rand;%产生一个随机数
    for j=1:length(pp)              %遍历累加概率数组，判断那个元素大于随机数r，就选取那个元素进入新种群
         if pp(j)>r                       
                pop.individual(i,:)=pop.individual(j,:);       
                % k(i) = find(pp>=r,1);%随机数落在哪个累积概率区间，即对应的个体被选中，记录下标
         end
            % for j=1:length(pp)
        % if pp(j)>r
                %pop.individual(i,:)=pop.individual(j,:);

                         
    end
%把选中的个体放入新种群
%pop.individual = pop.individual(k,:);
%pop.solution = pop.solution(k,:);
%pop.obj = pop.obj(:,k');
end