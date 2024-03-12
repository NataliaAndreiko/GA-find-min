function rand_elements = get_random_elements(population, a, b, number_of_ind, number_to_get, ind_len)
  idxs_to_get = randi([1, number_of_ind], 1, number_to_get);
  rand_elements = [];
  jj = 1;
  for ii = idxs_to_get
    rand_elements(jj, :) = population(ii, :);
    jj += 1;
  endfor
end;
