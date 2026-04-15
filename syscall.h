#ifndef _SYSCALL_H
#define _SYSCALL_H 1

#if defined(__x86_64__) || defined(__aarch64__) || defined(__riscv)
typedef unsigned long size_t;
#else
typedef unsigned int size_t;
#endif

typedef unsigned int fd_t;
typedef unsigned short umode_t;

#define false 0
#define true 1

int read(fd_t fd, char *buf, size_t buf_len);

int write(fd_t fd, const char *buf, size_t buf_len);

int open(const char *filename, int flags, umode_t mode);

int close(fd_t fd);

_Noreturn void exit(int code);

size_t syscall0(size_t n);

size_t syscall1(size_t n, size_t arg1);

size_t syscall2(size_t n, size_t arg1, size_t arg2);

size_t syscall3(size_t n, size_t arg1, size_t arg2, size_t arg3);
#endif
