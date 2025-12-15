% Definición TF
s = tf('s');
G1 = 3/s;
G2 = 1/(s^2+1);
H1 = 3;
G = series(G1,G2);
Gs = feedback(G,H1);    % lazo cerrado

% Mostrar Gs
Gs

% Polos
p = pole(Gs)

% Raíces del polinomio directamente
r = roots([1 0 1 9])

% Para ver damping (Control System Toolbox)
damp(Gs)
