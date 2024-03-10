import numpy as np

A: float = 8.98

def calc_eps_wb_0(cd: np.ndarray[float], cl2: np.ndarray[float]) -> float:
    """
    :param cd: uncorrected CD values
    :param cl2: squared uncorrected CL values
    :return: wake blockage correction
    """
    global A
    polar: np.ndarray[float] = np.polyfit(cd, cl2, 2)
    CD0: float = polar[-1]

    return 0.25*A*CD0
