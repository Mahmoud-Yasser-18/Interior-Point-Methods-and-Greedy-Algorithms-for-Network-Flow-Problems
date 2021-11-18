clear;
clc;
alpha=0.9;
sigma=0.5;
% edges=[
%     1,2;
%     1,3;
%     2,4;
%     2,7;
%     3,2;
%     3,5;
%     4,5;
%     4,7;
%     5,6;
%     6,7;
%     ];
% costs=[15,10,6,17,8,4,4,5,2,6];
% edges =[
% 1 2 ;
% 1 3 ;
% 
% 2 3 ;
% 2 4 ;
% 
% 3 2 ;
% 3 5 ;
% 
% 4 3 ;
% 4 6 ;
% 
% 5 4 ;
% 5 6 ];
% costs=[16,13,10,12,4,14,9,20,7,4];
edges =[1 2 ;
1 3 ;
1 4 ;
2 7 ;
3 2 ;
3 6 ;
4 3 ;
4 5 ;
5 8 ;
6 2 ;
6 5 ;
6 8 ;
7 6 ;
7 8 ]
costs=[3,2,3,5,1,1,2,2,5,4,2,1,2,3];

[A,b,c,edges_ordered,costs_ordered]=get_LPP_shortest_path(edges,costs);
[out,x,x_iter,s_iter] = MehrotraPredictorCorrector(c,A,b,0.9);
figure;
plot([0:length(out)-1],out,'-x')
title('Function value at each iteration')
xlabel('iteration')
ylabel('f_{min}')
saveas(gcf,'function value at each iteration.png')

figure;
L={};
for i = 1:length(costs)
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
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('MehrotraPredictorCorrector- Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'MehrotraPredictorCorrector- Complementary condition.png')


str=printer(round(out(end)),x,edges_ordered,costs_ordered,costs,edges);
disp(str)

