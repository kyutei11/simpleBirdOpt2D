global g
global m
global S
global AR
global b
global c
global cref

global Wx
global Wz

global h0

global K0
global Kf

########
setParam
########

global e0
global ef

global nDiv_CEQ
global nDiv_PHI
global dt_CEQ
global dt_PHI

global dtSlope
global gamma_max

dtSlope = 0.1;
gamma_max = 2.5;

h0 = 10.0;
V0 = 7.0      ; Vf = 7.0;
K0 = 0.5*V0**2; e0 = K0 + g*h0;
Kf = 0.5*Vf**2; ef = Kf;

x0 = [0.25,045,0.55,0.45];      # tau1, u1, tau2, u2
[xresult dist]=sqp(x0,'PHI','CEQ','CNE', [0.1,0.2,0.2,0.2],[0.6,0.8,0.9,0.8]);

## 'sqp' is a function from the file /usr/share/octave/5.2.0/m/optimization/sqp.m

##  -- [X, OBJ, INFO, ITER, NF, LAMBDA] = sqp (X0, PHI)
##  -- [...] = sqp (X0, PHI, G)
##  -- [...] = sqp (X0, PHI, G, H)
##  -- [...] = sqp (X0, PHI, G, H, LB, UB)
##  -- [...] = sqp (X0, PHI, G, H, LB, UB, MAXITER)
##  -- [...] = sqp (X0, PHI, G, H, LB, UB, MAXITER, TOL)
##      Minimize an objective function using sequential quadratic
##      programming (SQP).

##      Solve the nonlinear program

##           min phi (x)
##            x

##      subject to

##           g(x)  = 0
##           h(x) >= 0
##           lb <= x <= ub

##      using a sequential quadratic programming method.
