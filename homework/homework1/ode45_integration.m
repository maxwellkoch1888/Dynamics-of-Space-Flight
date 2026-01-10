clear all; close all;
format long g 

% Initial cond
x0  = [35.0 * pi / 180.0; 0];

% Integrate forward in time
ops = odeset('AbsTol', 1e-12, 'RelTol', 1e-12);
[t,x] = ode45(@diff_eq, [0,5.0], x0, ops);

disp('theta [rad]:')
disp(x(end, 1))
disp('thetadot [rad]:')
disp(x(end, 2))

%% Functions
function dxdt = diff_eq(t, x)
    g = 9.81;
    R = 2.0;

    theta    = x(1);
    thetadot = x(2);

    dxdt = [thetadot; -g/R * sin(theta)];    
end