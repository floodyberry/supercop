#ifndef MIRACL_H
#define MIRACL_H

/*
 *   main MIRACL header - miracl.h.
 *
 *   Copyright (c) 1988-2001 Shamus Software Ltd.
 */

#include "mirdef.h"

/* Some modifiable defaults... */

/* Use a smaller buffer if space is limited, don't be so wasteful! */

#ifdef MR_STATIC
#define MR_DEFAULT_BUFFER_SIZE 512
#else
#define MR_DEFAULT_BUFFER_SIZE 1024
#endif
/* see mrecgf2m.c */
#define MR_KARATSUBA 2

#ifdef MR_KCM
  #ifdef MR_FLASH
    #define MR_SPACES 31
  #else
    #define MR_SPACES 30
  #endif
#else
  #ifdef MR_FLASH
    #define MR_SPACES 29
  #else
    #define MR_SPACES 28
  #endif
#endif

/* size of bigs and elliptic curve points for memory allocation from stack or heap */

#define MR_ROUNDUP(a,b) ((a)-1)/(b)+1

#define MR_SL sizeof(long)


#define MR_ESIZE_A (((sizeof(epoint)+MR_BIG_RESERVE(2))-1)/MR_SL+1)*MR_SL
#define MR_ECP_RESERVE_A(n) ((n)*MR_ESIZE_A+MR_SL)

#ifdef MR_STATIC
#define MR_SIZE (((sizeof(struct bigtype)+(MR_STATIC+2)*sizeof(mr_utype))-1)/MR_SL+1)*MR_SL
#define MR_BIG_RESERVE(n) ((n)*MR_SIZE+MR_SL)

#ifdef MR_AFFINE_ONLY
#define MR_ESIZE (((sizeof(epoint)+MR_BIG_RESERVE(2))-1)/MR_SL+1)*MR_SL
#else
#define MR_ESIZE (((sizeof(epoint)+MR_BIG_RESERVE(3))-1)/MR_SL+1)*MR_SL
#endif
#define MR_ECP_RESERVE(n) ((n)*MR_ESIZE+MR_SL)
#endif

/* useful macro to convert size of big in words, to size of required structure */

#define mr_size(n) (((sizeof(struct bigtype)+((n)+2)*sizeof(mr_utype))-1)/MR_SL+1)*MR_SL
#define mr_big_reserve(n,m) ((n)*mr_size(m)+MR_SL)

#define mr_esize_a(n) (((sizeof(epoint)+mr_big_reserve(2,(n)))-1)/MR_SL+1)*MR_SL 
#define mr_ecp_reserve_a(n,m) ((n)*mr_esize_a(m)+MR_SL)

#ifdef MR_AFFINE_ONLY
#define mr_esize(n) (((sizeof(epoint)+mr_big_reserve(2,(n)))-1)/MR_SL+1)*MR_SL 
#else
#define mr_esize(n) (((sizeof(epoint)+mr_big_reserve(3,(n)))-1)/MR_SL+1)*MR_SL 
#endif
#define mr_ecp_reserve(n,m) ((n)*mr_esize(m)+MR_SL)


/* if basic library is static, make sure and use static C++ */

#ifdef MR_STATIC
 #ifndef BIGS
  #define BIGS MR_STATIC
 #endif
 #ifndef ZZNS
  #define ZZNS MR_STATIC
 #endif
 #ifndef GF2MS
  #define GF2MS MR_STATIC
 #endif
#endif

#ifdef __ia64__
#if MIRACL==64
#define MR_ITANIUM
#include <ia64intrin.h>
#endif
#endif

#ifdef MR_FP
#include <math.h>
#endif

#ifndef MR_NO_FILE_IO
#include <stdio.h>
#endif
               /* error returns */

#define MR_ERR_BASE_TOO_BIG       1
#define MR_ERR_DIV_BY_ZERO        2
#define MR_ERR_OVERFLOW           3
#define MR_ERR_NEG_RESULT         4
#define MR_ERR_BAD_FORMAT         5
#define MR_ERR_BAD_BASE           6
#define MR_ERR_BAD_PARAMETERS     7
#define MR_ERR_OUT_OF_MEMORY      8
#define MR_ERR_NEG_ROOT           9
#define MR_ERR_NEG_POWER         10
#define MR_ERR_BAD_ROOT          11
#define MR_ERR_INT_OP            12
#define MR_ERR_FLASH_OVERFLOW    13
#define MR_ERR_TOO_BIG           14
#define MR_ERR_NEG_LOG           15
#define MR_ERR_DOUBLE_FAIL       16
#define MR_ERR_IO_OVERFLOW       17
#define MR_ERR_NO_MIRSYS         18
#define MR_ERR_BAD_MODULUS       19
#define MR_ERR_NO_MODULUS        20
#define MR_ERR_EXP_TOO_BIG       21
#define MR_ERR_NOT_SUPPORTED     22
#define MR_ERR_NOT_DOUBLE_LEN    23
#define MR_ERR_NOT_IRREDUC       24
#define MR_ERR_NO_ROUNDING       25
#define MR_ERR_NOT_BINARY        26
#define MR_ERR_NO_BASIS          27
#define MR_ERR_COMPOSITE_MODULUS 28

               /* some useful definitions */

#define forever for(;;)   

#define mr_abs(x)  ((x)<0? (-(x)) : (x))

#ifndef TRUE
  #define TRUE 1
#endif
#ifndef FALSE
  #define FALSE 0
#endif

#define OFF 0
#define ON 1
#define PLUS 1
#define MINUS (-1)

