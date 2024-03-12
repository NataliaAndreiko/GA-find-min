clc
a = -1;
b = 2;
degree_number_of_points = 3;
number_of_ind = 100;
number_random_elements = 5;

number_of_solutions = (b-a) * 10^degree_number_of_points;
ind_len = ceil(log2(number_of_solutions));


prev_population = zeros(number_of_ind, ind_len);

for ii = 1:length(prev_population)
    prev_population(ii, :) = get_random_individual(ind_len);
endfor




[prev_best_binary_string, prev_best_f_value] = evaluation(prev_population, a, b, ind_len);


iteration_counter = 0; is_changed_counter = 0;
number_to_copy = length(prev_population) * 0.1;

prev_population;

while (iteration_counter < 1000 && is_changed_counter <20)
    iteration_counter += 1
    new_population = get_new_population(prev_population, a, b, ind_len, number_of_ind, number_random_elements);
    [new_best_binary_string, new_best_f_value] = evaluation(new_population, a, b, ind_len)
    if (abs(new_best_f_value - prev_best_f_value) < 1e-10)
      is_changed_counter += 1
    endif


    prev_best_f_value = new_best_f_value;
    prev_population = new_population;
    prev_best_binary_string = new_best_binary_string;
endwhile


