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

// Function arg order: %rdi, %rsi, %rdx, %rcx, %r8 %r9.

read:
    mov rax, 0
    syscall
    ret

write:
    mov rax, 1
    syscall
    ret

open:
    mov rax, 2
    syscall
    ret

close:
    mov rax, 3
    syscall
    ret

exit:
    mov rax, 60
    syscall
    ret

syscall0:
    mov rdi, rax
    # mov $0, %rdi
    syscall
    ret

syscall1:
    mov rdi, rax
    mov rsi, rdi
    # mov $0, %rsi
    syscall
    ret

syscall2:
    mov rdi, rax
    mov rsi, rdi
    mov rdx, rsi
    # mov $0, %rdx
    syscall
    ret

syscall3:
    mov rdi, rax
    mov rsi, rdi
    mov rdx, rsi
    mov rcx, rdx
    # mov $0, %rcx
    syscall
    ret
