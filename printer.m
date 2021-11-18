function str =printer(out,x,edges_ordered,capacities_ordered,capacities,edges)
str=sprintf("Max flow= %d\n",out);
str=str+p("flow",x(1 : length(capacities_ordered)));

% for i = 1 : length(capacities_ordered)-1
%     str= str+sprintf("%d,",round(x(i)));
% end
% str= str+sprintf("%d",round(x(i+1)));
% str=str+sprintf("]\n");
str=str+"edges_ordered=[";
for i = 1 : length(capacities_ordered)-1
    str= str+sprintf("[%d,%d],",round(edges_ordered(i,1)),round(edges_ordered(i,2)));
end
str= str+sprintf("[%d,%d]]\n",round(edges_ordered(i+1,1)),round(edges_ordered(i+1,2)));
str=str+p("capacities_ordered",capacities_ordered);
str=str+p("capacities_original",capacities);

str=str+"edges_original=[";
for i = 1 : length(capacities_ordered)-1
    str= str+sprintf("[%d,%d],",round(edges(i,1)),round(edges(i,2)));
end
str= str+sprintf("[%d,%d]]\n",round(edges_ordered(i+1,1)),round(edges_ordered(i+1,2)));

end
