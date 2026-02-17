// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.
//// Replace this comment with your code.

(INIT)
@SCREEN
D=A
@5
M=D
@8192
D=A
@4
M=D
@0
D=M
@1
M=D-1
@KEYCHECK
D;JMP

(KEYCHECK)
@KBD
D=M
@FILL
D;JGT
@KEYCHECK
D;JMP

(FILL)
@1
D=M
@5
A=M
M=D
@5
M=M+1
@4
DM=M-1
@CLEARCHECK
D;JEQ
@FILL
D;JMP

(CLEARCHECK)
@KBD
D=M
@CLEAR
D;JGT
@CLEARCHECK
D;JMP

(CLEAR)
@SCREEN
D=A
@5
M=D

@8192
D=A
@4
M=D
@CLEARLOOP
D;JMP


(CLEARLOOP)
@0
D=A
@5
A=M
M=D

@5 
M=M+1

@4
M=M-1
D=M
@INIT
D;JEQ
@CLEARLOOP
D;JMP


/*(INIT)
@SCREEN
D=A
@5
M=D
@4
MD=M-1
@5
A=M
M=D

@8192
D=A
@2
M=D

@LOOP
D;JMP

(LOOP)
@5 // fill screen
MD=M+1
@4
D=M
@5
A=M
M=D

@2 // check R2 to see if we're done
M=M-1
D=M
@KEYEND
D;JEQ
@KEYCHECK
D;JMP

(KEYCHECK)
@KBD // key check
D=M
@CLEAR
D;JGT
@LOOP
D;JMP

(KEYEND)
@KBD // key check
D=M
@CLEAR
D;JGT
@KEYEND
D;JMP

(CLEAR)
@SCREEN
D=A
@5
M=D
@0
D=M
@5
A=M
M=D

@8192
D=A
@1
M=D
@2
D=D-M
@INIT
D;JEQ
@CLEARLOOP
D;JMP


(CLEARLOOP)
@5 
MD=M+1
@0
D=M
@5
A=M
M=D

@1
D=M
@2
D=D-M
@INIT
D;JEQ
@1
M=M-1
@CLEARLOOP
D;JMP

(END)
@END
0;JMP



/*
(INIT)
@1
MD=D+1
@FILLINT
D;JMP

(FILLINIT)
@1
D=M
@SCREEN
D=A
@2
M=D
@FILL
D;JMP

(FILL)
@1
D=M
@2
A=M
@A
M=D
A=A+1
@A
M=D
@FILL
D;JMP

(KEYCHECK)
@KBD
M=D
@CLEAR
D;JEQ
@KEYCHECK
D;JMP

(CLEAR)

*/




