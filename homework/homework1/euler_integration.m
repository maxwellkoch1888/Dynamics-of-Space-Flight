clear all; close all;
format long g 

g = 9.81;
R = 2.0;
theta = 35.0 * pi / 180.0;
thetadot = 0.0;
t = 0.0;
dt = 0.1; 
% tf = 0.1;
tf = 5.0;

while t <= tf 
    thetaddot = -g/R * sin(theta);
    theta = theta + thetadot * dt;    
    thetadot = thetadot + thetaddot * dt;

    % disp('time:')
    % disp(t)
    % disp('theta [rad]:')
    % disp(theta)
    % disp('thetadot [rad/s]:')
    % disp(thetadot)

    t = t + dt;
end

disp('time:')
disp(t-dt)
disp('theta [rad]:')
disp(theta)
disp('thetadot [rad/s]:')
disp(thetadot)
