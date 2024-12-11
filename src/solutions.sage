from utils import Lattice
from sage.matrix.constructor import random_unimodular_matrix
from sage.modules.free_module_integer import IntegerLattice
from sage.matrix.matrix_space import MatrixSpace


def quadratic_form(self):
    '''
    Return the corresponding quadratic form for a lattice

    -----------
    Parameters:
    -----------
    - self: A lattice defined by basis B

    --------
    Returns:
    --------
    - Q: QuadraticForm corresponding to input lattice

    --------
    Example:
    --------
    Q = L.corresponding_quadratic_form()
    '''

    # B = self.basis()
    # G = B.transpose() * B
    G = self.gram_matrix()
    Q = QuadraticForm(G + G.transpose())

    return Q
Lattice.quadratic_form = quadratic_form


def gen_LIP_instance(d = 8):
    '''
    Generate a new instance of the lattice isomorphism problem

    -----------
    Parameters:
    -----------
    - d: the dimension of lattices L and L_prime

    --------
    Returns:
    --------
    - L: Lattice object
    - L_prime: Lattice object
    - U: The unimodular matrix that can be applied to the corresponding gram matrices
        lattices L and L_prime

    --------
    Example:
    --------
    L, L_prime, U = get_LIP_instance()
    '''
    # Generate a basis B for L
    B = sage.crypto.gen_lattice()

    # Generate a random U
    U = random_unimodular_matrix(MatrixSpace(ZZ, d))

    # Generate an orthonormal transform
    O = SO(d, ZZ).random_element()

    B_prime = O * B * U
    print(B_prime)

    L_prime = IntegerLattice(B_prime)
    L = IntegerLattice(B)

    return (L, L_prime, U)


##############################################
#                   TESTS                    #
##############################################
L = Lattice.random(45)

Q = L.quadratic_form()

(L, L_prime, U) = gen_LIP_instance()

LHS = L.quadratic_form().Gram_matrix()
RHS = U.transpose() * L_prime.quadratic_form().Gram_matrix() * U
assert LHS == RHS
