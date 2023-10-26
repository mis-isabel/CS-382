//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label
    
loop: // label
    LDR     X15, [X1, 0] // load 
    CMP     X15, 10 // check for end of array
    B.GT    loopContinue // loop back
    B       exit    // done
    
loopContinue: // label
    SUB     X15, X15, X22 // subtract to account for ascii value
    MUL     X20, X20, X21 // multiply by 10 to shift left
    ADD     X20, X20, X15 // add the value to final result
    B       read // branch back to read

_start: //marks first instruction
    MOV     X8, 63 // assign read to system call number 
    MOV     X0, 0 // fd = 0
    ADR     X1, arr // loads address of arr into X1
    MOV     X2, 1 // read 1 byte at a time
    MOV     X20, 0 // store final result, temp first as 0
    MOV     X21, 10 // store 10 to shift
    MOV     X22, 48 // store 48 for ascii value
read: // label
    SVC     0 // call read
    BL      loop // branch to loop

exit: //exit label
    MOV     X0, X20 // set to final call
    //regular exit calls
    MOV     X0, 0 //status = 0
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.bss
//stores 100 bytes of data for input
arr: .skip 100, 0 

