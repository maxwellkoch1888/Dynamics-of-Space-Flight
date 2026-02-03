clear all; close all; 

% data
mu = 398600;
R = 6378;
e = 0.3;
h = 60000; 
ta = 120 * pi / 180; %true anomaly

% what are the position and velocity vectors in the perifocal frame? 
rmag = h^2 / mu * 1/ (1+ e*cos(ta)); 
r = rmag * cos(ta) * [1;0;0] + rmag*sin(ta)*[0;1;0]
v = mu/h * (-sin(ta)*[1;0;0] + (e+cos(ta)) * [0;1;0])


%new example

% data 
mu = 398600; 
R = 6378; 
r_P = [7000; 9000; 0] ;
v_P = [-3.3472; 9.1251; 0]; 

% calc hmag
h_P = cross(r_P, v_P); 
hmag = norm(h_P)

% calc true anomaly 
e_P = cross(v_P, h_P) / mu - r_P/norm(r_P) % hyperbolic
emag = norm(e_P);
vr = dot(v_P, r_P/norm(r_P))
sinTA = vr*hmag/ (mu*emag); 
TA = asin(sinTA)
TA_inf = acosd(-1/emag) % arc cos in deg


