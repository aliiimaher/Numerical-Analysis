% Q9 _ RK4 for Second Derivation ODE
% Ali Maher
% Mohammad Zahmatkesh
% Alireza Khayami
%%
clear;
close;   
clc;
%% Data
f = @(x, y, z) z;
g = @(x, y, z) (x.^2)*y -4*z +(x.^4)*(log(x));
n = 100;
h = 0.06;
x = 2;
y = 1;
z = 1;
X = [x];
Y = [y];
Z = [z];
%% Calculation
for i = 1:n
    k1 = h * f(x, y, z);
    l1 = h * g(x, y, z);

    k2 = h * f(x + h/2, y + k1/2, z + l1/2);
    l2 = h * g(x + h/2, y + k1/2, z + l1/2);

    k3 = h * f(x + h/2, y + k2/2, z + l2/2);
    l3 = h * g(x + h/2, y + k2/2, z + l2/2);

    k4 = h * f(x + h, y + k3, z + l3);
    l4 = h * g(x + h, y + k3, z + l3);

    
    y = y + 1/6 * (k1 + 2*k2 + 2*k3 + k4);
    Y = [Y;y];

    z = z + 1/6 * (l1 + 2*l2 + 2*l3 + l4);
    Z = [Z;z];

    x = i * h + 2;
    X = [X;x];

end
%% Result
Y
Z
X
%% Plots
subplot(1, 2, 1)
plot(X, Z)
legend('y-prime based on time');
xlabel('time x');
ylabel('Z');

subplot(1, 2, 2)
plot(X, Y)
legend('y based on time');
xlabel('time x');
ylabel('Y');
