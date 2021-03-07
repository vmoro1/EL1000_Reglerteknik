s = tf('s');

G = 725/((s+1)*(s+2.5)*(s+25));
inv_G_delta = -1 * ((s + 1) / s);

F_1 = 1;

omega_c = 5;
beta = 0.21;
tau_d = 1 / (omega_c * sqrt(beta));
K = sqrt(beta);
F_lead = K*((tau_d*s + 1)/(beta*tau_d*s + 1));

tau_i = 10 / omega_c;
gamma = 0;
F_lag = (tau_i*s + 1)/(tau_i*s + gamma);

F_2 = F_lead*F_lag;

Gc_1 = feedback(F_1*G,1);
Gc_2 = feedback(F_2*G,1);

% bode(inv_G_delta, 'k-', Gc_1, 'k-.')
bode(inv_G_delta, 'k-', Gc_2, 'k-.')
