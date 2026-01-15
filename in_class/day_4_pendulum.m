clear all; close all;

x0 = [45;0]*pi/180;
g = 9.81;
R = 2;

[t,x] = ode45(@(t,x) ode(t,x,g,R), [0 10], x0);

figure
plot(t, x(:,1)*180/pi, 'linewidth',3), grid on
xlabel('t'), ylabel('\theta (deg)')

KE = 0.5*(R*x(:,2)).^2;
PE = g*R*(1 - cos(x(:,1)));
TE = KE + PE;

figure
plot(t, TE, 'linewidth',3), grid on
xlabel('t'), ylabel('Total Energy')

function xdot = ode(~,x,g,R)
x1 = x(1);
x2 = x(2);

x1dot = x2;
x2dot = -g/R*sin(x1);

xdot = [x1dot; x2dot];
end
