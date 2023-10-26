//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label
.extern printf //declares printf from external

_start: //marks first instruction
    ADR     X0, arr // store base address of arr
    ADR     X1, length // store base address of length

    LDR     X5, [X1, 0] // loads length
    LDR     X6, [X2, 0] // loads target
    MOV     X9, 0 // stores 0 into X9 as counter for low
    SUB     X11, X5, 1 // high = length - 1

highEqualLow: //label
    CMP     X11, X9 // compare high and low
    B.LE    doesntExist // branch to doesnt exist (end of loop)

    LSR     X10, X5, 1 // logical shift right 1 for mid
    LSL     X8, X10, 3 // logical shift left mid by 3 to find index
    LDR     X7, [X0, X8] // loads value of index

    CMP     X6, X7 // compare the target and index
    B.EQ    exists // if they are equal then the target exists

    CMP     X6, X7 // compare the target and index
    B.LT    else // check if X6 is less than X7, branch to else
    ADD     X9, X10, 1 // if it is not then add mid + 1 to low
    B       loop // branch to loop

else:
    SUB     X11, X10, 1 //subtract mid - 1 to equal high

loop:
    CMP     X9, X11 // compares X9 with X11
    B.EQ    exit // if compare is equal low == high, exit
    B       highEqualLow // loop back to begin

exists: //label
    MOV     X1, X6 // moves target into x1
    LDR     X0, [X3] // loads msg1
    BL      printf // prints
    B       exit // branches to exit code

doesntExist: //label
    MOV     X1, X6 // moves target into x1
    LDR     X0, [X4] //loads msg2

exit: //exit label
    //regular exit calls
    BL      fflush //clears printf object
    MOV     X0, 0 //status = 0
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.data
//source string
arr:    .word 0x12BFDA09, 0x9089CDBA, 0x56788910
length: .word 3