#define MR_MAXDEPTH 24
                              /* max routine stack depth */
/* big and flash variables consist of an encoded length, *
 * and an array of mr_smalls containing the digits       */

typedef int BOOL;

#define MR_BYTE unsigned char

#ifdef MR_BITSINCHAR
 #if MR_BITSINCHAR == 8
  #define MR_TOBYTE(x) ((MR_BYTE)(x))
 #else
  #define MR_TOBYTE(x) ((MR_BYTE)((x)&0xFF))
 #endif
#else
 #define MR_TOBYTE(x) ((MR_BYTE)(x))
#endif

#ifdef MR_FP

  typedef mr_utype mr_small;
  #ifdef mr_dltype
  typedef mr_dltype mr_large;
  #endif

  #define MR_DIV(a,b)    (modf((a)/(b),&dres),dres)

  #ifdef MR_FP_ROUNDING

/* slightly dicey - for example the optimizer might remove the MAGIC ! */

    #define MR_LROUND(a)   ( ( (a) + MR_MAGIC ) - MR_MAGIC )
  #else
    #define MR_LROUND(a)   (modfl((a),&ldres),ldres)
  #endif

  #define MR_REMAIN(a,b) ((a)-(b)*MR_DIV((a),(b)))

#else

  typedef unsigned mr_utype mr_small;
  #ifdef mr_dltype
    typedef unsigned mr_dltype mr_large;
  #endif

  #define MR_DIV(a,b)    ((a)/(b))
  #define MR_REMAIN(a,b) ((a)%(b))
  #define MR_LROUND(a)   ((a))
#endif

struct bigtype
{
    mr_unsign32 len;
    mr_small *w;
};                

typedef struct bigtype *big;
typedef big zzn;

typedef big flash;

#define MR_MSBIT ((mr_unsign32)1<<31)
#define MR_OBITS (MR_MSBIT-1)

#if MIRACL >= MR_IBITS
#define MR_TOOBIG (1<<(MR_IBITS-2))
#else
#define MR_TOOBIG (1<<(MIRACL-1))
#endif

#ifdef  MR_FLASH
#define MR_EBITS (8*sizeof(double) - MR_FLASH)
                                  /* no of Bits per double exponent */
#define MR_BTS 16
#define MR_MSK 0xFFFF

#endif

#define MR_HASH_BYTES     20

/* Marsaglia & Zaman Random number generator */
/*         constants      alternatives       */
#define NK   37           /* 21 */
#define NJ   24           /*  6 */
#define NV   14           /*  8 */

#ifdef mr_dltype

#ifdef MR_LITTLE_ENDIAN 
#define MR_BOT 0
#define MR_TOP 1
#endif
#ifdef MR_BIG_ENDIAN
#define MR_BOT 1
#define MR_TOP 0
#endif

union doubleword
{
    mr_large d;
    mr_small h[2];
};

#endif

/* chinese remainder theorem structures */

typedef struct {
big *C;
big *V;
big *M;
int NP;
} big_chinese;

typedef struct {
mr_utype *C;
mr_utype *V;
mr_utype *M;
int NP;
} small_chinese;

/* Cryptographically strong pseudo-random number generator */

typedef struct {
mr_unsign32 ira[NK];  /* random number...   */
int         rndptr;   /* ...array & pointer */
mr_unsign32 borrow;
int pool_ptr;
char pool[MR_HASH_BYTES];    /* random pool */
} csprng;

/* secure hash Algorithm structure */

typedef struct {
mr_unsign32 length[2];
mr_unsign32 h[8];
mr_unsign32 w[80];
} sha256;

typedef sha256 sha;

#ifdef mr_unsign64

typedef struct {
mr_unsign64 length[2];
mr_unsign64 h[8];
mr_unsign64 w[80];
} sha512;

typedef sha512 sha384;

#endif

/* Symmetric Encryption algorithm structure */

#define MR_ECB   0
#define MR_CBC   1
#define MR_CFB1  2
#define MR_CFB2  3
#define MR_CFB4  5
#define MR_PCFB1 10
#define MR_PCFB2 11
#define MR_PCFB4 13
#define MR_OFB1  14
#define MR_OFB2  15
#define MR_OFB4  17
#define MR_OFB8  21
#define MR_OFB16 29

typedef struct {
int Nk,Nr;
int mode;
mr_unsign32 fkey[60];
mr_unsign32 rkey[60];
char f[16];
} aes;

               /* Elliptic curve point status */

#define MR_EPOINT_GENERAL    0
#define MR_EPOINT_NORMALIZED 1
#define MR_EPOINT_INFINITY   2

#define MR_NOTSET     0
#define MR_PROJECTIVE 0
#define MR_AFFINE     1
#define MR_BEST       2
#define MR_TWIST      8

/* Elliptic Curve epoint structure. Uses projective (X,Y,Z) co-ordinates */

typedef struct {
int marker;
big X;
big Y;
#ifndef MR_AFFINE_ONLY
big Z;
#endif
} epoint;


/* Structure for Comb method for finite *
   field exponentiation with precomputation */

typedef struct {
#ifdef MR_STATIC
    const mr_small *table;
#else
    mr_small *table;
#endif
    big n; 
    int window;
    int max;
} brick;

/* Structure for Comb method for elliptic *
   curve exponentiation with precomputation  */

typedef struct {
#ifdef MR_STATIC
    const mr_small *table; 
#else
    mr_small *table;
#endif
    big a,b,n;
    int window;
    int max;
} ebrick;

