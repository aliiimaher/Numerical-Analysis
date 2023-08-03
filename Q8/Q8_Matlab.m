% Q8 _ Euler Method with State Space
% Ali Maher
% Mohammad Zahmatkesh
% Alireza Khayami
%%
clc
clear
close
%% Data
C1 = 50*10^-6;
C2 = 100*10^-6;
L1 = 50*10^-6;
L2 = 10*10^-6;
es = 20;
R1 = 2*10^3;
R2 = 5*10^3;
R3 = 2*10^3;
R4 = 3*10^3;
R5 = 2*10^3;
R = R5 + (R3*R4) / (R3+R4);
f = @(t,x) [-(R1+R)/L1,-R/L1,-1/L1,-1/L1
    -R/L2,-(R2+R)/L2,0,-1/L2
    1/C1,0,0,0
    1/C2,1/C2,0,0]*x +[R4/(L1*(R3+R4));R4/(L2*(R3+R4));0;0]*es;
h = 0.01;
x0 = [0;0;0;0];             %x1 = iL1 , x2 = iL2 , x3 = Vc1 , x4 = Vc2;
time = [0;7];               %time period
n = (time(2)-time(1))/h;    %number of steps
t = time(1);
T = time(1);
x = x0;
X = x0';
%% Calculation With Improved Euler Method
for i = 1:n 
    k1 = h*f(t,x);
    k2 = h*f(t+h,x+k1);
    x = x + 0.5*(k1+k2);
    t = t + h;
    X = [X; x']
end
%% Loop for dividing i from v
i_list = [];
v_list = [];
while i <= n
    i_list = [i_list X(i)];
    i = i + 1;
    i_list = [i_list X(i)];
    i = i + 1;
    v_list = [v_list X(i)];
    i = i + 1;
    v_list = [v_list X(i)];
    i = i + 1;
end
%% Graphic show
subplot(1, 2, 1)
plot(time, i_list)
xlabel('time')
ylabel('Intensity')

subplot(1, 2, 2)
plot(time, v_list)
xlabel('time')
ylabel('Voltages')