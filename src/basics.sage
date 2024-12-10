# Sage uses standard python operations for assignment, comparison, and *most* mathematical operations

a = 5

if a == 5:
    print("equality")
elif a == 3:
    print("won't print")
elif a != 3:
    print("inequality")
elif a <= 6:
    print("comparison")

a_cubed = a ** 3    # or we can use ^ unlike standard python
a_cubed_again = a ^ 3
assert a_cubed == a_cubed_again

mod = 10 % 3
division = 10 / 4
integer_quotient = 10 // 4

assert 4 * (10 // 4) + 10 % 4 == 10

# Typing
# Python is dynamically typed, and so we can implicitly coerce variable types (gross)
# Sage adds additional types, which we will see the use of later, but these will give more exact mathematical descriptions

print(type(a))
a = 5 / 3
print(type(a))  # What would this be in normal Python?
