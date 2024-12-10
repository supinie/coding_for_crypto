from sage.matrix.constructor import random_unimodular_matrix

class Lattice:
    def __init__(self):
        self.lattice = sage.crypto.gen_lattice(m=4, seed=123937542374, lattice=true)


    def __repr__(self):
        return f"{self.lattice}"


    def __getattr__(self, name):
        return getattr(self.lattice, name)


    def corresponding_quadratic_form(self):
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


def gen_LIP_instance(d = 4):
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
    L = Lattice()
    Q = L.corresponding_quadratic_form().Gram_matrix()

    matrix_space = sage.matrix.matrix_space.MatrixSpace(ZZ, d)

    U = random_unimodular_matrix(matrix_space)

    Q_prime = U.transpose() * Q * U

    B_prime = Q_prime.cholesky()

    L_prime = IntegralLattice(B_prime)

    return (L, L_prime, U)


##############################################
#                   TESTS                    #
#############################################

L = Lattice()

Q = L.corresponding_quadratic_form()
print(Q)

(L, L_prime, U) = gen_LIP_instance()

LHS = L.corresponding_quadratic_form().Gram_matrix()
RHS = U.transpose() * L_prime.corresponding_quadratic_form().Gram_matrix() * U
assert LHS == RHS
