/* port.c */
#include "complex.h"
typedef unsigned char byte;
int read_cmd(byte *buf);
int write_cmd(byte *buf, int len);


int main() {
  int fn, arg, res;
  byte buf[100];

  while (read_cmd(buf) > 0) {
    fn = buf[0];
    arg = buf[1];
    
    if (fn == 1) {
      res = foo(arg);
    } else if (fn == 2) {
      res = bar(arg);
    } else if (fn == 3) {
      res = baz(arg);
    } else if (fn == 4) {
      res = sum(arg, buf[2]);
    }

    buf[0] = res;
    write_cmd(buf, 1);
  }
}
