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

    # YOUR CODE HERE

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
    
    # YOUR CODE HERE

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

    # YOUR CODE HERE

    return LHS == RHS

##############################################
#                   TESTS                    #
##############################################
L = Lattice.random(45)

G = L.gram_matrix()
Q = L.quadratic_form()

assert G == Q.Gram_matrix()

(L, L_prime, U) = gen_LIP_instance()

assert verify_LIP_instance(L, L_prime, U) == true
