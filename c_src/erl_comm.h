typedef unsigned char byte;
int read_exact(byte *buf, int len);
int write_exact(byte *buf, int len);
int read_cmd(byte *buf);
int write_cmd(byte *buf, int len);
