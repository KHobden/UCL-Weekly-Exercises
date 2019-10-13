function [x,y] = forward_euler_sine(a, dt)
%Forward Euler method for f(y,t) = sin(ty)
%Method uses timestep dt and start y(0) = a
%Inputs are the timestep and initial value
%Outputs (x,y) co-ords

%Initialise N and x, y arrays
N = 1/dt;
x = linspace(0,1,N+1);
y(1) = a;

%Run forward Euler algorithm
%y has size N+1 to account for start value of 1
%Calculate the error at each step and store in e
for i = 1:N
    
    y(i+1) = y(i) + dt * sin(y(i));
    e(i+1) = abs(y_exact(i+1) - y(i+1));
end
end

%INCOMPLETE!!!!