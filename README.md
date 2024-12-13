# Coding for Crypto

This is the repository in which a set of examples, problems, and solutions will be kept for a crash course on using Sage (and complimentary packages) for (post-quantum) cryptography.

## Prerequisites:

- An IDE, eg. vscode _(if you are familiar with Jupyter and would prefer that, then this can be skipped)_
- [Python3](https://www.python.org/downloads/)
- [Sage Maths](https://doc.sagemath.org/html/en/installation/index.html) _(No development necessary)_
- [git](https://git-scm.com/downloads) _(Not *strictly* necessary, but will be helpful)_

If you have any troubles installing any of the above, let me know and I can lend a hand. If a large portion of the group are not comfortable with it, then I can adjust the plan to include this at the beginning.

I assume the reader has basic familiarity with Python, its syntax, and general programming constructs (loops, conditionals, variables, etc.). Again, if you don't think that this is you, let me know and I can give you some resources for this (and can go through it with you in the session quickly).

For more on Python, see:

- https://learnpython.org/
- https://docs.python.org/3/tutorial/index.html
- https://wiki.python.org/moin/BeginnersGuide


If you would like to get a headstart on the material we will cover, then check out:

- https://doc.sagemath.org/html/en/tutorial/index.html
- https://github.com/fplll/fpylll/blob/master/docs/tutorial.rst

## Contents:

The `src` directory contains a number of example files, as well as an exercise file to practice what was learnt, as well as some solutions. There is also a utils file, this can be ignored and only contains a few helper functions to allow easy extension of existing classes.

The example files should be covered in the following order:

- basics
- number_theory
- linear_algebra
- lattices
- LLL
- estimator

## References:

A lot of the examples are taken from:

- [Sage guided tour](https://doc.sagemath.org/html/en/tutorial/introduction.html)
- [Martin Albrecht's ICMS summer school workshop](https://www.icms.org.uk/sites/default/files/downloads/Masrtin%202%20%28worksheet%29.pdf)
- [Lattice Estimator](https://lattice-estimator.readthedocs.io/en/latest/readme_link.html)
- [Albrecht and Ducas' "Sage for Lattice-Based Cryptography](https://www.maths.ox.ac.uk/system/files/attachments/sage-introduction.pdf)

If you would like to learn more, I would highly recommend reading them fully. They contain far deeper explanations of the material covered, as well as more complex topics.
