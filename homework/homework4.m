clear all; close all; 
format long g
% Global 
mu = 398600; 
R = 6378; 
J2 = 0.00108263; 
Te = 365.26; 

%% Problem 1
% T = 14.5 * 60 * 60; 
% % T = 2*pi * a^(3/2) / sqrt(mu) 
% rp = 10500; 
% t = 12*3600; 
% 
% a = (T*sqrt(mu)/(2*pi))^(2/3);
% ra = 2*a - rp; 
% M = t*2*pi / T;
% 
% e = (ra-rp) / (ra + rp);
% syms x 
% fun = x - e*sin(x) - M;
% if M < pi
%     x0 = M + e/2;
% else 
%     x0 = M - e/2;
% end
% E = newtons_method(fun, x, x0, 1e-12);
% 
% ta = 2*atan2(sin(E/2) * sqrt(1+e), cos(E/2) * sqrt(1-e));
% r = a*(1-e^2)/ (1+e*cos(ta))
% h = sqrt(r*mu*(1+e*cos(ta)));
% energy = -0.5*mu^2/h^2*(1-e^2); 
% v = sqrt(2*(energy + mu/r))
% vr = mu/h*e*sin(ta)

%% Problem 2 
% r1 = [19000; -105000; -20000];
% v1 = [0.9; -3.5; -1.6]; 
% h = cross(r1,v1); hmag = norm(h);
% e = cross(v1,h)/mu - r1/norm(r1); emag = norm(e);
% dt = 2*3600; 
% 
% ta1 = acos((hmag^2/mu/norm(r1) - 1)/emag);
% 
% F = log((sqrt(emag+1) + sqrt(emag-1)*tan(ta1/2))/ (sqrt(emag+1) - sqrt(emag-1)*tan(ta1/2)));
% Mh = emag*sinh(F) - F; 
% t1 = hmag^3/mu^2 * Mh / (emag^2-1)^(3/2);
% t2 = t1 + dt;
% 
% Mh = mu^2/hmag^3 *(emag^2-1)^(3/2)*t2;
% syms x 
% fun = emag*sinh(x) - x - Mh; 
% F = newtons_method(fun, x, Mh, 1e-12);
% 
% ta2 = 2*atan2(sqrt((emag+1))*tanh(F/2), sqrt(emag-1));
% 
% phat = e/emag;
% what = h/hmag;
% qhat = cross(what, phat);
% rot = [phat'; qhat'; what'];
% 
% r2mag = hmag^2/mu * 1/(1+emag*cos(ta2));
% r2 = inv(rot)* [r2mag*cos(ta2); r2mag*sin(ta2); 0]
% v2 = mu/hmag * (-sin(ta2)*phat + (emag+cos(ta2))*qhat)

%% Problem 3 
% z1 = 520; 
% r1mag = R + z1; 
% v1 = [0; 0; 10]; 
% v1mag = norm(v1); 
% RAAN = 275 * pi/180; 
% dec = -60 * pi / 180; 
% 
% r1 = r1mag * [cos(dec)*cos(RAAN); cos(dec)*sin(RAAN); sin(dec)]; 
% 
% vr1 = dot(r1,v1)/r1mag;
% 
% alpha = 2/r1mag - v1mag^2/mu;
% 
% t = 45*60;
% 
% % Initial guess for chi
% chi = sqrt(mu)*abs(alpha)*t;
% 
% for k = 1:100
%     z = alpha*chi^2;
% 
%     if z > 0
%         C = (1 - cos(sqrt(z)))/z;
%         S = (sqrt(z) - sin(sqrt(z)))/(sqrt(z)^3);
%     elseif z < 0
%         C = (cosh(sqrt(-z)) - 1)/(-z);
%         S = (sinh(sqrt(-z)) - sqrt(-z))/(sqrt(-z)^3);
%     else
%         C = 1/2;
%         S = 1/6;
%     end
% 
%     F = r1mag*vr1/sqrt(mu)*chi^2*C + ...
%         (1 - alpha*r1mag)*chi^3*S + ...
%         r1mag*chi - sqrt(mu)*t;
% 
%     dF = r1mag*vr1/sqrt(mu)*chi*(1 - alpha*chi^2*S) + ...
%          (1 - alpha*r1mag)*chi^2*C + r1mag;
% 
%     chi = chi - F/dF;
% end
% 
% % f and g
% f = 1 - chi^2/r1mag * C;
% g = t - chi^3/sqrt(mu) * S;
% 
% r2 = f*r1 + g*v1;
% r2mag = norm(r2); 
% 
% dec2 = asin(r2(3)/r2mag)
% RAAN2 = atan2(r2(2),r2(1))

%% Problem 4 
z1 = 478; 
r1mag = R + z1; 
v1 = [0;0;10]; 
v1mag = norm(v1);
RAAN = 315 * pi / 180; 
dec = -65 * pi / 180; 

r1 = r1mag * [cos(dec)*cos(RAAN); cos(dec)*sin(RAAN); sin(dec)]; 

vr1 = dot(r1,v1)/r1mag;

alpha = 2/r1mag - v1mag^2/mu;

t = 33*60;

% Initial guess for chi
chi = sqrt(mu)*abs(alpha)*t;

for k = 1:100
    z = alpha*chi^2;

    if z > 0
        C = (1 - cos(sqrt(z)))/z;
        S = (sqrt(z) - sin(sqrt(z)))/(sqrt(z)^3);
    elseif z < 0
        C = (cosh(sqrt(-z)) - 1)/(-z);
        S = (sinh(sqrt(-z)) - sqrt(-z))/(sqrt(-z)^3);
    else
        C = 1/2;
        S = 1/6;
    end

    F = r1mag*vr1/sqrt(mu)*chi^2*C + ...
        (1 - alpha*r1mag)*chi^3*S + ...
        r1mag*chi - sqrt(mu)*t;

    dF = r1mag*vr1/sqrt(mu)*chi*(1 - alpha*chi^2*S) + ...
         (1 - alpha*r1mag)*chi^2*C + r1mag;

    chi = chi - F/dF;
end

% f and g
f = 1 - chi^2/r1mag * C;
g = t - chi^3/sqrt(mu) * S;

r2 = f*r1 + g*v1;
r2mag = norm(r2); 

dec2 = asin(r2(3)/r2mag)
RAAN2 = atan2(r2(2),r2(1))


%% Problem 5
% r1 = [2550; 16000; 4150]; 
% v1 = [-3; -1; 4]; 
% h = cross(r1,v1); 
% hmag = norm(h)
% e = cross(v1,h)/mu - r1/norm(r1); 
% emag = norm(e) 
% 
% ra = hmag^2/mu /(1+emag); 
% rp = hmag^2/mu /(1-emag); 
% a = (ra + rp)/2
% 
% inc = acos(h(3)/hmag)
% N = cross([0;0;1], h);
% 
% RAAN = acos(N(1)/norm(N))
% arg = acos(dot(N,e)/(norm(N)*emag))
% ta = acos(dot(e,r1)/(emag*norm(r1)))

%% Problem 6 
% r1 = [0;0; -13000]; 
% v1 = [4.3; 5.1; 5.9]; 
% h = cross(r1,v1); 
% hmag = norm(h)
% e = cross(v1,h)/mu - r1/norm(r1); 
% emag = norm(e) 
% 
% ra = hmag^2/mu /(1+emag); 
% rp = hmag^2/mu /(1-emag); 
% 
% inc = acos(h(3)/hmag)
% N = cross([0;0;1], h);
% 
% RAAN = acos(N(1)/norm(N))
% arg = acos(dot(N,e)/(norm(N)*emag))
% ta = acos(dot(e,r1)/(emag*norm(r1)))

%% Problem 7
% e = 1.4; 
% zp = 350; 
% rp = R + zp; 
% inc = 30*pi/180; 
% RAAN = 120*pi/180; 
% arg = 112*pi*180;
% t = 60; 
% 
% % Step 1: calculate r_p
% 
% h = sqrt(rp*mu*(1+e));
% 
% % calculate ta 
% Mh = mu^2/h^3 *(e^2-1)^(3/2)*t;
% syms x 
% fun = e*sinh(x) - x - Mh; 
% F = newtons_method(fun, x, Mh, 1e-12);
% 
% ta = 2*atan2(sqrt((e+1))*tanh(F/2), sqrt(e-1));
% r_p = h^2/mu /(1+e*cos(ta)) * [cos(ta); sin(ta); 0]; 
% 
% % Step 2: calculate v_p 
% v_p = mu/h * [-sin(ta); e+cos(ta); 0 ]; 
% 
% % Step 3: calculate Q_P2I, Q_I2P = R3(arg) * R1(inc) * R3(RAAN) 
% 
% R3_o = [cos(arg), sin(arg), 0; -sin(arg), cos(arg), 0; 0, 0, 1]; 
% R1_i = [1, 0, 0; 0, cos(inc), sin(inc); 0, -sin(inc), cos(inc)]; 
% R3_O = [cos(RAAN), sin(RAAN), 0; -sin(RAAN), cos(RAAN), 0; 0, 0, 1]; 
% Q_I2P = R3_o * R1_i * R3_O; 
% Q_P2I = inv(Q_I2P); 
% 
% % Step 4: rotate r_p and v_p 
% 
% r_I = Q_P2I * r_p
% v_I = Q_P2I * v_p 


%% Problem 8
% e = 0.11; 
% a = 7000; 
% inc = 40*pi/180; 
% RAAN = 5*pi/180; 
% arg = 25*pi/180; 
% ta = 15*pi/180; 
% 
% % Step 1: Calculate r_p 
% r_p = a*(1-e^2)/(1+e*cos(ta)) * [cos(ta); sin(ta); 0]; 
% rp = a*(1-e^2)/(1+e); 
% h = sqrt(rp*mu*(1+e*cos(ta)));
% 
% % Step 2: calculate v_p 
% v_p = mu/h * [-sin(ta); e+cos(ta); 0]; 
% 
% % Step 3: calculate Q_P2I, Q_I2P = R3(arg) * R1(inc) * R3(RAAN) 
% 
% R3_o = [cos(arg), sin(arg), 0; -sin(arg), cos(arg), 0; 0, 0, 1]; 
% R1_i = [1, 0, 0; 0, cos(inc), sin(inc); 0, -sin(inc), cos(inc)]; 
% R3_O = [cos(RAAN), sin(RAAN), 0; -sin(RAAN), cos(RAAN), 0; 0, 0, 1]; 
% Q_I2P = R3_o * R1_i * R3_O; 
% Q_P2I = inv(Q_I2P); 
% 
% % Step 4: rotate r_p and v_p 
% 
% r_I = Q_P2I * r_p
% v_I = Q_P2I * v_p 

%% Problem 9 

%% functions
function root = newtons_method(f_sym, sym_var, x0, tol)
    f_prime = diff(f_sym, sym_var);
    error = 1; 
    while error > tol
        % Calculate function and derivative
        f_res = double(subs(f_sym, sym_var, x0));        
        f_prime_res = double(subs(f_prime, sym_var, x0));

        % Implement newton's method
        x1 = x0 - f_res/ f_prime_res;

        % Estimate error and update value
        error = abs((x1-x0)/ x1);
        x0 = x1;
    end
    root = x0; 
end

