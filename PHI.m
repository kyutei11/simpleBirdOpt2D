function PHI=PHI(x)
  ## max. x = integ{e0..ef}(m/D)de
  ## dx*D/m = d(E/m) = de
  global K0
  global dtSlope

  tau1 = x(1);
  u1   = x(2);
  tau2 = x(3);
  u2   = x(4);

  tau = [0.0 tau1-dtSlope tau1 tau2 tau2+dtSlope 1.0];

  ## Gauss integ.
  PHI = 0.0;
  
  for i=1:5 # for taus
	PHI = PHI + getDdist(tau(i), tau(i+1), x);
  end

  PHI = -PHI*1e-3; # norm. to 1.0-order

endfunction

function Dx = getDdist(tau1,tau2, x)
  ## gauss integ.
  ## +- 1/sqrt(3)
  global g
  global m
  global e0
  global ef

  dtau = tau2-tau1;
  integ_point = 0.5*(1-sqrt(3)/3)*dtau; # (1-1/sqrt(3))/2 : from xi = 1 or -1
  
  integ_tau = [tau1 + integ_point;
			   tau2 - integ_point];
  Dx = 0.0;
  for i=1:2,
	K = getK(integ_tau(i),x);
	V = sqrt(2*K); # K = 0.5*V**2

	eNow = (1.0-integ_tau(i))*e0 + integ_tau(i)*ef; # tau = 0 -> 1
    alti = (eNow-K)/g;     # e = 0.5V**2+gh
    Dx  -= 0.5*dtau*(ef-e0)*m/D(V,alti); # RHS:negative val.
	##     0.5: 2point integ. weight
  end
endfunction
