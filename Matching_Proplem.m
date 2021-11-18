% Matching Proplem 
clc;
clear;
source_capabilities=[1,2,3,1,2  ];
source_capabilities=[1,1,1,1,1];
target_capabilities=[5,1,2,1,3];
target_capabilities=[1,1,1,1,1];
edges =[1,7;1,8;2,7;2,8;2,9;3,6;3,8;3,10;4,8;5,8;5,9;5,10];
edges_capabilities=ones(1,12);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
edges_middle= edges+1;
edges_source=[ones(length(source_capabilities),1),unique(edges_middle(:,1),'stable')];
edges_target=[unique(edges_middle(:,2)),(1+max(max(edges_middle)))*ones(length(target_capabilities),1)];
All_edges=[edges_source;edges_middle;edges_target];
graph_capabilities=[source_capabilities,edges_capabilities,target_capabilities];


[A,b,c,edges_ordered,capacities_ordered]=get_LPP_max_flow(All_edges,graph_capabilities);
sigma=0.5;
[out,x,x_iter,s_iter,y_iter] =  MehrotraPredictorCorrector(c,A,b,0.9);
out=-out;
figure;
plot([0:length(out)-1],out,'-x')
title('Function value at each iteration')
xlabel('iteration')
ylabel('f_{max}')
saveas(gcf,'function value at each iteration.png')

figure;
L={};
for i = 1+length(source_capabilities):length(capacities_ordered)-length(target_capabilities)
plot([0:length(x_iter(i,:))-1],x_iter(i,:),'-x')
L{end+1}=sprintf('edge %d -> %d',All_edges(i,1),All_edges(i,2));
hold on;
end
legend(L)
hold off;
title('Evolution of edges flow (Mehrotra)')
xlabel('Iteration')
ylabel('Edge Flow')
saveas(gcf,'Evolution of edges flow (Mehrotra).png')
figure;
L={}
for i = length(source_capabilities)+length(capacities_ordered)+1:2*length(capacities_ordered)-length(target_capabilities)
plot([0:length(x_iter(i,:))-1],x_iter(i,:),'-x')
L{end+1}=sprintf('edge %d -> %d',All_edges(i-length(capacities_ordered),1),All_edges(i-length(capacities_ordered),2));
hold on;
end
legend(L)
hold off;
title('Evolution of residual flow (Mehrotra)')
xlabel('Iteration')
ylabel('Edge Flow')
saveas(gcf,'Evolution of residual flow (Mehrotra).png')

figure;
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('MehrotraPredictorCorrector- Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'MehrotraPredictorCorrector- Complementary condition.png')


str=printer(round(out(end)),x,edges_ordered,capacities_ordered,capacities_ordered,edges_ordered);
disp(str)


