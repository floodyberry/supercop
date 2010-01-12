#ifndef _AESTAB_H
#define _AESTAB_H

#include "aestab_t.h"

//this is defined in the fugue_x.c file before include of this file
//#define SIXTEEN_TABLES
//#define FOUR_LONG_TABLES


#define brot(x,n)   (((crypto_uint32)(x) <<  n) | ((crypto_uint32)(x) >> ((32 - n) & 31)))
#define to_byte(x) ((x) & 0xff)
#define to_nib(x)  ((x) & 0xfc)
#define bval(x,n)   to_byte((x) >> (8 * (n)))
#define bval4(x,n)  (n==0 ? ((x<<2) & 0x3fc): n==1? ((x>>6) & 0x3fc) : n==2 ? ((x>>14)& 0x3fc) : ((x>>22)&0x3fc))
#define nibval(x,n)     to_nib((x) >> (8 * (n)))
#define bytes2word(b0, b1, b2, b3)  \
        (((crypto_uint32)(b3) << 24) | ((crypto_uint32)(b2) << 16) | ((crypto_uint32)(b1) << 8) | (b0))



#define sbox(w,r)							\
    w(r,0x63), w(r,0x7c), w(r,0x77), w(r,0x7b), w(r,0xf2), w(r,0x6b), w(r,0x6f), w(r,0xc5),\
    w(r,0x30), w(r,0x01), w(r,0x67), w(r,0x2b), w(r,0xfe), w(r,0xd7), w(r,0xab), w(r,0x76),\
    w(r,0xca), w(r,0x82), w(r,0xc9), w(r,0x7d), w(r,0xfa), w(r,0x59), w(r,0x47), w(r,0xf0),\
    w(r,0xad), w(r,0xd4), w(r,0xa2), w(r,0xaf), w(r,0x9c), w(r,0xa4), w(r,0x72), w(r,0xc0),\
    w(r,0xb7), w(r,0xfd), w(r,0x93), w(r,0x26), w(r,0x36), w(r,0x3f), w(r,0xf7), w(r,0xcc),\
    w(r,0x34), w(r,0xa5), w(r,0xe5), w(r,0xf1), w(r,0x71), w(r,0xd8), w(r,0x31), w(r,0x15),\
    w(r,0x04), w(r,0xc7), w(r,0x23), w(r,0xc3), w(r,0x18), w(r,0x96), w(r,0x05), w(r,0x9a),\
    w(r,0x07), w(r,0x12), w(r,0x80), w(r,0xe2), w(r,0xeb), w(r,0x27), w(r,0xb2), w(r,0x75),\
    w(r,0x09), w(r,0x83), w(r,0x2c), w(r,0x1a), w(r,0x1b), w(r,0x6e), w(r,0x5a), w(r,0xa0),\
    w(r,0x52), w(r,0x3b), w(r,0xd6), w(r,0xb3), w(r,0x29), w(r,0xe3), w(r,0x2f), w(r,0x84),\
    w(r,0x53), w(r,0xd1), w(r,0x00), w(r,0xed), w(r,0x20), w(r,0xfc), w(r,0xb1), w(r,0x5b),\
    w(r,0x6a), w(r,0xcb), w(r,0xbe), w(r,0x39), w(r,0x4a), w(r,0x4c), w(r,0x58), w(r,0xcf),\
    w(r,0xd0), w(r,0xef), w(r,0xaa), w(r,0xfb), w(r,0x43), w(r,0x4d), w(r,0x33), w(r,0x85),\
    w(r,0x45), w(r,0xf9), w(r,0x02), w(r,0x7f), w(r,0x50), w(r,0x3c), w(r,0x9f), w(r,0xa8),\
    w(r,0x51), w(r,0xa3), w(r,0x40), w(r,0x8f), w(r,0x92), w(r,0x9d), w(r,0x38), w(r,0xf5),\
    w(r,0xbc), w(r,0xb6), w(r,0xda), w(r,0x21), w(r,0x10), w(r,0xff), w(r,0xf3), w(r,0xd2),\
    w(r,0xcd), w(r,0x0c), w(r,0x13), w(r,0xec), w(r,0x5f), w(r,0x97), w(r,0x44), w(r,0x17),\
    w(r,0xc4), w(r,0xa7), w(r,0x7e), w(r,0x3d), w(r,0x64), w(r,0x5d), w(r,0x19), w(r,0x73),\
    w(r,0x60), w(r,0x81), w(r,0x4f), w(r,0xdc), w(r,0x22), w(r,0x2a), w(r,0x90), w(r,0x88),\
    w(r,0x46), w(r,0xee), w(r,0xb8), w(r,0x14), w(r,0xde), w(r,0x5e), w(r,0x0b), w(r,0xdb),\
    w(r,0xe0), w(r,0x32), w(r,0x3a), w(r,0x0a), w(r,0x49), w(r,0x06), w(r,0x24), w(r,0x5c),\
    w(r,0xc2), w(r,0xd3), w(r,0xac), w(r,0x62), w(r,0x91), w(r,0x95), w(r,0xe4), w(r,0x79),\
    w(r,0xe7), w(r,0xc8), w(r,0x37), w(r,0x6d), w(r,0x8d), w(r,0xd5), w(r,0x4e), w(r,0xa9),\
    w(r,0x6c), w(r,0x56), w(r,0xf4), w(r,0xea), w(r,0x65), w(r,0x7a), w(r,0xae), w(r,0x08),\
    w(r,0xba), w(r,0x78), w(r,0x25), w(r,0x2e), w(r,0x1c), w(r,0xa6), w(r,0xb4), w(r,0xc6),\
    w(r,0xe8), w(r,0xdd), w(r,0x74), w(r,0x1f), w(r,0x4b), w(r,0xbd), w(r,0x8b), w(r,0x8a),\
    w(r,0x70), w(r,0x3e), w(r,0xb5), w(r,0x66), w(r,0x48), w(r,0x03), w(r,0xf6), w(r,0x0e),\
    w(r,0x61), w(r,0x35), w(r,0x57), w(r,0xb9), w(r,0x86), w(r,0xc1), w(r,0x1d), w(r,0x9e),\
    w(r,0xe1), w(r,0xf8), w(r,0x98), w(r,0x11), w(r,0x69), w(r,0xd9), w(r,0x8e), w(r,0x94),\
    w(r,0x9b), w(r,0x1e), w(r,0x87), w(r,0xe9), w(r,0xce), w(r,0x55), w(r,0x28), w(r,0xdf),\
    w(r,0x8c), w(r,0xa1), w(r,0x89), w(r,0x0d), w(r,0xbf), w(r,0xe6), w(r,0x42), w(r,0x68),\ 
    w(r,0x41), w(r,0x99), w(r,0x2d), w(r,0x0f), w(r,0xb0), w(r,0x54), w(r,0xbb), w(r,0x16)

