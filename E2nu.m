function nu = E2nu(e, E)

nu = 2*atan2(sqrt(1+e)*sin(E/2), sqrt(1-e)*cos(E/2));