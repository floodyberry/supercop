typedef struct { /*Remember, no flood of .h files*/
  fep256 x;
  fep256 y;
  fep256 z;
} point;
extern void p256add(point *c, point *a, point *b);
extern void p256dbl(point *c, point *a);
extern void p256scalarmult(point *c, point *a, const unsigned char e[32]);
extern void p256scalarmult_base(point *c, const unsigned char e[32]);
extern void p256pack(unsigned char p[64], point *a);
extern void p256unpack(point *c, const unsigned char p[64]);
extern unsigned int  p256oncurvefinite(point *c);
extern void p256xpack(unsigned char c[32], point *a);
extern void p256base(point *c);
extern void p256add_total(point *c, point *a, point *b);
extern void p256dblmult_base(point *c, point *a, const unsigned char e1[32],
                             const unsigned char e2[32]);
