import numpy as np

alpha_unc_array = np.genfromtxt("unc_tailOff_alpha.txt")
cl_array = np.genfromtxt("unc_tailOff_CL.txt")


# Model dimensions
b_w = 1.397
c_mac = 0.165
l_t = 0.5*c_mac
S = 0.2172

bv_b = 0.77
b_e = (b_w/2)*(1+bv_b)

# Wind tunnel dimensions
H = 0.89*b_w
B = 1.29*b_w
C = 2.9

print(H/B)
print(b_e/B)
# Correction factors
tau2 = 0
delta = 0.105

alpha_cor = np.array([1, 2.5, 3, 4.5, 4.7])

alpha_geo = alpha_cor - delta * (S/C) * np.interp(alpha_cor, alpha_unc_array, cl_array)

print(alpha_geo)
