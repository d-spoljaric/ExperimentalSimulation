import numpy as np

L_fuselage: float = 1.342
D_fuselage: float = 0.140
print(f"Fineness ratio fuselage = {L_fuselage/D_fuselage}")
lambda_3D_fuselage: float = 4.91677

D_nacelle: float = 0.28*0.2032
L_nacelle: float = 0.345
print(f"Fineness ratio nacelle = {L_nacelle/D_nacelle}")
lambda_3D_nacelle: float = 3.21206

def calc_buoyancy_drag(shape_factor: float, t: float, dpdx: float) -> float:
    return -(np.pi/4)*shape_factor*(t**3)*dpdx