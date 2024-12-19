function C = CNE(x) # > 0

  global dtSlope
  
  tau1 = x(1);
  u1   = x(2);
  tau2 = x(3);
  u2   = x(4);

  C=zeros(3,1);
  C(1) = tau2-(tau1+0.1);
  C(2) = tau1-dtSlope - 0.0;
  C(3) = 1.0 - (tau2+dtSlope);
  C(4) = u1-u2; # you may want to remove this...

endfunction
