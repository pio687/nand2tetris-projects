// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

//check R1 for negative or one

@1 // check R1
D=M // save R1 to D
@ZERO1 // check zero loop
D;JEQ // jump to zero if zero
@1
D=M-1
@ONE1
D;JEQ // jump to one if one

//check R0 for negative or one

@0 // check R0
D=M // save R0 to D
@ZERO // check zero loop
D;JEQ // jump to zero if zero
@0 // check R0 again
D=M-1 // check if 1
@ONE
D;JEQ

//initialize

@0
D=M
@2
M=D
@1
M=M-1
@LOOP
D;JMP

//zero and one checks

(ZERO)
@0
D=M
@2
M=D
@END
D;JMP

(ONE)
@1
D=M
@END
D;JMP


(ZERO1)
@1
D=M
@2
M=D
@END
D;JMP

(ONE1)
@0
D=M
@2
M=D
@END
D;JMP


(LOOP)
@0 // check R0
D=M // save R0 to D
@2 // check R2
M=D+M // add D to R2
@1 // check 1
DM=M-1 // subtract 1 from R1
@END
D;JEQ // END IF 0
@LOOP
D;JMP
(END)



