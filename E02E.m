function E = E02E(e, E0, t0, t, mu, a)

tp = t0 - sqrt(a^3/mu)*(E0-e*sin(E0));
tau = 2*pi*sqrt(a^3/mu);
k = floor((t-tp)/tau);
C = sqrt(mu/a^3)*(t-t0)+(E0-e*sin(E0))-2*pi*k;

N = 10*floor(1/(1-e));
E = E0;
for j = 1:N
    E = e*sin(E) + C;
end