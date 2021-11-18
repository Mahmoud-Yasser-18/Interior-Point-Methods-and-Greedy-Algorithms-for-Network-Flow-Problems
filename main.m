%Ploting
clear;
clc;
c= [-1.1;-1;0];
A=[1,1,1];
b=[6];
alpha=0.9;
sigma=0.5;



[out,x,x_iter,s_iter] = central_path(c,A,b,alpha,sigma);
figure;
plot(x_iter(1,:),x_iter(2,:),'k-o')

title('Central Path - Solution Vector')
xlabel('x_1')
ylabel('x_2')
saveas(gcf,'Central Path - Solution Vector.png')


figure;
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('Central Path - Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'Central Path - Complementary condition.png')

figure;
plot([0:length(out)-1],out,'b-*')

title('Central Path - function value at each iteration')
xlabel('iteration')
ylabel('fmin')
saveas(gcf,'Central Path - function value at each iteration.png')



[out,x,x_iter,s_iter] = central_path_adaptive(c,A,b,sigma,0.9);
figure;
plot(x_iter(1,:),x_iter(2,:),'k-o')

title('Central Path Adaptive step- Solution Vector')
xlabel('x_1')
ylabel('x_2')
saveas(gcf,'Central Path Adaptive step- Solution.png')


figure;
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('Central Path Adaptive step- Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'Central Path Adaptive step- Complementary condition.png')

figure;
plot([0:length(out)-1],out,'b-*')

title('Central Path Adaptive step- function value at each iteration')
xlabel('iteration')
ylabel('fmin')
saveas(gcf,'Central Path Adaptive step- function value at each iteration.png')

[out,x,x_iter,s_iter] = MehrotraPredictorCorrector(c,A,b,0.9);
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
ylabel('fmin')
saveas(gcf,'MehrotraPredictorCorrector- function value at each iteration.png')
%%
clear;
clc;
c= [-20;-30;0;0];
A=[2,1,1,0;1, 3, 0, 1];
b=[8;8];
alpha=0.9;
sigma=0.5;


[out,x,x_iter,s_iter] = central_path(c,A,b,alpha,sigma);
figure;
plot(x_iter(1,:),x_iter(2,:),'k-o')

title('Central Path - Solution Vector')
xlabel('x_1')
ylabel('x_2')
saveas(gcf,'Central Path - Solution Vector.png')


figure;
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('Central Path - Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'Central Path - Complementary condition.png')

figure;
plot([0:length(out)-1],out,'b-*')

title('Central Path - function value at each iteration')
xlabel('iteration')
ylabel('fmin')
saveas(gcf,'Central Path - function value at each iteration.png')



[out,x,x_iter,s_iter] = central_path_adaptive(c,A,b,sigma,0.9);
figure;
plot(x_iter(1,:),x_iter(2,:),'k-o')

title('Central Path Adaptive step- Solution Vector')
xlabel('x_1')
ylabel('x_2')
saveas(gcf,'Central Path Adaptive step- Solution.png')


figure;
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('Central Path Adaptive step- Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'Central Path Adaptive step- Complementary condition.png')

figure;
plot([0:length(out)-1],out,'b-*')

title('Central Path Adaptive step- function value at each iteration')
xlabel('iteration')
ylabel('fmin')
saveas(gcf,'Central Path Adaptive step- function value at each iteration.png')

[out,x,x_iter,s_iter] = MehrotraPredictorCorrector(c,A,b,0.9);
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
ylabel('fmin')
saveas(gcf,'MehrotraPredictorCorrector- function value at each iteration.png')
%%
clear;
clc;
c= [4;1;0;0];
A=[3,1,0,0;4, 3, -1, 0;1,2,0,1];
b=[3;6;4];
alpha=0.5;
sigma=0.5;

[out,x,x_iter,s_iter] = central_path(c,A,b,alpha,sigma);
figure;
plot(x_iter(1,:),x_iter(2,:),'k-o')

title('Central Path - Solution Vector')
xlabel('x_1')
ylabel('x_2')
saveas(gcf,'Central Path - Solution Vector.png')


figure;
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('Central Path - Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'Central Path - Complementary condition.png')

figure;
plot([0:length(out)-1],out,'b-*')

title('Central Path - function value at each iteration')
xlabel('iteration')
ylabel('fmin')
saveas(gcf,'Central Path - function value at each iteration.png')



[out,x,x_iter,s_iter] = central_path_adaptive(c,A,b,sigma,0.9);
figure;
plot(x_iter(1,:),x_iter(2,:),'k-o')

title('Central Path Adaptive step- Solution Vector')
xlabel('x_1')
ylabel('x_2')
saveas(gcf,'Central Path Adaptive step- Solution.png')


figure;
plot(x_iter(1,:).*s_iter(1,:),x_iter(2,:).*s_iter(2,:),'r-^')
title('Central Path Adaptive step- Complementary condition')
xlabel('x_1S_1')
ylabel('x_2S_2')
saveas(gcf,'Central Path Adaptive step- Complementary condition.png')

figure;
plot([0:length(out)-1],out,'b-*')

title('Central Path Adaptive step- function value at each iteration')
xlabel('iteration')
ylabel('fmin')
saveas(gcf,'Central Path Adaptive step- function value at each iteration.png')

[out,x,x_iter,s_iter] = MehrotraPredictorCorrector(c,A,b,0.9);
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
ylabel('fmin')
saveas(gcf,'MehrotraPredictorCorrector- function value at each iteration.png')
