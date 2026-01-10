clear all; close all;
format long g 

% Initial cond/ simulation parameters
x  = [35.0 * pi / 180.0; 0];
t  = 0.0;
dt = 0.1; 
% tf = 0.1;
tf = 5.0;
tol = 1e-12;

% Integrate forward in time
while t < tf
    x = rk4(t, x, dt);

    % disp('time:')
    % disp(t)
    % disp('theta [rad]:')
    % disp(x(1))
    % disp('thetadot [rad]:')
    % disp(x(2))

    t = t + dt; 
end

disp('time:')
disp(t-dt)
disp('theta [rad]:')
disp(x(1))
disp('thetadot [rad]:')
disp(x(2))

%% Functions
function state = rk4(t0, x0, dt)
     % Define k terms for rk4
    k1 = diff_eq(t0, x0);
    k2 = diff_eq(t0 + dt*0.5, x0 + k1 * dt*0.5);
    k3 = diff_eq(t0 + dt*0.5, x0 + k2 * dt*0.5);
    k4 = diff_eq(t0 + dt, x0 + k3 * dt);
    
    % Calculate new state
    state = x0 + (dt/6) * (k1 + 2*k2 + 2*k3 + k4);
end

function dxdt = diff_eq(t, x)
    g = 9.81;
    R = 2.0;

    theta    = x(1);
    thetadot = x(2);

    dxdt = [thetadot; -g/R * sin(theta)];    
end