function new_population = get_new_population(prev_population, a, b, ind_len, number_of_ind, number_random_elements)
  [pop_size, ~] = size(prev_population);
  num_copied_ind = ceil(0.1 * pop_size);
  prev_ten_percent = get_prev_ten_percent(prev_population, a, b, ind_len, num_copied_ind);

  number_to_generate = ind_len - ceil(length(prev_population) * 0.1);
  new_population = prev_ten_percent;

  for ii = (num_copied_ind + 1):number_of_ind
    [child1, child2] = get_new_two_ind(prev_population, a, b, number_of_ind, number_random_elements, ind_len, pop_size);
    new_population(ii, :) = child1;
    new_population(ii+1, :) = child2;
  endfor
end;

