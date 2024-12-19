function K = getK(tau,x)

  global e0
  global ef
  global K0
  global Kf
  global dtSlope
  global gamma_max
  
  ## get kinetic energy per unit mass K = V**2/2 , e = K+gh

  ## de = dK + g*dh
  ## dK/de = (1 - g*dh/de)
  ## control u = [0,1] at tau = e/(ef-e0) in [0,1]
  ## g*dh/de = u*gamma_max : gamma_max in [2,2.5] will be fine

  ## K = K0 + integ{0..tau}[1 - u*gamma_max](e0-ef)d_tau

  ## gamma_max +-----
  ##           |     \slope
  ##           |      \
  ##           |    u1 -------- u2 (=u1 also give fine result)
  ##           |               \
  ##           |           slope\
  ##           |_________________\______|
  ##           0     tau1    tau2       1

  tau1 = x(1);
  u1   = x(2);
  tau2 = x(3);
  u2   = x(4);

  K = K0 + (ef-e0)*tau; # K0 + integ[0,1]{1 - g*dh/de}(ef-e0)dtau

  ## area in [0,tau] in pict. above
  if(tau < tau1-dtSlope)
	k1 = tau;
  elseif(tau < tau1)
	dtau = tau-(tau1-dtSlope);
	k1 = tau - 0.5*dtSlope*(1.0-u1)*(dtau/dtSlope)**2;
  elseif(tau < tau2)
	dtau = tau-tau1; dt12 = tau2-tau1; 
	k1 = tau1 - 0.5*dtSlope*(1.0-u1) + u1*dtau + 0.5*(u2-u1)*dt12*(dtau/dt12)**2;
  elseif(tau < tau2+dtSlope)
	dtau = tau-tau2; dt12 = tau2-tau1;
	k1 = tau2 - 0.5*dtSlope*(1.0-u1) -0.5*dt12*(1.0-u1 + 1.0-u2) + u2*dtau - 0.5*u2*dtSlope*(dtau/dtSlope)**2;
  else
	dt12 = tau2-tau1;
	k1 = tau2 - 0.5*dtSlope*(1.0-u1) -0.5*dt12*(1.0-u1 + 1.0-u2) + 0.5*u2*dtSlope;
  endif

  K = K + k1*gamma_max*(e0-ef); # note : e0-ef : positive value
endfunction
