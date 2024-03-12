function [child1, child2] = crossover(parent1, parent2, ind_len)
    crossover_point = randi([1, ind_len]);
    child1 = [parent1(1 : crossover_point) parent2(crossover_point + 1 : end)];
    child2 = [parent2(1 : crossover_point) parent1(crossover_point + 1 : end)];
end
