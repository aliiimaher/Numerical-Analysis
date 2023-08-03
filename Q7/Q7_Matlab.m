% Q7 _ Simpson, Diffrential, Integtal
% Ali Maher
% Mohammad Zahmatkesh
% Alireza Khayami
%%
clear
close
clc
%% Get data from file
file = fopen('deta.txt','r');
data = fscanf(file,'%f');
fclose(file);
x = [];
y = [];
n = size(data);
n = n(1);
i = 1;
while i<=n
    x = [x data(i)];
    i = i + 1;
    y = [y data(i)];
    i = i + 1;
end
clear data, clear file;
%% Calculate Part 1
% odd index
oddItemSum = 0;
for i = 2: 2: n/2
    oddItemSum = oddItemSum + y(i) * 4;
end

% even index
evenItemSum = 0;
for i = 3: 2: (n/2)-1
    evenItemSum = evenItemSum + y(i) * 2;
end

% first and last index + totalSum
totalSum = 0;
totalSum = oddItemSum + evenItemSum + y(1) + y(n/2);

% last calculate
disp('Answer for part A is:')
result = ((x(n/2) - x(1)) * totalSum / (3 * n/2))
%% Calculate Part 2
fpx = [];
for i = 2: n/2 - 1
   fpx = [fpx (y(i+1) - y(i-1)) / (x(i+1) - x(i-1))];
end
disp('Answer for part B is:')
fpx
subplot(1, 2, 1)
plot(x(2): 0.001: x(n/2 - 1), fpx)
legend('Centeral Difference')
xlabel('x')
ylabel('fpx')
%% Calculate Part 3
fppx = [];
for i = 4: 9990            % 5 to 9991
   fppx = [fppx (fpx(i+1)-fpx(i-1))/(x(i+2)-x(i))];
end
disp('Answer for part C is:')
fppx
subplot(1, 2, 2)
plot(x(4): 0.001: x(9990), fppx)
legend('Seconed Order Derivative')
xlabel('x')
ylabel('fppx')