typedef struct {
#ifdef MR_STATIC
    const mr_small *table;
#else
    mr_small *table;
#endif
    big a6,a2;
    int m,a,b,c;
    int window;
    int max;
} ebrick2;

typedef struct
{
    big a;
    big b;
} zzn2;

/* main MIRACL instance structure */

/* ------------------------------------------------------------------------*/

typedef struct {
mr_small base;       /* number base     */
mr_small base_mask;
mr_small apbase;     /* apparent base   */
int   pack;          /* packing density */
int   lg2b;          /* bits in base    */
mr_small base2;      /* 2^mr_lg2b          */
BOOL (*user)(void);  /* pointer to user supplied function */

int   nib;           /* length of bigs  */
#ifndef MR_STRIPPED_DOWN
int   depth;                 /* error tracing ..*/
int   trace[MR_MAXDEPTH];    /* .. mechanism    */
#endif
BOOL  check;         /* overflow check  */
BOOL  fout;          /* Output to file   */
BOOL  fin;           /* Input from file  */
BOOL  active;

#ifndef MR_NO_FILE_IO

FILE  *infile;       /* Input file       */
FILE  *otfile;       /* Output file      */

#endif

mr_unsign32 ira[NK];  /* random number...   */
int         rndptr;   /* ...array & pointer */
mr_unsign32 borrow;

            /* Montgomery constants */
mr_small ndash;
big modulus;
big pR;
BOOL ACTIVE;
BOOL MONTY;

                       /* Elliptic Curve details   */
BOOL SS;               /* True for Super-Singular  */
#ifndef MR_NOKOBLITZ
BOOL KOBLITZ;          /* True for a Koblitz curve */
#endif
#ifndef MR_AFFINE_ONLY
int coord;
#endif
int Asize,Bsize;

int M,AA,BB,CC;     /* for GF(2^m) curves */

/*
mr_small pm,mask;
int e,k,Me,m;       for GF(p^m) curves */


#ifndef MR_STATIC

int logN;           /* constants for fast fourier fft multiplication */
int nprimes,degree;
mr_utype *prime,*cr;
mr_utype *inverse,**roots;
small_chinese chin;
mr_utype const1,const2,const3;
mr_small msw,lsw;
mr_utype **s1,**s2;   /* pre-computed tables for polynomial reduction */
mr_utype **t;         /* workspace */
mr_utype *wa;
mr_utype *wb;
mr_utype *wc;

#endif

BOOL same;
BOOL first_one;
BOOL debug;

big w0;            /* workspace bigs  */
big w1,w2,w3,w4;
big w5,w6,w7;
big w8,w9,w10,w11;
big w12,w13,w14,w15;
big w16,w17;
big sru;

#ifdef MR_KCM
big big_ndash;
big ws;
#endif

big A,B;

/* User modifiables */

int  IOBSIZ;       /* size of i/o buffer */
BOOL ERCON;        /* error control   */
int  ERNUM;        /* last error code */
int  NTRY;         /* no. of tries for probablistic primality testing   */
int  IOBASE;       /* base for input and output */
BOOL EXACT;        /* exact flag      */
BOOL RPOINT;       /* =ON for radix point, =OFF for fractions in output */
BOOL TRACER;       /* turns trace tracker on/off */
int  INPLEN;       /* input length               */

#ifdef MR_STATIC
const int *PRIMES;                      /* small primes array         */
char IOBUFF[MR_DEFAULT_BUFFER_SIZE];   /* i/o buffer    */
#else
int *PRIMES;        /* small primes array         */
char *IOBUFF;       /* i/o buffer    */
#endif

#ifdef MR_FLASH
int   workprec;
int   stprec;        /* start precision */

int RS,RD;
double D;

double db,n,p;
int a,b,c,d,r,q,oldn,ndig;
mr_small u,v,ku,kv;

BOOL last,carryon;
flash pi;

#endif

#ifdef MR_FP_ROUNDING
mr_large inverse_base;
#endif

#ifndef MR_STATIC
char *workspace;
#else
char workspace[MR_BIG_RESERVE(MR_SPACES)];
#endif

BOOL TWIST; /* set to twisted curve */
int qnr;    /* a QNR -1 for p=3 mod 4, -2 for p=5 mod 8, 0 otherwise */
int cnr;    /* a cubic non-residue */
int pmod8;

} miracl;

/* ------------------------------------------------------------------------*/


#ifndef MR_GENERIC_MT

#ifdef MR_WINDOWS_MT
#define MR_OS_THREADS
#endif

#ifdef MR_UNIX_MT
#define MR_OS_THREADS
#endif

#ifndef MR_OS_THREADS

extern miracl *mr_mip;  /* pointer to MIRACL's only global variable */

#endif

#endif

#ifdef MR_GENERIC_MT

#define _MIPT_  miracl *,
#define _MIPTO_ miracl *
#define _MIPD_  miracl *mr_mip,
#define _MIPDO_ miracl *mr_mip
#define _MIPP_  mr_mip,
#define _MIPPO_ mr_mip

#else

#define _MIPT_    
#define _MIPTO_  void  
#define _MIPD_    
#define _MIPDO_  void  
#define _MIPP_    
#define _MIPPO_    

#endif

/* Preamble and exit code for MIRACL routines. *
 * Not used if MR_STRIPPED_DOWN is defined     */ 

#ifdef MR_STRIPPED_DOWN
#define MR_OUT
#define MR_IN(N)
#else
#define MR_OUT  mr_mip->depth--;        
#define MR_IN(N) mr_mip->depth++; if (mr_mip->depth<MR_MAXDEPTH) {mr_mip->trace[mr_mip->depth]=(N); if (mr_mip->TRACER) mr_track(_MIPPO_); }
#endif

