function [x,y,e] = forward_euler(a, dt, n)
%Forward Euler method
%Use the forward Euler method with timestep dt
%and f(y) = n*y
%Inputs are the timestep and initial value
%Outputs (x,y) co-ords and e (error at each x)

%Initialise N and x, y, e arrays
N = 1/dt;
x = linspace(0,1,N+1);
y(1) = a;
e(1) = 0;

%Exact analytical solution
y_exact = exp(n*x);

%Run forward Euler algorithm
%y has size N+1 to account for start value of 1
%Calculate the error at each step and store in e
for i = 1:N
    y(i+1) = y(i) + dt * n * y(i);
    e(i+1) = abs(y_exact(i+1) - y(i+1));
end
end
