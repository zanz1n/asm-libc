#include "syscall.h"

size_t strlen(const char *str) {
  for (size_t i = 0;; i++) {
    if (str[i] == '\0') {
      return i;
    }
  }
}

char itoa_b[128];

const char *itoa(int num) {
  int i = 0;
  bool isNegative = false;

  if (num == 0) {
    itoa_b[i++] = '0';
    itoa_b[i] = '\0';
    return itoa_b;
  }

  if (num < 0) {
    isNegative = true;
    num = -num;
  }

  while (num != 0) {
    int rem = num % 10;
    itoa_b[i++] = (rem > 9) ? (rem - 10) + 'a' : rem + '0';
    num = num / 10;
  }

  if (isNegative)
    itoa_b[i++] = '-';

  itoa_b[i] = '\0';

  for (int j = 0; j < i / 2; j++) {
    itoa_b[j] = itoa_b[i - j];
  }

  return itoa_b;
}

void print(const char *s) { write(1, s, strlen(s)); }

void println(const char *s) {
  write(1, s, strlen(s));
  write(1, "\n", 1);
}

int main(int argc, const char **argv) {
  println("AAAAA");
  println(itoa(argc));

  for (int i = 0; i < argc; i++) {
    println(argv[i]);
  }
  return 222;
}
