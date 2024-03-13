import numpy as np
bw: float = 1.397  # [m]
S: float = 0.2172
B: float = 1.29 * bw
H: float = 0.89 * bw
print(H/B)
lt: float = 3.22 * 0.165
b_h: float = 0.576
taper_ratio: float = 1
A: float = 3.87
bv_b: float = 0.85539

b_e: float = 0.5*b_h*(1+bv_b)
k: float = b_e/B
print(k)

delta: float = 0.110119

print(lt/B)

tau2: float = 0.744765

def d_alpha_t(alpha: np.ndarray[float] | float, clw: np.ndarray[float] | float) -> np.ndarray[float] | float:
    global delta
    global S
    global lt
    global C

    return delta*(S/C)*clw*(1+tau2*lt)

def d_cm_025(delta_alpha_t: np.ndarray[float] | float, cm_alpha: np.ndarray[float] | float) -> np.ndarray[float] | float:
    return cm_alpha*delta_alpha_t