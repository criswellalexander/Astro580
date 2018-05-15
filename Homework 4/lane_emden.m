%Function to Define Lane-Emden Equation

function le = lane_emden(x,yz,n)
le = zeros(2,1);
le(1) = yz(2);
le(2) = -(abs(yz(1)))^n -(2/x)*yz(2);