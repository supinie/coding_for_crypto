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
    
    A = random_matrix(GF(q), d, d)
    s = random_vector(GF(q), d)
    e = random_vector(GF(5), d).change_ring(GF(q))  # generate in F_5 to ensure small coefficients

    b = A * s + e

    pk = (A, b)
    sk = s

    return pk, sk


def LWE_encrypt(pk, message, q = 251):
    '''
    Encrypt a single message bit in {0, 1} using textbook LWE

    -----------
    Parameters:
    -----------
    - pk: The public key, (A, b)
    - message: A single message bit (0 or 1) (theta)
    - q

    --------
    Returns:
    --------
    - ciphertext: The ciphertext (v, w), where v = (x^T A)^T and w = x^Tb + theta * (q - 1)/2

    --------
    Example:
    --------
    c = LWE_encrypt(pk, 0)
    '''

    d = len(pk[1])  # get dimension
    x = random_vector(GF(2), d).change_ring(GF(q))

    v = (x * pk[0]).change_ring(GF(q))
    w = x * pk[1] + (message * (q - 1)//2)

    c = (v, w)

    return c


def LWE_decrypt(sk, ciphertext, q = 251):
    '''
    Decrypt a textbook LWE ciphertext

    -----------
    Parameters:
    -----------
    - sk: The secret key, s
    - ciphertext: An LWE ciphertext, (v, w)
    - q

    --------
    Returns:
    --------
    - message: returns the "rounding" of w - v^T s. If this is approx. 0, then return 0, if this is approx (q - 1)/2, then return 1.

    --------
    Example:
    --------
    m = LWE_decrypt(pk, 0)
    '''

    m = (ciphertext[1] - ciphertext[0] * sk) % q

    dist_to_half = m - (q - 1) // 2

    if m <= dist_to_half:
        return 0
    else:
        return 1


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

(pk, sk) = gen_LWE_keys()
message = 1
ciphertext = LWE_encrypt(pk, message)
dec_message = LWE_decrypt(sk, ciphertext)

assert dec_message == message

(L, L_prime, U) = gen_LIP_instance()

print(verify_LIP_instance(L, L_prime, U))
