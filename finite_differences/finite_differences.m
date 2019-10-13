%MatLab Exercises Week 2
%Finite Differences
%Kieran Hobden
%08-Oct-'19

%Use the Forward Euler method to solve the ODE:
% dy/dt = 2y, y(0) = 1
%over the range 0<=t<=1 using different time-steps

%Calculate y with Forward Euler method for different dt
[t1,y1,e1] = forward_euler(1, 0.1, 2);
[t2,y2,e2] = forward_euler(1, 0.05, 2);
[t3,y3,e3] = forward_euler(1, 0.01, 2);

%Plot of numerical solutions for different timesteps
plot(t1, y1), hold on
plot(t2, y2), hold on
plot(t3, y3), hold on

%Plot of exact analytical result e^(2*x)
t = linspace(0,1,100);
plot(t, exp(2*t)), hold off

%Label and save plot as forward_euler_method.jpg
title('Forward Euler method')
xlabel('t')
ylabel('y')
legend('Numerical solution (dt = 0.1)', 'Numerical solution (dt = 0.05)', 'Numerical solution (dt = 0.01)', 'Exact analytical soution')
print -djpeg90 forward_euler_method

%Plot the local errors for different dt
plot(t1, e1), hold on
plot(t2, e2), hold on
plot(t3, e3), hold off

%Label and save plot as forward_euler_error.jpg
title('Local Error for Different dt')
xlabel('t')
ylabel('Local Error')
legend('0.1', '0.05', '0.01')
print -djpeg90 forward_euler_error

%Repeat the above method to solve the ODE:
% dy/dt = -50y, y(0) = 1
%over the range 0<=t<=1 using different time-steps

%Calculate y with Forward Euler method for different dt
[t4,y4,e4] = forward_euler(1, 0.05, -50);

%Plot of numerical solutions for different timesteps
plot(t4, y4), hold on

%Plot of exact analytical result e^(-50*x)
t = linspace(0,1,100);
plot(t, exp(-50*t)), hold off

%Label and save plot as forward_euler_method.jpg
title('Forward Euler method')
xlabel('t')
ylabel('y')
legend('Numerical solution (dt = 0.05)', 'Exact analytical soution')
print -djpeg90 unstable_forward_euler_method

%Plot the local errors for the unstable numerical solution
plot(t4, e4)

%Label and save plot as forward_euler_error.jpg
title('Local Error for Unstable Implementation dt=0.05')
xlabel('t')
ylabel('Local Error')
print -djpeg90 unstable_forward_euler_error

%Compute the final time-step error for various dt
%Error values are so different a plot would be useless
%A table of results is printed instead
dt = logspace(-2,-1,100);
for i = 1:length(dt)
    [t5,y5,e5] = forward_euler(1, dt(i), -50);
    error(i) = e5(length(e5));  
end

%Table is piped to a .txt file
%Notice the error is very small for small dt and large for large dt
%Similar to prior discussions on stability
error_table = [dt; error];
fileID = fopen('unstable_forward_euler_errors.txt', 'w');
fprintf(fileID, '%9s    %9s\n', 'dt', 'error');
fprintf(fileID, '%1.3e    %1.3e\n', error_table);
fclose(fileID);

%Plot the error at y=1 as a function of dt
%The loglog plot shows the method is first order
loglog(dt, error, 'x')
%Ylim prevents less than minimum computed error (10^-21) from being shown
%ylim([10^(-15) 0.1])
title('Logarithmic Plot of the Error at y(1) Against dt')
xlabel('Log(dt)')
ylabel('Log(Error)')
grid on
print -djpeg90 loglog_error_against_dt

%Solve the previous ODEs with the backward Euler method
[t6,y6,e6] = backward_euler(1, 0.05, 2);
plot(t6, y6), hold on

%Plot of exact analytical result e^(2*x)
t = linspace(0,1,100);
plot(t, exp(2*t)), hold off

%Label and save plot as backward_euler_1.jpg
title('Backward Euler method f(y)=2y')
xlabel('t')
ylabel('y')
legend('Numerical solution (dt = 0.05)', 'Exact analytical soution')
print -djpeg90 backward_euler_1

%Repeat the above procedure for f(y)=-50y
[t7,y7,e7] = backward_euler(1, 0.05, -50);
plot(t7, y7), hold on

%Plot of exact analytical result e^(-50*x)
t = linspace(0,1,100);
plot(t, exp(-50*t)), hold off

%Label and save plot as backward_euler_2.jpg
title('Backward Euler method f(y)=-50y')
xlabel('t')
ylabel('y')
legend('Numerical solution (dt = 0.05)', 'Exact analytical soution')
print -djpeg90 backward_euler_2

%As before, compute the final time-step error against dt
%Error values are so different a plot would be useless
%A table of results is printed instead
x = logspace(-5,-1,100);
for i = 1:length(dt)
    [t8,y8,e8] = backward_euler(1, x(i), 2);
    [t9,y9,e9] = backward_euler(1, x(i), -50);
    error_2y(i) = e8(length(e8));
    error_neg50y(i) = e9(length(e9));
end

%Table is piped to a .txt file
%Notice the error is very small for small dt and large for large dt
%Similar to prior discussions on stability
backward_error_table = [dt; error_2y; error_neg50y];
fileID = fopen('stability_backward_euler.txt', 'w');
fprintf(fileID, '%9s %12s %9s\n', 'dt', 'error f=2y', 'error f=-50y');
fprintf(fileID, '%1.3e    %1.3e    %1.3e\n', backward_error_table);
fclose(fileID);
%The backward Euler method is implicit and doesn't diverge
%This is shown analytically in my notes

%Solve the ODE with f(y,t) = sin(ty) w/ y(0) = pi/2
%over the range 0<=t<=6pi
%FE method is used and verified by use of BE which
%is implicit and hence stable