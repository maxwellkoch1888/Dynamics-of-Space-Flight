clear all; close all; 

% Data 
 mu = 398600; 
 R = 6378; 
 e = 1; 
 vp = 10; 
 t = 6*60*60; 

% Steps
rp = 2*mu / vp^2; 
h = rp * vp;
Mp = 2*mu^2/h^3 * t;
z = (3*Mp + sqrt(1+9*Mp^2)) ^ (1/3)
y = z-1/z
ta = 2*atan(y) 
r = h^2/mu * 1/(1+e*cos(ta))

