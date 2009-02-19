#include <stdio.h>
#include <stdlib.h>

#include "nist.h"
#include "compat.h"

typedef short          v4hi __attribute__ ((vector_size (8)));
typedef unsigned char  v8qi __attribute__ ((vector_size (8)));
typedef v4hi vec;

struct mem64  { char x[ 64]; };
struct mem128 { char x[128]; };
struct mem256 { char x[256]; };

#define VECTOR_SIZE 4
#define CV(x) {x, x, x, x}

union cv {
  short u16[4];
  vec v16;
};

char* VERSION(void) {
  return "OPTIMIZED, VECTORIZED";
}

int SupportedLength(int hashbitlen) {
  if (hashbitlen <= 0 || hashbitlen > 256)
    return 0;
  else
    return 1;
}

int RequiredAlignment(void) {
  return 8;
}

static const vec V128 = CV(128);
static const vec V255 = CV(255);
static const vec V257 = CV(257);

static const short FFT64_Twiddle[] __attribute__ ((aligned)) = {
   1,    2,    4,    8,   16,   32,   64,  128,
   1,   60,    2,  120,    4,  -17,    8,  -34,
   1,  120,    8,  -68,   64,  -30,   -2,   17,
   1,   46,   60,  -67,    2,   92,  120,  123,
   1,   92,  -17,  -22,   32,  117,  -30,   67,
   1,  -67,  120,  -73,    8,  -22,  -68,  -70,
   1,  123,  -34,  -70,  128,   67,   17,   35,
  };

