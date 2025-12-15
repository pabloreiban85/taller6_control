%% SISTEMA QUE DA LA GRAFICA QUE MOSTRASTE

% Planta de 2º orden con polos complejos ESTABLES
% Polos ≈ -5000 ± j3000
g1 = tf([1e7], [1 10000 3.4e7]);

%% Controlador (ganancia equivalente, estable)
p  = 3;

i  = tf([1],[10]);
gi = 1000;

d  = tf([10],[1]);
gd = 0.001;

%% Series
ig = series(gi,i);
dg = series(gd,d);

%% Paralelo
pi  = parallel(p,ig);
pid = parallel(pi,dg);

%% Serie total
g = series(pid,g1);

%% Realimentacion unitaria
Gs = feedback(g,1);

%% Graficas
figure

subplot(2,1,1)
step(Gs)
grid on
title('Step Response')

subplot(2,1,2)
pzmap(Gs)
grid on
title('Pole-Zero Map')
