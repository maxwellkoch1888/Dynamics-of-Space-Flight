clear all; close all; 
format long g

% Global data
R = 6378; 
mu = 398600;

%% Problems
% % Problem 1
% % find ta, distance and speed when ta increases by 75 deg
% r = [3440; -1750; 7758];
% rmag = norm(r);
% v = [5.3; -5.4; 1];
% vmag = norm(v);
% h = cross(r,v); 
% hmag = norm(h) ;
% e = cross(v,h)/mu - r/norm(r); 
% emag = norm(e);
% E = -0.5 * mu^2/hmag^2 * (1 - emag^2);
% 
% ta = acos((hmag^2/(mu*rmag) - 1) / emag)
% 
% ta1 = ta + 75*pi/180;
% r1 = hmag^2/mu * 1/(1 + emag*cos(ta1));
% r1mag = norm(r1)
% v1mag = sqrt(2 * (E + mu/rmag))


% % Problem 2
% syms x 
% fun = x^2 - 5*x + 4.15 - 10*exp(sin(x));
% root1 = newtons_method(fun, x, 0, 1e-12)
% root2 = newtons_method(fun, x, 5, 1e-12)
% root3 = newtons_method(fun, x, 10, 1e-12)


% % Problem 4
% zp = 150; 
% za = 350; 
% rp = zp + R; 
% ra = za + R;
% ta = 35 * pi / 180; 
% 
% a = (ra+rp)/2
% T = 2*pi/sqrt(mu) * a^(3/2)
% n = 2*pi/T % mean motion
% e = (ra-rp)/(ra+rp)
% E = 2*atan2( sqrt(1-e)*sin(ta/2), sqrt(1+e)*cos(ta/2) ) % eccentric anomaly
% M = E - e*sin(E) % mean anomaly
% t = M*T / (2*pi)


% % Problem 5
% zp = 150; 
% za = 350; 
% rp = zp + R; 
% ra = za + R;
% t = 18 * 60; 
% 
% a = (ra+rp)/2;
% T = 2*pi/sqrt(mu) * a^(3/2);
% M = t*2*pi / T
% 
% e = (ra-rp) / (ra + rp);
% syms x 
% fun = x - e*sin(x) - M;
% if M < pi
%     x0 = M + e/2;
% else 
%     x0 = M - e/2;
% end
% E = newtons_method(fun, x, x0, 1e-12)
% 
% ta = 2*atan2(sin(E/2) * sqrt(1+e), cos(E/2) * sqrt(1-e))

% % Problem 6
% r1 = [3440; -1750; 7758];
% rmag1 = norm(r1);
% v1 = [5.3; -5.4; 1];
% vmag1 = norm(v1);
% dt = 26 * 60; 
% 
% h = cross(r1,v1); 
% hmag = norm(h);
% e = cross(v1,h)/mu - r1/rmag1;
% emag = norm(e)
% ra = hmag^2/mu * 1/(1-emag);
% rp = hmag^2/mu * 1/(1+emag);
% a = (ra+rp)/2;
% T = 2*pi/sqrt(mu) * a^(3/2);
% 
% ta1 = acos((hmag^2/(mu*rmag1) - 1) / emag)
% E1 = 2*atan2( sqrt(1-emag)*sin(ta1/2), sqrt(1+emag)*cos(ta1/2) ) % eccentric anomaly
% M1 = E1 - emag*sin(E1) % mean anomaly
% t1 = M1*T / (2*pi)
% 
% t2 = t1 + dt
% M2 = t2*2*pi / T
% 
% syms x 
% fun = x - emag*sin(x) - M2;
% if M2 < pi
%     x0 = M2 + emag/2;
% else 
%     x0 = M2 - emag/2;
% end
% E2 = newtons_method(fun, x, x0, 1e-12)
% 
% ta2 = 2*atan2(sin(E2/2) * sqrt(1+emag), cos(E2/2) * sqrt(1-emag))
% 
% phat = e/emag; 
% what = h/hmag;
% qhat = cross(what, phat); 
% rot = [phat'; qhat'; what'];
% 
% r2mag = hmag^2/mu * 1/(1+emag*cos(ta2));
% r2 = inv(rot)* [r2mag*cos(ta2); r2mag*sin(ta2); 0]
% v2mag = mu/hmag * (-sin(ta2)*phat + e+cos(ta2)*qhat)


% % Problem 7
% zp = 210; 
% za = 600; 
% rp = zp + R; 
% ra = za + R;
% rmin = 435 + R; 
% 
% a = (ra + rp)/2; 
% e = (ra-rp)/(ra+rp);
% ta = acos((a/rmin*(1-e^2) - 1)/e);
% T = 2*pi/sqrt(mu) * a^(3/2);
% E = 2*atan2( sqrt(1-e)*sin(ta/2), sqrt(1+e)*cos(ta/2) ); % eccentric anomaly
% M = E - e*sin(E); % mean anomaly
% t = M*T / (2*pi);
% time_above = T - 2*t


% % Problem 8
% rp = 7500;
% ra = 16000; 
% ta = 75 * pi / 180; 
% 
% e = (ra-rp)/(ra+rp);
% a = (ra + rp)/2; 
% T = 2*pi/sqrt(mu) * a^(3/2);
% E = 2*atan2( sqrt(1-e)*sin(ta/2), sqrt(1+e)*cos(ta/2) ); % eccentric anomaly
% M = E - e*sin(E); % mean anomaly
% t = M*T / (2*pi);
% 
% t1 = t + 45*60; 
% M1 = t1*2*pi / T;
% 
% syms x 
% fun = x - e*sin(x) - M1;
% if M1 < pi
%     x0 = M1 + e/2;
% else 
%     x0 = M1 - e/2;
% end
% E2 = newtons_method(fun, x, x0, 1e-12);
% 
% ta2 = 2*atan2(sin(E2/2) * sqrt(1+e), cos(E2/2) * sqrt(1-e))


% % Problem 9
% zp = 300; 
% rp = zp + R; 
% e = 1;
% rd = 925000;
% 
% vp = sqrt(2*mu/rp);
% h = rp*vp
% ta = acos((h^2/(mu*rd) - 1)) / e
% Mp = 0.5 * tan(ta/2) + 1/6 * (tan(ta/2))^3
% t = Mp / mu^2 * h^3


% % Problem 10
% rp = 6200; 
% v_esc = sqrt(2*mu/rp);
% vp = 1.2 * v_esc;
% t = 24*60*60; 
% 
% h = vp * rp;
% e = h^2/(mu * rp) - 1
% Mh = mu^2/h^3 * (e^2 - 1)^(3/2) * t
% 
% syms x
% fun = e*sqrt(e^2-1)*sin(x) / (1+ e*cos(x)) - log((sqrt(e+1) + sqrt(e-1) * tan(x/2)) / (sqrt(e+1) - sqrt(e-1) * tan(x/2))) - Mh; 
% ta = newtons_method(fun, x, 120, 1e-12)
% 
% F = log((sqrt(e+1) + sqrt(e-1) * tan(ta/2)) / (sqrt(e+1) - sqrt(e-1) * tan(ta/2)))


%% Functions
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