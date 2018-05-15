%Astro 580 HW 4
%HKT Problem 7.4
%Code to find solution for Lane-Emdem equation with 2<n<4
clear,clc
%Polytropic Index
nrange = linspace(2,4,11)
for n=nrange
%Conditions at Center
xi = 0.0000000000000000000001; %Xi(0)
yi = 1; %Theta_n(0)
zi = 0; %dtheta_n/dXi(0)

yz0 = [yi,zi];
xspan = linspace(xi,1000,10000);
soln = odeset('Events', @firstzero);
%[x,yz] = ode45(@(x,yz) lane_emden(x,yz,n), xspan, yz0); %,soln);
[x,yz,x1,y1,i1] = ode45(@(x,yz) lane_emden(x,yz,n), xspan, yz0,soln);
disp(x1)
%disp(x)
%disp(yz)
plot(x,yz(:,1))
title('Polytrope Solutions to Lane-Emden Equation for 2 \leq n \leq 4')
xlabel('\xi')
ylabel('\theta_n')
ylim([0,1])
hold on
end
legend('n=2.0','n=2.2','n=2.4','n=2.6','n=2.8','n=3.0','n=3.2','n=3.4','n=3.6','n=3.8','n=4.0')
%text(6.5,-.02,'\xi_1 = 6.9002')