void fft64(short *a) {

  vec* A = (vec*) a;

  // DIF8

#define str(x) #x
#define REG(i) "%" str(i)
#define TMP(t) str(t)

#define SHIFT_0(out,in)                                 \
  "wmov " out ", " in "\n\t"

#define SHIFT_1(out,in)                                 \
  "wsllhg " out ", " in ", %[CG2]           \n\t"

#define SHIFT_2(out,in)                                 \
  "wsllhg " out ", " in ", %[CG4]           \n\t"

#define SHIFT_3(out,in)                                 \
  "wsllhg " out ", " in ", %[CG6]           \n\t"

#define SHIFT(out,in,n) SHIFT_##n (out,in)

#define BUTTERFLY(i,j,n)                                \
  "wsubh wr14, " REG(i) ", " REG(j) "       \n\t"       \
  "waddh " REG(i) ", " REG(j) ", " REG(i) " \n\t"       \
  SHIFT(REG(j),"wr14",n)

#define DO_REDUCE(i)                                    \
  "wand wr14, " REG(i) ", %[V255]           \n\t"       \
  "wsrahg " REG(i) ", " REG(i) ", %[CG8]    \n\t"       \
  "wsubh " REG(i) ", wr14, " REG(i) "       \n\t"

#define DO_REDUCE_FULL_S(i)                             \
  DO_REDUCE(i)                                          \
  "wcmpgtsh wr14, " REG(i) ", %[V128]        \n\t"      \
  "wand wr14, %[V257], wr14                  \n\t"      \
  "wsubh " REG(i)", " REG(i) ", wr14         \n\t"

  /* wcmpgt has a latency of 2, so we break it in two... */

#define DO_REDUCE_FULL_A(i,t)                           \
  "wand " TMP(t) ", " REG(i) ", %[V255]     \n\t"       \
  "wsrahg " REG(i) ", " REG(i) ", %[CG8]    \n\t"       \
  "wsubh " REG(i) ", " TMP(t) ", " REG(i) " \n\t"       \
  "wcmpgtsh " TMP(t) ", " REG(i) ", %[V128] \n\t"

#define DO_REDUCE_FULL_AA(i,t)                           \
  "wand " TMP(t) ", %[V257], " TMP(t) "     \n\t"       \
  "wsubh " REG(i)", " REG(i) ", " TMP(t) "  \n\t"

#define DO_REDUCE_FULL_Z(i,t)                           \
  DO_REDUCE_FULL_AA(i,t)				\
  "wmulsl " REG(i)", " REG(i) ", wr13       \n\t"

#define DO_REDUCE_FULL_B(i,t)                           \
  DO_REDUCE_FULL_Z(i,t)                                 \
  GET_TWIDDLE

#define TRANSPOSE(a,b,c,d)                              \
  "wunpckilh wr14, " REG(a) ", " REG(b) "   \n\t"       \
  "wunpckihh wr15, " REG(a) ", " REG(b) "   \n\t"       \
  "wunpckilh "REG(a)", "REG(c)", "REG(d)"   \n\t"       \
  "wunpckihh "REG(b)", "REG(c)", "REG(d)"   \n\t"       \
  "wunpckihh " REG(c) ", wr14, " REG(a) "   \n\t"       \
  "wunpckilh " REG(a) ", wr14, " REG(a) "   \n\t"       \
  "wunpckihh " REG(d) ", wr15, " REG(b) "   \n\t"       \
  "wunpckilh " REG(b) ", wr15, " REG(b) "   \n\t"


#define GET_TWIDDLE                                     \
  "wldrd wr13, [%[Twiddle]], #16           \n\t"

#define STORE(a,b,c,d,i)                                \
  "wstrd " REG(a) ", [%[A], #8*" #i "]     \n\t"        \
  "wstrd " REG(b) ", [%[A], #8*" #i "+32]  \n\t"        \
  "wstrd " REG(c) ", [%[A], #8*" #i "+64]  \n\t"        \
  "wstrd " REG(d) ", [%[A], #8*" #i "+96]  \n\t"        \

#define LOAD(a,b,c,d,i)                                 \
  "wldrd " REG(a) ", [%[A], #8*" #i "]     \n\t"        \
  "wldrd " REG(b) ", [%[A], #8*" #i "+32]  \n\t"        \
  "wldrd " REG(c) ", [%[A], #8*" #i "+64]  \n\t"        \
  "wldrd " REG(d) ", [%[A], #8*" #i "+96]  \n\t"        \

    void * unused_1;
    int u;

#define FFT_REG                                 \
             BUTTERFLY(0, 4, 0)                 \
             BUTTERFLY(1, 5, 1)                 \
             BUTTERFLY(2, 6, 2)                 \
             BUTTERFLY(3, 7, 3)                 \
                                                \
             DO_REDUCE(6)                       \
             DO_REDUCE(7)                       \
						\
             BUTTERFLY(0, 2, 0)                 \
             BUTTERFLY(4, 6, 0)                 \
             BUTTERFLY(1, 3, 2)                 \
             BUTTERFLY(5, 7, 2)                 \
                                                \
             DO_REDUCE(7)                       \
						\
             BUTTERFLY(0, 1, 0)                 \
             BUTTERFLY(2, 3, 0)                 \
             BUTTERFLY(4, 5, 0)                 \
             BUTTERFLY(6, 7, 0)                 \
                                                \
             GET_TWIDDLE                        \
             DO_REDUCE_FULL_A(1, wr14)          \
             DO_REDUCE_FULL_A(2, wr15)          \
             DO_REDUCE_FULL_B(1, wr14)          \
             DO_REDUCE_FULL_A(3, wr14)          \
             DO_REDUCE_FULL_B(2, wr15)          \
             DO_REDUCE_FULL_A(4, wr15)          \
             DO_REDUCE_FULL_B(3, wr14)          \
             DO_REDUCE_FULL_A(5, wr14)          \
             DO_REDUCE_FULL_B(4, wr15)          \
             DO_REDUCE_FULL_A(6, wr15)          \
             DO_REDUCE_FULL_B(5, wr14)          \
             DO_REDUCE_FULL_A(7, wr14)          \
             DO_REDUCE_FULL_B(6, wr15)          \
             DO_REDUCE_FULL_Z(7, wr14)          \
                                                \
             TRANSPOSE(0, 2, 4, 6)              \
             TRANSPOSE(1, 3, 5, 7)


    __asm__ (
             FFT_REG
             STORE(0, 2, 4, 6, 0)
             LOAD (0, 2, 4, 6, 1)
             "sub %[Twiddle], %[Twiddle], #104  \n\t"
             STORE(1, 3, 5, 7, 1)
             LOAD (1, 3, 5, 7, 3)
             FFT_REG
             : "=y" (A[ 2]), "=y" (A[ 3]), "=y" (A[ 6]), "=y" (A[ 7]),
               "=y" (A[10]), "=y" (A[11]), "=y" (A[14]), "=y" (A[15]),
               [Twiddle] "=r" (unused_1),   /* Incremented for each read   */
                /* Write by side effects: */
	       "=m"  (* (struct mem128*) A)
             :  "0" (A[ 0]),  "1" (A[ 2]),  "2" (A[ 4]),  "3" (A[ 6]),
                "4" (A[ 8]),  "5" (A[10]),  "6" (A[12]),  "7" (A[14]),
                [V255] "y" (V255), [V128] "y" (V128), [V257] "y" (V257),
                [CG2] "z" (2), [CG4] "z" (4), [CG6] "z" (6), [CG8] "z" (8),
                "[Twiddle]" (FFT64_Twiddle), [A] "r" (A),
                /* Read by side effects: */
/*                 "m"  (*(union cv (*)[7]) FFT64_Twiddle), */
                "m"  (*(vec (*)[64]) A)
             : "wr13",                      /* Used to store the twiddles  */
               "wr14", "wr15"               /* Used as temporary variables */
             );

#undef BUTTERFLY

#define BUTTERFLY(i,j,n)                                \
  SHIFT("wr14",REG(j),n)                                \
  "wsubh " REG(j) ", " REG(i) ", wr14       \n\t"       \
  "waddh " REG(i) ", " REG(i) ", wr14       \n\t"       \

  for (u=0; u<8; u+=VECTOR_SIZE) {
    A = (vec*)((char*)a+2*u);

    __asm__ (
             DO_REDUCE_FULL_A (0, wr15)          \
             DO_REDUCE_FULL_A (1, wr14)          \
             DO_REDUCE_FULL_AA(0, wr15)          \
             DO_REDUCE_FULL_A (2, wr15)          \
             DO_REDUCE_FULL_AA(1, wr14)          \
             DO_REDUCE_FULL_A (3, wr14)          \
             DO_REDUCE_FULL_AA(2, wr15)          \
             DO_REDUCE_FULL_A (4, wr15)          \
             DO_REDUCE_FULL_AA(3, wr14)          \
             DO_REDUCE_FULL_A (5, wr14)          \
             DO_REDUCE_FULL_AA(4, wr15)          \
             DO_REDUCE_FULL_A (6, wr15)          \
             DO_REDUCE_FULL_AA(5, wr14)          \
             DO_REDUCE_FULL_A (7, wr14)          \
             DO_REDUCE_FULL_AA(6, wr15)          \
             DO_REDUCE_FULL_AA(7, wr14)          \

             BUTTERFLY(0, 1, 0)
             BUTTERFLY(2, 3, 0)
             BUTTERFLY(4, 5, 0)
             BUTTERFLY(6, 7, 0)
             
             BUTTERFLY(0, 2, 0)
             BUTTERFLY(4, 6, 0)
             BUTTERFLY(1, 3, 2)
             BUTTERFLY(5, 7, 2)

             DO_REDUCE(7)

             BUTTERFLY(0, 4, 0)
             BUTTERFLY(1, 5, 1)
             BUTTERFLY(2, 6, 2)
             BUTTERFLY(3, 7, 3)
             
             DO_REDUCE_FULL_S(0)
             DO_REDUCE_FULL_S(1)
             DO_REDUCE_FULL_S(2)
             DO_REDUCE_FULL_S(3)
             DO_REDUCE_FULL_S(4)
             DO_REDUCE_FULL_S(5)
             DO_REDUCE_FULL_S(6)
             DO_REDUCE_FULL_S(7)
             
             : "+y" (A[ 0]), "+y" (A[ 2]), "+y" (A[ 4]), "+y" (A[ 6]),
               "+y" (A[ 8]), "+y" (A[10]), "+y" (A[12]), "+y" (A[14])
             :  [V255] "y" (V255), [V128] "y" (V128), [V257] "y" (V257),
                [CG2] "z" (2), [CG4] "z" (4), [CG6] "z" (6), [CG8] "z" (8)
             : "wr13",                      /* Used to store the twiddles  */
               "wr14", "wr15"               /* Used as temporary variables */
             );

  }

#undef BUTTERFLY

#undef X

}



