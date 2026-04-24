.intel_syntax noprefix

.section .text

.global read
.global write
.global open
.global close
.global exit

.global syscall0
.global syscall1
.global syscall2
.global syscall3

// Function arg order: %eax, %ebx, %ecx, %edx, %esi, %edi %ebp.

read:
    mov eax, 3
    int 0x80
    ret

write:
    mov edx, ecx
    mov ecx, ebx
    mov ebx, eax
    mov eax, 4
    int 0x80
    ret

open:
    mov eax, 5
    int 0x80
    ret

close:
    mov eax, 6
    int 0x80
    ret

exit:
    mov eax, 1
    int 0x80

syscall0:
    int 0x80
    ret

syscall1:
    int 0x80
    ret

syscall2:
    int 0x80
    ret

syscall3:
    int 0x80
    ret
