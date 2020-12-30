
# R-type (register) instruction format fields
#   funct7  |   rs2     |   rs1     |   funct3  |   rd      |   opcode
#   7 bits  |   5 bits  |   5 bits  |   3 bits  |   5 bits  |   7 bits
# registers (with 32 present) are represented by 5 bits in each machine instruction (rs2, rs1, rd)
# funct7 and funct3 provide additional optional space for the opcode field
# rd is the destination register
# rs1 and rs2 are the first and second source registers


# I-type (immediate) instruction format fields
#   immediate   |   rs1     |   funct3  |   rd      |   opcode
#   12 bits     |   5 bits  |   3 bits  |   5 bits  |   7 bits
# used for addi and load from memory


# S-type (store) instruction format fields
#   immediate [12:5]    |   rs2     |   rs1     |   funct3  |   immediate [4:0] |   opcode
#   7 bits              |   5 bits  |   5 bits  |   3 bits  |   5 bits          |   7 bits


# instructions might have immediates broken up, so that rs2 and rs1 are always in the same place
# funct3 and opcode are also always the same size and location in an instruction
# the specific combination of funct3 and opcode tell the proc what the instruction format is (and also help define the instruction to execute)
