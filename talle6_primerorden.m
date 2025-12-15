Gs = tf(1,[2 1]); [y,t] = step(Gs); p = roots([2 1]);
figure; plot(t,y,'LineWidth',2); grid on; title('Respuesta estable')

Gs2 = tf(1,[1 -1]); [y2,t2] = step(Gs2);
figure; plot(t2,y2,'LineWidth',2); grid on; title('Respuesta inestable')
