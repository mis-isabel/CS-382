//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label
    
loop: // label
    LDR     X15, [X1, 0] // load 
    CMP     X15, 10 // check for end of array
    ADD     X19, X19, 1 // add 1 to counter
    B.GT    loopContinue // loop back
    B       square    // write output
    
loopContinue: // label
    SUB     X15, X15, X22 // subtract to account for ascii value
    MUL     X20, X20, X21 // multiply by 10 to shift left
    ADD     X20, X20, X15 // add the value to final result
    B       read // branch back to read

_start: // marks first instruction
    MOV     X8, 63 // assign read to system call number 
    MOV     X0, 0 // fd = 0
    ADR     X1, arr // loads address of arr into X1
    MOV     X2, 1 // read 1 byte at a time
    MOV     X20, 0 // store final result, temp first as 0
    MOV     X21, 10 // store 10 to shift and modulus
    MOV     X22, 48 // store 48 for ascii value
    MOV     X19, 0 // length
    MOV     X18, 0 // check for end
    MOV     X12, 10 // store 10 as new line character

read: // label
    SVC     0 // call read
    BL      loop // branch to loop

square: // label
    MOV     X0, X20 // set to final call
    MUL     X3, X0, X0 // squaring final result
    SUB     SP, SP, 8 // allocate space in stack
    STR     X12, [SP, 0] // store new line character
    MOV     X27, X3

modulus: // label
    MOV     X3, X27 // store last called multiple
    UDIV    X4, X3, X21 // get division of unsigned int
    MUL     X5, X4, X21 // get multiplication
    SUB     X5, X3, X5 // getting final first digit

loopascii: // label
    MOV     X27, X4 // store x4
    CMP     X5, X18 // check for end
    B.GT    putin // loop to continue
    B       takeout // exit to write

putin: // label
    ADD     X5, X5, X22 // subtract to account for ascii value
    SUB     SP, SP, 8 // allocate space in stack
    STR     X5, [SP, 0] // store in stack
    B       modulus // go back to modulus

takeout: // label
    LDR     X13, [SP] // taking out of stack
    MOV     X0, 1 // fd = 1
    MOV     X1, SP // store write result
    MOV     X2, 1 // length
    MOV     X8, 64 // assign write to system call number
    SVC     0 // call write
    ADD     SP, SP, 8 // adding 8 to sp
    CMP     X13, 10 // check for new line character to stop
    B.NE    takeout // loop back again
    B       exit

exit: //exit label
    //regular exit calls
    MOV     X0, 0 //status = 0
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.bss
//stores 100 bytes of data for input
arr: .skip 100, 0 