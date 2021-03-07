s = tf('s');
G = 0.4 / ((s^2 + s + 1)*(s + 0.2));
K_p = 3.1;
F = K_p;
G_0 = G * F;
% margin(G_0)

G_c = feedback(G_0,1);
step(G_c,50)