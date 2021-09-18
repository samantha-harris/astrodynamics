
function [tout, y] = integrate(mu, t_initial, t_final, r0, v0)

t         = 1;
tspan     = [t_initial, t_final];%bounds of integration
p0 = [r0;v0];                    %initial position and velocity
options = odeset('reltol', 1e-8);%set the relative error tolerance

%using the ode113 function to solve the differential equations
%'stateEqs' within the time interval 'tspan' and with intital
%conditions 'initiali'
[tout,y] = ode113(@stateEqs, tspan, p0, options, mu);
