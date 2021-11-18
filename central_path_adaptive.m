function [f_min,x,x_iter,s_iter] = central_path_adaptive(c,A,b,sigma,eita)
%CENTRAL PATH ADAPTIVE STEP LENGTH: The function calculate the optimum point of a linear
%function described by the cost coeffienct cT*x and constains Ax=b ,centering parameter sigma
% with an adaptive step size at each iteration 
%The function returns the value of function at the optimal point and the
% corresponing solution vector x


%---------Finding Initial feasable point-------------------
%-solving the least square problem Ax=b
x_telda=transpose(A)*((A*transpose(A))\b);
%-solving for AA_transpose_y=Ac
y_telda= (A*transpose(A))\A*c;
%-solving for s = c-A_transpose_y
s_telda=c-transpose(A)*y_telda;
%---Making sure that the initial point is positive---
dx=max(-3/2*min(x_telda),0);
ds=max(-3/2*min(s_telda),0);
x_bar=x_telda+dx;
s_bar=s_telda+ds;
dx=0.5*sum(x_bar.*s_bar)/sum(s_bar);
ds=0.5*sum(x_bar.*s_bar)/sum(x_bar);
x=x_bar+dx;
s=s_bar+ds;
y=y_telda;


%---------------Starting the Algorithm-------------
x_iter=[x];
s_iter=[s];
f_min=[sum(c.*x)];

while transpose(x)*s > 0.01
    %---------Avoiding being too close to the boundarys-----
    x(x<0.001)=0.001; %--finding the values less than 0.001 and make it 0.001 
    s(s<0.001)=0.001;%--finding the values less than 0.001 and make it 0.001 
    
    u=transpose(x)*s /length(x);
    %-----------Calculating rc,rb,rXS---------
    rc=transpose(A)*y+s-c;
    rb=A*x-b;
    rXS=s.*x-u*sigma;
    %-----------Calculating the deltas--------
    delta_y=((A*(((1./s).*x).*transpose(A))))\(-rb-A*(((1./s).*x).*rc)+A*((1./s).*rXS));
    delta_s=-rc-transpose(A)*delta_y;
    delta_x=-(1./s).*rXS-((1./s).*x).*delta_s;
    if any(delta_y ==Inf)||any(delta_y ==-Inf)||any(delta_s ==Inf)||any(delta_s ==-Inf)||any(delta_x ==Inf)||any(delta_x ==-Inf)
        break
    end

    %-----------Calculating new step length--------
    alpha_pri=min([-(x(delta_x<0))./(delta_x(delta_x<0))*eita;1]);
    alpha_dual=min([-(s(delta_s<0))./(delta_s(delta_s<0))*eita;1]);
    %-----------Calculating the new values of x,y,s--------
    x=x+alpha_pri*delta_x;
    y=y+alpha_dual*delta_y;
    s=s+alpha_dual*delta_s;
    %-----------adding the points to the stack for ploting--------
    x_iter=[x_iter,x];
    s_iter=[s_iter,s];
    f_min=[f_min,sum(c.*x)];
    if abs(abs(f_min(length(f_min)))-abs(f_min(length(f_min)-1)))<0.01 
        break;
    end

end
end

