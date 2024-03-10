import numpy as np

# ========================== Input parameters ================================= #

# ======== Correction factors ======= #

# Solid blockage factors
K1: int = 1  # Wing body shape factor, based on airfoil t/c
K3: float = 0.94  # Fuselage body shape factor, based on fuselage d/l
tau1: int = 1  # Tunnel/model factor

# ======= Model and wind tunnel data ===== #

# Model data
model_area: float = 1
volume_wing: float = 1
# Wind tunnel section data
A_wt: float = 1
# ===== Raw data =============#

# Uncorrected data
alpha_unc = np.genfromtxt("alpha_unc.dat")


