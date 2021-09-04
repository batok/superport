/* port.c */

typedef unsigned char byte;
int read_cmd(byte *buf);
int write_cmd(byte *buf, int len);
int foo(int x);
int bar(int x);
int baz(int x);


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
    }

    buf[0] = res;
    write_cmd(buf, 1);
  }
}