void fft128(short *a, const unsigned char *x, int final) {

  static const short FFT128_Twiddle[] __attribute__ ((aligned)) =  {
      1, -118,   46,  -31,   60,  116,  -67,  -61,
      2,   21,   92,  -62,  120,  -25,  123, -122,
      4,   42,  -73, -124,  -17,  -50,  -11,   13,
      8,   84,  111,    9,  -34, -100,  -22,   26,
     16,  -89,  -35,   18,  -68,   57,  -44,   52,
     32,   79,  -70,   36,  121,  114,  -88,  104,
     64,  -99,  117,   72,  -15,  -29,   81,  -49,
    128,   59,  -23, -113,  -30,  -58,  -95,  -98,
  };

  static const vec Tweak =
    {0,0,0,1};
  static const vec FinalTweak =
    {0,1,0,1};

#define UNPACK_4(i)                                 \
  "wldrd wr0, [%[X], #8*"#i"  ]         \n\t"       \
  "wunpckehub wr1, wr0                  \n\t"       \
  "wstrd wr1, [%[Z], #16*"#i"+8 ]       \n\t"       \
  "wunpckelub wr0, wr0                  \n\t"       \
  "wldrd wr3, [%[Twiddle], #16*"#i"+8 ] \n\t"       \
  "wmulsl wr1, wr1, wr3                 \n\t"       \
  "wstrd wr0, [%[Z], #16*"#i"   ]       \n\t"       \
  "wand wr14, wr1, %[V255]              \n\t"       \
  "wldrd wr2, [%[Twiddle], #16*"#i"   ] \n\t"       \
  "wmulsl wr0, wr0, wr2                 \n\t"       \
  "wsrahg wr1, wr1, %[CG8]              \n\t"       \
  "wsubh wr1, wr14, wr1                 \n\t"	    \
  "wstrd wr1, [%[Z], #16*"#i"+128+8 ]   \n\t"       \
  "wand wr14, wr0, %[V255]              \n\t"       \
  "wsrahg wr0, wr0, %[CG8]              \n\t"       \
  "wsubh wr0, wr14, wr0                 \n\t"	    \
  "wstrd wr0, [%[Z], #16*"#i"+128   ]   \n\t"

#define UNPACK_TWEAK(i)                             \
  "wldrd wr0, [%[X], #8*"#i"  ]         \n\t"       \
  "wunpckehub wr1, wr0                  \n\t"       \
  "wldrd wr3, [%[Twiddle], #16*"#i"+8 ] \n\t"       \
  "waddh wr14, %[Tweak], wr1            \n\t"       \
  "wstrd wr14, [%[Z], #16*"#i"+8 ]      \n\t"       \
  "wsubh wr1, wr1, %[Tweak]             \n\t"       \
  "wmulsl wr1, wr1, wr3                 \n\t"       \
  "wunpckelub wr0, wr0                  \n\t"       \
  "wstrd wr0, [%[Z], #16*"#i"   ]       \n\t"       \
  "wand wr14, wr1, %[V255]              \n\t"       \
  "wldrd wr2, [%[Twiddle], #16*"#i"   ] \n\t"       \
  "wmulsl wr0, wr0, wr2                 \n\t"       \
  "wsrahg wr1, wr1, %[CG8]              \n\t"       \
  "wsubh wr1, wr14, wr1                 \n\t"	    \
  "wstrd wr1, [%[Z], #16*"#i"+128+8 ]   \n\t"       \
  "wand wr14, wr0, %[V255]              \n\t"       \
  "wsrahg wr0, wr0, %[CG8]              \n\t"       \
  "wsubh wr0, wr14, wr0                 \n\t"	    \
  "wstrd wr0, [%[Z], #16*"#i"+128   ]   \n\t"

  __asm__ (
           UNPACK_4(0)
           UNPACK_4(1)
           UNPACK_4(2)
           UNPACK_4(3)
           UNPACK_4(4)
           UNPACK_4(5)
           UNPACK_4(6)
           UNPACK_TWEAK(7)
           : /* Write by side effects: */
             "=m" (* (struct mem256*) a)
           : [Twiddle] "r" (FFT128_Twiddle), [X] "r" (x), [Z] "r" (a),
	   [Tweak] "y" (final? FinalTweak: Tweak),
           [V255] "y" (V255), [CG8] "z" (8),
             /* Read by side effects: */
/*              "m"  (*(short (*)[64]) TT), */
             "m"  (* (struct mem64*) x)
           : "wr0", "wr1", "wr2", "wr3", "wr14"
           );
  fft64(a);
  fft64(a+64);

  /* FIXME: reduce */
}

