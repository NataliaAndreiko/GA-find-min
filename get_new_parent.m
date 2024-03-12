function parent = get_new_parent(population, a, b, number_of_ind, number_random_elements, ind_len)
  rand_elements = [];
  rand_elements = get_random_elements(population, a, b, number_of_ind, number_random_elements, ind_len);
  parent = evaluation(population, a, b, number_of_ind);
end;
