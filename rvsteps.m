function [rstep,vstep] = rvsteps(t0, t, r0, v0, mu)

trange = linspace(t0,t,100);

for j = 1:length(trange)-1
    [rstep(j,1:3), vstep(j,1:3)] = r0v02rv(trange(j), trange(j+1), r0, v0, mu);
    r0 = rstep(j,1:3)';
    v0 = vstep(j,1:3)';
end