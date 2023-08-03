% Q10 _ Laplace Solving
% Ali Maher
% Mohammad Zahmatkesh
% Alireza Khayami
%%
clear
close
clc
%% Data
h = 0.01 ;
k = 0.01 ;
h_end = 10 ;
v_end = 8;
Row_Dots = int8(h_end / h + 1) ;
Vec_Dots = int8(v_end / k + 1) ;
V = zeros(Vec_Dots,Row_Dots) ;
A = zeros((Row_Dots-2)*(Vec_Dots-2)) ;
b = zeros((Row_Dots-2)*(Vec_Dots-2),1) ;
for r = 1:Row_Dots
    for v = 1:Vec_Dots
        % Dir Conditions
        x = (double(r-1))*h ;
        y = (double(v-1))*k ;
        if x == 0
            V(v,r) = y ;
        end
        if x == h_end
            V(v,r) = 3*y ;
        end
        if y == 0
            V(v,r) = 6 ;
        end
        if y == v_end
            V(v,r) = 5*x+2 ;
        end
    end
end
for i = 2:Row_Dots-3
    j = 1 ;
    n0 = (j-1)*(Row_Dots-2)+i ;
    n1 = ((j+1)-1)*(Row_Dots-2)+i ;
    n3 = (j-1)*(Row_Dots-2)+(i+1) ;
    n4 = (j-1)*(Row_Dots-2)+(i-1) ;
    A(n0,n0) = -4 ;
    A(n0,n1) = 1;
    A(n0,n3) = 1;
    A(n0,n4) = 1;
    b(n0) = -1*V(1,i) ;
    j = Vec_Dots-2 ;
    n0 = (j-1)*(Row_Dots-2)+i ;
    n2 = ((j-1)-1)*(Row_Dots-2)+i ;
    n3 = (j-1)*(Row_Dots-2)+(i+1) ;
    n4 = (j-1)*(Row_Dots-2)+(i-1) ;
    A(n0,n0) = -4 ;
    A(n0,n2) = 1;
    A(n0,n3) = 1;
    A(n0,n4) = 1;
    b(n0) = -1*V(Vec_Dots,i) ;
end
for j = 2:Vec_Dots-3
    i = 1 ;
    n0 = (j-1)*(Row_Dots-2)+i ;
    n1 = ((j+1)-1)*(Row_Dots-2)+i ;
    n2 = ((j-1)-1)*(Row_Dots-2)+i ;
    n3 = (j-1)*(Row_Dots-2)+(i+1) ;
    A(n0,n0) = -4 ;
    A(n0,n1) = 1;
    A(n0,n2) = 1;
    A(n0,n3) = 1;
    b(n0) = -1*V(j,1) ;
    i = Row_Dots-1 ;
    n0 = (j-1)*(Row_Dots-2)+i ;
    n1 = ((j+1)-1)*(Row_Dots-2)+i ;
    n2 = ((j-1)-1)*(Row_Dots-2)+i ;
    n4 = (j-1)*(Row_Dots-2)+(i-1) ;
    A(n0,n0) = -4 ;
    A(n0,n1) = 1;
    A(n0,n2) = 1;
    A(n0,n4) = 1;
    b(n0) = -1*V(j,Row_Dots) ;
end
for i = 2:Row_Dots-3
    for j = 2:Vec_Dots-3
        n0 = (j-1)*(Row_Dots-2)+i ;
        n1 = ((j+1)-1)*(Row_Dots-2)+i ;
        n2 = ((j-1)-1)*(Row_Dots-2)+i ;
        n3 = (j-1)*(Row_Dots-2)+(i+1) ;
        n4 = (j-1)*(Row_Dots-2)+(i-1) ;
        A(n0,n0) = -4 ;
        A(n0,n1) = 1;
        A(n0,n2) = 1;
        A(n0,n3) = 1;
        A(n0,n4) = 1;
    end
end
% Corner top-left
j = 1 ;
i = 1 ;
n0 = (j-1)*(Row_Dots-2)+i ;
n1 = ((j+1)-1)*(Row_Dots-2)+i ;
n3 = (j-1)*(Row_Dots-2)+(i+1) ;
A(n0,n0) = -4 ;
A(n0,n1) = 1;
A(n0,n3) = 1;
b(n0) = -1*(V(1,2)+V(2,1)) ;
% Corner top-right
j = 1 ;
i = Row_Dots - 2 ;
n0 = (j-1)*(Row_Dots-2)+i ;
n1 = ((j+1)-1)*(Row_Dots-2)+i ;
n4 = (j-1)*(Row_Dots-2)+(i-1) ;
A(n0,n0) = -4 ;
A(n0,n1) = 1;
A(n0,n4) = 1;
b(n0) = -1*(V(1,Row_Dots-1)+V(2,Row_Dots)) ;
% Corner down-left
j = Vec_Dots - 2;
i = 1 ;
n0 = (j-1)*(Row_Dots-2)+i ;
n2 = ((j-1)-1)*(Row_Dots-2)+i ;
n3 = (j-1)*(Row_Dots-2)+(i+1) ;
A(n0,n0) = -4 ;
A(n0,n2) = 1;
A(n0,n3) = 1;
b(n0) = -1*(V(Vec_Dots,2)+V(Vec_Dots-1,1)) ;
% Corner down-right 
j = Vec_Dots - 2 ;
i = Row_Dots - 2 ;
n0 = (j-1)*(Row_Dots-2)+i ;
n2 = ((j-1)-1)*(Row_Dots-2)+i ;
n4 = (j-1)*(Row_Dots-2)+(i-1) ;
A(n0,n0) = -4 ;
A(n0,n2) = 1;
A(n0,n4) = 1;
b(n0) = -1*(V(Vec_Dots,Row_Dots-1)+V(Vec_Dots-1,Row_Dots)) ;
%%
A;
b;
res = A\b;
%% try one for Graphic
%y = linspace(0, 0.01, 8);
%a=3;b=2;c=6;d=2;
%x = linspace(0, 0.01, 10);
%[y2, x2] = meshgrid(y, x);
%z2=(1/c).*(d+(a.*x2)+(b.*y2));% ax+by+cz+d plane
%surf( x2,y2,b );
%% try two for Graphic
% x = 0:0.01:10;
x = linspace(0, 10, 127);
% y = 0:0.01:8;
y = linspace(0, 8, 127);
[X,Y] = meshgrid(x,y);
%Z = 2*sin(X.*Y);
mesh(X,Y,A)
grid on
hold on