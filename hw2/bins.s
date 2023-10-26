//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label
.extern printf //declares printf from external

_start: //marks first instruction
    ADR     X12, arr // store base address of arr
    ADR     X1, length // store base address of length
    ADR     X2, target // store base address of target

    LDR     X5, [X1, 0] // loads length
    LDR     X6, [X2, 0] // loads target
    MOV     X9, 0 // stores 0 into X9 as counter for low
    SUB     X11, X5, 1 // high = length - 1

highEqualLow: //label
    CMP     X11, X9 // compare high and low
    B.LT    doesntExist // branch to doesnt exist (end of loop)

    ADD     X10, X9, X11 // add high and low
    LSR     X10, X10, 1 // logical shift right 1 for mid
    LSL     X8, X10, 3 // logical shift left mid by 3 to find index
    LDR     X7, [X12, X8] // loads value of index

    CMP     X6, X7 // compare the target and index
    B.EQ    exists // if they are equal then the target exists

    CMP     X6, X7 // compare the target and index
    B.LT    else // check if X6 is less than X7, branch to else
    ADD     X9, X10, 1 // if it is not then add mid + 1 to low
    B       loop // branch to loop

else: //label
    MOV     X11, X10 // move middle to high

loop: //label
    CMP     X9, X11 // compares X9 with X11
    B       highEqualLow // loop back to begin

exists: //label
    ADR     X0, msg1 // store base address of msg1
    MOV     X1, X6 // moves target into x1
    BL      printf // prints
    B       exit // branches to exit code

doesntExist: //label
    ADR     X0, msg2 // store base address of msg2
    MOV     X1, X6 // moves target into x1
    BL      printf //prints

exit: //exit label
    //regular exit calls
    MOV     X0, 0 //status = 0
    BL      fflush //clears printf object
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.data
//original array
arr:    .quad -40, -25, -1, 0, 100, 300
length: .quad 6 //length of array
target: .quad -25 //target number
msg1: .string "Target %ld is in the array." //string if target is in array
msg2: .string "Target %ld is not in the array." //string if target is not in array

