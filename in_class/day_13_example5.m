clear all; close all; 

mu = 398600;
rp = 200 + 6378; 
v_esc = sqrt(2*mu/rp);
vp = 1.1 * v_esc;
v1 = 8; 

h = vp * rp;
e = h^2/(mu * rp) - 1;
energy = vp^2/2 - mu/rp;

r1 = mu / (v1^2/2 - energy);
ta1 = -acos((h^2/mu/r1 - 1)/e); 

F1 = 2 * atanh(sqrt((e-1)/(e+1)) * tan(ta1/2)); 
Mh1 = e*sinh(F1) - F1; 

t1 = Mh1 *h^2/mu^2/(e^2-1)^(3/2);
t2 = t1 + 7*3600;  

Mh2 = mu^2/h^2*(e^2-1)^(3/2) * t2;
F0 = asinh(Mh2/e);
F2 = fsolve(@(F2) e*sinh(F2) - F2 - Mh2, F0);

ta2 = 2*atan(sqrt((e+1)/(e-1))*tanh(F2/2)); 
r2 = h^2/mu /(1+e*cos(ta2)); 
z2 = r2 - 6378
