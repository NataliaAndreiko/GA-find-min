
function findMin(a = -1, b = 2, degree_number_of_points = 1, number_of_ind = 20)
  number_of_solutions = (b-a) * 10^degree_number_of_points;
  ind_len = ceil(log2(number_of_solutions));

  prev_population = zeros(number_of_ind, ind_len);

  for ii = 1:length(prev_population)
    prev_population(ii, :) = get_random_individual(ind_len);
  endfor

  [best_binary_string, best_f_value] = evaluation(prev_population, a, b, ind_len);

  iteration_counter = 0; is_changed_counter = 0;
  number_to_copy = length(prev_population) * 0.1;
  while true
    if iteration_counter > 2 || is_changed_counter > 20, break; endif
    iteration_counter += 1;
    prev_ten_percent = get_prev_ten_percent(prev_population, a, b, ind_len);
    population = prev_ten_percent;
    [child1, child2] = get_new_two_ind(prev_population, a, b, number_of_ind, 5, ind_len);

  endwhile
end

function ind = get_random_individual(ind_len)
    ind = randi([0, 1], 1, ind_len);
end


function [child1, child2] = crossover(parent1, parent2, ind_len)
    crossover_point = randi([1, ind_len]);
    child1 = [parent1(1 : crossover_point) parent2(crossover_point + 1 : end)];
    child2 = [parent2(1 : crossover_point) parent1(crossover_point + 1 : end)];
end


function [best_binary_string, best_f_value] = evaluation(population, a, b, n)
  clear best_binary_string;
  clear best_f_value;
  for ii = 1:length(population);
    transformed_population(ii) = bin2dec(num2str(population(ii, :)));
    x(ii) = (((b-a)/(2^n-1))*transformed_population(ii)) + a;
    y_population(ii) = f(x(ii));
  endfor
  best_f_value = min(y_population);
  index_of_best_ind = (find(y_population == best_f_value))(1);
  best_binary_string = population(index_of_best_ind, :)
end;


function prev_ten_percent = get_prev_ten_percent(population, a, b, ind_len)
    number_to_copy = ceil(length(population) * 0.1);
    population_cpy = population;
    clear best_binary_string; clear prev_ten_percent;

    for ii = 1:number_to_copy
      best_binary_string = zeros(1,ind_len);
      [best_binary_string, ~] = evaluation(population_cpy, a, b, ind_len);
      prev_ten_percent(ii, :) = best_binary_string(:);
      index_of_best_ind = find(ismember(population_cpy, best_binary_string, 'rows'));
      population_cpy(index_of_best_ind, :) = [];
    endfor

end;


function y = f(x)
  y = x^2;
end;

function rand_elements = get_random_elements(population, a, b, number_of_ind, number_to_get, ind_len)
  idxs_to_get = randi([1, number_of_ind], 1, number_to_get);
  rand_elements = [];
  jj = 1;
  for ii = idxs_to_get
    rand_elements(jj, :) = population(ii, :);
    jj += 1;
  endfor
end;

function parent = get_new_parent(population, a, b, number_of_ind, number_random_elements, ind_len)
  rand_elements = [];
  rand_elements = get_random_elements(population, a, b, number_of_ind, number_random_elements, ind_len);
  parent = evaluation(population, a, b, number_of_ind);
end;

function [child1, child2] = get_new_two_ind(population, a, b, number_of_ind, number_random_elements, ind_len)
  parent1 = get_new_parent(population, a, b, number_of_ind, number_random_elements, ind_len);
  parent2 = get_new_parent(population, a, b, number_of_ind, number_random_elements, ind_len);

  [child1, child2] = crossover(parent1, parent2, ind_len);

end;


