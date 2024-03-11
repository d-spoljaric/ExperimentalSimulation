import numpy as np

# Parameters
taper_ratio: float = 0.4  # Wing taper ratio
bw: float = 1.397  # [m]
B: float = 1.29 * bw
H: float = 0.89 * bw
S: float = 0.2172
C: float = 2.9
c_bar: float = 0.165

bv_b_025: float = 0.70199  # at lambda = 0.25
bv_b_050: float = 0.769642  # at lambda = 0.5

weight_025: float = np.abs(1 - (taper_ratio - 0.25) / taper_ratio)
weight_050: float = np.abs(1 - (taper_ratio - 0.5) / taper_ratio)

bv_b: float = (bv_b_025 * weight_025 + bv_b_050 * weight_050) / (weight_025 + weight_050)
print(f"bv/b = {bv_b}")

be: float = (bw / 2) * (1 + bv_b)
print(f"be = {be}")

k: float = bw / B
print(f"k = {k}")

delta: float = 0.0841918
print(f"delta = {delta}")

lt: float = 0.5 * c_bar
print(f"lt/B = {lt / B}")

tau2: float = 0.155015
print(f"tau2 = {tau2}")


def d_alpha_uw(cl_w: np.ndarray[float]) -> np.ndarray[float]:
    global delta
    global S
    global C

    return delta * (S / C) * cl_w


def d_cd_w(cl_w: np.ndarray[float]) -> np.ndarray[float]:
    global delta
    global S
    global C

    return delta * (S / C) * cl_w ** 2


def d_alpha_sc(da_uw: np.ndarray[float]) -> np.ndarray[float]:
    global tau2
    global c_bar
    return tau2 * (0.5 * c_bar) * da_uw

def d_cm025c_sc(da_sc: np.ndarray[float], cl_alpha: np.ndarray[float]) -> np.ndarray[float]:
    return (1/8)*da_sc*cl_alpha
