%differential equation 
%          x"(t) + (mu/r^3)*x(t) = 0

function z = stateEqs(t, rv, mu)
r = rv(1:3);
v = rv(4:6);
%the state equations of the differential equation with omega = 1
xdot = v(1);
ydot = v(2);
zdot = v(3);
vxdot = -r(1)*mu/(norm(r)^3);
vydot = -r(2)*mu/(norm(r)^3);
vzdot = -r(3)*mu/(norm(r)^3);
%the state equations as a column vector
z = [xdot; ydot; zdot; vxdot; vydot; vzdot];
end
