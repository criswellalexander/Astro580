%seccond attempt at saha code
function S = sahaeqn(z,A1,A2)
S(1) = A1.*(1-z(1)-z(2))-(z(1).^2+2.*z(1).*z(2));
S(2) = A2.*z(1)-(2*z(2).^2+z(1).*z(2));