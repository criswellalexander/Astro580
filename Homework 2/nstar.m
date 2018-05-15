%Saha Functions for Neutron Star
%n(1) is np, n(2) is nn. rho is density, cst = Q*mp*4.03*10^53
function E = nstar(n,rho,cst,ecst)
E(1) = ((n(1))^(2/3))+(ecst*(n(1))^(1/3))-((n(2))^(2/3))-cst;
E(2) = rho-(1.6726219*10^-24)*(n(1)+n(2));