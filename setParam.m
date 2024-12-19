global g
global m
global S
global AR
global b
global c
global cref

global Wx
global Wy
global Wz

g = 9.8;
m = 100;

S  = 20;
AR = 20;
b = sqrt(AR*S);
cref = S/AR;
c = cref;

## wind gradient per m
Wx = -0.0  ; # positive : against wind
Wy =  0.0  ; # positive : from right
Wz = -0.0  ; # positive : lift
