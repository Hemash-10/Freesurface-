%The function serves to model the ordinary differential equation, by
%substuting required variables, in a form which enables the ode15i function
%to produce a numerical solution of the equation, with an increased
%friction factor
function dSydSx = fuup(x,y,yp);
p = 2500; % density (kg/m^3)
g = 9,81; % gravity acting on system (m/s^2)
u = 0.7;  % Increased friction factor(assuming no slip)
n = 6e-3; % shear viscosity (Pa.s)
w = 3.85; % Angular velcoity (1/s)
h0= 0.004;% height (m)
theta =40;% angle of repose (degrees)
R= 0.238; % radius of rotating drum (m)
Po= h0*p*g*cos(theta);
kn = (2*Po^3)/(3*n*p^2*g^2*w);

dSydSx=(yp)^3 - u*(yp)^2 +yp -u - (1/kn)*(R^2-(x^2+y^2));
