%Function to set up system of differential equations
%dXdt(1) -> dX4/dt, 2->dX12/dt, 3->dX16/dt, 4->dX20/dt
%X(1) ->X4, 2 -> X12, 3->X16, 4->X20
function dXdt = alphadiff(t,X,C4,C12,C16)
dXdt = zeros(4,1);
dXdt(1) = -2*C4*X(1)^3 - 4*C12*X(1)*X(2) - 4*C16*X(1)*X(3);
dXdt(2) = 2*C4*X(1)^3 - 12*C12*X(1)*X(2);
dXdt(3) = 16*C12*X(1)*X(2) - 16*C16*X(1)*X(3);
dXdt(4) = 20*C16*X(1)*X(3);