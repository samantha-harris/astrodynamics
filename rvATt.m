function [r,v] = rvATt(t, mu, t_initial, t_final, r0, v0)

 [tout, y] = integrate(mu, t_initial, t_final, r0, v0);
 tindex = find(tout == t);
 
 r = [y(tindex,1); y(tindex,2); y(tindex,3)];
 v = [y(tindex,4); y(tindex,5); y(tindex,6)];