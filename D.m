function D=D(V,h)
  global g
  global rho
  global m
  global S
  global AR
  global b
  global c
  global cref

  global Wx
  global Wz

  ## Final set of parameters            Asymptotic Standard Error
  ## =======================            ==========================
  ## a               = 2.81167e-05      +/- 2.905e-07    (10.33%)
  ## b               = -9.14833e-04     +/- 5.854e-06    (6.399%)
  ## c               = 0.01604         +/- 2.771e-05    (1.727%)

  ## cref=1.0
  Re = 70000*(V+Wx*h)*c/cref;
  CD0 = 5.738e-15*Re.**2 -1.30693e-8*Re+0.01604;
  ##CD0 = 0.01;
    
  hNorm = h./(0.5*b);
  CL = m*g./(0.6*(V+Wx*h).**2.0*S);
  CD = (CD0 + AR_by_ARe(hNorm).* CL.**2/(pi*AR));

  CD = CD + CL.*((-Wz.*h)./(V+Wx*h));
  D=0.6*(V+Wx*h).**2.*CD*S;
endfunction
