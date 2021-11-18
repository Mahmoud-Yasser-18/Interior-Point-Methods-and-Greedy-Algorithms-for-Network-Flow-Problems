function [A,b,c,edges_ordered,capacities_ordered]=get_LPP_max_flow(edges,capacities)


m=from_list_to_adj_matrix(edges,capacities);
node_constranis=zeros(length(m),2*length(capacities));
counter=1;
edges_ordered=zeros(length(capacities),2);
for r =1: length(m)
  for c =1: length(m)
    if m(r,c)~=0
      node_constranis(r,counter)=-1;
      node_constranis(c,counter)=1;
      capacities(counter)=m(r,c);
      edges_ordered(counter,1)=r;
      edges_ordered(counter,2)=c;
      counter=counter+1;
    end
  end
end
node_constranis(length(m),:)=-node_constranis(length(m),:)-node_constranis(1,:);
c=node_constranis(1,:)';
node_constranis=node_constranis(2:end,:);
edge_constrains= zeros(length(capacities),2*length(capacities));
for i =0: 2*length(capacities)-1
  edge_constrains(1+mod(i,length(capacities)),i+1)=1; 
end
A=[node_constranis;edge_constrains];
b=[zeros(1,length(m)-1),capacities]';
capacities_ordered=capacities;
end