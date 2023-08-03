function [x,e,root,xroot]=Unknown(f,a,b,n,root,xroot)
    if f(a)*f(b)>0
    x='invalid';
    e='invalid';
    else if f(a)==0
            root=root+1;
    x=a;
    e=0;
    xroot(root)=x;
    
else if f(b)==0
        root=root+1;
        x=b;
        e=0;
        xroot(root)=x;
else
    root=root+1;
for i=1:n
    x=(a+b)/2;
    if f(x)==0
        e=0;
        break;
    end
    if f(x)*f(a)<0
        b=x;
    else 
        a=x;
end

x=(a+b)/2;
    e=(b-a)/2;
 xroot(root)=x;
end
end 
    end
    if root >1
    if xroot(root)==xroot(root-1) 
        root=root-1;
    end
    end
end