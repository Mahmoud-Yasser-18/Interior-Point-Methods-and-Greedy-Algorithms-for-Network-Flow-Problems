clear;
clc;
source =[1200,1000,800];
destination=[1100,400,750,750];
costs=[35,30,40,32;37,40,42,25;40,15,20,28];

A=zeros(length(source)+length(destination),length(source)+length(destination)+length(source)*length(destination));
for i =0:length(source)*length(destination)-1
    A(1+mod(i,length(source))+length(destination),i+1)=1;
end
for i =0:length(source)-1
    A(i+1,1+i*length(destination):i*length(destination)+length(destination))=1;
end
% A(1+length(source)*length(destination):length(source)+length(destination)+length(source)*length(destination),1:length(source))=eye(length(source));
A(1:length(source),1+length(source)*length(destination):end-length(destination))=-eye(length(source));
A(1+length(source):end,length(source)+1+length(source)*length(destination):end)=eye(length(destination));
b=[source,destination]';
c=reshape(costs.',1,[])';
c=[c;zeros(length(source)+length(destination),1)];

 [out,x,x_iter,s_iter] = central_path_adaptive(c,A,b,0.5,0.9);
figure;
plot(x_iter(1,:),x_iter(2,:),'k-o')

title('MehrotraPredictorCorrector- Solution Vector')
xlabel('x_1')
ylabel('x_2')
saveas(gcf,'MehrotraPredictorCorrector- Solution Vector.png')


figure;
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('MehrotraPredictorCorrector- Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'MehrotraPredictorCorrector- Complementary condition.png')

figure;
plot([0:length(out)-1],out,'b-*')

title('MehrotraPredictorCorrector- function value at each iteration')
xlabel('iteration')
ylabel('fmax')
saveas(gcf,'MehrotraPredictorCorrector- function value at each iteration.png')


