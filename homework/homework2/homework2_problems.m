clear all; close all; 
format long g

%data
mu = 398600; 
R = 6378;

% % problem 6
% r = [7500; -2200; -4100];
% rmag = norm(r);
% v = [3.1;-6.2;4.9];
% vmag = norm(v);
% h = cross(r,v); 
% e = cross(v,h)/mu - r/norm(r)
% emag = norm(e) 
% 
% ta = acos(dot(r,e) / (rmag*emag))


% %problem 7 
% rp = 5000; 
% ra = 100000; 
% 
% e = (ra-rp)/(ra+rp)
% a = (ra+rp)/2
% T = 2*pi / sqrt(mu) * a^(3/2)
% % h = sqrt(rp * mu *(1+e))
% h = sqrt(ra * mu *(1-e));
% energy = -1/2 * mu^2/h^2 * (1-e^2) 
% 
% rd = 10000 + R;
% ta = acos(1/e*(h^2/(mu*rd) - 1))
% r2 = h^2/ mu * 1/(1+e*cos(-ta));


% %problem 8 
% T = 100 * 60;
% rp = 215 + R;
% 
% a = (T*sqrt(mu)/(2*pi))^(2/3);
% ra = 2*a - rp ;
% 
% e = (ra-rp)/(ra+rp)



% % problem 10 
% rp = 250 + R; 
% vp = 15;
% h = rp * vp; 
% 
% v_inf = sqrt(vp^2 - 2*mu/rp)
% e = (h^2/(mu*rp) - 1)
% rd = h^2/mu * 1/ (1 + e*cos(95*pi/180))


% % problem 11
% r = 399000; 
% ta = 140*pi/180; 
% v = 2.36; 
% 
% energy = 1/2*v^2  - mu/r
% a = mu/(2*energy);
% 
% % rearrange conic eqn for a quadratic eqn
% A = a; 
% B = -r*cos(ta); 
% C = -a-r; 
% 
% % keep the solution that makes sense
% e = (-B + sqrt(B^2-4*A*C))/(2*A)
% % sol2 = (-B - sqrt(B^2-4*A*C))/(2*A)
% 
% rp = a*(e-1) - R
% vp = sqrt(2*(energy + mu/(rp + R)))


% % problem 12
% r = [7500; -2200; -4100];
% v = [3.1; -6.2; 4.9];  
% h = cross(r,v); 
% e = cross(v,h)/mu - r/norm(r); 
% q = cross(h, e);
% qhat = q/norm(q)


% % problem 13 
% r_I = [7500; -2200; -4100];
% v_I = [3.1; -6.2; 4.9]; 
% ta = 48 * pi / 180; 
% 
% h = cross(r_I,v_I); 
% hmag = norm(h); 
% e = cross(v_I, h)/mu - r_I/norm(r_I);
% emag = norm(e);
% energy = -0.5 * mu^2/hmag^2*(1-emag^2);
% 
% rd = hmag^2/mu * 1/(1+emag*cos(ta));
% rd_P = [rd*cos(ta); rd*sin(ta); 0];
% 
% phat = e/emag; 
% what = h/hmag; 
% qhat = cross(what, phat); 
% 
% rot_I_to_P = [phat'; qhat'; what']; 
% 
% rd_I = inv(rot_I_to_P) * rd_P
% vd_I = mu/hmag*(-sin(ta) * phat + qhat *(emag+cos(ta)))
