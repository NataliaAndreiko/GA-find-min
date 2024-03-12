function child1 = mutation(child1)
    index_to_change1 = randi([1, length(child1)]);
    child1(index_to_change1) = ~child1(index_to_change1);
end
