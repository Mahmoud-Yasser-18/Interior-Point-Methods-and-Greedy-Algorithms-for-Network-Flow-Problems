function [A,b,c,edges_ordered,costs_ordered]=get_LPP_shortest_path(edges,costs)

m=from_list_to_adj_matrix(edges,costs);
node_constranis=zeros(length(m),length(costs));
counter=1;
edges_ordered=zeros(length(costs),2);
for r =1: length(m)
  for c =1: length(m)
    if m(r,c)~=0
      node_constranis(r,counter)=-1;
      node_constranis(c,counter)=1;
      costs(counter)=m(r,c);
      edges_ordered(counter,1)=r;
      edges_ordered(counter,2)=c;
      counter=counter+1;
    end
  end
end
c=costs';
edge_constrains= zeros(length(costs),2*length(costs));
for i =0: 2*length(costs)-1
  edge_constrains(1+mod(i,length(costs)),i+1)=1; 
end
A=node_constranis;
b=zeros(length(m),1);
b(1)=-1;
b(end)=1;
costs_ordered=costs;
end
