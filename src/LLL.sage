# FPyLLL comes packaged with sage by default. This allows us to use LLL and BKZ on bases easily.

A = sage.crypto.gen_lattice(m = 10, seed=1337, type = "modular")
print("A = ", A)

# We can directly call LLL using a convinent method
A.LLL(delta = 0.99, eta = 0.51)
print("LLL reduced A = ", A)


# Or BKZ:
B = sage.crypto.gen_lattice(m = 100, seed = 42, q = next_prime(2^20))
print("B = ", B)

B.BKZ(block_size = 60, proof = False)   # Using `proof = False` uses decent preset heuristics for pruning and recursive processing
print("BKZ reduced B = ", B)


# We are also able to create GSO objects, which allow us to run LLL and BKZ with more granular control
from fpylll import GSO, IntegerMatrix, LLL

set_random_seed(1337)
# Generate a q-ary matrix of dimension 100 and determinant q^k, for q a 30-bit prime
A = IntegerMatrix.random(100, "qary", k = 50, bits = 30)

# We create a GSO object M
M = GSO.Mat(A, float_type="d")

# We can now compute the GSO (or alternatively pass `update = True` during construction
_ = M.update_gso()
print("A = ", A)

# We can now create an LLL object that operates on our GSO object
L = LLL.Reduction(M, delta = 0.99, eta = 0.51)
L()
print("LLL reduced A = ", A)

# We can check that this is size reduced:
print(all([abs(M.get_mu(i, j)) <= 0.51 for i in range(M.d) for j in range(i)]))

# BKZ:
from fpylll.algorithms.bkz2 import BKZReduction as BKZ2
from fpylll import BKZ

# We first want to set our parameters
flags = BKZ.AUTO_ABORT|BKZ.MAX_LOOPS|BKZ.GH_BND
params = BKZ.Param(60, strategies = BKZ.DEFAULT_STRATEGY, max_loops = 4)
# Here, 60 is our block size, max_loops is the maximum number of tours, and we are using the default strategy.
# The strategy defines any preprocessing and pruning parameters, here we just use the default

bkz = BKZ2(A)   # We can also call this on our GSO object.
_ = bkz(params)

print("BKZ reduced A = ", A)
