%% aasignment 1
s = tf('s');
[J,umax] = lab3robot_R2017b(991231);
L_m = 2;
R_m = 21;
b = 1;
K_tau = 38;
K_m = 0.5;
n = 1/20;

% G_theta = K_tau/(s*(J*s+b)*(s*L_m + R_m)+ s*K_m*K_tau);  % överföringsfunktion mellan theta_m och u
% G = n*(1/s)*(1/(J*s+b))*K_tau*(1/(s*L_m + R_m))*(1 - (K_m*s*G_theta)); % överföringsfunktion mellan theta_L och U

G = (n*K_tau*(1/s)) / ((J*s + b)*(s*L_m + R_m) + K_m*K_tau); % Ekvivalent men förenkal överföringsfunktion mellan theta_L och U
lab3robot_R2017b(G,991231)

%% assignment 2

K = 5.83;
F_P = K;
G_P = F_P*G; % Transfer function
GP_c = feedback(F_P*G,1);
step(GP_c,200);
grid
info = stepinfo(GP_c); % Innehåller all viktig information

%% assignment 3
margin(F_P*G) % Info för öppet system
omega_b = bandwidth(GP_c); % bandbredd för slutet system
margin(GP_c);
%% assignment 6
omega_c = 0.252;
omega_cd = 4*omega_c;
beta = 0.14;
tau_D = 1/(omega_cd*sqrt(beta));
G_omega_cd = 10^(-32.9/20);
K_lead = sqrt(beta)/G_omega_cd;
F_lead=K_lead*(tau_D*s+1)/(beta*tau_D*s+1);

gamma=0.036;
tau_I=15; 
F_lag=(tau_I*s+1)/(tau_I*s+gamma); 
F = F_lead*F_lag;
G_ll = F*G;

margin(F*G)

G_c = feedback(F*G,1);
step(G_c)
info_leadlag = stepinfo(G_c);

t = 0:0.1:30;
r = ones(1,length(t));
u = lsim(F/(1 + F*G),r,t);
u_max = max(u);  % Ska vara mindre än umax

%% assignment 8

S1 = 1/(F_P*G); % S för proportionell controller
S2 = 1/(F*G);    % S för lead lag
bodemag(S1, S2) % Kolla amplituddel för att svara på frågan

%% assignment 9

T = F*G/(1 + F*G);
delta_G1 = (s + 10)/40;
delta_G2 = (s + 10)/(4*(s + 0.01));

bodemag(delta_G1, 'b', 1/T, 'r'); % Robusthet garanterad om robusthetskriteriet är tillämpbart % Undersök om 1/T är större än delta_G för alla frekvenser. Då garanterar robustet om robusthetskriteriet tillämpbart
bodemag(delta_G2, 'b', 1/T, 'r'); % Robusthet är ej garanterad


%% assignment 11

A = [0 n 0; 0 -b/J K_tau/J; 0 -K_m/L_m -R_m/L_m];
B = [0;0;1/L_m];
C = [1 0 0];

S = [B A*B A*A*B]; % Styrbarhetsmatrisen;
d_s = det(S); % Styrbar om determinanten inte är lika med 1

O = [C; C*A; C*A*A]; % Observerbarhetsmatris
d_o = det(O); % Observerbar om det(O) inte är 1

%% assignment 12
L = place(A, B, [-3 (-3+5*i) (-3-5*i)]);
L0 = 1/( C * inv( -A + B*L ) * B );

Gc_ss = ss(A-B*L,B*L0,C,0);
step(Gc_ss)
info_ss = stepinfo(Gc_ss);

t = 0:0.1:30;
r = ones(1,length(t));
u = lsim(Gc_ss,r,t);
u_max = max(u);

%% validation

lab3robot_R2017b(G,K,F,A,B,C,L,L0,991231)

% System transfer function G is correct
% Congratulations. You have completed this computer exercise.
% Time to prepare for the examination. You will need the following code
% 4269191
