.section .text
.global _start
.extern main

_start:
    // argc
    mov (%esp), %eax
    // argv
    lea 4(%esp), %ebx
    push %ebx
    push %eax
    call main

    // mov return value of main before call to exit
    mov %eax, %ebx
    call exit
