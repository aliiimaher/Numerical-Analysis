% Q3 _ Bisection Method
% Ali Maher
% Mohammad Zahmatkesh
% Alireza Khayami
%%
clearvars
clc
%% data
f = @(x) x.^5-6*x.^4+5;
n=10^(5);                               % check kon ---> number of steps we are going to do the bisection method
root=0;                                 % check kon ---> root tedad rishe haye yafte shode ro neshun mide
v=0:.1:10;                              % check kon ---> it is our calculation range
xroot=0:length(v)-1;                    % check kon ---> matris of all the roots
%% calculate
for j=1:length(v)-1
a=v(j);
b=v(j+1);
[x,e,root,xroot]=Unknown(f,a,b,n,root,xroot);

disp('--------------------')
disp(a) 
disp('      to')
disp(' ')
disp(b)
x
e
end

disp('--------------------')
root
disp('--------------------')
c=xroot;
xroot=1:root;
for t=1:root
   xroot(t)=c(t);
end
for t=1:root
   x=xroot(t)
end
%% work with file
fileroot = fopen('example.txt', 'w');
fprintf(fileroot,'%10.5f',root,xroot);
fclose(fileroot);