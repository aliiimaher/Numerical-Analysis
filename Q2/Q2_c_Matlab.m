%                              Question 5
%        Seyed Ali Maher - Mohammad Zahmatkesh - Seyed Alireza Khayami
%--------------------------------------------------------------------------

clc
clear
close

%----------------------------Calculating Root------------------------------

a = 1;          % start of range
b = 2;          % end of range

counter = 1;
steps = 1;

while counter < 9999
    f_a = (a^3)-(2^sqrt(a));
    f_b = (b^3)-(2^sqrt(b));
    x = ( (a*f_b) - (b*f_a) ) / (f_b-f_a);
    x_n(steps) = x;
    steps = steps+1;
    f_x = (x^3)-(2^sqrt(x));

    if abs(f_x) < 10^(-3)
        x
        break
    elseif (f_a)*(f_x) < 0
        b = x;
    else
        a = x;
    end

    counter = counter+1;
end

xPoints = 1:0.01:2;

for counter=1:length(xPoints)
    y(counter)=0;
end

y2 = (xPoints.^3)-(2.^sqrt(xPoints));

for counter=1:length(x_n)
    y3(counter) = (x_n(counter)^3)-(2^sqrt(x_n(counter)));
end

%--------------------------------------------------------------------------
subplot(1, 3, 1)
plot(xPoints,y)
xlabel('X')
ylabel('Y')

subplot(1, 3, 2)
plot(xPoints,y2)
xlabel('X')
ylabel('Y')

subplot(1, 3, 3)
plot(x_n,y3)
xlabel('X')
ylabel('Y')
title('Displacement Method')
legend('Roots')

disp('num of steps: ')
disp(steps-1)
disp('considered x_n: ')
disp(x_n)