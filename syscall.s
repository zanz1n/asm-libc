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

.section .text

read:
    movq $0, %rax
    syscall
    ret

write:
    mov $1, %rax
    syscall
    ret

open:
    mov $2, %rax
    syscall
    ret

close:
    mov $3, %rax
    syscall
    ret

exit:
    mov $60, %rax
    syscall
    ret

syscall0:
    mov %rdi, %rax
    # mov $0, %rdi
    syscall
    ret

syscall1:
    mov %rdi, %rax
    mov %rsi, %rdi
    # mov $0, %rsi
    syscall
    ret

syscall2:
    mov %rdi, %rax
    mov %rsi, %rdi
    mov %rdx, %rsi
    # mov $0, %rdx
    syscall
    ret

syscall3:
    mov %rdi, %rax
    mov %rsi, %rdi
    mov %rdx, %rsi
    mov %rcx, %rdx
    # mov $0, %rcx
    syscall
    ret
