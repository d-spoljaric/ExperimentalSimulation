import numpy as np

bw: float = 1.397  # [m]
bh: float = 0.576
bv: float = 0.258
B: float = 1.29 * bw
H: float = 0.89 * bw
C: float = 2.9

t_c_du96150: float = 0.15821
V_wing: float = 0.0030229
V_h: float = 0.0009751 # TODO: Look at this
V_v: float = 0.0003546

print(f"B/H = {B/H}")
print(f"2b/B wing = {bw/B}")
print(f"2b/B horizontal tail = {bh/B}")
print(f"2b/B vertical tail = {bv/B}")


# Fuselage geometry
L_fuselage: float = 1.342
D_fuselage: float = 0.140
V_fuselage: float = 0.0160632

print(f"d/l fuselage = {D_fuselage/L_fuselage}")

# Nacelle Geometry
D_nacelle: float = 0.28*0.2032
L_nacelle: float = 0.345
V_nacelle: float = 0.0007921
print(f"d/l nacelle = {D_nacelle/L_nacelle}")

# Correction factors
tau1_fuselage_nacelle: float = 0.860854
tau1_wing: float = 0.881445
tau1_horizontal_tail: float = 0.857714
tau1_vertical_tail: float = 0.858123
K3_fuselage: float = 0.909876
K3_nacelle: float = 0.86169
K1_wing: float = 1.01865  # TODO: Look a this again
K1_h: float = 1.01865
K1_v: float = 1.03624

# ===================== Epsilon corrections ====================
eps_sb_f: float = K3_fuselage*tau1_fuselage_nacelle*V_fuselage/(C**(3/2))
eps_sb_n: float = K3_nacelle*tau1_fuselage_nacelle*(2*V_nacelle)/(C**(3/2))

eps_sb_w: float = K1_wing*tau1_wing*V_wing/(C**(3/2))
eps_sb_h: float = K1_h*tau1_horizontal_tail*V_h/(C**(3/2))
eps_sb_v: float = K1_v*tau1_vertical_tail*V_v/(C**(3/2))