from sage.modules.free_module_integer import FreeModule_submodule_with_basis_integer
from sage.modules.free_module_integer import IntegerLattice

def random(d=4):
    '''
    Generate a random full rank integer lattice of dimension d

    -----------
    Parameters:
    -----------
    - d: the dimension of lattice L

    --------
    Returns:
    --------
    - L: Lattice object

    --------
    Example:
    --------
    L = IntegerLattice.random()
    '''
    
    B = sage.crypto.gen_lattice(m=d, seed=1337)
    L = IntegerLattice(B)

    return L


def from_basis(B):
    '''
    Generates an integer lattice from a given basis

    --------
    Parameters:
    -----------
    - B: the basis matrix for the lattice

    ------
    Returns:
    --------
    - L: Lattice object defined by the basis

    -------
    Example:
    --------
    L = Lattice.with_basis(B)
    '''
    L = IntegerLattice(B)

    return L

Lattice = FreeModule_submodule_with_basis_integer
Lattice.random = random
