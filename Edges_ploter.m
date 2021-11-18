%%
clc;
clear;
alpha=0.9;
sigma=0.5;
% edges =[1 2 ;1 3 ;2 3 ;2 4 ;3 2 ;3 5 ;4 3 ;4 6 ;5 4 ;5 6 ];
% capacities=[16,13,10,12,4,14,9,20,7,4];
edges=[1 2 ;1 3 ;2 4 ;3 4 ;3 5 ;5 6 ;4 7 ;6 7 ];
capacities=[3,1,3,5,4,2,5,3];
% 
% edges =[1 2 ;
% 1 3 ;
% 1 4 ;
% 2 7 ;
% 3 2 ;
% 3 6 ;
% 4 3 ;
% 4 5 ;
% 5 8 ;
% 6 2 ;
% 6 5 ;
% 6 8 ;
% 7 6 ;
% 7 8 ]
% capacities=[3,2,3,5,1,1,2,2,5,4,2,1,2,3];
[A,b,c,edges_ordered,capacities_ordered]=get_LPP_max_flow(edges,capacities);
[out,x,x_iter,s_iter,y_iter] =  MehrotraPredictorCorrector(c,A,b,0.9);
out=-out;
figure;
L={};
for i = 1:length(capacities)
plot([0:length(x_iter(i,:))-1],x_iter(i,:),'-x')
L{end+1}=sprintf('edge %d -> %d',edges_ordered(i,1),edges_ordered(i,2));
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
for i = length(capacities)+1:2*length(capacities)
plot([0:length(x_iter(i,:))-1],x_iter(i,:),'-x')
L{end+1}=sprintf('edge %d -> %d',edges_ordered(i-length(capacities),1),edges_ordered(i-length(capacities),2));
hold on;
end
legend(L)
hold off;
title('Evolution of residual flow (Mehrotra)')
xlabel('Iteration')
ylabel('Edge Flow')
saveas(gcf,'Evolution of residual flow (Mehrotra).png')