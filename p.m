
function s=p(name,array)
    s=sprintf("%s=[",name);
    for i = 1 : length(array)-1
        s= s+sprintf("%d,",round(array(i)));
    end
    s= s+sprintf("%d",round(array(i+1)));
    s=s+sprintf("]\n");
end 

