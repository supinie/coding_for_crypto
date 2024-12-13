# Recall from linear_algebra how to construct and use matrices.
# We can also construct a basis for a q-ary lattice

# Pick parameters
m, n, q = 5, 3, 101

# Compute the reduced row-echelon form
A = random_matrix(GF(q), n, m)
A.echelonize()
print("A = ", A)

# Stack A on top of a matrix accounting for modular reductions
N = A.change_ring(ZZ)
S = matrix(ZZ, m - n, n).augment(q * identity_matrix(m - n))
N.stack(S, subdivide = True)
print("N = ", N)

# Or we can generate typical crypto lattices with:
B = sage.crypto.gen_lattice(m = 10, seed = 1337, type = "modular")
print("B = ", B)

# We can also construct a lattice object
from sage.modules.free_module_integer import IntegerLattice
C = random_matrix(ZZ, 80, 80, x=-2000, y=2000)
L = IntegerLattice(A)
print("L = ", L)
