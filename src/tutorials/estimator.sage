from estimator import *

kyber = schemes.Kyber512
print(kyber)

print(LWE.primal_usvp(kyber))

print(LWE.estimate.rough(kyber))

print(LWE.estimate(kyber))
