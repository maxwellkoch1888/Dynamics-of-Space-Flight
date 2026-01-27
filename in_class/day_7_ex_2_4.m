%Problem 2.4 in book
clear all; close all; 

mu = 398600;
R = 6378;
r0 = [3207; 5459; 2714];
v0 = [-6.532; 0.7835; 6.142];

h = cross(r0, v0); % angular momentum
hmag = norm(h);
e = cross(v0,h)/mu- r0/norm(r0); % eccentricity
emag = norm(e); 
E = norm(v0)^2 / 2 - mu/norm(r0); % energy

vr = dot(v0, r0/norm(r0)); % radial velocity 

cosTA = dot(r0/norm(r0), e/emag);
TA = -acosd(cosTA); 

rp = hmag^2/2 * 1/(1+emag)

ops = odeset('AbsTol', 1e-12, 'RelTol',1e-12);
[t,x] = ode45(@ode,[0,4*60*60], [r0;v0],ops,mu);

for i = 1: length(t) % verify angular momentum, energy, and eccentricty are const
    r = x(i, 1:3)'; 
    rmag(i) = norm(r);
    v = x(i, 4:6)'; 
    H(:,i) = cross(r,v); 
    E(i) = norm(v)^2/2 - mu/norm(r);

end 

[rmin,Imin] = min(rmag)

rp - rmin 

figure, plot(t, H(1,:)/H(1,1), t, H(2,:)/H(2,1), t,H(3,:)/ H(3,1)), grid on 
figure, plot3(x(:,1), x(:,2), x(:,3), 'linewidth', 3), grid on 


function xdot = ode(t,x,mu)

    r = x(1:3);
    v = x(4:6);

    rdot = v;
    vdot = -mu * r / norm(r)^3;

    xdot = [rdot; vdot];

end