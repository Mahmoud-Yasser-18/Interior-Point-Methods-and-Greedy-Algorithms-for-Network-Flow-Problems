function [f_min,x,x_iter,s_iter] = central_path(c,A,b,alpha,sigma)
%CENTRAL PATH : The function calculate the optimum point of a linear
%function described by the cost coeffienct cT*x and constains Ax=b , with
%a step size alpha and centering parameter sigma
% The function returns the value of function at the optimal point and the


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

while transpose(x)*s > 0.0001
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
    if any(isnan(delta_y))||any(isnan(delta_x))||any(isnan(delta_s))
        break
    end
    %-----------Calculating the new values of x,y,s--------
    x=x+alpha*delta_x;
    y=y+alpha*delta_y;
    s=s+alpha*delta_s;
    %-----------adding the points to the stack for ploting--------
    x_iter=[x_iter,x];
    s_iter=[s_iter,s];
    f_min=[f_min,sum(c.*x)];

end
end

