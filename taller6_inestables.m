%% ============================
%   SISTEMA INESTABLE OSCILANTE
%   Polos con parte real > 0 y parte imaginaria != 0
% =============================
num1 = 1;
den1 = [1  -0.5 4];   % polos con parte real positiva (oscilante e inestable)
sys1 = tf(num1, den1);

figure;

% Respuesta al escalón
subplot(2,2,1)
step(sys1,50)
title('Sistema inestable oscilante')
xlabel('Time (seconds)')
ylabel('Amplitud')
grid on

% Polos y ceros
subplot(2,2,3)
pzmap(sys1)
title('Diagrama de polos y ceros')
grid on


%% ===============================
%  SISTEMA INESTABLE NO OSCILANTE
%  Polos reales positivos (explosivo, sin oscilación)
% ================================
num2 = 1;
den2 = [1  -12  4];   % polos reales positivos → no oscilante e inestable
sys2 = tf(num2, den2);

% Respuesta al escalón
subplot(2,2,2)
step(sys2,6)
title('Sistema inestable no oscilante')
xlabel('Time (seconds)')
ylabel('Amplitud')
grid on

% Polos y ceros
subplot(2,2,4)
pzmap(sys2)
title('Diagrama de polos y ceros')
grid on
