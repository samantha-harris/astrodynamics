function [E,nu] = KeplerSolver(a,e,t0,t,nu0,mu)    
    
% % ---------------------------------------------------------------------- %
% % --------- Kepler Solver for Propagation Along Elliptic Orbits -------- %
% % Solve Kepler's equation for the eccentric anomaly and the true anomaly %
% % given an initial time, t0, the initial true anomaly, nu0, the terminal %
% % time, t, the semi-major axis, a, eccentricity, e, and the planet       %
% % gravitational parameter, mu.  This function takes into account the     %
% % number of periapsis crossings en route from t0 to t and assumes that   %
% % the orbit is elliptic (that is, is is assumed that the eccentricity is %
% % strictly less than unity.                                              %
% % ---------------------------------------------------------------------- %
% % Inputs: a, e, mu, t, t0, and nu0                                       %
% %   a     = semi-major axis                                              %
% %   e     = eccentricity                                                 %
% %   t0    = initial time                                                 %
% %   t     = terminal time                                                %
% %   nu0   = true anomaly at t0                                           %
% %   mu    = gravitational parameter of planet                            %
% % ---------------------------------------------------------------------- %
% % Outputs: E and nu                                                      %
% % ---------------------------------------------------------------------- %
% %   E     = the eccentric anomaly at time t                              %
% %   nu    = the true anomaly at time t                                   %                            
% % ---------------------------------------------------------------------- %
% % IMPORTANT: the units of a, mu, t0, and t must be consistent            %
% % ---------------------------------------------------------------------- %
% % FUNCTIONS THAT WERE USED:
% %                       e, nu0  -> E0      nu2E.m
% %          e, E0, t0, t, mu, a  -> E       E02E.m
% %                         e, E  -> nu      E2nu.m
% % ---------------------------------------------------------------------- %
 E0 = nu2E(e, nu0);
 E = E02E(e, E0, t0, t, mu, a);
 nu = E2nu(e, E);
 
 
 
 
 
 
 
 
 
 