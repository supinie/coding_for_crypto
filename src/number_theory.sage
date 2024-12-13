# Sage also supports extensive number theoretic functionality.

# Arithmetic in Z/nZ:

R = IntegerModRing(97)

a = R(2) / R(3)
print(a)

print(a.rational_reconstruction())

b = R(47)
print(b^20052005)

modulus = b.modulus()
square = b.is_square()

print(modulus, square)


# Number theoretic functions:

print(gcd(515, 2005))

print(factor(2005))

print(factorial(25))

print(next_prime(2005))
print(previous_prime(2005))

print(divisors(28))

print(inverse_mod(3, 2005))

# Chinese remainder theorem
x = crt(2, 1, 3, 5)
print("x = ", x)
print("x mod 3 = ", x % 3)
print("x mod 5 = ", x % 5)
