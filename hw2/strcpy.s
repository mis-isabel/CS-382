//Isabel Sutedjo
//I pledge my honor that I have abided by the Stevens Honor System.
.text //marks text that all lines after are assembly code
.global _start //declares _start as a global label

_start: //marks first instruction
    ADR     X0, src_str // store base address of src_str
    ADR     X1, dst_str //store base address of dst_str
    MOV     X9, 0 // stores 0 into X9 as 'index' counter

begin: //label
    LDRB    W2, [X0, X9] //load address into register W2 using counter offset 
    STRB    W2, [X1, X9] //store W2 in X1 (dst_str)
    ADD     X9, X9, 1 //increment counter
    CMP     W2, 0 // compares W2 to 0 
    B.EQ    exit // if compare is equal to 0 (last char in string) branch to end
    B       begin // loop back to begin
    
exit: //exit label
    //regular exit calls
    MOV     X0, 0 //status = 0
    MOV     X8, 93 //system call to exit is #93
    SVC     0 //calls the system to exit

.data
//source string
src_str:    .string "I love 382 and assembly!"

.bss
//destination string
dst_str:    .skip 100

