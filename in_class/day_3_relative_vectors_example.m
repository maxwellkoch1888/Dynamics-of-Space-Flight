clear all; close all; 

%data 
r0_IJK = [100; 200; 300]; 
v0_IJK = [-50; 30; -10];
w_IJK = [1; -0.4; 0.6];
r_IJK = [300; -100; 150];
v_IJK = [70; 25; -20];

% what is the position of P relative to the moving frame
% i.e. reletative to point O
r_rel_IJK = r_IJK - r0_IJK

% what is the velocity relative to the moving frame?
v_rel_IJK = v_IJK - v0_IJK - cross(w_IJK, r_rel_IJK) 

%can't find accel, were'nt given a or a_rel for the problem. 
