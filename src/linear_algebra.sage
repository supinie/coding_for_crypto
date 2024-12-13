# Sage provides pretty much all the basics of linear algebra you might use.
# It provides matrices, vectors, and common operations on these.

# Vector and Matrix spaces:

V = VectorSpace(QQ, 3)
x = V.random_element()
print("x = ", x)

M = MatrixSpace(QQ, 3)
A = M.random_element()
print("A = ", A)

# We can easily multiply matrices and vectors

y = A * x
print("y = ", y)

# As well as use some standard operations/methods

Z = A.transpose()
kernel = kernel(A)  # Note this is the left kernel, {w \in V | wA = 0}
print("kernel = ", kernel)

p = Z.solve_left(y) # Find p s.t. pZ = y
print("p = ", p)
