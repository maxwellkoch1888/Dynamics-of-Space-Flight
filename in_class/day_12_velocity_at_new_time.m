clear all; close all; 

% data
mu = 398600; 
R = 6378; 
vp = 15; 
zp = 300; 
rp = zp + R; 
ta = 100 * pi / 180; 

% Steps
h = rp * vp; 
e = h^2 / (mu * rp) - 1; 
ta_inf = acos(-1/e); % should be between -180 and 180 deg
r = h^2/ mu * 1/ (1+e*cos(ta)); 
F = 2*atanh(sqrt((e-1)/(e+1)) * tan(ta/2));
M = e * sinh(F) - F; 
t = h^3 / mu ^2 * M / (e^2 - 1) ^ (3/2);

% Find the velocity three hours later
t1 = t + 3*60*60; 
M1 = mu^2/ h^3 * (e^2 - 1) ^ (3/2) * t1; 
fun = @(F) e*sinh(F) - F - M1; 
F1 = fsolve(fun, M1); 
ta1 = 2*atan(sqrt((e+1)/(e-1)) * tanh(F1/2)); 
r = h^2/ mu * 1/ (1+e*cos(ta1)); 
% calculate velocity from energy or using vperp and vr

