%Astro 580 HW4 Problem 7.2 (HKT)
%Simple code to determine density ratio from tabulated M, R, central density data

clear,clc

%Enter Tabulated data from HKT Tables 2.5 & 2.6

%Mass in Solar Masses
MMo = [60;40;30;20;15;10;7;5;3;2;1.75;1.50;1.30;1.20;1.10;1.00;0.90;0.75;0.60;0.50;0.40;0.30;0.20;0.10;0.08]; 
%Radius in 10^10 cm
R10 = [70.96;56.89;48.53;38.73;32.89;25.94;20.99;17.18;12.76;10.30;9.695;9.151;8.827;8.648;8.032;6.931;5.902;4.834;3.908;3.553;2.640;2.054;1.519;0.805;0.650];
%Central Density in g/cm^3
rhoc = [1.93;2.49;3.05;4.21;5.48;8.33;12.6;19.0;35.8;47.0;66.5;76.7;84.1;85.7;84.9;82.2;78.5;81.5;79.1;100;104;107;180;545;775];

%Convert R10 to cm
R = R10.*10^10;

%Convert MMo to g
Msun = 1.989*10^33; %Mo in g
M = MMo.*Msun;

%Find <rho>
vc = 3/(4*pi);
rhoav = vc*(M./(R.^3));

%Find rhoc/<rho>
rhorat = rhoc./rhoav

plot(MMo,rhorat,'k')
xlabel('Mass (Mo)')
ylabel('Central Density / Average Density')
title('HKT Problem 7.2: Density Ratio versus Mass')