function matrix=from_list_to_adj_matrix(edges,capacity)
nodes_numbers=max(max(edges));
matrix= zeros(nodes_numbers,nodes_numbers);
for i=1:length(capacity)
    matrix(edges(i,1),edges(i,2))=capacity(i);
end