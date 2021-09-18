function pdot = twoBodyOde(t,p,mu)

%-%-----------------------------------------------%-%
%-%     Computes the right-hand side dynamics     %-%
%-%     for the two-body differential equation.   %-%
%-%-----------------------------------------------%-%
%-% Inputs:                                       %-%
%   t: current time                               %-%
%   p:      6 by 1 column matrix containing the   %-%
%           state of the spacecraft at time t     %-%
%   p(1:3): Planet-centered position              %-%
%   p(4:6): Planet-centered inertial position     %-%
%-% Output:                                       %-%
%-%   pdot: 6 by 1 column matrix containing the   %-%  
%-%         rate of change of the state at time t %-%  
%-%-----------------------------------------------%-%
%-% ASSUMPTION:  CANONICAL UNITS ARE USED (MU=1)  %-%
%-%-----------------------------------------------%-%

%-%-----------------------------------------------%-%
%-%       Gravitational Parameter = mu = 1        %-%
%-%-----------------------------------------------%-%

%-%-----------------------------------------------%-%
%-%  Extract the position and inertial velocity   %-%
%-%-----------------------------------------------%-%

%-%-----------------------------------------------%-%
%-%       Compute the planet-centered radius      %-%
%-%-----------------------------------------------%-%
pdot = stateEqs(t, p, mu);






