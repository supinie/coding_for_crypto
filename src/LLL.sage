# FPyLLL comes packaged with sage by default. This allows us to use LLL and BKZ on bases easily.

# Generate a q-ary matrix of dimension 100 and determinant q^50 for some 30-bit prime q.
# We set the seed to allow reproducability.
set_random_seed(1337)
A = IntegerMatrix.random(100, "qary", k=50, bits=30)
