clear all; close all; clc; 
format long g

%% Problem 1
% Compute the total two-impulse Hohmann transfer delta-v 
% from Venus's orbit to Mars's orbit. 
% Assume both orbits are circular with radii equal to the 
% semi-major axes given in Appendix A.1. 
% Use Tables A.1, A.2, and A.3 for any other needed 
% information. Report your answer in km/s.
rv = 108.2e6; ri = rv; % venus radius
rm = 227.9e6; rf = rm; % mars radius
mu = 132712440018; % sun mu 

% Transfer orbit
e_t = (rf-ri) / (ri+rf);
ht = sqrt(ri*mu*(1+e_t)); 
vp_t = ht/ri; 
va_t = ht/rf; 

% Circular orbits
vi = sqrt(mu/ri); 
vf = sqrt(mu/rf); 

% Delta v
dv1 = vp_t - vi; 
dv2 = vf - va_t; 
% dv = norm(dv1) + norm(dv2) % ANSWER


%% Problem 2 
% Compute the total two-impulse Hohmann transfer delta-v 
% from Jupiter's orbit to Neptune's orbit. Assume both 
% orbits are circular with radii equal to the semi-major 
% axes given in Appendix A.1. 
rj = 778.6e6; ri = rj; % jupiter radius
rn = 4.495e9; rf = rn; % neptune radius
mu = 132712440018; % sun mu 

% Transfer orbit
e_t = (rf-ri) / (ri+rf);
ht = sqrt(ri*mu*(1+e_t)); 
vp_t = ht/ri; 
va_t = ht/rf; 

% Circular orbits
vi = sqrt(mu/ri); 
vf = sqrt(mu/rf); 

% Delta v
dv1 = vp_t - vi; 
dv2 = vf - va_t; 
% dv = norm(dv1) + norm(dv2) % ANSWER

%% Problem 3
% Compute the synodic period of Mercury relative to earth. 
% Use the orbit sidereal period data in Appendix A.1. Report 
% your answer in earth days.
T1 = 87.97; % mercury period days
T2 = 365.256; % earth period days

% t_syn = T1 * T2 / norm(T1-T2)% ANSWER

%% Problem 4
% Compute the synodic period of Jupiter relative to Uranus. 
% Use the orbit sidereal period data in Appendix A.1. Report 
% your answer in earth years to three decimals.
T1 = 11.86;  % jupiter period yr
T2 = 84.01; % uranus period yr

% t_syn = T1 * T2 / norm(T1-T2) % ANSWER


%% Problem 5 
% Compute the sphere of influence of earth. 
% Use Tables A.1, A.2, and A.3 for any needed information. 
% Report your answer in km to km precision (no decimals).
Rp = 149.6e6;
mp = 5.974e24; 
ms = 1.989e30; 

% r_SOI = Rp * (mp/ms)^(2/5) % ANSWER

%% Problem 6 
% Compute the sphere of influence of the moon. 
% Use Tables A.1, A.2, and A.3 for any needed information. 
% Report your answer in km to km precision (no decimals).
Rp = 384.4e3;
mp = 73.48e21; 
ms = 5.974e24; 

% r_SOI = Rp * (mp/ms)^(2/5) % ANSWER

%% Problem 7 
% At a time when the earth was 147.3 x 10^6 km from the sun, 
% a spacecraft parked in a 200 km altitude circular earth 
% orbit was inserted directly into an elliptical orbit around 
% the sun with perihelion of 115 x 10^6 km and aphelion of 
% 147.3 x 10^6 km. We will walk through steps to calculate the delta-v.

% ** Do NOT ignore the earth's non-zero eccentricity in this problem. **

% ** Because spacecraft's aphelion distance equals the earth's radial 
% distance at the maneuver time, you may assume the spacecraft is at aphelion. **

% ** For the earth's true anomaly, compute the value in the first quadrant. **
% Use Tables A.1, A.2, and A.3 for any needed information.

% Calculate the true anomaly of the earth. 
% Report your answer in radians to three decimals.
mu = 132712440018; % sun mu 
a = 149.6e6; 
r = 147.3e6; 
e_e = 0.0167; 
ta_e = acos(1/e_e*(a/r*(1-e_e^2) - 1));

% Calculate the velocity of the earth in its perifocal frame. 
% Report your answer in km/s to three decimals.
h_e = sqrt(r*mu*(1+e_e*cos(ta_e))); 
v_e = mu/h_e * [-sin(ta_e); e_e+cos(ta_e); 0];

% Calculate the true anomaly of the spacecraft in its 
% heliocentric orbit. Report your answer in radians to 
% three decimals.
ta_s = pi;

% Calculate the velocity vector of the spacecraft in its 
% perifocal frame with the sun at the origin. Report your 
% answer in km/s to three decimals.
rp = 115e6; 
ra = 147.3e6;
e_s = (ra-rp)/(ra+rp);
h_s = sqrt(r*mu*(1+e_s*cos(ta_s))); 
v_s = mu/h_s * [-sin(ta_s); e_s+cos(ta_s); 0];

% Compute the V-infinity vector in the earth's perifocal frame. 
% Report your answer in km/s to three decimals.

% Compute the delta-v magnitude required for the maneuver. 
% Report your answer in km/s to three decimals.


% ta_e, v_e, ta_s, v_s, v_inf % ANSWERS

%% Problem 8 
% Calculate the propellant mass required to inject a spacecraft 
% with a dry (structure only) mass of 2500 kg from a 200 km 
% altitude circular earth orbit on a Hohmann transfer 
% trajectory to the orbit of Saturn. The engine Isp is 
% 295 seconds, and the gravitational acceleration at sea 
% level is 9.806 m/s2. Consider only the single departure 
% impulse and not the total two-impulse Hohmann transfer delta-v.
% Use Tables A.1, A.2, and A.3 for any needed information. 
% Assume the planetary orbits are circular.
Isp = 295; 
g0 = 9.806; 

% ** Recognize that Eq. (8.35) has a typo. See Eq. (8.3) 
% for a correct version. **

% As intermediate steps, calculate the hyperbolic excess 
% speed v_infinity. Report your answer in km/s to 
% three decimals.
mu = 132712440018; % sun mu 
R1 = 149.6e6; 
R2 = 1.422e9; 

v_inf = sqrt(mu/R1) * (sqrt(2*R2/(R1 + R2)) - 1);

% Calculate the speed at perigee of the hyperbolic trajectory. 
% Report your answer in km/s to three decimals.
mu_E = 398600;   % km^3/s^2
r_p = 6378 + 200;

v_p = sqrt(v_inf^2 + 2*mu_E/r_p);

% Calculate the circular orbit speed in the 200 km altitude 
% orbit. Report your answer in km/s to three decimals.
v_c = sqrt(mu_E/r_p);

% Calculate the delta-v required. Report your answer in km/s 
% to three decimals.
delta_v = v_p - v_c;

% Calculate the propellant mass required. Report your answer 
% in kg to three decimals.
mf = 2500;
delta_v_m = delta_v * 1000;
m0 = mf * exp(delta_v_m / (g0 * Isp));

mp = m0 - mf;

% v_inf, v_p, v_c, delta_v, mp % ANSWERS 
