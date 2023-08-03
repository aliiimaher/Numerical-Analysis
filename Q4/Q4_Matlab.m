% Q4 _ Root Locating
% Ali Maher
% Mohammad Zahmatkesh
% Alireza Khayami
%%
clear
clc
close
%% Data
f = @(x) sin(31*x) - 2*cos(23*x);
a = [];
b = [];
n = 10000;
x = linspace(-7, 6.5, n);
%% Calulation Part A
for i = 1: n-1  
    if f(x(i)) * f(x(i+1)) < 0  
        a = [a  x(i) ];
        b = [b x(i+1)];        
    elseif f(x(i)) == 0
        a = [a x(i)];
        b = [b x(i)];
    end
end
if f(x(n)) == 0
    a = [a x(n)];
    b = [b x(n)];
end

rootNumber = length(a);
fprintf('Number of roots is: %.0f\n\n', rootNumber);
  
for i = 1: rootNumber
    fprintf('َAnswer Range is from %f to %f \n' , a(i), b(i))
end
%% Calulation Part B
X = [];
for i = 1: rootNumber 
    for j = 1: 10
        c = a(i);
        d = b(i);
        x = (c + d) / 2;
        if c*x < 0
            d = x;
        elseif c*x > 0
            c = x;
        elseif x == 0
            break;
        elseif c == 0
            x = c;
            break;
        end
    end
    X = [X x];
end

disp('Answers: ');
disp(X);