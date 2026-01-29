clear all; close all; 

% Perifocal example
mu = 398600;
R = 6378;
r0 = [3207; 5459; 2714]; %measured in inertial frame
v0 = [-6.532; 0.7835; 6.142]; %measured in inertial frame

h = cross(r0, v0); % angular momentum
hmag = norm(h);
e = cross(v0,h)/mu- r0/norm(r0); % eccentricity
emag = norm(e); 

%Define perifocal unit vectors 
phat = e/emag; 
what = h/hmag; 
qhat = cross(what, phat)

ta = 15*pi/180; %true anomaly
r_I = hmag^2 /mu * 1/(1+emag*cos(ta)) * (cos(ta)*phat + sin(ta)*qhat) %inertial
r_P = hmag^2 /mu * 1/(1+emag*cos(ta)) * [cos(ta);sin(ta); 0]
r_P = hmag^2 /mu * 1/(1+emag*cos(ta)) * (cos(ta)*[1;0;0] + sin(ta)*[0;1;0])