cimport cython
from numpy cimport ndarray as ar
from libc.math cimport exp, log
from cython.parallel import prange
@cython.boundscheck(False)
@cython.wraparound(False)
cpdef cysumpar(ar[double] A):
    cdef double tot=0.
    cdef int i, n=A.size
    for i in prange(n, nogil=True):
        tot +=exp(log(exp(log(A[i]))))
    return tot

cpdef nocyn(ar[double] B):
    cdef double tot=0.0
    cdef int i, n=B.size
    for i in range(n):
        tot +=exp(log(exp(log(B[i]))))
    return tot


