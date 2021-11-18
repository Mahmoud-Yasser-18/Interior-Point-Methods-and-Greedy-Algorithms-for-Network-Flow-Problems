function str =printer_shortest(x,edges_ordered,costs_ordered,costs,edges)
str=p("flow",x(1 : length(costs_ordered)));
% for i = 1 : length(costs_ordered)-1
%     str= str+sprintf("%d,",round(x(i)));
% end
% str= str+sprintf("%d",round(x(i+1)));
% str=str+sprintf("]\n");
str=str+"edges_ordered=[";
for i = 1 : length(costs_ordered)-1
    str= str+sprintf("[%d,%d],",round(edges_ordered(i,1)),round(edges_ordered(i,2)));
end
str= str+sprintf("[%d,%d]]\n",round(edges_ordered(i+1,1)),round(edges_ordered(i+1,2)));
str=str+p("costs_ordered",costs_ordered);
str=str+p("costs_original",costs);

str=str+"edges_original=[";
for i = 1 : length(costs_ordered)-1
    str= str+sprintf("[%d,%d],",round(edges(i,1)),round(edges(i,2)));
end
str= str+sprintf("[%d,%d]]\n",round(edges_ordered(i+1,1)),round(edges_ordered(i+1,2)));
end
