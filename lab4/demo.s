
.text
.global _start

_start:
    MOV     X0, 0
    MOV     X8, 93
    SVC     0

.data
    hello_str: .ascii "Hello World!\n\0"
    arr: .dword 13, 14, 1024