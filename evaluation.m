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
  best_binary_string = population(index_of_best_ind, :);
end;
