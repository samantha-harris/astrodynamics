function oe = rv2oe_Harris_Samantha(rPCI,vPCI,mu)

%-%----------------------------------------------------------------------%-
%-%------------ Code Template for Computing Orbital Elements ------------%-
%-%----------- from Cartesian Planet-Centered Inertial (PCI) ------------%-
%-%-------- and Cartesian Planet-Centered Inertial (PCI) Velocity -------%-
%-%----------------------------------------------------------------------%-
%-%--- PRIOR TO SUBMISSION THIS FUNCTION MUST BE RENAMED AS FOLLOWS: ----%-
%-%------------------------- FUNCTION HEADER LINE -----------------------%-
%-%---------- function oe = rv2oe_LastName_FirstName(rv,vv,mu) ----------%-
%-%------------------- NAME OF ACTUAL FUNCTION FILE ---------------------%-
%-%-------------------- rv2oe_LastName_FirstName.m ----------------------%-
%-%----------------------------------------------------------------------%-
%-%----------------------------------------------------------------------%-
% Inputs:                                                                %-
%    rPCI:  Cartesian planet-centered inertial (PCI) position (3 by 1)   %-
%    vPCI:  Cartesian planet-centered inertial (PCI) velocity (3 by 1)   %-
%    mu:    gravitational parameter of centrally attacting body.         %-
% Outputs:  orbital elements                                             %-
%    oe(1): semi-major axis.                                             %-
%    oe(2): eccentricity.                                                %-
%    oe(3): longitude of the ascending node (rad)                        %-
%    oe(4): inclination (rad)                                            %-
%    oe(5): argument of the periapsis (rad)                              %-
%    oe(6): true anomaly (rad)                                           %-
%-%----------------------------------------------------------------------%-

%-%----------------------------------------------------------------------%-
%-% ------------------ Format of Final Line of Code -------------------- %- 
%-% oe = [a; e; Omega; inc; omega; nu];                                  %-
%-%----------------------------------------------------------------------%-
%-%--- IMPORTANT: THE OUTPUT oe MUST BE A COLUMN VECTOR OF LENGTH SIX ---%-

hv = cross(rPCI,vPCI);                      %angular momentum vector
h = norm(hv);                               %magnitude of angular momentum
p = h^2/mu;                                 %semi-latus rectum
ev = cross(vPCI, hv)/mu - rPCI/norm(rPCI);  %eccentricity vector
e = norm(ev);                               %eccentricity
a = p/(1-e^2);                              %semi-major axis

px = ev/norm(ev);         %Perifocal bases x direction
pz = hv/norm(hv);         %Perifocal bases y direction
py = cross(pz,px);        %Perifocal bases z direction

I = [1 0 0;0 1 0; 0 0 1]; %Inertial Bases
Ix = I(:,1);              %Inertial bases x direction
Iy = I(:,2);              %Inertial bases y direction
Iz = I(:,3);              %Inertial bases z direction

%TRUE ANOMALY
nu = atan2(dot(rPCI, py),dot(rPCI, px));%pg 42 in notes
if nu < 0 %make sure the angle is [0,2pi]
   nu  = nu + 2*pi;
end
nudeg = rad2deg(nu);%convert from radians to degrees

n = cross(Iz, hv); %pg 39 in notes 

%LONGITUDE OF THE ASCENDING NODE
Omega = atan2(dot(n, Iy),dot(n,Ix));
if Omega < 0 %make sure the angle is [0,2pi]
    Omega = Omega + 2*pi;
end
Omegadeg = rad2deg(Omega);%convert from radians to degrees
%go from I bases to N basis
TNI = [cos(Omega) -sin(Omega) 0;sin(Omega) cos(Omega) 0; 0 0 1];
N = I*TNI;
Nx = N(:,1);
Ny = N(:,2);
Nz = N(:,3);

%INCLINATION
inc = atan2(dot(-hv, Ny),dot(hv, Nz));%pg 40 in notes
incdeg = rad2deg(inc); %convert from radians to degrees

%ARGUMENT OF PERIAPSIS
omega = atan2(dot(-ev,cross(hv,n)), -h*dot(ev,n)) + pi;%pg 41 in notes
omegadeg = rad2deg(omega); %convert from radians to degrees
%put all orbital elements in a column vector
oe = [a; e; Omega; inc; omega; nu];
%oedeg = [a; e; Omegadeg; incdeg; omegadeg;nudeg];


