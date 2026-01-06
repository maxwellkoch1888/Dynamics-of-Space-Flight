clear all; close all; clc

format long g

% Goal is to numerically integrate spring mass system
k = 1;
m = 1;
x0 = 1; 
xd0 = 0; 
y0 = [x0; xd0];

ops = odeset('AbsTol', 1e-8, 'RelTol', 1e-8);
[t,y] = ode45(@ode, [0,10],y0,[],k,m);

% analytical solution 
w = sqrt(k/m);
x = x0*cos(w*t) + xd0/w*sin(w*t);

% Should produce a plot that oscillates
figure, plot(t,y(:,1), 'linewidth', 2), grid on 
xlabel('t(s)'), ylabel('x(m)')
hold on, plot(t,x,'--', 'linewidth',2)

% Error
e = x - y(:,1);

figure, plot(t,e,'LineWidth',3), grid on 
xlabel('t(s)'), ylabel('(e(m)')


function ydot = ode(t,y,k,m)

y1 = y(1);
y2 = y(2);
y1dot = y2;
y2dot = -k/m * y1;

ydot = [y1dot; y2dot];


end 



