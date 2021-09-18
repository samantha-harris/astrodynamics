function [rPCI,vPCI]  = oe2rv_Harris_Samantha(oe,mu)

%-%----------------------------------------------------------------------%-
%-%-------------------- Code Template for Computing ---------------------%-
%-%--------- Cartesian Planet-Centered Inertial (PCI) Position ----------%-
%-%------- and Cartesian Planet-Centered Inertial (PCI) Velocity --------%-
%-%------------------------ from Orbital Elements -----------------------%-
%-%----------------------------------------------------------------------%-
%-%--- PRIOR TO SUBMISSION THIS FUNCTION MUST BE RENAMED AS FOLLOWS: ----%-
%-%------------------------- FUNCTION HEADER LINE -----------------------%-
%-%-------- function [rPCI,vPCI] = oe2rv_LastName_FirstName(oe,mu) ------%-
%-%------------------- NAME OF ACTUAL FUNCTION FILE ---------------------%-
%-%-------------------- oe2rv_LastName_FirstName.m ----------------------%-
%-%----------------------------------------------------------------------%-
%-%----------------------------------------------------------------------%-
%-% Input:  orbital elements             (6 by 1 column vector)          %-
%-%   oe(1): Semi-major axis.                                            %-
%-%   oe(2): Eccentricity.                                               %-
%-%   oe(3): Longitude of the ascending node Omega (rad)                       %-
%-%   oe(4): Inclination (rad)                                           %-
%-%   oe(5): Argument of the periapsis omega (rad)                             %-
%-%   oe(6): True anomaly (rad)                                          %-
%-%   mu:    Planet gravitational parameter     (scalar)                 %-
%-% Outputs:                                                             %-
%-%   rPCI:  Planet-Centered Inertial (PCI) Cartesian position           %-
%-%          (3 by 1 column vector)                                      %-
%-%   vPCI:  Planet-Centered Inertial (PCI) Cartesian inertial velocity  %-
%-%          (3 by 1 column vector)                                      %-
%-%----------------------------------------------------------------------%-

%-%----------------------------------------------------------------------%-
%-% ---------- Final Two Lines of Code (UNCOMMENT)                       %- 
%-% rPCI = < PUT YOUR FINAL PCI POSITION HERE >                          %-
%-% vPCI = < PUT YOUR FINAL PCI INERTIAL VELOCITY HERE >                 %-
%-%----------------------------------------------------------------------%-

%assigning elements
a       = oe(1);            %semi-major axis
e       = oe(2);            %eccentricity
Omega   = oe(3);   %longitude of ascending node
inc     = oe(4);   %orbital inclination
omega   = oe(5);   %argument of the periapsis (rad)
nu      = oe(6);   %true anomaly

%transformation matrix tranforming from Reference Frame N to I
TNI = [cos(Omega) -sin(Omega) 0;sin(Omega) cos(Omega) 0; 0 0 1];
%transformation matrix tranforming from Reference Frame Q to N
TQN = [1 0 0; 0 cos(inc) -sin(inc); 0 sin(inc) cos(inc)];
%transformation matrix tranforming from Reference Frame P to Q
TPQ = [cos(omega) -sin(omega) 0; sin(omega) cos(omega) 0; 0 0 1];
%transformation from P to I
TPI = TNI*TQN*TPQ;

r = a*(1-e^2)/(1+e*cos(nu));        %orbit equation
rvp = [r*cos(nu); r*sin(nu);0];     %position of spacecraft in perifocal frame
p = a*(1-e^2);                      %semi-latus rectum
vvp = sqrt(mu/p)*[-sin(nu); e + cos(nu); 0]; %velocity of spacecraft in p frame

rPCI = (TPI*rvp)'; %Planet-Centered Inertial (PCI) Cartesian position
vPCI = (TPI*vvp)'; %Planet-Centered Inertial (PCI) Cartesian velocity







