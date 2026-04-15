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

// Function arg order: %ebx, %ecx, %edx, %esi, %edi %ebp.

read:
    mov $3, %eax
    int $0x80
    ret

write:
    mov $4, %eax
    int $0x80
    ret

open:
    mov $5, %eax
    int $0x80
    ret

close:
    mov $6, %eax
    int $0x80
    ret

exit:
    mov $1, %eax
    int $0x80

syscall0:
    mov %ebx, %eax
    # mov $0, %ebx
    int $0x80
    ret

syscall1:
    mov %ebx, %eax
    mov %ecx, %ebx
    # mov $0, %ecx
    int $0x80
    ret

syscall2:
    mov %ebx, %eax
    mov %ecx, %ebx
    mov %edx, %ecx
    # mov $0, %edx
    int $0x80
    ret

syscall3:
    mov %ebx, %eax
    mov %ecx, %ebx
    mov %edx, %ecx
    mov %esi, %edx
    # mov $0, %esi
    int $0x80
    ret
