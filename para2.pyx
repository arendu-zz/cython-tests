cimport cython
import numpy as np

from numpy cimport ndarray as ar
from libc.math cimport exp, log
import multiprocessing
from multiprocessing import Pool

global tot
cdef double tot = 0.0

cpdef cysumpar(ar[double] A):
    cdef double tot = 0.
    cdef int i, n = A.size
    for i in prange(n, nogil=True):
        tot += exp(log(exp(log(A[i]))))
    return tot

"""
cpu_count = multiprocessing.cpu_count()
                    pool = Pool(processes=cpu_count)
                    batches = np.array_split(ids, cpu_count)
                    for obs_ids in batches:
                        pool.apply_async(batch_sgd, args=(obs_ids, shared_sgd_theta, shared_sum_squared_grad),
                                         callback=batch_sgd_accumilate)
                    pool.close()
                    pool.join()
"""
def para_func(batch, B):
    t = 0.0
    for i in batch:
        t += B[i]
    return t
def para_fun_sum(t):
    global tot
    tot += t

@cython.boundscheck(False)
@cython.wraparound(False)
cpdef double nocyn(ar B)  nogil:
    global tot
    cdef double tot = 0.0
    cdef int i, n = B.size
    cpu_count = multiprocessing.cpu_count()
    pool = Pool(processes=cpu_count)
    batches = np.array_split(range(n), cpu_count)
    for batch in batches:
        pool.apply_async(para_func, args=(batch, B), callback=para_fun_sum)
        #tot += exp(log(exp(log(B[i]))))
    pool.close()
    pool.join()
    return tot


