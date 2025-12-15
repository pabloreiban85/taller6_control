import control as co
import matplotlib.pyplot as plt
import numpy as np

# ------------------------------------
# PLANTA (2º orden, estable)
# Polos ≈ -5000 ± j3000
# ------------------------------------
g1 = co.tf([1e7], [1, 10000, 3.4e7])

# ------------------------------------
# Proporcional
# ------------------------------------
p = co.tf([3], [1])

# ------------------------------------
# Integral (misma forma que MATLAB)
# ------------------------------------
i  = co.tf([1], [10])
gi = 1000
ig = co.series(gi, i)

# ------------------------------------
# Derivativo (misma forma que MATLAB)
# ------------------------------------
d  = co.tf([10], [1])
gd = 0.001
dg = co.series(gd, d)

# ------------------------------------
# PID en paralelo
# ------------------------------------
pi  = co.parallel(p, ig)
pid = co.parallel(pi, dg)

# ------------------------------------
# Serie con la planta
# ------------------------------------
g = co.series(pid, g1)

# ------------------------------------
# Realimentación unitaria
# ------------------------------------
Gs = co.feedback(g, 1)

# ------------------------------------
# Respuesta al escalón
# ------------------------------------
t, y = co.step_response(Gs)

plt.figure(figsize=(7,6))

plt.subplot(2,1,1)
plt.plot(t, y)
plt.grid(True)
plt.title("Step Response")

# ------------------------------------
# Mapa polos-ceros
# ------------------------------------
plt.subplot(2,1,2)
co.pzmap(Gs, plot=True, grid=True)
plt.title("Pole-Zero Map")

plt.tight_layout()
plt.show()
