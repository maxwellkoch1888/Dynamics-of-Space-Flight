clear all; close all; 
format long g

% Global data
mu = 398600; 
Re = 6378; 
J2 = 0.00108263; 
Te = 365.26; 

%% Problem 1 and 2
% % e = 0.25; % problem 1 eccentricity
% e = 0.5;  % problem 2 eccentricity
% w = 40*pi/180; 
% W = 35*pi/180; 
% i = 10*pi/180; 
% 
% R3w = [cos(w), sin(w), 0; -sin(w), cos(w), 0; 0, 0, 1]; 
% R3W = [cos(W), sin(W), 0; -sin(W), cos(W), 0; 0, 0, 1]; 
% R1i = [1, 0, 0; 0, cos(i), sin(i); 0, -sin(i), cos(i)]; 
% 
% Q_g2p = R3w * R1i * R3W

%% Problem 4
% m0 = 2500; 
% Isp = 295; 
% dv1 = 1000 * [-0.3; -.1; -0.2]; 
% dv2 = 1000 * [0.1; 0.2; -0.2]; 
% g0 = 9.807; 
% 
% dv1_mag = norm(dv1);
% dv2_mag = norm(dv2);
% 
% m1 = m0 * exp(-dv1_mag/(g0*Isp));
% m2 = m1 * exp(-dv2_mag/(g0*Isp));
% dm = m0 - m2 

%% Problem 5
% m0 = 2500; 
% Isp = 295; 
% dv2 = 1000 * [-0.3; -.1; -0.2]; 
% dv1 = 1000 * [0.1; 0.2; -0.2]; 
% g0 = 9.807; 
% 
% dv1_mag = norm(dv1);
% dv2_mag = norm(dv2);
% 
% m1 = m0 * exp(-dv1_mag/(g0*Isp));
% m2 = m1 * exp(-dv2_mag/(g0*Isp));
% dm = m0 - m2 

%% Problem 6
% % Inner orbital elements
% ai = Re + 1100; 
% ei = 0.1; 
% ii = 15*pi/180; 
% Wi = 20*pi/180; 
% wi = 30*pi/180; 
% 
% % Outer orbiral elements 
% ao = Re + 2000; 
% eo = 0.1; 
% io = 15*pi/180; 
% Wo = 20*pi/180; 
% wo = 30*pi/180; 
% 
% % Angular momentum
% h_i = sqrt(mu * ai * (1 - ei^2));
% h_o = sqrt(mu * ao * (1 - eo^2));
% 
% %  Transfer orbit (Hohmann-like)
% rp = ai*(1 - ei);
% ra = ao*(1 + eo);
% a_t = (rp + ra)/2;
% e_t = (ra - rp)/(ra + rp);
% h_t = sqrt(mu * a_t * (1 - e_t^2));
% 
% % Rotation matrix 1
% R3w = [cos(wi), sin(wi), 0; -sin(wi), cos(wi), 0; 0, 0, 1]; 
% R3W = [cos(Wi), sin(Wi), 0; -sin(Wi), cos(Wi), 0; 0, 0, 1]; 
% R1i = [1, 0, 0; 0, cos(ii), sin(ii); 0, -sin(ii), cos(ii)]; 
% 
% Q_g2p_1 = R3w * R1i * R3W;
% Q_p2g_1 = inv(Q_g2p_1);
% 
% % First dv
% ta_i = 0; 
% v_ip = mu/h_i * [-sin(ta_i); ei+cos(ta_i); 0]; 
% v_tp = mu/h_t * [-sin(ta_i); e_t + cos(ta_i); 0];
% dv1_p = v_tp - v_ip 
% dv1_g = Q_p2g_1 * dv1_p
% 
% % Rotation matrix 2
% R3w = [cos(wo), sin(wo), 0; -sin(wo), cos(wo), 0; 0, 0, 1]; 
% R3W = [cos(Wo), sin(Wo), 0; -sin(Wo), cos(Wo), 0; 0, 0, 1]; 
% R1i = [1, 0, 0; 0, cos(io), sin(io); 0, -sin(io), cos(io)]; 
% 
% Q_g2p_2 = R3w * R1i * R3W;
% Q_p2g_2 = inv(Q_g2p_2);
% 
% % Second dv
% ta_o = pi; 
% v_oa = mu/h_o * [-sin(ta_o); eo+cos(ta_o); 0];
% v_ta = mu/h_t * [-sin(ta_o); e_t+cos(ta_o); 0]; 
% dv2_p = v_oa - v_ta;
% dv2_g = Q_p2g_2 * dv2_p

