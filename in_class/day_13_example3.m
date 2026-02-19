clear all; close all; 

% Data
e = 1; 
energy = 0; 
zp = 200; 
rp = zp + 6378; 
SOI = 925000; % sphere of influence
r2 = SOI; 
mu = 398600; 

vp = sqrt(2*mu/rp);
h = rp*vp;
ta2 = acos((h^2/(mu*r2) - 1)) / e;
Mp = 0.5 * tan(ta2/2) + 1/6 * (tan(ta2/2))^3;
t = Mp / mu^2 * h^3 / 3600 / 24

