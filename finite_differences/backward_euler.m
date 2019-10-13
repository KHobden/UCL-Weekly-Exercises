function [x,y,e] = backward_euler(a, dt, n)
%Backward Euler method
%Use the backward Euler method with timestep dt
%and f(y) = n*y
%Inputs are the timestep and initial value
%Outputs (x,y) co-ords and e (error at each x)
%A linear difference equation has been produced
%and is included but not commented on

%Initialise N and x, y, e arrays
N = 1/dt;
x = linspace(0,1,N+1);
y(1) = a;
e(1) = 0;

%Exact analytical solution
y_exact = exp(n*x);

%Run backward Euler algorithm
%y has size N+1 to account for start value of 1
%Calculate the error at each step and store in e
for i = 2:N+1
    y(i) = (1 - n*dt)^(-i);
    e(i) = abs(y_exact(i) - y(i));
end
end
