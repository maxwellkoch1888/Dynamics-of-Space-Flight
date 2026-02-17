clear all; close all; 
format long g

% Data
mu = 398600; 
R = 6378;
zp = 500; 
za = 5000; 
rp = zp + R;
ra = za + R;

% Calculate orbit parameters
e = (ra-rp)/ (ra+rp);
h = sqrt(rp * mu * (1+e));
a = h^2/mu * 1/(1-e^2);
T = 2*pi * a^(3/2) / sqrt(mu);

% Calculate ta with newton's method
fun = @(ta) 1+ e*cos(ta) - (a*(1-e^2) * sin(ta))/R; 
ta = fsolve(fun,pi/4);


% Calualte t from ta
E = 2*atan(sqrt((1-e)/(1+e)) * tan(ta/2));
M = E - e*sin(E);
t_PB = M*T / (2*pi);
t_shadow = 2*t_PB;

%  Position vector in perifocal frame at beta
r = h^2 / mu * 1/(1+ e*cos(ta)); 
r_Pf = [r*cos(ta); r*sin(ta); 0 ]; 

rP_Pf = [rp; 0; 0]; 
rA_pf = [ - ra; 0; 0]; 