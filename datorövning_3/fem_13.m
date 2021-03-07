s = tf('s');
% a)
G = 725/((s+1)*(s+2.5)*(s+25));
F = 1;
% margin(F*G)

% b)
omega_c = 5;
beta = 0.21;
tau_d = 1 / (omega_c * sqrt(beta));
K = sqrt(beta);
F_lead = K*((tau_d*s + 1)/(beta*tau_d*s + 1));

tau_i = 10 / omega_c;
gamma = 0;
F_lag = (tau_i*s + 1)/(tau_i*s + gamma);

F = F_lead*F_lag;

% margin(F*G)

G_c = feedback(F*G,1);
% step(G_c,20)
% grid;

% c)

G_c2 = feedback(1*G,1);
% bode(G_c, G_c2)

% d)

S = 1 / (1 + F*G);
t = 0:0.1:30;
r = t;
y = lsim(S,r,t);
plot(t,y)

