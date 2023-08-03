%                              Question 5
%        Seyed Ali Maher - Mohammad Zahmatkesh - Seyed Alireza Khayami
%--------------------------------------------------------------------------
clc
clear
close
%----------------------------Calculating Root------------------------------

a = 0;     % start of range
b = 1;     % end of range

counter = 1;
steps = 0;     % num of steps to find root

while counter < 9999
    middle = (a+b)/2;
    middlePoints(steps+1) = middle;
    steps = steps+1;

    f_a = (a^3)+(4*a^2)-2;
    f_b = (b^3)+(4*b^2)-2;
    f_x = (middle^3)+(4*middle^2)-2;

    if abs(f_x) <= 4*(10^(-3))
        disp('root: ')
        disp(middle)
        break
    elseif (f_a)*(f_x) < 0
        b = middle;
    else
        a = middle;
    end

    counter = counter+1;
end

xPoints = 0:0.01:1;

for counter = 1:length(xPoints)
    y(counter) = 0;
end

y2 = xPoints.^3+(4*xPoints.^2)-2;

for counter=1:length(middlePoints)
    q(counter) = middlePoints(counter)^3+(4*middlePoints(counter)^2)-2;
end

%--------------------------------Show Graph----------------------------
subplot(1, 3, 1)
plot(xPoints,y)
xlabel('X')
ylabel('Y')
                 
subplot(1, 3, 2)
plot(xPoints,y2)
xlabel('X')
ylabel('Y')

subplot(1, 3, 3)
plot(middlePoints,q,'ro')
xlabel('X')
ylabel('Y')
title('Bisection Method')
legend('Roots')

disp('num of steps to find root : ')
disp(steps)
disp('middle points: ')
disp(middlePoints)