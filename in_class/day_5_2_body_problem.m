clear all; close all; 

%example 2.2
G = 6.6742e-11 / (1000^3);     %m3/kg/s2
R10 = [0;0;0];         
R20 = [3000; 0; 0];
V10 = [10; 20; 30];
V20 = [0; 40; 0];
m1  = 10^26;
m2  = m1;

ops = odeset('AbsTol', 1e-12, 'RelTol', 1e-12);

[t,x] = ode45(@ode, [0,480], [R10;V10;R20;V20], ops, G, m1,m2);
R1 = x(:, 1:3);
R2 = x(:, 7:9);
rG = (m1*R1 + m2*R2)/ (m1+m2);
figure, plot3(R1(:,1), R1(:,2),R1(:,3), 'linewidth', 3), grid on, hold on 
plot3(R2(:,1), R2(:,2),R2(:,3), 'linewidth', 3), grid on, hold on 
plot3(rG(:,1), rG(:,2),rG(:,3), 'linewidth', 3), grid on, hold on 

r = R2-R1; 
rG1 = rG - R1; 

figure, plot3(r(:,1), r(:,2), r(:,3),'linewidth', 3), grid on, hold on 
plot3(rG1(:,1), rG1(:,2), rG1(:,3),'linewidth', 3), grid on, hold on 


function xdot = ode(t, x, G, m1, m2)

R1 = x(1:3);
V1 = x(4:6);
R2 = x(7:9);
V2 = x(10:12);

r = R2 - R1;
rnorm = norm(r);

R1dot = V1;
V1dot =  G*m2/rnorm^3 * r;
R2dot = V2;
V2dot = -G*m1/rnorm^3 * r;

xdot = [R1dot; V1dot; R2dot; V2dot];

end
