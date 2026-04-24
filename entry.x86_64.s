.intel_syntax noprefix

.section .text
.global _start
.extern main

_start:
    // argc
    pop rdi
    // argv
    mov rsi, rsp
    call main

    // mov return value of main before call to exit
    mov rdi, rax
    call exit
