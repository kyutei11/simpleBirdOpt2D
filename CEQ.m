function C = CEQ(x) # equality constr.
  global Kf

  C = getK(1.0,x) - Kf;
endfunction