#define h0(x)   (x)

//this is the new mix for the hash funciton , replacing AES 2113 by new 1174 -CSJ
#define u0(r,p)   bytes2word(p, p, f7(p), f4(p))
#define u1(r,p)   bytes2word(f4(p),  p, p, f7(p))
#define u2(r,p)   bytes2word(f7(p), f4(p), p, p)
#define u3(r,p)   bytes2word(p, f7(p), f4(p), p)

      

#define WPOLY   0x011b

#define f0(x)   0
#define f1(x)   (x)
#define f2(x)   ((x<<1) ^ (((x>>7) & 1) * WPOLY))
#define f4(x)   ((x<<2) ^ (((x>>6) & 1) * WPOLY) ^ (((x>>6) & 2) * WPOLY))
#define f8(x)   ((x<<3) ^ (((x>>5) & 1) * WPOLY) ^ (((x>>5) & 2) * WPOLY) \
                        ^ (((x>>5) & 4) * WPOLY))
#define f3(x)   (f2(x) ^ x)
#define f7(x)   (f4(x)^ f2(x) ^x)   //this is new -CSJ
#define f5(x)   (f4(x) ^ x)
#define f6(x)   (f4(x) ^ f2(x))

 
#define d_16(tab)   \
  static   __attribute__((aligned(16)))  const crypto_uint32 tab[16][256*4] = \
    {table_block(0), table_block(1), table_block(2), table_block(3)}


