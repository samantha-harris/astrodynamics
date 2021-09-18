mu                        = 398600;
t0                        = 27*60;
tf                        = 57*60;
rPCI0                     = [-10515.45; -5235.37; 49.17];
vPCI0                     = [-2.10305; -4.18146; 5.563290];

% ------------------------------------------------------------------ %
% ---------- Compute Solution at tf Using Kepler Solver ------------ %
% ------------------------------------------------------------------ %
[rPCIf,vPCIf,E0,nu0,E,nu] = propagateKepler(t0,tf,rPCI0,vPCI0,mu);

% ------------------------------------------------------------------ %
% ----------- Compute Solution at MATLAB Solver ODE 113 ------------ %
% ------------------------------------------------------------------ %
p0                        = [rPCI0; vPCI0];
tspan                     = [t0 tf];
options                   = odeset('RelTol',1e-8);
[tout,pout]               = ode113(@twoBodyOde,tspan,p0,options,mu);
rout                      = pout(:,1:3);
vout                      = pout(:,4:6);
rfOde                     = rout(end,:).';
vfOde                     = vout(end,:).';
oef                       = rv2oe_Harris_Samantha(rfOde,vfOde,mu);
e                         = oef(2);
nuf                       = oef(6);
Ef                        = 2*atan2(-sqrt(1-e)*sin(nuf/2),-sqrt(1+e)*cos(nuf/2))+2*pi;
disp(sprintf('|-------------------------------------------------------------------------------------------------|'));
disp(sprintf('|                                                                                                 |'));
disp(sprintf('|-------------------------------------------------------------------------------------------------|'));
disp(sprintf('|------------------------- Information at Terminal Time Using ODE113 -----------------------------|'));
disp(sprintf('|-------------------------------------------------------------------------------------------------|'));
disp(sprintf('|        xf = terminal x-component of position                       =  %15.5f           |',rout(end,1)));
disp(sprintf('|        yf = terminal y-component of position                       =  %15.5f           |',rout(end,2)));
disp(sprintf('|        zf = terminal z-component of position                       =  %15.5f           |',rout(end,3)));
disp(sprintf('|       vxf = terminal x-component of inertial velocity              =  %15.5f           |',vout(end,1)));
disp(sprintf('|       vyf = terminal y-component of inertial velocity              =  %15.5f           |',vout(end,2)));
disp(sprintf('|       vzf = terminal z-component of inertial velocity              =  %15.5f           |',vout(end,3)));
disp(sprintf('|       nuf = terminal true anomaly                                  =  %15.5f deg       |',nuf*180/pi));
disp(sprintf('|        Ef = terminal eccentric anomaly                             =  %15.5f deg       |',Ef*180/pi));
disp(sprintf('|-------------------------------------------------------------------------------------------------|'));