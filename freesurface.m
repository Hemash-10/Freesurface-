clc
%The use of rotating drums is vastly used in the mining, metallurgy, chemical and pharmaceutical industries with
%the purpose of mixing, drying, granulation, milling and kilns. This code focuses on the free surface modelling
%of a rotating drum used in the milling industry with the objective of developing the free surface curve and a 
%comparative study of the varying parameters on the curve. The operation of a drum includes the use
%of granular material in addition to steel balls or rods to allow for the material to break down and the 
%behaviour of the granular material and flow pattern in the drum can be investigated by means of the rotational
%speed (Bhimji, 2009).

%The free surface curve is modeled by a non-linear, 2 space varible ordinary differential equation 
%The ODE is setup by the following functions: fsurface, fw(increasing rotational speed), fwlower(decreasing
% rotational speed), fuup(increased friction), fulow(decreased friction),
% fvisup(increased viscosity), fvislower(decreased viscosity)
% The circle is placed at origin to enable the symmetric nature  of the freesurface
% profile to be used, by placing the point of inflection at (0,0)

h = circle(0,0,0.238) % creates a circle at orgin, represents the rotating mill in a 2-dimensional space
hold on 
% ode15i is used to numerically solve of the ODE of the free surface curve,
% xo,yo are used as initial conditions
% yo, yp are initial conditions for y and y' respectively

xnewspan= [0 0.238]; %specifies the interval of integration
xo = 0;
yo= 0;
yp=tan(40);
[x1,y1] = ode15i(@fsurface,xnewspan,yo,yp);
plot(x1,y1,'k')
hold on 
% models the effect of increased rotational speed on the free surface curve
xnewspan= [0 0.238];
xo = 0;
yo= 0;
yp=tan(40);
[x2,y2] = ode15i(@fw,xnewspan,yo,yp);
plot(x2,y2,'r')
hold on
% Models the effect of decreased rotational speed on the free surace curve
xnewspan= [0 0.238];
xo = 0;
yo= 0;
yp=tan(40);
[x4,y4] = ode15i(@fwlower,xnewspan,yo,yp);
plot(x4,y4,'g')
hold on 
% Models the effect of increased friction on the free surface curve
xnewspan= [0 0.238];
xo = 0;
yo= 0;
yp=tan(40);
[x6,y6] = ode15i(@fuup,xnewspan,yo,yp);
plot(x6,y6,'b')
hold on 
% Models the effect of decreased friction on the free surface curve
xnewspan= [0 0.238];
xo = 0;
yo= 0;
yp=tan(40);
[x8,y8] = ode15i(@fulow,xnewspan,yo,yp);
plot(x8,y8,'c')
hold on 
% Models the effect of increased viscosity on the free surface curve
xnewspan= [0 0.238];
xo = 0;
yo= 0;
yp=tan(40);
[x10,y10] = ode15i(@fvisup,xnewspan,yo,yp);
plot(x10,y10,'y')
hold on 
%  Models the effect of decreased viscosity on the free surface curve
xnewspan= [0 0.238];
xo = 0;
yo= 0;
yp=tan(40);
[x12,y12] = ode15i(@fvislower,xnewspan,yo,yp);
plot(x12,y12,'m')
hold on 
% Reflects increased speed  free surface curve about the x and y axis
x3 = -x2;
y3 = -y2;
plot(x3,y3,'r')
hold on 
%Uses symmtery of the problem to reflect the solution about the x and y
%axis
x = -x1;
y = -y1;
plot(x,y,'k')
hold on 
% Reflects decreased rotational speed free surface curve about the x and y
% axis
x5 = -x4;
y5 = -y4;
plot(x5,y5, 'g')
hold on 
%Reflects the increased friction free surface surve about x and y axis
x7 = -x6;
y7 = -y6;
plot(x7,y7,'b')
hold on 
%Reflects decreased friction free surface curve about the x and y axis 
x9 = -x8;
y9 = -y8;
plot(x9,y9,'c')
hold on 
% Reflects the increased viscosity free surface curve about the x and y
% axis
x11 = -x10;
y11 = -y10;
plot(x11,y11,'y')
hold on 
%Reflects the decreased viscosity free surface curve about the x and y
% axis
x13 = -x12;
y13 = -y12;
plot(x13,y13,'m')
hold on 
axis equal 
xlabel('x')
ylabel('y')
title('Free Surface Curve with varing parameters in rotating drum')
legend('rotating drum','free surface curve','increased rotating drum speed', 'decreasing rotating drum speed', 'increased friction', 'decreased friction','increased viscosity','decreased viscosity')
