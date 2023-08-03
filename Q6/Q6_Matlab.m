% Q6 _ Power Method and Inverse Power Method
% Ali Maher
% Mohammad Zahmatkesh
% Ali Reza Khayami
%%
clc
close
clear
%% Data
disp('Matris: ');
A = [9 -3 -6; 2 8 2; -5 10 7]       % our main matris
disp('Initial Guess: ');
x = [1; 1; 1]                       % our initial guess
e = 0;                              % error amount
%% Calculation
% this part is for lambda_max > 0 _ Power Method
for i = 1:10000
    x = A * x;
    xTemp = abs(x);
    eTemp = max(xTemp);
    for j = 1:3
        if eTemp == abs(x(j))
            e = x(j);
        end
    end
    x = x / e;
end
fprintf('The biggest eigen value for lambda_max > 0 _ Power Method is: %4.4f \n', e)

% this part is for lambda_max < 0 _ Power Method
for i = 1:10000
    x = A * x;
    xTemp = abs(x);
    eTemp = min(xTemp);
    for j = 1:3
        if eTemp == abs(x(j))
            e = x(j);
        end
    end
    x = x / e;
end
fprintf('The biggest eigen value for lambda_max < 0 _ Power Method is: %4.4f \n', e)

% this part is for lambda_max > 0 _ Inverse Power Method
AI = inv(A);
x = [1; 1; 1];
e = 0;
for i = 1:10000
    x = AI * x;
    xTemp = abs(x);
    eTemp = max(xTemp);
    for j = 1:3
        if eTemp == abs(x(j))
            e = x(j);
        end
    end
    x = x / e;
end
e = 1 / e;
fprintf('The smallest eigen value for lambda_max > 0 _ Inverse Power Method is: %4.4f \n', e)

% this part is for lambda_max < 0 _ Inverse Power Method
AI = inv(A);
x = [1; 1; 1];
e = 0;
for i = 1:10000
    x = AI * x;
    xTemp = abs(x);
    eTemp = min(xTemp);
    for j = 1:3
        if eTemp == abs(x(j))
            e = x(j);
        end
    end
    x = x / e;
end
e = 1 / e;
fprintf('The smallest eigen value for lambda_max < 0 _ Inverse Power Method is: %4.4f \n', e)