%% Problem 7 and 8 
% Original orbit elements
% ai = Re + 5500; 
% ei = 0.25; 
% tai = 0; 
% i = 25*pi/180; 
% W = 35*pi/180; 
% w = 45*pi/180; 
% 
% Perigee radius
% rp = ai * (1-ei^2)/(1+ei*cos(tai)); 
% 
% Phase maneuver elements
% T = 3*3600; 
% at = (T*sqrt(mu)/(2*pi))^(2/3);
% ra = 2*at - rp; 
% et = (ra-rp)/(ra+rp); 
% tat = tai; 
% 
% [r1i, v1i] = oe2rv(ai, ei, tai, i, W, w); 
% [r1t, v1t] = oe2rv(at, et, tai ,i, W, w);
% v1t 
% v1i
% dv = v1t -v1i

%% Problem 9 
% ai = Re + 4525; 
% ei = 0.28; 
% ii = 25*pi/180; 
% Wi = 35*pi/180; 
% wi = 45*pi/180; 
% tai = 0; 
% 
% % Find time for 15 deg lag 
% ta_lag = 15 * pi / 180; 
% 
% T = 2*pi/sqrt(mu) * ai^(3/2);
% n = 2*pi/T;
% E = 2*atan2( sqrt(1-ei)*sin(ta_lag/2), sqrt(1+ei)*cos(ta_lag/2) ) ;% eccentric anomaly
% M = E - ei*sin(E); % mean anomaly
% t = M*T / (2*pi);
% 
% T2 = T + t;
% 
% % Phase maneuver elements
% rp = ai * (1-ei^2)/(1+ei*cos(tai)); 
% at = (T2*sqrt(mu)/(2*pi))^(2/3);
% ra = 2*at - rp; 
% et = (ra-rp)/(ra+rp); 
% tat = tai; 
% 
% [r1i, v1i] = oe2rv(ai, ei, tai, ii, Wi, wi); 
% [r1t, v1t] = oe2rv(at, et, tat ,ii, Wi, wi);
% dv = v1t -v1i

%% Problem 10
% ai = Re + 4525; 
% ei = 0.28; 
% ii = 25*pi/180; 
% Wi = 35*pi/180; 
% wi = 45*pi/180; 
% tai = 0; 
% 
% % Perigee radius
% rp = ai * (1-ei^2)/(1+ei*cos(tai)); 
% 
% % Find time for 15 deg lag 
% ta_lag = 15 * pi / 180; 
% 
% T = 2*pi/sqrt(mu) * ai^(3/2); % initial orbit period
% n = 2*pi/T;
% E = 2*atan2( sqrt(1-ei)*sin(ta_lag/2), sqrt(1+ei)*cos(ta_lag/2) ) ;% eccentric anomaly
% M = E - ei*sin(E); % mean anomaly
% t = M*T / (2*pi);
% 
% dt = 0.5*(2*T + t);
% 
% % Phase maneuver elements
% at = (dt*sqrt(mu)/(2*pi))^(2/3);
% ra = 2*at - rp; 
% et = (ra-rp)/(ra+rp); 
% tat = 0; 
% 
% [r1i, v1i] = oe2rv(ai, ei, tai, ii, Wi, wi); 
% [r1t, v1t] = oe2rv(at, et, tat ,ii, Wi, wi);
% dv = v1t -v1i
% 2*norm(dv)

%% Problem 11
% % Initial orbital elements (orbit 1)
% a1 = Re + 500; 
% e1 = 0.1; 
% i = 10*pi/180; 
% W = 20*pi/180; 
% w = 30*pi/180; 
% taA = 15*pi/180; 
% h1 = sqrt(mu * a1 * (1 - e1^2));
% 
% % Desired orbital elements (orbit 3)
% a3 = Re + 5000; 
% e3 = 0.3;
% taB = 158*pi/180; 
% h3 = sqrt(mu * a3 * (1 - e3^2));
% 
% % Calculate positions/velocities for points A and B
% rA = h1^2/mu /(1 + e1*cos(taA))
% vA1 = mu/h1 * [-sin(taA); e1+cos(taA); 0]; 
% rB = h3^2/mu /(1 + e3*cos(taB))
% vB3 = mu/h3 * [-sin(taB); e3+cos(taB); 0]; 
% 
% % Calculate transfer elements and velocity
% e2 = (rA-rB)/(rB*cos(taB) - rA*cos(taA))
% h2 = sqrt(mu*rA*rB) * sqrt((cos(taA) - cos(taB)) / (rA*cos(taA) - rB*cos(taB)));
% vA2 = mu/h2 * [-sin(taA); e2+cos(taA); 0];
% vB2 = mu/h2 * [-sin(taB); e2+cos(taB); 0];
% 
% % Rotation matrix 2
% R3w = [cos(w), sin(w), 0; -sin(w), cos(w), 0; 0, 0, 1]; 
% R3W = [cos(W), sin(W), 0; -sin(W), cos(W), 0; 0, 0, 1]; 
% R1i = [1, 0, 0; 0, cos(i), sin(i); 0, -sin(i), cos(i)]; 
% 
% Q_g2p = R3w * R1i * R3W;
% Q_p2g = inv(Q_g2p);
% 
% dv1_p = vA2 - vA1;
% dv2_p = vB3 - vB2;
% dv1_g = Q_p2g * dv1_p 
% dv2_g = Q_p2g * dv2_p


