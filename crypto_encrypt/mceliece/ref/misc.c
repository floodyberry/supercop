#include<stdlib.h>
#include<string.h>
#include "randombytes.h"
#include "sizes.h"

__inline int u8rnd() { char c; randombytes(&c,1); return 255 & (int) c; }

// coefficient binomial median bino[t-1] = binomial(t,t/2) avec t/2
// arrondi inférieurement
unsigned bino[NB_ERRORS] = {1U, 2U, 3U, 6U, 10U, 20U, 35U, 70U, 126U, 252U, 462U, 924U, 1716U, 3432U, 6435U, 12870U, 24310U, 48620U, 92378U, 184756U, 352716U, 705432U, 1352078U, 2704156U, 5200300U, 10400600U, 20058300U, 40116600U, 77558760U, 155117520U, 300540195U, 601080390U};

#define MAX_BUF_SIZE 32
unsigned buf = 0;
int buf_size = 0;

void fill_buf() {
  unsigned res;

  res = u8rnd();
  buf_size += 8;
  while (buf_size < MAX_BUF_SIZE) {
    res = u8rnd() ^ res << 8;
    buf_size += 8;
  }
  buf_size = MAX_BUF_SIZE;
  buf ^= res;
}

// 32 >= r > 0
unsigned rnd(int r) {
  if (buf_size < r)
    fill_buf();
  return buf >> (MAX_BUF_SIZE - r);
}

// buf_size >= r > 0
void update_rnd(int r) {
  buf_size -= r;
  buf = (r == MAX_BUF_SIZE) ? 0 : (buf << r);
}

void pick_er(int t, int m, int * e, int x)
{
  unsigned i, j;
  unsigned b, c;
  long long d;

  if (t == 0)
    return;

  if (m == 0) {
    *e = x;
  }
  else if (t == 1) {
    *e = x + rnd(m);
    update_rnd(m);
  }
  else {
    do {
      b = bino[t-1];
      c = rnd(t);
      update_rnd(t);
      j = t / 2;
      if (!(t & 1)) { // t even
	if (c >= b) {
	  c -= b;
	  d = (long long) b * j;
	  b = (unsigned) (d / (t - j + 1));
	  --j;
	}
      }
      i = j;
      while (c >= b) {
	c -= b;
	i = t - j;
	if (c < b)
	  break;
	c -= b;
	d = (long long) b * j;
	b = (unsigned) (d / (t - j + 1));
	--j;
	i = j;
      }
    } while ((i > (1 << (m - 1))) || ((t - i) > (1 << (m - 1))));
    pick_er(i, m - 1, e, x);
    pick_er(t - i, m - 1, e + i, x + (1 << (m - 1)));
  }
}
