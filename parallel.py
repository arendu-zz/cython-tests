__author__ = 'arenduchintala'
from para import nocyn, cysumpar
import numpy as np
import time
if __name__ == '__main__':
   a = np.arange(0, 1000000,.01 )
   print 'start'
   t0 = time.time()
   print nocyn(a)
   print time.time() - t0
   print 'start'
   t1 = time.time()
   print cysumpar(a)
   print time.time() - t1