%% Problem 12
% ra1 = 16000; 
% rp1 = 8500; 
% ra2 = 21000; 
% rp2 = 7000; 
% eta = 28*pi/180; 
% 
% e1 = (ra1-rp1)/(ra1+rp1);
% e2 = (ra2-rp2)/(ra2+rp2);
% 
% h1 = sqrt(rp1*mu*(1+e1));
% h2 = sqrt(rp2*mu*(1+e2));
% 
% % parameters from 6.13
% a = e1*h2^2 - e2*h1^2*cos(eta);
% b = -e2*h1^2*sin(eta);
% c = h1^2-h2^2;
% 
% % 6.14
% phi = atan2(b,a);
% term = acos(c/a * cos(phi));
% 
% ta11 = phi + acos(c/a * cos(phi));
% ta12 = phi - acos(c/a * cos(phi));    
% ta1 = min(ta11, ta12);
% 
% r = h1^2/mu /(1+e1 * cos(ta1));
% v1_perp = h1/r;
% v1_r = mu/h1 * e1 * sin(ta1); 
% y1 = atan(v1_r/ v1_perp); 
% v1 = sqrt(v1_r^2 + v1_perp^2);
% 
% v2_perp = h2/r; 
% v2_r = mu/h2 * e2 * sin(ta1 - eta); 
% y2 = atan(v2_r/ v2_perp); 
% v2 = sqrt(v2_r^2 + v2_perp^2);
% 
% dv = sqrt(v1^2 + v2^2 - 2*v1*v2*cos(y2-y1))

%% Problem 13
a = Re + 500; 
e = 0.25; 
i = 20*pi/180;
W = 15*pi/180; 
w = 30*pi/180; 

% True anomaly at apogee
ta = pi;

% Step 1: Get r and v in perifocal frame
p = a*(1 - e^2);

r_pf = (p/(1 + e*cos(ta))) * [cos(ta); sin(ta); 0]
v_pf = sqrt(mu/p) * [-sin(ta); e + cos(ta); 0]

% rotation matrix
R3_W = [cos(W) -sin(W) 0;sin(W)  cos(W) 0;0       0      1];
R1_i = [1 0 0;0 cos(i) -sin(i);0 sin(i)  cos(i)];
R3_w = [cos(w) -sin(w) 0;sin(w)  cos(w) 0;0       0      1];

Q_p2g = R3_W * R1_i * R3_w;

r = Q_p2g * r_pf
v = Q_p2g * v_pf

% Angular momentum direction
h = cross(r,v)
h_hat = h / norm(h);

% delta v 
dv_mag = 0.05; 
v_new = v + dv_mag * h_hat

% Compute new orbital elements
h_new = cross(r, v_new);
n = cross([0;0;1], h_new);
e_vec = (cross(v_new, h_new)/mu) - r/norm(r);
e_new = norm(e_vec);

energy = norm(v_new)^2/2 - mu/norm(r);
a_new = -mu/(2*energy);

i_new = acos(h_new(3)/norm(h_new))
W_new = atan2(n(2), n(1))
w_new = atan2(dot(cross(n,e_vec),h_new)/norm(h_new), dot(n,e_vec))


%% Functions
function [r,v] = oe2rv(a, e, ta, i, W, w)
    % Returns r and v in the GEF frame 
    mu = 398600; 
    h = sqrt(mu * a * (1 - e^2));
    
    r_p = (h^2/mu)/(1+e*cos(ta)) * [cos(ta); sin(ta); 0];
    v_p = mu/h * [-sin(ta); e+cos(ta); 0];
    
    R3w = [cos(w), sin(w), 0; -sin(w), cos(w), 0; 0, 0, 1]; 
    R3W = [cos(W), sin(W), 0; -sin(W), cos(W), 0; 0, 0, 1]; 
    R1i = [1, 0, 0; 0, cos(i), sin(i); 0, -sin(i), cos(i)]; 
    
    Q_g2p = R3w * R1i * R3W;
    Q_p2g = Q_g2p'
    r = Q_p2g * r_p; 
    v = Q_p2g * v_p; 
end 