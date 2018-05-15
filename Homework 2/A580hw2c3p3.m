%Code to compute number densities of protons, electrons, and neutrons in a
%neutron star for T~0

clear,clc

rhos = linspace(10^13,2*10^14,10); %density
sr = size(rhos);
m = 1.6726219*10^-24; %proton mass in g
me = 9.10938*10^-28; %electron mass in g
Q = 1.2529021*10^-6; %reaction energy in erg
beta = 4.0303853*10^53; %constant ~1/h^2 in erg^-2*s^-2
alpha = 3.9421808*10^37; %constant
ecst = m*alpha/me;
cst = m*Q*beta;
for i=1:sr(2)
    nsaha=@nstar;
    n0 = [100,10^40];
    rho = rhos(i);
    NT(i,1) = rhos(i)/10^13;
    NT(i,2:3) = fsolve(@(n)nstar(n,rho,cst,ecst),n0);
end

disp(NT)