#define row_stretch(p,a,b,c,d,i,j,k,l,s,t,u,v,x,y,z,w)	\
      bytes2word(f##a(p),f##b(p),f##c(p),f##d(p)), \
      bytes2word(f##i(p),f##j(p),f##k(p),f##l(p)), \
      bytes2word(f##s(p),f##t(p),f##u(p),f##v(p)), \
      bytes2word(f##x(p),f##y(p),f##z(p),f##w(p))

#define aes_row_0(r,p) row_stretch(p,1,1,6,4, 0,1,0,0, 7,0,0,0, 0,0,0,4)
#define aes_row_1(r,p) row_stretch(p,0,0,4,0, 1,0,7,4, 1,0,0,0, 0,0,0,7)
#define aes_row_2(r,p) row_stretch(p,0,0,7,0, 0,4,0,0, 1,0,0,0, 0,0,0,1)
#define aes_row_3(r,p) row_stretch(p,0,0,1,0, 0,7,0,0, 4,0,0,0, 1,1,7,5)


//block 2 goes last, block 3 goes first
#define d_4(tab)   \
  static   __attribute__((aligned(16)))  const crypto_uint32 tab[4][256*4] = \
    { {sbox(aes_row_0,0)}, {sbox(aes_row_1,0)}, {sbox(aes_row_2,0)}, {sbox(aes_row_3,0)}}
 

#if defined(SIXTEEN_TABLES)
d_16(aes_style_table);
#elif defined(FOUR_LONG_TABLES)
d_4(aes_style_table);
#else
static const crypto_uint32 aes_style_table[4][256] = { {sbox(u0,0)}, {sbox(u1,0)}, {sbox(u2,0)}, {sbox(u3,0)} };
#endif

#endif







//----------------------------garbage-------------------------------------------------------
/*

//because column 3 goes first, and col 2 goes last
#define r_stretch(r,p,a,b,c,d) r_stretch_##r(p,a,b,c,d)
#define r_stretch_0(p,a,b,c,d) stretch(p,a,b,c,d)
#define r_stretch_1(p,a,b,c,d) stretch(p,b,c,d,a)
#define r_stretch_2(p,a,b,c,d) stretch(p,c,d,a,b)
#define r_stretch_3(p,a,b,c,d) stretch(p,d,a,b,c)

#define stretch(p,a,b,c,d)  bytes2word(f##a(p), f##b(p), f##c(p), f##d(p))

#define c0(r,p)   r_stretch(r,p,1,0,0,0)
#define c1(r,p)   r_stretch(r,p,0,0,0,4)
#define c2(r,p)   r_stretch(r,p,0,0,1,0)
#define c3(r,p)   r_stretch(r,p,0,1,0,0)


#define c4(r,p)   r_stretch(r,p,4,1,0,0)
#define c5(r,p)   r_stretch(r,p,0,1,0,7)
#define c6(r,p)   r_stretch(r,p,0,7,1,0)
#define c7(r,p)   r_stretch(r,p,0,5,0,0)


#define c8(r,p)    r_stretch(r,p,7,0,1,0)
#define c9(r,p)    r_stretch(r,p,0,0,1,1)
#define c10(r,p)   r_stretch(r,p,0,0,6,0)
#define c11(r,p)   r_stretch(r,p,0,4,4,0)


#define c12(r,p)   r_stretch(r,p,1,0,0,1)
#define c13(r,p)   r_stretch(r,p,0,0,0,0)
#define c14(r,p)   r_stretch(r,p,0,0,4,7)
#define c15(r,p)   r_stretch(r,p,0,7,0,4)


#define t_b_r(a,b,g,d,r)				\
  sbox(c##a,r), sbox(c##b,r) , sbox(c##g,r), sbox(c##d,r)

#define table_block(r) \
      table_block##r(r,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
#define table_block_trans(r) \
      table_block##r(r,0,4,8,12,1,5,9,13,2,6,10,14,3,7,11,15)


#define table_block0(rho,x,y,z,w,a,b,c,d,i,j,k,l,p,q,r,s) \
      {t_b_r(x,y,z,w,rho)}, {t_b_r(a,b,c,d,rho)}, {t_b_r(i,j,k,l,rho)}, {t_b_r(p,q,r,s,rho)}
#define table_block1(rho,x,y,z,w,a,b,c,d,i,j,k,l,p,q,r,s) \
     { t_b_r(p,q,r,s,rho)}, {t_b_r(x,y,z,w,rho)}, {t_b_r(a,b,c,d,rho)}, {t_b_r(i,j,k,l,rho)}
#define table_block2(rho,x,y,z,w,a,b,c,d,i,j,k,l,p,q,r,s) \
      {t_b_r(i,j,k,l,rho)}, {t_b_r(p,q,r,s,rho)}, {t_b_r(x,y,z,w,rho)}, {t_b_r(a,b,c,d,rho) }
#define table_block3(rho,x,y,z,w,a,b,c,d,i,j,k,l,p,q,r,s) \
      { t_b_r(a,b,c,d,rho)}, {t_b_r(i,j,k,l,rho)}, {t_b_r(p,q,r,s,rho)}, {t_b_r(x,y,z,w,rho)}


*/
