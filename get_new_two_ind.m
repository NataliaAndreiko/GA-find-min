function [child1, child2] = get_new_two_ind(population, a, b, number_of_ind, number_random_elements, ind_len, pop_size)
  parent1 = population(randi(pop_size), :);
  parent2 = population(randi(pop_size), :);

  [child1, child2] = crossover(parent1, parent2, ind_len);

  crossover_probability = rand();
  if crossover_probability < 0.9
    [child1, child2] = crossover(parent1, parent2, ind_len);

    mutation_probability1 = rand();
    if mutation_probability1 < 0.1
      child1 = mutation(child1);
    end

    mutation_probability2 = rand();
    if mutation_probability2 < 0.1
      child2 = mutation(child2);
    end
  end
end