/* Function definitions  */

/* Group 0 - Internal routines */

extern void  mr_berror(_MIPT_ int);
extern mr_small mr_shiftbits(mr_small,int);
extern mr_small mr_setbase(_MIPT_ mr_small);
extern void  mr_track(_MIPTO_ );
extern void  mr_lzero(big);
extern BOOL  mr_notint(flash);
extern int   mr_lent(flash);
extern void  mr_padd(_MIPT_ big,big,big);
extern void  mr_psub(_MIPT_ big,big,big);
extern void  mr_pmul(_MIPT_ big,mr_small,big);
#ifdef MR_FP_ROUNDING
extern mr_large mr_invert(mr_small);
extern mr_small imuldiv(mr_small,mr_small,mr_small,mr_small,mr_large,mr_small *);
extern mr_small mr_sdiv(_MIPT_ big,mr_small,mr_large,big);
#else
extern mr_small mr_sdiv(_MIPT_ big,mr_small,big);
#endif
extern void  mr_shift(_MIPT_ big,int,big); 
extern miracl *mr_first_alloc(void);
extern void  *mr_alloc(_MIPT_ int,int);
extern void  mr_free(void *);  
extern void  set_user_function(_MIPT_ BOOL (*)(void));
extern void  set_io_buffer_size(_MIPT_ int);
extern int   mr_testbit(_MIPT_ big,int);
extern int   recode(_MIPT_ big ,int ,int ,int );
extern int   mr_window(_MIPT_ big,int,int *,int *);
extern int   mr_window2(_MIPT_ big,big,int,int *,int *);
extern int   mr_naf_window(_MIPT_ big,big,int,int *,int *);

extern int   mr_fft_init(_MIPT_ int,big,big,BOOL);
extern void  mr_dif_fft(_MIPT_ int,int,mr_utype *);
extern void  mr_dit_fft(_MIPT_ int,int,mr_utype *);
extern void  fft_reset(_MIPTO_);

extern int   mr_poly_mul(_MIPT_ int,big*,int,big*,big*);
extern int   mr_poly_sqr(_MIPT_ int,big*,big*);
extern void  mr_polymod_set(_MIPT_ int,big*,big*);
extern int   mr_poly_rem(_MIPT_ int,big *,big *);

extern int   mr_ps_big_mul(_MIPT_ int,big *,big *,big *);
extern int   mr_ps_zzn_mul(_MIPT_ int,big *,big *,big *);

extern mr_small muldiv(mr_small,mr_small,mr_small,mr_small,mr_small *);
extern mr_small muldvm(mr_small,mr_small,mr_small,mr_small *); 
extern mr_small muldvd(mr_small,mr_small,mr_small,mr_small *); 
extern void     muldvd2(mr_small,mr_small,mr_small *,mr_small *); 

extern flash mirvar_mem_variable(char *,int,int);
extern epoint* epoint_init_mem_variable(_MIPT_ char *,int,int);

/* Group 1 - General purpose, I/O and basic arithmetic routines  */

extern unsigned int   igcd(unsigned int,unsigned int); 
extern mr_small sgcd(mr_small,mr_small);
extern unsigned int   isqrt(unsigned int,unsigned int);
extern void  irand(_MIPT_ mr_unsign32);
extern mr_small brand(_MIPTO_ );       
extern void  zero(flash);
extern void  convert(_MIPT_ int,big);
extern void  uconvert(_MIPT_ unsigned int,big);
extern void  lgconv(_MIPT_ long,big);

#ifdef mr_dltype
extern void  dlconv(_MIPT_ mr_dltype,big);
#endif

extern flash mirvar(_MIPT_ int);
extern flash mirvar_mem(_MIPT_ char *,int);
extern void  mirkill(big);
extern void  *memalloc(_MIPT_ int);
extern void  memkill(_MIPT_ char *,int);
extern void  mr_init_threading(void);
extern void  mr_end_threading(void);
extern miracl *get_mip(_MIPTO_ );
#ifdef MR_STATIC
extern miracl *mirsys(miracl *,int,mr_small);
#else
extern miracl *mirsys(_MIPT_ int,mr_small);
#endif
extern void  mirexit(_MIPTO_ );
extern int   exsign(flash);
extern void  insign(int,flash);
extern int   getdig(_MIPT_ big,int);  
extern int   numdig(_MIPT_ big);        
extern void  putdig(_MIPT_ int,big,int);
extern void  copy(flash,flash);  
extern void  negify(flash,flash);
extern void  absol(flash,flash); 
extern int   size(big);
extern int   compare(big,big);
extern void  add(_MIPT_ big,big,big);
extern void  subtract(_MIPT_ big,big,big);
extern void  incr(_MIPT_ big,int,big);    
extern void  decr(_MIPT_ big,int,big);    
extern void  premult(_MIPT_ big,int,big); 
extern int   subdiv(_MIPT_ big,int,big);  
extern BOOL  subdivisible(_MIPT_ big,int);
extern int   remain(_MIPT_ big,int);   
extern void  bytes_to_big(_MIPT_ int,char *,big);
extern int   big_to_bytes(_MIPT_ int,big,char *,BOOL);
extern mr_small normalise(_MIPT_ big,big);
extern void  multiply(_MIPT_ big,big,big);
extern void  fft_mult(_MIPT_ big,big,big);
extern BOOL  fastmultop(_MIPT_ int,big,big,big);
extern void  divide(_MIPT_ big,big,big);  
extern BOOL  divisible(_MIPT_ big,big);   
extern void  mad(_MIPT_ big,big,big,big,big,big);
extern int   instr(_MIPT_ flash,char *);
extern int   otstr(_MIPT_ flash,char *);
extern int   cinstr(_MIPT_ flash,char *);
extern int   cotstr(_MIPT_ flash,char *);
extern epoint* epoint_init(_MIPTO_ );
extern epoint* epoint_init_mem(_MIPT_ char *,int);
extern void* ecp_memalloc(_MIPT_ int);
void ecp_memkill(_MIPT_ char *,int);
BOOL init_big_from_rom(big,int,const mr_small *,int ,int *);
BOOL init_point_from_rom(epoint *,int,const mr_small *,int,int *);