void rounds(u32* state, const unsigned char* msg, const short *fft) {
  
  vec* S = (vec*) state;

  /*
   * Boolean functions:
   * Use wr14 as scratch, and output in wr15
   */

#define F_0(B, C, D)				        \
  "wxor wr15, " REG(C) ", " REG(D) "         \n\t"	\
  "wand wr15, wr15, " REG(B) "               \n\t"	\
  "wxor wr15, wr15, " REG(D) "               \n\t"
  
#define F_1(B, C, D)				        \
  "wand wr15, " REG(C) ", " REG(D) "         \n\t"	\
  "wor  wr14, " REG(C) ", " REG(D) "         \n\t"	\
  "wand wr14, wr14, " REG(B) "               \n\t"	\
  "wor  wr15, wr14, wr15                     \n\t"

#define F(a,b,c,fun,rnd) FR_##rnd (a,b,c,fun)

#define FR_0(a,b,c,fun) F_##fun (a,b,c)
#define FR_1(a,b,c,fun) F_##fun (8,b,c)
#define FR_2(a,b,c,fun) F_##fun (a,b,c)
#define FR_3(a,b,c,fun) F_##fun (8,b,c)

#define MREG0 "wr13"
#define MREG1 "wr12"
#define MREG2 "wr13"
#define MREG3 "wr12"

#define GET_MESSAGE(m0, m1)				\
  "wldrd wr14, [%[fft],#8*" #m0 "]           \n\t"	\
  "wldrd wr13, [%[fft],#8*" #m1 "]           \n\t"	\
  "wunpckihh wr12, wr14, wr13                \n\t"	\
  "wunpckilh wr13, wr14, wr13                \n\t"

#define ROTATE_ADD(a,b,c,d,aa,i,r)			\
  ROTATE_##i(a,b,c,d,aa,r)				\
  ADD_##i(a,b,c,d,aa)

#define ROTATE_0(a,b,c,d,aa,r)				\
  "wmov   " REG(8) ", " REG(aa) "            \n\t"	\
  "wrorwg " REG(a) ", " REG(a) ", %[CG" r "] \n\t"	\
  "wrorwg " REG(aa)", " REG(aa)", %[CG" r "] \n\t"	\

#define ROTATE_2(a,b,c,d,aa,r)				\
  ROTATE_0(a,b,c,d,aa,r)

#define ROTATE_1(a,b,c,d,aa,r)
#define ROTATE_3(a,b,c,d,aa,r)

#define ADD_0(a,b,c,d,aa)				\
  "waligni wr13, " REG(a) ", " REG(aa) ", #4 \n\t"      \
  "waddw " REG(d) ", wr15, wr13              \n\t"
  
#define ADD_2(a,b,c,d,aa)				\
  "waddw " REG(d) ", wr15, " REG(aa) "       \n\t"

#define ADD_1(a,b,c,d,aa) ADD_0(a,b,c,d,aa)
#define ADD_3(a,b,c,d,aa) ADD_2(a,b,c,d,aa)

  /*
   * Step:
   * Takes the message in wr13, and the output of F in wr15
   */

#define STEP(a,b,c,d,aa,i,r,s)				\
  "waddw wr15, wr15, " REG(d) "              \n\t"      \
  "waddw wr15, wr15, wr13                    \n\t"      \
  "wrorwg wr15, wr15, %[CG" s "]             \n\t"	\
  ROTATE_ADD(a,b,c,d,aa,i,r)				\

#define STEP_MESSAGE(a,b,c,d,aa,i,j,r,s)	        \
  F(a,b,c,j,i)						\
  "wmulsl wr13, " MREG##i ", %[CodeMul]      \n\t"      \
  STEP(a,b,c,d,aa,i,r,s)

#define ROUND(j,   m0, m1, m2, m3, m4, m5, m6, m7)	\
  GET_MESSAGE(m0, m1)					\
  STEP_MESSAGE(0, 2, 4, 6, 1, 0, j, "a", "b")		\
  STEP_MESSAGE(1, 3, 5, 7, 0, 1, j, "a", "b")		\
  GET_MESSAGE(m2, m3)					\
  STEP_MESSAGE(6, 0, 2, 4, 7, 2, j, "b", "c")		\
  STEP_MESSAGE(7, 1, 3, 5, 6, 3, j, "b", "c")		\
  GET_MESSAGE(m4, m5)					\
  STEP_MESSAGE(4, 6, 0, 2, 5, 0, j, "c", "d")		\
  STEP_MESSAGE(5, 7, 1, 3, 4, 1, j, "c", "d")		\
  GET_MESSAGE(m6, m7)					\
  STEP_MESSAGE(2, 4, 6, 0, 3, 2, j, "d", "a")		\
  STEP_MESSAGE(3, 5, 7, 1, 2, 3, j, "d", "a")

#define STEP_FF(a,b,c,d,aa,i,j,r,s)			\
  "wldrd wr13, [%[state]],#8                   \n\t"	\
  F(a,b,c,0,i)						\
  STEP(a,b,c,d,aa,i,r,s)
  
#define FEED_FORWARD					\
  STEP_FF(0, 2, 4, 6, 1, 0, 0, "a", "b")		\
  STEP_FF(1, 3, 5, 7, 0, 1, 1, "a", "b")		\
  STEP_FF(6, 0, 2, 4, 7, 2, 2, "b", "c")		\
  STEP_FF(7, 1, 3, 5, 6, 3, 3, "b", "c")		\
  STEP_FF(4, 6, 0, 2, 5, 0, 4, "c", "d")		\
  STEP_FF(5, 7, 1, 3, 4, 1, 5, "c", "d")		\
  STEP_FF(2, 4, 6, 0, 3, 2, 6, "d", "a")		\
  STEP_FF(3, 5, 7, 1, 2, 3, 7, "d", "a")

#define LOAD_ROT(a,b,c,d)				\
  "mov  %[tmp], #32-" #a "                   \n\t"	\
  "tmcr %[CGa], %[tmp]                       \n\t"	\
  "mov  %[tmp], #32-" #b "                   \n\t"	\
  "tmcr %[CGb], %[tmp]                       \n\t"	\
  "mov  %[tmp], #32-" #c "                   \n\t"	\
  "tmcr %[CGc], %[tmp]                       \n\t"	\
  "mov  %[tmp], #32-" #d "                   \n\t"	\
  "tmcr %[CGd], %[tmp]                       \n\t"

  vec unused_1; // , unused_2;
  vec codemul;
  int tmp;

  __asm__ (
	   "mov  %[tmp], #185                \n\t"
	   "tbcsth %[CodeMul], %[tmp]        \n\t"
	   "wldrd wr13, [%[msg]], #8         \n\t"
	   "wldrd wr14, [%[state]], #8       \n\t"
	   "wxor " REG(0) ", wr13, wr14      \n\t"
	   "wldrd wr13, [%[msg]], #8         \n\t"
	   "wldrd wr14, [%[state]], #8       \n\t"
	   "wxor " REG(1) ", wr13, wr14      \n\t"
	   "wldrd wr13, [%[msg]], #8         \n\t"
	   "wldrd wr14, [%[state]], #8       \n\t"
	   "wxor " REG(2) ", wr13, wr14      \n\t"
	   "wldrd wr13, [%[msg]], #8         \n\t"
	   "wldrd wr14, [%[state]], #8       \n\t"
	   "wxor " REG(3) ", wr13, wr14      \n\t"
	   "wldrd wr13, [%[msg]], #8         \n\t"
	   "wldrd wr14, [%[state]], #8       \n\t"
	   "wxor " REG(4) ", wr13, wr14      \n\t"
	   "wldrd wr13, [%[msg]], #8         \n\t"
	   "wldrd wr14, [%[state]], #8       \n\t"
	   "wxor " REG(5) ", wr13, wr14      \n\t"
	   "wldrd wr13, [%[msg]], #8         \n\t"
	   "wldrd wr14, [%[state]], #8       \n\t"
	   "wxor " REG(6) ", wr13, wr14      \n\t"
	   "wldrd wr13, [%[msg]], #8         \n\t"
	   "wldrd wr14, [%[state]], #8       \n\t"
	   "wxor " REG(7) ", wr13, wr14      \n\t"
	   "add %[state], %[state], #-64     \n\t"
	   LOAD_ROT(3,20,14,27)
           ROUND(0,   4, 20, 6, 22, 0, 16, 2, 18)
           ROUND(1,   7, 23, 5, 21, 3, 19, 1, 17)
	   LOAD_ROT(26,4,23,11)
           ROUND(0,   15, 31, 11, 27, 12, 28, 8, 24)
           ROUND(1,   9, 25, 13, 29, 10, 26, 14, 30)
	   LOAD_ROT(19,28,7,22)
	   "mov  %[tmp], #233                \n\t"
	   "tbcsth %[CodeMul], %[tmp]        \n\t"
           ROUND(0,   1, 9, 2, 10, 7, 15, 4, 12)
           ROUND(1,   6, 14, 5, 13, 0, 8, 3, 11)
	   LOAD_ROT(15,5,29,9)
           ROUND(0,   22, 30, 16, 24, 17, 25, 23, 31)
           ROUND(1,   19, 27, 21, 29, 20, 28, 18, 26)
	   FEED_FORWARD
           : "=y" (S[0]), "=y" (S[1]), "=y" (S[2]), "=y" (S[3]),
             "=y" (S[4]), "=y" (S[5]), "=y" (S[6]), "=y" (S[7]),
	     "=y" (unused_1), // "=y" (unused_2),
	     [tmp] "=r" (tmp),
	     [CodeMul] "=y" (codemul),
             /* Warning: avoid input/output overlap */
             [msg] "+r" (msg), [fft] "+r" (fft), [state] "+r" (state)
           : [CGa] "z" (3), [CGb] "z" (7), [CGc] "z" (11), [CGd] "z" (19),
	     /* Read by side effects: */
	     "m"  (* (struct mem256*) fft)
           : "wr12", "wr13", "wr14", "wr15"
           );
}


void SIMD_Compress(hashState * state, const unsigned char *m, int final) {
  union cv Y[32];
  short* y = (short*) Y[0].u16;

  fft128(y, m, final);
  rounds(state->A, m, y);
}
