%Code to compute mass fractions of He, C, O, and Ne for He burning
%A580 HW3 HKT6.6

clear,clc

%Define Constants
C4 = 2.5*10^-12;
C12 = 0.7*1.22*10^-14;
C16 = 4.75*10^-20;
X4i = 1;
X12i = 0;
X16i = 0;
X20i = 0;
tend = 5*10^6; %in years
tends = tend*3600*24*365;
%Equation solver
tspan = linspace(0,tends,1000);
X0 = [X4i, X12i, X16i, X20i];
[t,X] = ode23(@(t,X) alphadiff(t,X,C4,C12,C16),tspan,X0);
%Convert to yr

tyears = t./(3600*24*365);
%Plot
plot(tyears,X(:,1),'b',tyears,X(:,2),'g',tyears,X(:,3),'r',tyears,X(:,4),'k')
title('Mass Fractions for Helium Burning')
xlabel('Time (years)')
ylabel('Mass Fraction')
legend('Helium 4','Carbon 12','Oxygen 16','Neon 20')