#ifndef MR_NO_FILE_IO

extern int   innum(_MIPT_ flash,FILE *);          
extern int   otnum(_MIPT_ flash,FILE *);
extern int   cinnum(_MIPT_ flash,FILE *);
extern int   cotnum(_MIPT_ flash,FILE *);

#endif

/* Group 2 - Advanced arithmetic routines */

extern mr_small smul(mr_small,mr_small,mr_small);
extern mr_small spmd(mr_small,mr_small,mr_small); 
extern mr_small invers(mr_small,mr_small);
extern mr_small sqrmp(mr_small,mr_small);
extern int      jac(mr_small,mr_small);

extern void  gprime(_MIPT_ int);
extern int   jack(_MIPT_ big,big);
extern int   egcd(_MIPT_ big,big,big);
extern int   xgcd(_MIPT_ big,big,big,big,big);
extern int   logb2(_MIPT_ big);
extern int   hamming(_MIPT_ big);
extern void  expb2(_MIPT_ int,big);
extern void  bigbits(_MIPT_ int,big);
extern void  expint(_MIPT_ int,int,big);
extern void  sftbit(_MIPT_ big,int,big);
extern void  power(_MIPT_ big,long,big,big);
extern void  powmod(_MIPT_ big,big,big,big);
extern void  powmod2(_MIPT_ big,big,big,big,big,big);
extern void  powmodn(_MIPT_ int,big *,big *,big,big);
extern int   powltr(_MIPT_ int,big,big,big);
extern BOOL  double_inverse(_MIPT_ big,big,big,big,big);
extern BOOL  multi_inverse(_MIPT_ int,big*,big,big*);
extern void  lucas(_MIPT_ big,big,big,big,big);
extern BOOL  nroot(_MIPT_ big,int,big);
extern BOOL  sqroot(_MIPT_ big,big,big);
extern void  bigrand(_MIPT_ big,big);
extern void  bigdig(_MIPT_ int,int,big);
extern int   trial_division(_MIPT_ big,big);
extern BOOL  isprime(_MIPT_ big);
extern BOOL  nxprime(_MIPT_ big,big);
extern BOOL  nxsafeprime(_MIPT_ int,int,big,big);
extern BOOL  crt_init(_MIPT_ big_chinese *,int,big *);
extern void  crt(_MIPT_ big_chinese *,big *,big);
extern void  crt_end(big_chinese *);
extern BOOL  scrt_init(_MIPT_ small_chinese *,int,mr_utype *);    
extern void  scrt(_MIPT_ small_chinese*,mr_utype *,big); 
extern void  scrt_end(small_chinese *);
#ifndef MR_STATIC
extern BOOL  brick_init(_MIPT_ brick *,big,big,int,int);
extern void  brick_end(brick *);
#else
extern void  brick_init(brick *,const mr_small *,big,int,int);
#endif
extern void  pow_brick(_MIPT_ brick *,big,big);
#ifndef MR_STATIC
extern BOOL  ebrick_init(_MIPT_ ebrick *,big,big,big,big,big,int,int);
extern void  ebrick_end(ebrick *);
#else
extern void  ebrick_init(ebrick *,const mr_small *,big,big,big,int,int);
#endif
extern int   mul_brick(_MIPT_ ebrick*,big,big,big);
#ifndef MR_STATIC
extern BOOL  ebrick2_init(_MIPT_ ebrick2 *,big,big,big,big,int,int,int,int,int,int);
extern void  ebrick2_end(ebrick2 *);
#else
extern void  ebrick2_init(ebrick2 *,const mr_small *,big,big,int,int,int,int,int,int);
#endif
extern int   mul2_brick(_MIPT_ ebrick2*,big,big,big);

/* Montgomery stuff */

extern mr_small prepare_monty(_MIPT_ big);
extern void  kill_monty(_MIPTO_ );
extern void  nres(_MIPT_ big,big);        
extern void  redc(_MIPT_ big,big);        

extern void  nres_negate(_MIPT_ big,big);
extern void  nres_modadd(_MIPT_ big,big,big);    
extern void  nres_modsub(_MIPT_ big,big,big); 
extern void  nres_lazy(_MIPT_ big,big,big,big,big,big);
extern void  nres_double_modadd(_MIPT_ big,big,big);    
extern void  nres_double_modsub(_MIPT_ big,big,big); 
extern void  nres_premult(_MIPT_ big,int,big);
extern void  nres_modmult(_MIPT_ big,big,big);    
extern int   nres_moddiv(_MIPT_ big,big,big);     
extern void  nres_dotprod(_MIPT_ int,big *,big *,big);
extern void  nres_powmod(_MIPT_ big,big,big);     
extern void  nres_powltr(_MIPT_ int,big,big);     
extern void  nres_powmod2(_MIPT_ big,big,big,big,big);     
extern void  nres_powmodn(_MIPT_ int,big *,big *,big);
extern BOOL  nres_sqroot(_MIPT_ big,big);
extern void  nres_lucas(_MIPT_ big,big,big,big);
extern BOOL  nres_double_inverse(_MIPT_ big,big,big,big);
extern BOOL  nres_multi_inverse(_MIPT_ int,big *,big *);

