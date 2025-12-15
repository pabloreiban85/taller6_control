% Frecuencia natural ajustada (periodo lento y visible)
wn = 4;  % T ≈ 8 s

figure;

% --- No amortiguado ---
z = 0;
G1 = tf(wn^2,[1 2*z*wn wn^2]);
subplot(2,2,1); step(G1,0:0.01:5); grid on; xlim([0 5]);
title('No amortiguado');

subplot(2,2,2); pzmap(G1); grid on; title('Polos y ceros');

% --- Sub amortiguado ---
z = 0.3;
G2 = tf(wn^2,[1 2*z*wn wn^2]);
subplot(2,2,3); step(G2,0:0.01:5); grid on; xlim([0 5]);
title('Sub amortiguado');

subplot(2,2,4); pzmap(G2); grid on; title('Polos y ceros');


figure;
% --- Criticamente amortiguado ---
z = 1;
G3 = tf(wn^2,[1 2*z*wn wn^2]);
subplot(2,2,1); step(G3,0:0.01:5); grid on; xlim([0 5]);
title('Criticamente amortiguado');

subplot(2,2,2); pzmap(G3); grid on; title('Polos y ceros');

% --- Sobre amortiguado ---
z = 2;
G4 = tf(wn^2,[1 2*z*wn wn^2]);
subplot(2,2,3); step(G4,0:0.01:5); grid on; xlim([0 5]);
title('Sobre amortiguado');

subplot(2,2,4); pzmap(G4); grid on; title('Polos y ceros');
