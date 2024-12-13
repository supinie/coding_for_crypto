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


def gen_LWE_keys(d = 8, q = 251):
    '''
    Generate a basic textbook LWE keys pk = (A, b), and sk = s

    -----------
    Parameters:
    -----------
    - d: The dimension
    - q: A prime number, determines F_q

    --------
    Returns:
    --------
    - pk: The public key, (A, b)
    - sk: The secret key, s

    --------
    Example:
    --------
    pk, sk = gen_LWE_keys()
    '''
    
    # YOUR CODE HERE

    return pk, sk


def LWE_encrypt(pk, message):
    '''
    Encrypt a single message bit \in {0, 1} using textbook LWE

    -----------
    Parameters:
    -----------
    - pk: The public key, (A, b)
    - message: A single message bit (0 or 1) (theta)

    --------
    Returns:
    --------
    - ciphertext: The ciphertext (v, w), where v = (x^T A)^T and w = x^Tb + theta * (q - 1)/2

    --------
    Example:
    --------
    c = LWE_encrypt(pk, 0)
    '''

    # YOUR CODE HERE

    return c


def LWE_decrypt(sk, ciphertext):
    '''
    Decrypt a textbook LWE ciphertext

    -----------
    Parameters:
    -----------
    - sk: The secret key, s
    - ciphertext: An LWE ciphertext, (v, w)

    --------
    Returns:
    --------
    - message: returns the "rounding" of w - v^T s. If this is approx. 0, then return 0, if this is approx (q - 1)/2, then return 1.

    --------
    Example:
    --------
    c = LWE_encrypt(pk, 0)
    '''

    # YOUR CODE HERE

    return c


def gen_LIP(d = 8):
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
    L, L_prime, U = get_LIP()
    '''
    
    # YOUR CODE HERE

    return (L, L_prime, U)


def verify_LIP(L, L_prime, U):
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
    isomorphic = verify_LIP()
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

let pk, sk = gen_LWE_keys()
let message = 1
let ciphertext = LWE_encrypt(pk, message)
let dec_message = LWE_decrypt(sk, ciphertext)

assert dec_message == message

(L, L_prime, U) = gen_LIP()

assert verify_LIP(L, L_prime, U) == true
