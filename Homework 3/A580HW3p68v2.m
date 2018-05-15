%Code to determine T(t) and find helium flash
%A580 HW3 HKT6.8
clear,clc
%Define constants

rho = 2*10^5; %g/cm^3
T9i = .15; %Initial T in 10^9K
cvhe = 1.2471*10^8; %Ideal gas Cv for He
B = 9.739*10^5; %g/cm^3
Y = 1; %Mass fraction of He (pure He)
ue = 2/Y; %Chemical potential of e- for fully ionized He
x = (rho/(ue*B))^(1/3); %Constant for use in finding cve
T9(1) = T9i;
ti = 0;
t(1) = ti;
i=1;
dt = 1.157*10^-7;
while T9(i)<=.8
    if i>1
        i = i+1;
        t(i) = ti+(i-1)*dt;
        T9(i) = T9(i-1)+dT;
    end
    E3a = 3600*24*(5.1*10^8)*rho^2*Y^3*T9(i)^-3*exp(-4.4027/T9(i)); %Energy generation rate for 3-alpha. erg/g/s
    cve = (1.35*10^14)*rho^-1*T9(i)*x*sqrt(1+x^2); %Cv for e-
    C = cvhe+cve; %Total Specific Heat
    dTdt = E3a/C;
    dT = dTdt*dt;
    if i==1
        T9 = [T9,0];
        i=2;
    end
end

plot(t,T9,'-o')