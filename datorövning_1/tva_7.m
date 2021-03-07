s = tf('s');

alpha = 1;
G = (alpha*s + 1)/(s^2 + 2*s + 1);
step(G,15)
grid;