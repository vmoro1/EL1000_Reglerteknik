s = tf('s');

G = 0.2 / ((s^2 + s + 1)*(s + 0.2));

K_p = 1;
K_i = 1;
T = 0.1;
K_d = 1;
F = K_p + K_i/s + K_d*s/(s*T+1);

G_c = feedback(F*G,1);
step(G_c,15)
grid;

