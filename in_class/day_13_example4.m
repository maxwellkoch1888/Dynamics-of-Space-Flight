clear all; close all; 

% Data
e = 1; 
energy = 0; 
rp = 6600; 
mu = 398600; 
ta2 = 90 * pi / 180; 

vp = sqrt(2*mu/rp);
h = rp*vp;

Mp = 0.5 * tan(ta2/2) + 1/6 * (tan(ta2/2))^3;
t = Mp / mu^2 * h^3 / 3600 * 2 % time from -90 to 90


t2 = 36 * 3600; 
Mp2 = mu^2 /h^3 * t2; 
z = (3*Mp2 + sqrt(1+9*Mp2^2))^(1/3); 
ta = 2*atan(z-1/z); 

r = h^2/mu * 1/(1+e*cos(ta))

