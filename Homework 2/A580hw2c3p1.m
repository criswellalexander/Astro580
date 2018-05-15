% Astro 580 HW2
%Problem 3.1
%Simultaneously solve Saha eqns
%attempt 2

clear,clc

T = linspace(10^4,2*10^5,2500);
n = size(T);
for i=1:n(2)
    A1 = exp(-7.3516)*(T(i)^(3/2))*exp((-2.85*10^5)/T(i));
    A2 = exp(-6.6585)*(T(i)^(3/2))*exp((-6.31*10^5)/T(i));
    saha = @sahaeqn;
    z0 = [.49,.49];
    S(i,1) = T(i);
    S(i,2:3) = fsolve(@(z)sahaeqn(z,A1,A2),z0);
    S(i,4) = 2*S(i,3)+S(i,2);
    S(i,5) = 1-(S(i,2)+S(i,3));
end

TR = T./(10^4);
TR2 = transpose(TR);
disp([TR2 S(:,2:5)])
plot(T,S(:,2),'r',T,S(:,3),'g',T,S(:,5),'b')
title('Fractional Helium Ionization by Temperature for Density of 10^-4 g/cm^3')
xlabel('Temperature (K)')
ylabel('Ionization Fraction')
legend('He I','He II','Neutral He')

plot(T,S(:,4))
title('Fractional Free Electron Number Density for Density of 10^-4 g/cm^3')
xlabel('Temperature (K)')
ylabel('Fractional Electron Density')


%dlmwrite('c3p1.txt',S,'delimiter','\t','precision',5)
% datafile = fopen('c3p1.txt','w');
% fprintf(datafile,'%-6s %-12s %-12s %-12s %-12s\r\n','T','z1','z2','ze','z0');
% fprintf(datafile,'%6d %1.5f %1.5f %1.5f %1.5f\r\n',S(:,1),S(:,2),S(:,3),S(:,4),S(:,5));
% type c3p1.txt
% fclose(datafile);