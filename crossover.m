function pop = crossover(pop)
%交叉算子
for i = 1:pop.size/2%遍历每一对个体
    if rand<pop.cr%依交叉概率执行交叉操作
        %提取待交叉个体
        a1 = pop.individual(2*(i-1)+1,:);
        a2 = pop.individual(2*i,:);

        aa = rand;

        pop.individual(2*(i-1)+1,:) = aa*a1+(1-aa)*a2;
        pop.individual(2*i,:) = aa*a2+(1-aa)*a1;

    end
end

end