clear all; close all; 

%data 
r0_IJK = [-16; 84; 59];
v0_IJK = [7; 9; 4];
a0_IJK = [3; -7; 4];

w_IJK = [-0.8; 0.7; 0.4];
wdot_IJK = [-0.4; 0.9; -1.0];

r_IJK = [51; -45; 36];

vrel_ijk = [31; -68; -77];
arel_ijk = [2; -6; 5];

% Transformation matrices
ihat = [-0.1567; -0.31235; 0.93704];
jhat = [-0.1294; 0.94698; 0.29409];
khat = [-0.97922; -0.075324; -0.18831];

T_I2i = [ihat'; jhat'; khat'];


% velocity of origin of moving frame in ijk
v0_ijk = T_I2i * v0_IJK;
T_i2I = inv(T_I2i);

% velocity of point P in IJK
vrel_IJK = T_i2I * vrel_ijk;
rrel_IJK = r_IJK - r0_IJK;

v_IJK = v0_IJK + vrel_IJK + cross(w_IJK, rrel_IJK)

% velocity of particle P in the unit velocity direction 
uv_IJK = v_IJK / norm(v_IJK);
v_uv_IJK = norm(v_IJK) * uv_IJK

% able to calculate accelerations with given information