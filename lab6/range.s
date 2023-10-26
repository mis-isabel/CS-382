//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label
.extern printf //declares printf from external

_start: //marks first instruction
    ADR     X19, starting // store base address of starting
    ADR     X20, ending // store base address of ending
    LDR     x25, [X19, 0] // load address into register X25 using offset
    LDR     X26, [X20, 0] // load address into register X26 using offset
    BL      range //call range function

range: //label
    SUB     SP, SP, 8 // allocating frame sp -= frame size
    STR     LR, [SP, 0] // uses link register 
    CMP     X25, X26 // checks whether to end or branch to recursive call
    B.LT    recursive // branch to recursive call
    LDR     LR, [SP] // add link register to stack pointer
    ADD     SP, SP, 8 // deallocating frame sp += frame size
    RET     // return call

recursive: // label
    ADR     X0, outstr //store base address of string
    MOV     X1, X25 // moves current into x1
    BL      printf // prints
    ADD     X25, X25, 1 // add 1 to the counter
    BL      range // branch back to range

exit: //exit label
    //regular exit calls
    MOV     X0, 0 //status = 0
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.data
//stores starting point for range
starting: .quad 10
//stores ending point for range
ending: .quad 15
//stores printout string
outstr: .string "%ld\n"