extern void  shs_init(sha *);
extern void  shs_process(sha *,int);
extern void  shs_hash(sha *,char *);

extern void  shs256_init(sha256 *);
extern void  shs256_process(sha256 *,int);
extern void  shs256_hash(sha256 *,char *);

#ifdef mr_unsign64

extern void  shs512_init(sha512 *);
extern void  shs512_process(sha512 *,int);
extern void  shs512_hash(sha512 *,char *);

extern void  shs384_init(sha384 *);
extern void  shs384_process(sha384 *,int);
extern void  shs384_hash(sha384 *,char *);

#endif

extern BOOL  aes_init(aes *,int,int,char *,char *);
extern void  aes_getreg(aes *,char *);
extern mr_unsign32 aes_encrypt(aes *,char *);
extern mr_unsign32 aes_decrypt(aes *,char *);
extern void  aes_reset(aes *,int,char *);
extern void  aes_end(aes *);

extern void  strong_init(csprng *,int,char *,mr_unsign32);   
extern int   strong_rng(csprng *);
extern void  strong_bigrand(_MIPT_ csprng *,big,big);
extern void  strong_bigdig(_MIPT_ csprng *,int,int,big);
extern void  strong_kill(csprng *);

/* special modular multipliers */

extern void  comba_mult(_MIPT_ big,big,big);
extern void  comba_square(_MIPT_ big,big);
extern void  comba_redc(_MIPT_ big,big);
extern void  comba_add(_MIPT_ big,big,big);
extern void  comba_sub(_MIPT_ big,big,big);
extern void  comba_double_add(_MIPT_ big,big,big);
extern void  comba_double_sub(_MIPT_ big,big,big);
extern void  comba_negate(_MIPT_ big,big);

extern void  comba_mult2(_MIPT_ big,big,big);

extern void  fastmodmult(_MIPT_ big,big,big);
extern void  fastmodsquare(_MIPT_ big,big);   

extern void  kcm_mul(_MIPT_ big,big,big);
extern void  kcm_sqr(_MIPT_ big,big); 
extern void  kcm_redc(_MIPT_ big,big); 

extern void  kcm_multiply(_MIPT_ int,big,big,big);
extern void  kcm_square(_MIPT_ int,big,big);
extern BOOL  kcm_top(_MIPT_ int,big,big,big);

/* elliptic curve stuff */

extern BOOL point_at_infinity(epoint *);

extern void ecurve_init(_MIPT_ big,big,big,int);
extern big  ecurve_add(_MIPT_ epoint *,epoint *);
extern big  ecurve_sub(_MIPT_ epoint *,epoint *);
extern void ecurve_double_add(_MIPT_ epoint *,epoint *,epoint *,epoint *,big *,big *);
extern void ecurve_multi_add(_MIPT_ int,epoint **,epoint **);
extern void ecurve_double(_MIPT_ epoint*);
extern void ecurve_mult(_MIPT_ big,epoint *,epoint *);
extern void ecurve_mult2(_MIPT_ big,epoint *,big,epoint *,epoint *);
extern void ecurve_multn(_MIPT_ int,big *,epoint**,epoint *);

extern BOOL epoint_x(_MIPT_ big);
extern BOOL epoint_set(_MIPT_ big,big,int,epoint*);
extern int  epoint_get(_MIPT_ epoint*,big,big);
extern void epoint_getxyz(_MIPT_ epoint *,big,big,big);
extern int  epoint_norm(_MIPT_ epoint *);
extern void epoint_free(epoint *);
extern void epoint_copy(epoint *,epoint *);
extern BOOL epoint_comp(_MIPT_ epoint *,epoint *);
extern void epoint_negate(_MIPT_ epoint *);

extern BOOL ecurve2_init(_MIPT_ int,int,int,int,big,big,BOOL,int);
extern big  ecurve2_add(_MIPT_ epoint *,epoint *);
extern big  ecurve2_sub(_MIPT_ epoint *,epoint *);
extern void ecurve2_multi_add(_MIPT_ int,epoint **,epoint **);
extern void ecurve2_mult(_MIPT_ big,epoint *,epoint *);
extern void ecurve2_mult2(_MIPT_ big,epoint *,big,epoint *,epoint *);
extern void ecurve2_multn(_MIPT_ int,big *,epoint**,epoint *);

extern epoint* epoint2_init(_MIPTO_ );
extern BOOL epoint2_set(_MIPT_ big,big,int,epoint*);
extern int  epoint2_get(_MIPT_ epoint*,big,big);
extern void epoint2_getxyz(_MIPT_ epoint *,big,big,big);
extern int  epoint2_norm(_MIPT_ epoint *);
extern void epoint2_free(epoint *);
extern void epoint2_copy(epoint *,epoint *);
extern BOOL epoint2_comp(_MIPT_ epoint *,epoint *);
extern void epoint2_negate(_MIPT_ epoint *);

/* GF(2) stuff */

