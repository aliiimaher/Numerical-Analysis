%                              Question 5
%        Seyed Ali Maher - Mohammad Zahmatkesh - Seyed Alireza Khayami
%--------------------------------------------------------------------------
clc
clear
close
%----------------------------Calculating Root------------------------------

x = 2;                         % Initial Guess
x_n(1) = x;
steps = 1;

while steps <= 15
    f_x = (x^3) - nthroot(x^4+x^2+5,3);
    derivationF = (3*x^2) - ( (1/3)*(x^4+x^2+5)^(-2/3)*(4*x^3+2*x) );
    x2 = x-(f_x/derivationF);
    x_n(steps+1) = x2;
    steps = steps+1;
    x = x2;
end

root = x;

xPoints = 0:0.01:3;

for steps=1:length(xPoints)
    y(steps) = 0;
end

f = (xPoints.^4) + (xPoints.^2) +5;
y2 = (xPoints.^3) - (nthroot(f,3));

for steps=1:length(x_n)
    f(steps) = x_n(steps)^4+x_n(steps)^2+5;
    y3(steps) = x_n(steps)^3-nthroot(f(steps),3);
end
%--------------------------------Show Graph--------------------------------
subplot(1, 3, 1)
plot(xPoints,y)
xlabel('X')
ylabel('Y')

subplot(1, 3, 2)
plot(xPoints,y2)
xlabel('X')
ylabel('Y')

subplot(1, 3, 3)
plot(x_n,y3,'ro')
xlabel('X')
ylabel('Y')
title('Newton Method')
legend('Roots')

root
disp('num of steps : ')
disp(steps-1)
disp('considered x_n: ')
disp(x_n)