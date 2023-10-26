//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label

_start: //marks first instruction
    ADR     X0, p1 // store base address of p1
    ADR     X1, p2 // store base address of p2
    ADR     X2, p3 // store base address of p3

    //calculate distance p1 and p2
    LDUR    x3, [X0, 0] // load address into register X3 using offset
    LDUR    X4, [X0, 8] // load address into register X4 using offset
    LDUR    X5, [X1, 0] // load address into register X5 using offset
    LDUR    X6, [X1, 8] // load address into register X6 using offset
    LDUR    X7, [X2, 0] // load address into register X7 using offset
    LDUR    x8, [X2, 8] // load address into register X8 using offset
    SUB     x9, X3, X5 // subtracts x3 and x5 (x1 - x2)
    MUL     X10, X9, X9 // square the value of X8
    SUB     X11, x4, X6 // subtracts x4 and x6 (x1 - x2)
    MUL     X12, X11, X11 // square the value of X11
    ADD     X13, X10, X12 //add the two squared values together (X10 + X12)

    //calculate distance p2 and p3
    SUB     X9, X5, X7 // subtracts x5 and x7 (x1 - x2)
    MUL     X10, X9, X9 // square the value of X9
    SUB     X11, X6, X8 // subtracts x6 and x8 (x1 - x2)
    MUL     X12, X11, X11 // square the value of X11
    ADD     X14, X10, X12 //add the two squared values together (X10 + X12)

    //calculate distance p1 and p3
    SUB     X9, X3, X7 // subtracts x3 and x7 (x1 - x2)
    MUL     X10, X9, X9 // square the value of X9
    SUB     X11, X4, X8 // subtracts x3 and x8 (x1 - x2)
    MUL     X12, X11, X11 // square the value of X11
    ADD     X15, X10, X12 // add the two squared values together (X10 + X12)

    // find the biggest side
    CMP     X13, X14 // X13-X14 and compares it to 0
    B.GT    firstLongBeforeLast // if compare is greater than 0 than branch to firstlongBeforeLast
    B       secondLongBeforeLast // goto secondLongBeforeLast

firstLongBeforeLast: // label
    CMP     X13, X15 // X13 - X15 and compares it to 0
    B.GT    firstLong // if compare is greater than 0 than branch to firstlong
    B       thirdLong // if not go to third long

firstLong: // label
    ADD     X16, X14, X15 // add the 2 distances together that is not the hypoteneus
    CMP     X13, X16  // if hypoteneuse is equal to the sum of the other two distances
    B.EQ    rightTriangle // go to right triangle if it is a right triangle
    B       notRightTriangle // go to not right triangle if not a right triangle

secondLongBeforeLast: // label
    CMP     X14, X15 // X14 - X15 and compares it to 0
    B.GT    secondLong // if compare is greater than 0 than branch to secondLong
    B       thirdLong // if not go to third long

secondLong: //label
    ADD     X16, X13, X15 // add the 2 distances together that is not the hypoteneus
    CMP     X14, X16 // if hypoteneuse is equal to the sum of the other two distances
    B.EQ    rightTriangle // go to right triangle if it is a right triangle
    B       notRightTriangle // go to not right triangle if not a right triangle

thirdLong: //label
    ADD     X16, X13, X14 // add the 2 distances together that is not the hypoteneus
    CMP     X15, X16 // if hypoteneuse is equal to the sum of the other two distances
    B.EQ    rightTriangle // go to right triangle if it is a right triangle
    B       notRightTriangle // go to not right triangle if not a right triangle

rightTriangle: // label
    ADR    X1, yes // stores base address for yes
    B      exit //go to exit label 

notRightTriangle: // label
    ADR    X1, no // stores base address for no

exit: //exit label
    //regular exit calls
    MOV     X0, 0 //status = 0
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.data
//stores first point of triangle
p1: .quad 1, 0
//stores second point of triangle
p2: .quad 0, 2
//stores third point of triangle
p3: .quad 2, 0
//stores string if triangle is a right triangle
yes: .string "It is a right triangle."
//stores string if triangle is not a right triangle
no: .string "It is not a right triangle."

