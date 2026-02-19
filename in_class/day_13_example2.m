clear all; close all;

% data
rp = 7500;
ra = 16000;
mu = 398600; 

ta1 = 80 * pi /180; 


e = (ra-rp)/(ra+rp); 
a = (ra + rp)/2;
h = sqrt(mu*a*(1-e^2));

E1 = 2*atan2( sqrt(1-e)*sin(ta1/2), sqrt(1+e)*cos(ta1/2) ); % eccentric anomaly
M1 = E1 - e*sin(E1); 
t1 = M1 / (mu^2/h^3 * (1-e^2)^(3/2));

t2 = t1 + 40*60; 

M2 = mu^2/h^3 *(1-e^2)^(3/2) * t2;
E2 = fsolve(@(E2) E2-e*sin(E2) -M2, M2);
ta2 = 2*atan2(sin(E2/2) * sqrt(1+e), cos(E2/2) * sqrt(1-e)) * 180/pi


