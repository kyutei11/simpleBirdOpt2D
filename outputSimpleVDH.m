function VDH=outputSimpleVDH(x)
  global g
  global m
  global K0
  global h0
  global e0
  global ef

  nDiv = 50; dt=1/nDiv;
  Velo=sqrt(2*K0);
  Dist=0.0;
  Alti=h0;
  VDH = [Velo Dist Alti];
  for i=1:nDiv
	tau = (i-1)*dt;
	K = getK(tau,x);
	Velo = sqrt(2*K);
	eNow = (1.0-tau)*e0 + tau*ef;
	Alti = (eNow-0.5*Velo**2)/g;
    Dist += dt*(e0-ef)*m/D(Velo,Alti);
	VDH = [VDH; [Velo Dist Alti]];
  end
endfunction
	
