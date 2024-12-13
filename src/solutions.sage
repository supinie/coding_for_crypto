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

    Because Sage restricts lattices to integer valued bases, we restrict the orthonormal
    transform to be integer (not real as it should be).

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

    # Because Sage restricts lattices to integer valued bases, we restrict the orthonormal
    # transform to be integer (not real as it should be).
    G = GO(d, ZZ)
    # make sure to run `sage -i gap_packages` first
    O = G.random_element()

    B_prime = O * B * U

    L_prime = IntegerLattice(B_prime)
    L = IntegerLattice(B)

    return (L, L_prime, U)


def verify_LIP_instance(L, L_prime, U):
    '''
    Verifies whether the two given lattices are indeed isomorphic with respect to the given unimodular transform.

    -----------
    Parameters:
    -----------
    - L: Lattice object
    - L_prime: Lattice object
    - U: The unimodular matrix that can be applied to the corresponding gram matrices
        lattices L and L_prime

    --------
    Returns:
    --------
    - Boolean output depending on whether the two lattices are indeed isomorphic w.r.t. U.

    --------
    Example:
    --------
    isomorphic = verify_LIP_instance()
    '''
    LHS = L_prime.gram_matrix()
    RHS = U.transpose() * L.gram_matrix() * U

    return LHS == RHS

##############################################
#                   TESTS                    #
##############################################
L = Lattice.random(45)

G = L.gram_matrix()
Q = L.quadratic_form()

assert G == Q.Gram_matrix()

(L, L_prime, U) = gen_LIP_instance()

print(verify_LIP_instance(L, L_prime, U))
