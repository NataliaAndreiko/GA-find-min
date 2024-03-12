function prev_ten_percent = get_prev_ten_percent(population, a, b, ind_len, num_copied_ind)
    number_to_copy = ceil(num_copied_ind);
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
