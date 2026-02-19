clear all; close all;

% data
rp = 7000;
ra = 10000;
mu = 398600; 
t1 = 0.5*60*60; 
t2 = 1.5 * 3600; 

e = (ra-rp)/(ra+rp); 
a = (ra + rp)/2;
h = sqrt(mu*a*(1-e^2));

M1 = mu^2/h^3 *(1-e^2)^(3/2) * t1;
M2 = mu^2/h^3 *(1-e^2)^(3/2) * t2;

E2 = fsolve(@(E2) E2-e*sin(E2) -M2, M2);
E1 = fsolve(@(E1) E1-e*sin(E1) -M1, M1);

ta1 = 2*atan2(sin(E1/2) * sqrt(1+e), cos(E1/2) * sqrt(1-e));
ta2 = 2*atan2(sin(E2/2) * sqrt(1+e), cos(E2/2) * sqrt(1-e));

dta = wrapTo2Pi(ta2-ta1) * 180 / pi

A = h/2 * 3600
