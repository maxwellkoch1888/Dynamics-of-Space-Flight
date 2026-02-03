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

vr = dot(v0, r0/norm(r0))
cosTA = dot(r0/norm(r0), e/emag)
if vr >= 0
    ta0 = acos(cosTA)
else 
    ta0 = -acos(cosTA)
end

%Define perifocal unit vectors 
phat = e/emag; 
what = h/hmag; 
qhat = cross(what, phat)

ta = 15*pi/180; %true anomaly
r_I = hmag^2 /mu * 1/(1+emag*cos(ta)) * (cos(ta)*phat + sin(ta)*qhat) %inertial
r_P = hmag^2 /mu * 1/(1+emag*cos(ta)) * [cos(ta);sin(ta); 0] % perifocal
r_P = hmag^2 /mu * 1/(1+emag*cos(ta)) * (cos(ta)*[1;0;0] + sin(ta)*[0;1;0])

ta = ta0 + 38*pi / 180
v = mu/hmag *(-sin(ta)*phat + (emag+cos(ta))*qhat)
v_P = mu/hmag *(-sin(ta)*[1;0;0] + (emag+cos(ta))*[0;1;0])

% Make some graphs 
ta = linspace(0,2*pi);
for i = 1:length(ta)
    r(:,i) = hmag^2 /mu * 1/(1+emag*cos(ta(i))) * (cos(ta(i))*phat + sin(ta(i))*qhat); %inertial
    v(:,i) = mu/hmag *(-sin(ta(i))*phat + (emag+cos(ta(i)))*qhat);
    r_P(:,i) = hmag^2 /mu * 1/(1+emag*cos(ta(i))) * [cos(ta(i));sin(ta(i)); 0]; % perifocal
    R_P(:,i) = [phat.'; qhat.'; what.'] * r(:,i);
    v_P(:,i) = mu/hmag *(-sin(ta(i))*[1;0;0] + (emag+cos(ta(i)))*[0;1;0]);
end 

figure, plot3(r(1,:), r(2,:), r(3,:)), grid on
figure, plot3(r_P(1,:), r_P(2,:), r_P(3,:)), grid on, hold on 
plot3(R_P(1,:), R_P(2,:), r_P(3,:), '--')