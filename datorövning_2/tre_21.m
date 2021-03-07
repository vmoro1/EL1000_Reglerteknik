% a)
% s = tf('s');
% P = 0.2;
% Q = (s^2 + s + 1)*(s + 0.2);
% rlocus(P/Q)

% b)
s = tf('s');
P_b = s + s*(s^2 + s + 1)*(s + 0.2);
Q = (s^2 + s + 1)*(s + 0.2);
rlocus(P/Q)