extern BOOL prepare_basis(_MIPT_ int,int,int,int,BOOL);
extern void add2(big,big,big);
extern void incr2(big,int,big);
extern void reduce2(_MIPT_ big,big);
extern void multiply2(_MIPT_ big,big,big);
extern void modmult2(_MIPT_ big,big,big);
extern void modsquare2(_MIPT_ big,big);
extern void power2(_MIPT_ big,int,big);
extern void sqroot2(_MIPT_ big,big);
extern void halftrace2(_MIPT_ big,big);
extern BOOL quad2(_MIPT_ big,big);
extern BOOL inverse2(_MIPT_ big,big);
extern void karmul2(int,mr_small *,mr_small *,mr_small *,mr_small *);
extern void karmul2_poly(_MIPT_ int,big *,big *,big *,big *);
extern void karmul2_poly_upper(_MIPT_ int,big *,big *,big *,big *);
extern void gf2m_dotprod(_MIPT_ int,big *,big *,big);
extern int  trace2(_MIPT_ big);
extern void rand2(_MIPT_ big);
extern void gcd2(_MIPT_ big,big,big);
extern int degree2(big);

/* zzn2 stuff */

extern BOOL zzn2_iszero(zzn2 *);
extern BOOL zzn2_isunity(_MIPT_ zzn2 *);
extern void zzn2_from_int(_MIPT_ int,zzn2 *);
extern void zzn2_from_ints(_MIPT_ int,int,zzn2 *);
extern void zzn2_copy(zzn2 *,zzn2 *);
extern void zzn2_zero(zzn2 *);
extern void zzn2_negate(_MIPT_ zzn2 *,zzn2 *);
extern void zzn2_conj(_MIPT_ zzn2 *,zzn2 *);
extern void zzn2_add(_MIPT_ zzn2 *,zzn2 *,zzn2 *);
extern void zzn2_sub(_MIPT_ zzn2 *,zzn2 *,zzn2 *);
extern void zzn2_smul(_MIPT_ zzn2 *,big,zzn2 *);
extern void zzn2_mul(_MIPT_ zzn2 *,zzn2 *,zzn2 *);
extern void zzn2_inv(_MIPT_ zzn2 *);
extern void zzn2_timesi(_MIPT_ zzn2 *);
extern void zzn2_powl(_MIPT_ zzn2 *,big,zzn2 *);
extern void zzn2_from_zzns(big,big,zzn2 *);
extern void zzn2_from_bigs(_MIPT_ big,big,zzn2 *);
extern void zzn2_from_zzn(big,zzn2 *);
extern void zzn2_from_big(_MIPT_ big, zzn2 *);
extern void zzn2_sadd(_MIPT_ zzn2 *,big,zzn2 *);
extern void zzn2_ssub(_MIPT_ zzn2 *,big,zzn2 *);
extern void zzn2_imul(_MIPT_ zzn2 *,int,zzn2 *);
extern BOOL zzn2_compare(zzn2 *,zzn2 *);

/* Group 3 - Floating-slash routines      */

#ifdef MR_FLASH
extern void  fpack(_MIPT_ big,big,flash);
extern void  numer(_MIPT_ flash,big);    
extern void  denom(_MIPT_ flash,big);    
extern BOOL  fit(big,big,int);    
extern void  build(_MIPT_ flash,int (*)(_MIPT_ big,int));
extern void  mround(_MIPT_ big,big,flash);         
extern void  flop(_MIPT_ flash,flash,int *,flash);
extern void  fmul(_MIPT_ flash,flash,flash);      
extern void  fdiv(_MIPT_ flash,flash,flash);      
extern void  fadd(_MIPT_ flash,flash,flash);      
extern void  fsub(_MIPT_ flash,flash,flash);      
extern int   fcomp(_MIPT_ flash,flash);           
extern void  fconv(_MIPT_ int,int,flash);         
extern void  frecip(_MIPT_ flash,flash);          
extern void  ftrunc(_MIPT_ flash,big,flash);      
extern void  fmodulo(_MIPT_ flash,flash,flash);
extern void  fpmul(_MIPT_ flash,int,int,flash);   
extern void  fincr(_MIPT_ flash,int,int,flash);   
extern void  dconv(_MIPT_ double,flash);          
extern double fdsize(_MIPT_ flash);
extern void  frand(_MIPT_ flash);

/* Group 4 - Advanced Flash routines */ 

extern void  fpower(_MIPT_ flash,int,flash);
extern BOOL  froot(_MIPT_ flash,int,flash); 
extern void  fpi(_MIPT_ flash);             
extern void  fexp(_MIPT_ flash,flash);      
extern void  flog(_MIPT_ flash,flash);      
extern void  fpowf(_MIPT_ flash,flash,flash);
extern void  ftan(_MIPT_ flash,flash); 
extern void  fatan(_MIPT_ flash,flash);
extern void  fsin(_MIPT_ flash,flash); 
extern void  fasin(_MIPT_ flash,flash);
extern void  fcos(_MIPT_ flash,flash);  
extern void  facos(_MIPT_ flash,flash); 
extern void  ftanh(_MIPT_ flash,flash); 
extern void  fatanh(_MIPT_ flash,flash);
extern void  fsinh(_MIPT_ flash,flash); 
extern void  fasinh(_MIPT_ flash,flash);
extern void  fcosh(_MIPT_ flash,flash); 
extern void  facosh(_MIPT_ flash,flash);
#endif


