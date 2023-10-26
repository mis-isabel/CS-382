//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label

_start: //marks first instruction
    ADR     X0, vec1 // store base address of vec1
    LDUR    X2, [X0, 0] // load address into register X2 using offset
    ADR     X1, vec2 // store base address of vec2
    LDUR    X3, [X1, 0] // load address into register X3 using offset
    MUL     X4, X2, X3 //multiply vec1[0] * vec2[0]

    LDUR    X2, [X0, 8] // load address into register X2 using offset
    LDUR    X3, [X1, 8] // load address into register X3 using offset
    MUL     X5, X2, X3 //multiply vec1[1] * vec2[1]

    LDUR    X2, [X0, 16] // load address into register X2 using offset
    LDUR    X3, [X1, 16] // load address into register X3 using offset
    MUL     X6, X2, X3 //multiply vec1[2] * vec2[2]

    ADD     X7, X4, X5 // add X4 + X5
    ADD     X8, X7, X6 // add X7 to X6
    ADR     X9, dot //store base address of dot in x9
    STUR    X8, [X9] // stores x8 in dot

    MOV     X0, 0 //status = 0
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.data
//stores vector 1
vec1: .quad 10, 20, 30
//stores vector 2
vec2: .quad 1, 2, 3
//stores final dot product result
dot: .quad 0

