# Example 2.3.1
# f = (g + h) - (i + j)
# x19 = (x20 + x21) - (x22 + x23)
add x8, x20, x21
add x9, x22, x23
sub x19, x8, x9


# Example 2.3.2
# g = h + A[8] (A is an array of doublewords)
# x20 = x21 + A[base_addr: x22]
ld x8, 8(x22)
add x20, x21, x8

# Notes:
# RISC-V addresses each byte, so offsets should actually be multiples of 8 for doublewords, 4 for words
# In the above example, we would want to execute:
ld x8, 64(x22)
# since the doubleword at index 8 would be 64 bytes into the array's memory space


# Example 2.3.3
# A[12] = h + A[8]
# h is x21 and A[base_addr: x22]
ld x8, 64(x22)
add x9, x8, x21
sd x9, 96(x22)
# could have added back in to x8 e.g. add x8, x8, x21


# constants can be written directly in assembly
addi x9, x9, 4 # x9 = x9 + 4
# addi can use negative numbers as well (the immediate is a 2s-complement)

# register x0 holds the constant value 0
# can be used to negate the value in a register using subtraction
sub x9, x0, x9 # negates the value of x9 


# loading doublewords from memory into a register with the same size (64bits) makes signed / unsigned destinction moot
# we only care about a difference for signed / unsigned when loading individual bytes
lb t1, 0(s1) # signed byte load - performs proper sign extension when filling the target register with the byte value
lbu t1, 0(s1) # unsigned byte load - just fills the left-side bytes in the target register with 0
# loading bytes sees usage primarily for loading text characters
# lbu sees the most usage as a result (we want to load the exact bit values with no sign consideration