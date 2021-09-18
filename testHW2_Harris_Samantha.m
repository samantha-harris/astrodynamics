clc
clear all

%Chapter 2 Problems 5 - 10
%2-5
mu5 = 1;
rv5 = [.7;.6;.3];
vv5 = [-.8;.8;0];

oe5 = rv2oe_Harris_Samantha(rv5,vv5,mu5);
a = oe5(1); 
e = oe5(2);                                          

%orbital period
tao = 2*pi*sqrt(a^3/mu5);
%semi-latus rectum
p = a*(1-e^2);
%specific angular momentum
hv = cross(rv5, vv5);
%magnitude of specific angular momentum
h = norm(hv);
%specific mechanial energy
E = -mu5/2*a;
%periapsis radius
rp = p/(1+e);

%2-6
[rSCI6,vSCI6]  = oe2rv_Harris_Samantha(oe5,mu5);

%2-7
muEarth = 398600;
a7 = 15307.548;
e7 = .7;
Omega7 = 194;
inc7 = 39;
omega7 = 85;
nu7 = 48;

oe7 = [a7;e7;Omega7;inc7;omega7;nu7];

[rECI7,vECI7]  = oe2rv_Harris_Samantha(oe7,muEarth);
oe7c = rv2oe_Harris_Samantha(rECI7,vECI7,muEarth);

%2-8
a8 = 19133.333;
e8 = .5;
Omega8 = 30;
inc8 = 45;
omega8 = 45;
nu8 = 0;

oe8 = [a8;e8;Omega8;inc8;omega8;nu8];

[rECI8,vECI8]  = oe2rv_Harris_Samantha(oe8,muEarth);
oe8c = rv2oe_Harris_Samantha(rECI8,vECI8,muEarth);

%2-9
a9 = 20000;
e9 = .45;
Omega9 = 59;
inc9 = 27;
omega9 = 94;
nu9 = 58;

oe9 = [a9;e9;Omega9;inc9;omega9;nu9];

[rECI9,vECI9]  = oe2rv_Harris_Samantha(oe9,muEarth);
oe9c = rv2oe_Harris_Samantha(rECI9,vECI9,muEarth);

%2-10
mu10 = 1;
a10 = 1.6;
e10 = .4;
Omega10 = 287;
inc10 = 46;
omega10 = 28;
nu10 = 139;

oe10 = [a10;e10;Omega10;inc10;omega10;nu10];

[rPCI10,vPCI10]  = oe2rv_Harris_Samantha(oe10,mu10);
oe10c = rv2oe_Harris_Samantha(rPCI10,vPCI10,mu10);

fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('                        Question (2-5):                         \n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('                            Part a):                         \n'); 
fprintf('-------------------------------------------------------------\n');
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f AU\n',oe5(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe5(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe5(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe5(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe5(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe5(6));
fprintf('-------------------------------------------------------------\n');
fprintf('                            Part b):                         \n'); 
fprintf('-------------------------------------------------------------\n');
fprintf('orbital period (tao) \t\t\t = %10.6f TU\n',tao);
fprintf('-------------------------------------------------------------\n');
fprintf('                            Part c):                         \n');
fprintf('-------------------------------------------------------------\n');
fprintf('semi-latus rectum (p) \t\t\t = %10.6f AU\n',p);
fprintf('-------------------------------------------------------------\n');
fprintf('                            Part d):                         \n');
fprintf('-------------------------------------------------------------\n');
fprintf('Specific Angular Momentum (hv) [AU^2/TU]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',hv);
fprintf('Magnitude of the Specific Angular Momentum (h) [AU^2/TU]:\n'); 
fprintf('                                   \t %16.8f\n',h);
fprintf('-------------------------------------------------------------\n');
fprintf('                            Part e):                         \n');
fprintf('-------------------------------------------------------------\n');
fprintf('Specific Mechanical Energy (E) \t = %10.6f AU^2/s^2\n',E);
fprintf('-------------------------------------------------------------\n'); 
fprintf('The periapsis radius of this asteroid is %10.6f AU and the\n', rp);
fprintf('radius of Earth is 1 AU. Therefore, the asteroid is potentially\n');
fprintf('hazardous to Earth.\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n');
fprintf('-------------------------------------------------------------\n'); 
fprintf('                        Question (2-6):                         \n'); 
fprintf('-------------------------------------------------------------\n');
fprintf('Position of Spacecraft in SCI coordinates [AU]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',rSCI6);
fprintf('Inertial Velocity of Spacecraft in SCI coordinates [AU/TU]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',vSCI6);
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('                        Question (2-7):                         \n');
fprintf('-------------------------------------------------------------\n');
fprintf('GIVEN:\n'); 
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f km \n',oe7(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe7(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe7(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe7(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe7(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe7(6));
fprintf('-------------------------------------------------------------\n');
fprintf('ANSWER:\n'); 
fprintf('Position of Spacecraft in ECI coordinates [km]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',rECI7);
fprintf('Inertial Velocity of Spacecraft in ECI coordinates [km/s]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',vECI7);
fprintf('-------------------------------------------------------------\n');
fprintf('CHECK:\n'); 
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f km \n',oe7c(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe7c(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe7c(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe7c(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe7c(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe7c(6));
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('                        Question (2-8):                         \n');
fprintf('-------------------------------------------------------------\n');
fprintf('GIVEN:\n'); 
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f km \n',oe8(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe8(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe8(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe8(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe8(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe8(6));
fprintf('-------------------------------------------------------------\n');
fprintf('ANSWER:\n'); 
fprintf('Position of Spacecraft in ECI coordinates [km]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',rECI8);
fprintf('Inertial Velocity of Spacecraft in ECI coordinates [km/s]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',vECI8);
fprintf('-------------------------------------------------------------\n');
fprintf('CHECK:\n'); 
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f km \n',oe8c(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe8c(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe8c(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe8c(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe8c(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe8c(6));
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('                        Question (2-9):                         \n');
fprintf('-------------------------------------------------------------\n');
fprintf('GIVEN:\n'); 
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f km \n',oe9(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe9(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe9(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe9(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe9(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe9(6));
fprintf('-------------------------------------------------------------\n');
fprintf('ANSWER:\n'); 
fprintf('Position of Spacecraft in ECI coordinates [km]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',rECI9);
fprintf('Inertial Velocity of Spacecraft in ECI coordinates [km/s]:\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',vECI9);
fprintf('-------------------------------------------------------------\n');
fprintf('CHECK:\n'); 
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f km \n',oe9c(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe9c(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe9c(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe9c(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe9c(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe9c(6));
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('-------------------------------------------------------------\n'); 
fprintf('                        Question (2-10):                         \n');
fprintf('-------------------------------------------------------------\n');
fprintf('GIVEN: (in canonical units)\n'); 
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f \n',oe10(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe10(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe10(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe10(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe10(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe10(6));
fprintf('-------------------------------------------------------------\n');
fprintf('ANSWER:\n'); 
fprintf('Position of Spacecraft in PCI coordinates :\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',rPCI10);
fprintf('Inertial Velocity of Spacecraft in PCI coordinates :\n   '); 
fprintf('[%16.8f,%16.8f,%16.8f]\n',vPCI10);
fprintf('-------------------------------------------------------------\n');
fprintf('CHECK:\n'); 
fprintf('Orbital elements:\n'); 
fprintf('semi-major axis (a) \t\t\t = %10.6f \n',oe10c(1));
fprintf('eccentricity (e) \t\t\t = %10.6f\n',oe10c(2));
fprintf('longitude of the ascending node (Omega)  = %10.6f degrees\n',oe10c(3));
fprintf('inclination (inc) \t\t\t = %10.6f degrees\n',oe10c(4));
fprintf('argument of the periapsis (omega) \t = %10.6f degrees\n',oe10c(5));
fprintf('true anomaly (nu) \t\t\t = %10.6f degrees\n',oe10c(6));
