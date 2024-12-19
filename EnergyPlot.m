global g
global m
global S
global AR
global b
global c
global cref

global Wx
global Wz

setParam

fig=figure;

v=linspace(5,15,100);
h=linspace(0,11,100);

[V H] = meshgrid(v,h);

E_m = g*H+0.5*(V.**2);

[con, hei] = contour(V,H,E_m,25,'b');
hold on
[con, hei] = contour(V,H,m./D(V,H),50,'b');
hold off

m./D(V+H*Wx,H);

clabel(con, hei, 0:100, "fontsize", 12);

hold on
xlabel ("Ground Speed(m/s)");
ylabel ("Altitude(m)");

#load 'traj2D.dat'
#load 'result1D.dat'
load 'simpleVDH.dat'

#plot(x_next(:,1), x_next(:,3), 'linewidth', 3);
#plot(result1D(:,1), result1D(:,3), 'linewidth', 3);
plot(simpleVDH(:,1), simpleVDH(:,3), 'linewidth', 3);
hold off
##E_m = @(x,y) (9.8*y+0.5*(x**2));

##print(fig,'plot.eps','-depsc2');
