#include "syscall.h"

size_t strlen(const char *str) {
  for (size_t i = 0;; i++) {
    if (str[i] == '\0') {
      return i;
    }
  }
}

void print(const char *s) { write(1, s, strlen(s)); }

void println(const char *s) {
  write(1, s, strlen(s));
  write(1, "\n", 1);
}

int main(int argc, const char **argv) {
  for (int i = 0; i < argc; i++) {
    println(argv[i]);
  }
}
