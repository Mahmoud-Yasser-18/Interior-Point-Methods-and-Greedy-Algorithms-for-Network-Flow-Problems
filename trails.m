clear;
clc;
c= [-20;-30;0;0];
A=[2,1,1,0;1, 3, 0, 1];
b=[8;8];
alpha=0.0001;
sigma=0.5;
eita=0.9;



x_telda=transpose(A)*((A*transpose(A))\b);
y_telda= (A*transpose(A))\A*c;
s_telda=c-transpose(A)*y_telda;
dx=max(-3/2*min(x_telda),0);
ds=max(-3/2*min(s_telda),0);
x_bar=x_telda+dx;
s_bar=s_telda+ds;
dx=0.5*sum(x_bar.*s_bar)/sum(s_bar);
ds=0.5*sum(x_bar.*s_bar)/sum(x_bar);
x=x_bar+dx;
s=s_bar+ds;
y=y_telda;
x_iter=[x];
s_iter=[s];
delta_xs=[x];
delta_ss=[x];
alphas_pri=[0];
alphas_dual=[0];
while transpose(x)*s > 0.01
    u=transpose(x)*s /length(x);
    rc=transpose(A)*y+s-c;
    rb=A*x-b;
    rXS=s.*x+u*sigma;
    delta_y=((A*(((1./s).*x).*transpose(A))))\(-rb-A*(((1./s).*x).*rc)+A*((1./s).*rXS));
    delta_s=-rc-transpose(A)*delta_y;
    delta_x=-(1./s).*rXS-((1./s).*x).*delta_s;
    delta_xs=[delta_xs,delta_x];
    delta_ss=[delta_ss,delta_s];
    alpha_pri=min([-(x(delta_x<0))./(delta_x(delta_x<0))*eita;1]);
    alpha_dual=min([-(s(delta_s<0))./(delta_s(delta_s<0))*eita;1]);
    alphas_pri=[alphas_pri,alpha_pri];
    alphas_dual=[alphas_dual,alpha_dual];
%     alpha_pri_=min(1,eita*alpha_pri);
%     alpha_dual_=min(1,eita*alpha_dual);
    x=x+alpha_pri*delta_x;
    y=y+alpha_dual*delta_y;
    s=s+alpha_dual*delta_s;
    x_iter=[x_iter,x];
    s_iter=[s_iter,s];
    x(x<0.01)=0.01;
    s(s<0.01)=0.01;
end
out=sum(c.*x);

