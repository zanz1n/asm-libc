.global _start

_start:
    // argc
    pop %rdi
    // argv
    mov %rsp, %rsi
    call main

    // mov return value of main before call to exit
    mov %rax, %rdi
    call exit
