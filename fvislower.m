%The function serves to model the ordinary differential equation, by
%substituting required variables, in a form which enables the ode15i function
%to produce a numerical solution of the equation. This function uses a
%lower viscosity for the ODE
function dSydSx = fvislower(x,y,yp);
p = 2500; % density (kg/m^3)
g = 9,81; % gravity acting on system (m/s^2)
u = 0.5;  % friction factor(assuming no slip)  
n = 7e-3; %decreased viscosity (Pa.s)
w = 3.85; % Angular velocity (1/s)
h0= 0.004;% height (m)
theta =40;% angle of repose (degrees) %0.689132 ;
R= 0.238; % radius of rotating drum (m)
Po= h0*p*g*cos(theta);
kn = (2*Po^3)/(3*n*p^2*g^2*w);

dSydSx=(yp)^3 - u*(yp)^2 +yp -u - (1/kn)*(R^2-(x^2+y^2));