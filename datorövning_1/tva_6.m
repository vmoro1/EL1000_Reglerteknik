s = tf('s');

G_A = 1 / (s^2 + 2*s + 1);
% step(G_A, 15)
poles = pole(G_A);