/* Test predefined Macros to determine compiler type, and hopefully 
   selectively use fast in-line assembler (or other compiler specific
   optimisations. Note I am unsure of Microsoft version numbers. So I 
   suspect are Microsoft.

   Note: It seems to be impossible to get the 16-bit Microsoft compiler
   to allow inline 32-bit op-codes. So I suspect that INLINE_ASM == 2 will
   never work with it. Pity. 

#define INLINE_ASM 1    -> generates 8086 inline assembly
#define INLINE_ASM 2    -> generates mixed 8086 & 80386 inline assembly,
                           so you can get some benefit while running in a 
                           16-bit environment on 32-bit hardware (DOS, Windows
                           3.1...)
#define INLINE_ASM 3    -> generate true 80386 inline assembly - (Using DOS 
                           extender, Windows '95/Windows NT)
                           Actually optimised for Pentium

#define INLINE_ASM 4    -> 80386 code in the GNU style (for (DJGPP)

Small, medium, compact and large memory models are supported for the
first two of the above.
                        
*/

/* To allow for inline assembly */

#ifdef __GNUC__ 
    #define ASM __asm__ __volatile__
#endif

#ifdef __TURBOC__ 
    #define ASM asm
#endif

#ifdef _MSC_VER
    #define ASM _asm
#endif

#ifndef MR_NOASM

/* Itanium - inline the time-critical functions */

    #ifdef MR_ITANIUM
        #define muldvd(a,b,c,rp)  (tm=_m64_xmahu((a),(b),(c)),*(rp)=_m64_xmalu((a),(b),(c)),tm)
        #define muldvd2(a,b,c,rp) (tm=_m64_xmalu((a),(b),(*(c))),*(c)=_m64_xmahu((a),(b),(*(c))),tm+=*(rp),*(c)+=(tm<*(rp)),*(rp)=tm)
    #endif

/*

SSE2 code. Works as for itanium - but in fact it is slower than the regular code so not recommended
Would require a call to emmintrin.h or xmmintrin.h, and an __m128i variable tm to be declared in effected 
functions. But it works!

	#define muldvd(a,b,c,rp)  (tm=_mm_add_epi64(_mm_mul_epu32(_mm_cvtsi32_si128((a)),_mm_cvtsi32_si128((b))),_mm_cvtsi32_si128((c))),*(rp)=_mm_cvtsi128_si32(tm),_mm_cvtsi128_si32(_mm_shuffle_epi32(tm,_MM_SHUFFLE(3,2,0,1))) )
	#define muldvd2(a,b,c,rp) (tm=_mm_add_epi64(_mm_add_epi64(_mm_mul_epu32(_mm_cvtsi32_si128((a)),_mm_cvtsi32_si128((b))),_mm_cvtsi32_si128(*(c))),_mm_cvtsi32_si128(*(rp))),*(rp)=_mm_cvtsi128_si32(tm),*(c)=_mm_cvtsi128_si32( _mm_shuffle_epi32(tm,_MM_SHUFFLE(3,2,0,1))  )
*/

/* Borland C/Turbo C */

    #ifdef __TURBOC__ 
    #ifndef __HUGE__
        #if defined(__COMPACT__) || defined(__LARGE__)
            #define MR_LMM
        #endif

        #if MIRACL==16
            #define INLINE_ASM 1
        #endif

        #if __TURBOC__>=0x410
            #if MIRACL==32
#if defined(__SMALL__) || defined(__MEDIUM__) || defined(__LARGE__) || defined(__COMPACT__)
                    #define INLINE_ASM 2
                #else
                    #define INLINE_ASM 3
                #endif
            #endif
        #endif
    #endif
    #endif

/* Microsoft C */

    #ifdef _MSC_VER
    #ifndef M_I86HM        
        #if defined(M_I86CM) || defined(M_I86LM)
            #define MR_LMM
        #endif
        #if _MSC_VER>=600
            #if _MSC_VER<1200
                #if MIRACL==16
                    #define INLINE_ASM 1
                #endif
            #endif
        #endif
        #if _MSC_VER>=1000
            #if MIRACL==32
                #define INLINE_ASM 3
            #endif
        #endif     
    #endif       
    #endif

/* DJGPP GNU C */

    #ifdef __GNUC__
    #ifdef i386
        #if MIRACL==32
            #define INLINE_ASM 4
        #endif
    #endif
    #endif

#endif



/* 
   The following contribution is from Tielo Jongmans, Netherlands
   These inline assembler routines are suitable for Watcom 10.0 and up 

   Added into miracl.h.  Notice the override of the original declarations 
   of these routines, which should be removed.

   The following pragma is optional, it is dangerous, but it saves a 
   calling sequence
*/

/*

#pragma off (check_stack);

extern unsigned int muldiv(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int *);
#pragma aux muldiv=                 \
       "mul     edx"                \
       "add     eax,ebx"            \
       "adc     edx,0"              \
       "div     ecx"                \
       "mov     [esi],edx"          \
    parm [eax] [edx] [ebx] [ecx] [esi]   \
    value [eax]                     \
    modify [eax edx];

extern unsigned int muldvm(unsigned int, unsigned int, unsigned int, unsigned int *);
#pragma aux muldvm=                 \
        "div     ebx"               \
        "mov     [ecx],edx"         \
    parm [edx] [eax] [ebx] [ecx]    \
    value [eax]                     \
    modify [eax edx];

extern unsigned int muldvd(unsigned int, unsigned int, unsigned int, unsigned int *);
#pragma aux muldvd=                 \
        "mul     edx"               \
        "add     eax,ebx"           \
        "adc     edx,0"             \
        "mov     [ecx],eax"         \
        "mov     eax,edx"           \
    parm [eax] [edx] [ebx] [ecx]    \
    value [eax]                     \
    modify [eax edx];

*/


#endif


