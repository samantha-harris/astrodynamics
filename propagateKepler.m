function [rPCIf,vPCIf,E0,nu0,E,nu] = propagateKepler(t0,t,rPCI0,vPCI0,mu)
% % ------------------------------------------------------------------ %
% % ----------------------- propagateKepler.m ------------------------ %
% % ------- Propagate Spacecraft Orbit Using Kepler's Equation ------- %
% % ------------------------------------------------------------------ %
% % Given a position and inertial velocity at a time t0 expressed in   %
% % planet-centered inertial (PCI) coordinates, determine the position %
% % and inertial velocity at a later time t on an elliptic orbit by    %
% % solving Kepler's equation.                                         %
% % ------------------------------------------------------------------ %
% % ------------- Inputs (Supplied Data) for Test Cases -------------- %
% % ------------------------------------------------------------------ %
% %    t0 = initial time                                               %
% %     t = terminal time                                              %
% % rPCI0 = Initial PCI Position                                       %
% % vPCI0 = Initial PCI Inertial Velocity                              %
% %    mu = planet gravitational parameter                             %
% % ------------------------------------------------------------------ %
% % --------- Output (Computed Quantities) from Test Cases ----------- %
% % ------------------------------------------------------------------ %
% % rPCIf = Terminal PCI Position                                      %
% % vPCIf = Terminal PCI Inertial Velocity                             %
% %    E0 = Eccentric Anomaly at Time t0                               %
% %   nu0 = True Anomaly at Time t0                                    %
% %     E = Eccentric Anomaly at Time t                                %
% %    nu = True Anomaly at Time t                                     %
% % ------------------------------------------------------------------ %
% % -------- Note: all quantities must be in consistent units -------- %
% % ------------------------------------------------------------------ %
% % ---------------------------------------------------------------------- %
% % FUNCTIONS THAT WERE USED:    
% %                    t0, t, r0, v0, mu -> rPCI0, vPCI0      r0v02rv.m
% %              t0, t, rsteps, vsteps, mu -> [rPCIf, vPCIf]     rvsteps.m
% % ---------------------------------------------------------------------- %
oe0 = rv2oe_Harris_Samantha(rPCI0,vPCI0,mu);
a     = oe0(1);
e     = oe0(2);
Omega = oe0(3);
inc   = oe0(4);
omega = oe0(5);
nu0   = oe0(6);

E0 = nu2E(e, nu0);
[E,nu] = KeplerSolver(a,e,t0,t,nu0,mu);
oe = [a, e, Omega, inc, omega, nu];
[r,v]  = oe2rv_Harris_Samantha(oe,mu);
[rPCIf,vPCIf] = rvsteps(t0, t, rPCI0, vPCI0, mu);








