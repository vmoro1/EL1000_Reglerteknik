s = tf('s');

G = 1 / (s*(s+1));
G = ss(G);

L = place(G.a, G.b, [-2.2 -2.1]);
Gc0 = ss(G.a - G.b * L, G.b, G.c, 0);
l_0 = 1 / dcgain(Gc0);
Gc = Gc0 * l_0;

[y, t, x] = step(Gc, 10);
u = l_0 - x * L.';
plot(t,y,'-',t,u,'-.')