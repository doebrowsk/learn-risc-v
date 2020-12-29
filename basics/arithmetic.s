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
