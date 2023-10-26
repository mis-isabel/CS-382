//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label
.extern printf //declares printf from external

_start: //marks first instruction
    ADR     X19, arr // store base address of arr
    ADR     X20, length // store base address of length
    LDR     x25, [X20, 0] // load address of length into register X25 using offset
    SUB     X21, X25, 1 // subtract 1 to calculate offset
    LSL     X22, X21, 3 // logical shift left 3 to calculate offset
    LDR     X24, [X19, X22] // load address of last value in array
    MOV     X23, X24 // temp max value as last value in array 
    BL      findmax // call findmax function

findmax: //label
    SUB     SP, SP, 8 // allocating frame sp -= frame size
    STR     LR, [SP, 0] // uses link register 
    CMP     X22, 0 // checks whether to end or branch to recursive call
    B.NE    recursive // branch to recursive call
    B       finalCall // branch to final call
    RET     // return call
    

recursive: //label
    SUB     X22, X22, 8 // finds next offset
    LDR     X24, [X19, X22] // load address of next array value
    CMP     X23, X24 // checks if current index if greater than current max
    B.LT    greater // branch to greater call
    B       findmax //branch to original find max      

greater: //label
    MOV     X23, X24 // update the max value
    B       findmax // branch to original findmax

finalCall: // label
    ADR     X0, outstr //store base address of string
    MOV     X1, X23 // moves max into x1
    BL      printf // prints
    LDR     LR, [SP] // add link register to stack pointer
    ADD     SP, SP, 8 // deallocating frame sp += frame size

exit: //exit label
    //regular exit calls
    MOV     X0, 0 //status = 0
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.data
//stores starting point for range
arr: .quad -10, 23, -100, 124, 66, 12
//stores ending point for range
length: .quad 6
//stores printout string
outstr: .string "%ld\n"

