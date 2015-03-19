# asd.pyx
from cython.parallel cimport prange

import numpy as np

def foo():
    cdef int i, j, n
    x = np.zeros((20000, 200000), float)
    n = x.shape[0]
    for i in prange(n, nogil=True):
        with gil:
            for j in range(100):
                x[i, :] = np.cos(x[i, :])

    return x

def foo2():
    cdef int i, j, n
    x = np.zeros((20000, 200000), float)
    n = x.shape[0]
    for i in range(n):
        for j in range(100):
            x[i, :] = np.cos(x[i, :])

    return x
