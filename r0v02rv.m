function [r, v] = r0v02rv(t0, t, r0, v0, mu)

oe0 = rv2oe_Harris_Samantha(r0,v0,mu);
a     = oe0(1);
e     = oe0(2);
Omega = oe0(3);
inc   = oe0(4);
omega = oe0(5);
nu0   = oe0(6);

E0 = nu2E(e, nu0);
E = E02E(e, E0, t0, t, mu, a);
nu = E2nu(e, E);
oe = [a, e, Omega, inc, omega, nu];
[r,v]  = oe2rv_Harris_Samantha(oe,mu);
