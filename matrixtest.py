import numpy as np
import os
import time

n = 400

a = np.random.randint(-1000,1000,(n,n))
b = np.random.randint(-1000,1000,(n,n))

np.savetxt("A.txt",a,"%d")
np.savetxt("B.txt",b,"%d")

start = time.time()
os.system("runghc matrix.hs A.txt B.txt C.txt")
end = time.time()

c = np.loadtxt("C.txt")
diff = c - a.dot(b)
print "diff:", np.abs(diff).max()
print "time:", end-start