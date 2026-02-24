clear all; close all; 

% Data
R = 6378; 
mu = 398600; 
r = [-6045; -3490; 2500];
v = [-3.457; 6.618; 2.533]; 

% Find all orbital elements 
h = cross(r,v); hmag = norm(h)
e = cross(v,h)/mu - r/norm(r); emag = norm(e)
vr = dot(v, r/norm(r));
if vr >= 0
    ta = acos(dot(e/emag, r/norm(r)));
else 
    ta = -acos(dot(e/emag, r/norm(r)));
end 

inc = acos(h(3)/hmag)

N = cross([0;0;1], h); 
if N(2) >= 0
    RAAN = acos(N(1)/norm(N)); 
else 
    RAAN = 2*pi - acos(N(1)/norm(N)); 
end 

if e(3) >= 0
    wp = acos(dot(N/norm(N), e/emag)); 
else 
    wp = 2*pi - acos(dot(N/norm(N), e/emag)); 
end 
