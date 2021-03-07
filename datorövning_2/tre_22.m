s = tf('s');
G = 0.2 / ((s^2 + s + 1)*(s + 0.2));

% a)
F = 6;
G_0 = G*F;
% nyquist(G_0)

% b)
K_I = 1.5;
F = 1 + (K_I / s);
G_0 = G*F;
% nyquist(G_0)
% axis([-2 2 -2 2])

% c)
K_D = 66;
F = 1 + 1/s + K_D*s/(0.1*s +1);
G_0 = G*F;
nyquist(G_0)
axis([-2 2 -2 2])