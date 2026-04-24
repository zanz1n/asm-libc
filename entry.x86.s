.intel_syntax noprefix

.section .text
.global _start
.extern main

_start:
    // argc
    pop ecx
    mov ebx,esp
    push ebx
    push ecx
    call main

    // mov return value of main before call to exit
    mov ebx, eax
    mov eax, 1
    int 0x80
    ret
