# Emilia Käsper
# Peter Schwabe
# D. J. Bernstein

@define bitslicekey0(key, bskey) \
  xmm0 = mem128[key];\
  interleave(xmm0);\
  xmm1 = xmm0;\
  xmm2 = xmm0;\
  xmm3 = xmm0;\
  xmm4 = xmm0;\
  xmm5 = xmm0;\
  xmm6 = xmm0;\
  xmm7 = xmm0;\
  ;\
  bitslice(xmm7, xmm6, xmm5, xmm4, xmm3, xmm2, xmm1, xmm0);\
  ;\
  mem128[bskey] aligned= xmm0; bskey += 16;\
  mem128[bskey] aligned= xmm1; bskey += 16;\
  mem128[bskey] aligned= xmm2; bskey += 16;\
  mem128[bskey] aligned= xmm3; bskey += 16;\
  mem128[bskey] aligned= xmm4; bskey += 16;\
  mem128[bskey] aligned= xmm5; bskey += 16;\
  mem128[bskey] aligned= xmm6; bskey += 16;\
  mem128[bskey] aligned= xmm7; bskey += 16;\
  bskey -= 128;\

# oneshiftrow: x = x[1]x[2]x[3]x[0] x[6]x[7]x[4]x[5] x[11]x[8]x[9]x[10] x[12]x[13]x[14]x[15]
# SR: .quad 0x0504070600030201, 0x0f0e0d0c0a09080b
@define oneshiftrow(x) \
  x = x[SR[0,1,2,3,4,5,6,7]] x[8,9,10,11,12,13,14,15];\
  x = x[0,1,2,3,4,5,6,7] x[8+SR[8,9,10,11,12,13,14,15]];\

# oneshiftrowlast: x = x[15]x[10]x[5]x[0] x[14]x[9]x[4]x[3] x[12]x[11]x[6]x[1] x[13]x[8]x[7]x[2]
# SRM0:   .quad 0x0304090e00050a0f, 0x01060b0c0207080d
@define oneshiftrowlast(x) \
  oneshiftrow(x);\
  interleave(x);\

# SWAP32: .int 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f
@define swap32(x) \
  x = x[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12];\

# RCON: .int 0x00000000, 0x00000000, 0x00000000, 0xffffffff
@define setrcon(x) \
  2x x = 0;\
  x = x[0],0xffffffff00000000;\


# rotbyte: x = ? ? ? x[12] ? ? ? x[0] ? ? ? x[4] ? ? ? x[8]
# don't care about ? values
# e.g. shuffle bytes of x by ROTB: .int 0x0c000000, 0x00000000, 0x04000000, 0x08000000

@define rotbyte(x) \
  x = x[3]x[0,1,2] ;\
  4x x <<= 24 ;\

@define rotbyte8(x0,x1,x2,x3,x4,x5,x6,x7) \
  x0 = x0[3]x0[0,1,2] ;\
  x1 = x1[3]x1[0,1,2] ;\
  x2 = x2[3]x2[0,1,2] ;\
    4x x0 <<= 24 ;\
  x3 = x3[3]x3[0,1,2] ;\
    4x x1 <<= 24 ;\
  x4 = x4[3]x4[0,1,2] ;\
    4x x2 <<= 24 ;\
  x5 = x5[3]x5[0,1,2] ;\
    4x x3 <<= 24 ;\
  x6 = x6[3]x6[0,1,2] ;\
    4x x4 <<= 24 ;\
  x7 = x7[3]x7[0,1,2] ;\
    4x x5 <<= 24 ;\
    4x x6 <<= 24 ;\
    4x x7 <<= 24 ;\


# expb: x = x[3]x[3]x[3]x[3] x[7]x[7]x[7]x[7] x[11]x[11]x[11]x[11] x[15]x[15]x[15]x[15]
# e.g. shuffle bytes of x by EXPB0: .int 0x03030303, 0x07070707, 0x0b0b0b0b, 0x0f0f0f0f

@define expb(x) \
  4x x unsigned>>= 24;\
  4x u = x << 8;\
  x |= u;\
  4x u = x << 16;\
  x |= u;\

@define expb8(x0,x1,x2,x3,x4,x5,x6,x7) \
  4x x0 unsigned>>= 24;\
    4x x1 unsigned>>= 24;\
      4x x2 unsigned>>= 24;\
        4x x3 unsigned>>= 24;\
  4x u0 = x0 << 8;\
    4x u1 = x1 << 8;\
      4x u2 = x2 << 8;\
        4x u3 = x3 << 8;\
  x0 |= u0;\
    x1 |= u1;\
      x2 |= u2;\
        x3 |= u3;\
  4x u0 = x0 << 16;\
    4x u1 = x1 << 16;\
      4x u2 = x2 << 16;\
        4x u3 = x3 << 16;\
  x0 |= u0;\
    x1 |= u1;\
      x2 |= u2;\
        x3 |= u3;\
  4x x4 unsigned>>= 24;\
    4x x5 unsigned>>= 24;\
      4x x6 unsigned>>= 24;\
        4x x7 unsigned>>= 24;\
  4x u4 = x4 << 8;\
    4x u5 = x5 << 8;\
      4x u6 = x6 << 8;\
        4x u7 = x7 << 8;\
  x4 |= u4;\
    x5 |= u5;\
      x6 |= u6;\
        x7 |= u7;\
  4x u4 = x4 << 16;\
    4x u5 = x5 << 16;\
      4x u6 = x6 << 16;\
        4x u7 = x7 << 16;\
  x4 |= u4;\
    x5 |= u5;\
      x6 |= u6;\
        x7 |= u7;\


# interleave: x = x[15]x[11]x[7]x[3] x[14]x[10]x[6]x[2] x[13]x[9]x[5]x[1] x[12]x[8]x[4]x[0]
# e.g. shuffle bytes of x by M0:  .quad 0x02060a0e03070b0f, 0x0004080c0105090d

@define interleave(x) \
  x = x[0,2,1,3];\
  x = x[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15];\
  x = x[0,2,1,3];\
  x = x[0,4,2,6,1,5,3,7];\
  x = x[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8];\
  x = x[1,0];\

# interleaveswap: x = x[12]x[8]x[4]x[0] x[13]x[9]x[5]x[1] x[14]x[10]x[6]x[2] x[15]x[11]x[7]x[3]
# e.g. shuffle bytes of x by M0SWAP: .quad 0x0105090d0004080c , 0x03070b0f02060a0e

@define interleaveswap(x) \
  x = x[0,2,1,3];\
  x = x[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15];\
  x = x[0,2,1,3];\
  x = x[0,4,2,6,1,5,3,7];\
  x = x[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12];\
  

@define keyexpbs1(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, rcon, bskey) \
  rotbyte8(b0,b1,b2,b3,b4,b5,b6,b7);\
  ;\
  sbox(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7);\
  ;\
  setrcon(u);\
  rcon;\
  expb8(b0,b1,b4,b6,b3,b7,b2,b5);\
  ;\
  t0 aligned= mem128[bskey]; bskey += 16;\
  b0 ^= t0;\
    t1 aligned= mem128[bskey]; bskey += 16;\
    b1 ^= t1;\
      t2 aligned= mem128[bskey]; bskey += 16;\
      b4 ^= t2;\
        t3 aligned= mem128[bskey]; bskey += 16;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
    b1 ^= t1;\
      b4 ^= t2;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
    b1 ^= t1;\
      b4 ^= t2;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
          t4 aligned= mem128[bskey]; bskey += 16;\
    b1 ^= t1;\
            t5 aligned= mem128[bskey]; bskey += 16;\
      b4 ^= t2;\
              t6 aligned= mem128[bskey]; bskey += 16;\
        b6 ^= t3;\
                t7 aligned= mem128[bskey]; bskey += 16;\
          b3 ^= t4;\
  mem128[bskey] aligned= b0 ; bskey += 16;\
            b7 ^= t5;\
    mem128[bskey] aligned= b1 ; bskey += 16;\
              b2 ^= t6;\
      mem128[bskey] aligned= b4 ; bskey += 16;\
                b5 ^= t7;\
        mem128[bskey] aligned= b6 ; bskey += 16;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
          b3 ^= t4;\
            b7 ^= t5;\
              b2 ^= t6;\
                b5 ^= t7;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
          b3 ^= t4;\
            b7 ^= t5;\
              b2 ^= t6;\
                b5 ^= t7;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
          b3 ^= t4;\
            b7 ^= t5;\
              b2 ^= t6;\
                b5 ^= t7;\
          mem128[bskey] aligned= b3 ; bskey += 16;\
            mem128[bskey] aligned= b7 ; bskey += 16;\
              mem128[bskey] aligned= b2 ; bskey += 16;\
                mem128[bskey] aligned= b5 ; bskey += 16;\
  bskey -= 128;\

@define keyexpbs10(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, bskey) \
  b0 = ~b0;\
  b1 = ~b1;\
  b5 = ~b5;\
  b6 = ~b6;\
  rotbyte8(b0,b1,b2,b3,b4,b5,b6,b7);\
  ;\
  sbox(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7);\
  ;\
  setrcon(u);\
  b1 ^= u;\
  b4 ^= u;\
  b3 ^= u;\
  b7 ^= u;\
  expb8(b0,b1,b4,b6,b3,b7,b2,b5);\
  ;\
  t0 aligned= mem128[bskey]; bskey += 16;\
  t0 = ~t0;\
    t1 aligned= mem128[bskey]; bskey += 16;\
    t1 = ~t1;\
      t2 aligned= mem128[bskey]; bskey += 16;\
  b0 ^= t0;\
        t3 aligned= mem128[bskey]; bskey += 16;\
    b1 ^= t1;\
      b4 ^= t2;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
    b1 ^= t1;\
      b4 ^= t2;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
    b1 ^= t1;\
      b4 ^= t2;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
    b1 ^= t1;\
      b4 ^= t2;\
          t4 aligned= mem128[bskey]; bskey += 16;\
        b6 ^= t3;\
            t5 aligned= mem128[bskey]; bskey += 16;\
            t5 = ~t5;\
              t6 aligned= mem128[bskey]; bskey += 16;\
              t6 = ~t6;\
                t7 aligned= mem128[bskey]; bskey += 16;\
          b3 ^= t4;\
            b7 ^= t5;\
  interleave(b0);\
              b2 ^= t6;\
                b5 ^= t7;\
  mem128[bskey] aligned= b0 ; bskey += 16;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
    interleave(b1);\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
    mem128[bskey] aligned= b1 ; bskey += 16;\
          b3 ^= t4;\
            b7 ^= t5;\
      interleave(b4);\
              b2 ^= t6;\
                b5 ^= t7;\
      mem128[bskey] aligned= b4 ; bskey += 16;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
        interleave(b6);\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
        mem128[bskey] aligned= b6 ; bskey += 16;\
          b3 ^= t4;\
            b7 ^= t5;\
              b2 ^= t6;\
                b5 ^= t7;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
          b3 ^= t4;\
            b7 ^= t5;\
              b2 ^= t6;\
                b5 ^= t7;\
          interleave(b3);\
          mem128[bskey] aligned= b3 ; bskey += 16;\
            interleave(b7);\
            mem128[bskey] aligned= b7 ; bskey += 16;\
              interleave(b2);\
              mem128[bskey] aligned= b2 ; bskey += 16;\
                interleave(b5);\
                mem128[bskey] aligned= b5 ; bskey += 16;\
  bskey -= 128;\

@define keyexpbs(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, rcon, bskey) \
  b0 = ~b0;\
  b1 = ~b1;\
  b5 = ~b5;\
  b6 = ~b6;\
  rotbyte8(b0,b1,b2,b3,b4,b5,b6,b7);\
  ;\
  sbox(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7);\
  ;\
  setrcon(u);\
  rcon;\
  expb8(b0,b1,b4,b6,b3,b7,b2,b5);\
  ;\
  t0 aligned= mem128[bskey]; bskey += 16;\
  t0 = ~t0;\
    t1 aligned= mem128[bskey]; bskey += 16;\
    t1 = ~t1;\
      t2 aligned= mem128[bskey]; bskey += 16;\
  b0 ^= t0;\
        t3 aligned= mem128[bskey]; bskey += 16;\
    b1 ^= t1;\
      b4 ^= t2;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
    b1 ^= t1;\
      b4 ^= t2;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
    b1 ^= t1;\
      b4 ^= t2;\
        b6 ^= t3;\
  4x t0 unsigned>>= 8;\
    4x t1 unsigned>>= 8;\
      4x t2 unsigned>>= 8;\
        4x t3 unsigned>>= 8;\
  b0 ^= t0;\
    b1 ^= t1;\
      b4 ^= t2;\
          t4 aligned= mem128[bskey]; bskey += 16;\
        b6 ^= t3;\
            t5 aligned= mem128[bskey]; bskey += 16;\
            t5 = ~t5;\
              t6 aligned= mem128[bskey]; bskey += 16;\
              t6 = ~t6;\
                t7 aligned= mem128[bskey]; bskey += 16;\
          b3 ^= t4;\
  mem128[bskey] aligned= b0 ; bskey += 16;\
            b7 ^= t5;\
    mem128[bskey] aligned= b1 ; bskey += 16;\
              b2 ^= t6;\
      mem128[bskey] aligned= b4 ; bskey += 16;\
                b5 ^= t7;\
        mem128[bskey] aligned= b6 ; bskey += 16;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
          b3 ^= t4;\
            b7 ^= t5;\
              b2 ^= t6;\
                b5 ^= t7;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
          b3 ^= t4;\
            b7 ^= t5;\
              b2 ^= t6;\
                b5 ^= t7;\
          4x t4 unsigned>>= 8;\
            4x t5 unsigned>>= 8;\
              4x t6 unsigned>>= 8;\
                4x t7 unsigned>>= 8;\
          b3 ^= t4;\
            b7 ^= t5;\
              b2 ^= t6;\
                b5 ^= t7;\
          mem128[bskey] aligned= b3 ; bskey += 16;\
            mem128[bskey] aligned= b7 ; bskey += 16;\
              mem128[bskey] aligned= b2 ; bskey += 16;\
                mem128[bskey] aligned= b5 ; bskey += 16;\
  bskey -= 128;\


@define loadkey(t0, t1, t2, t3, t4, t5, t6, t7, bskey) \
	t0 aligned= mem128[bskey]; bskey += 16;\
	t1 aligned= mem128[bskey]; bskey += 16;\
	t2 aligned= mem128[bskey]; bskey += 16;\
	t3 aligned= mem128[bskey]; bskey += 16;\
	t4 aligned= mem128[bskey]; bskey += 16;\
	t5 aligned= mem128[bskey]; bskey += 16;\
	t6 aligned= mem128[bskey]; bskey += 16;\
	t7 aligned= mem128[bskey]; bskey += 16;\

@define aesround(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, bskey) \
	b1 ^= t1;\
	  z = &SR_stack;\
	  SR aligned= mem128[z];\
	b2 ^= t2;\
	b5 ^= t5;\
	  oneshiftrow(b1);\
	b0 ^= t0;\
	b3 ^= t3;\
	  oneshiftrow(b2);\
	b6 ^= t6;\
	b7 ^= t7;\
	  oneshiftrow(b5);\
	b4 ^= t4;\
	  oneshiftrow(b0);\
	    b2 ^= b1;\
	  oneshiftrow(b3);\
	    b5 ^= b0;\
	  oneshiftrow(b6);\
	    b3 ^= b0;\
	  oneshiftrow(b7);\
	    b5 ^= b6;\
	    b6 ^= b3;\
	    b3 ^= b7;\
	  oneshiftrow(b4);\
	    b6 ^= b2;\
	    b7 ^= b5;\
	    b3 ^= b4;\
	    b4 ^= b5;\
	    b3 ^= b1;\
	    b2 ^= b7;\
	    b1 ^= b5;\
        Inv_GF256(b6, b5, b0, b3, b7, b1, b4, b2, t0, t1, t2, t3, t4, t5, t6, t7); \
	b7 ^= b0;\
	b1 ^= b6;\
	b4 ^= b7;\
	b6 ^= b0;\
	b0 ^= b1;\
	b1 ^= b5;\
	b5 ^= b2;\
	b2 ^= b3;\
	b3 ^= b5;\
        t0 = b0[3]b0[0,1,2];\
	b4 ^= b5;\
	t1 = b1[3]b1[0,1,2];\
	b6 ^= b3;\
	t2 = b4[3]b4[0,1,2];\
	b0 ^= t0;\
	t3 = b6[3]b6[0,1,2];\
	b1 ^= t1;\
	t4 = b3[3]b3[0,1,2];\
	b4 ^= t2;\
	t7 = b5[3]b5[0,1,2];\
	b6 ^= t3;\
	t5 = b7[3]b7[0,1,2];\
	b3 ^= t4;\
	t6 = b2[3]b2[0,1,2];\
	b5 ^= t7;\
	b7 ^= t5;\
	b2 ^= t6;\
	t1 ^= b0;\
	t0 ^= b5;\
	t2 ^= b1;\
	t1 ^= b5;\
	b0 = b0[2,3]b0[0,1];\
	t3 ^= b4;\
	b1 = b1[2,3]b1[0,1];\
	t4 ^= b6;\
	b4 = b4[2,3]b4[0,1];\
	t5 ^= b3;\
	b6 = b6[2,3]b6[0,1];\
	t3 ^= b5;\
	b3 = b3[2,3]b3[0,1];\
	t6 ^= b7;\
	b7 = b7[2,3]b7[0,1];\
	t7 ^= b2;\
	b2 = b2[2,3]b2[0,1];\
	t4 ^= b5;\
	b5 = b5[2,3]b5[0,1];\
	t0 ^= b0;\
	  b0 aligned= mem128[bskey]; bskey += 16;\
	t1 ^= b1;\
	  b1 aligned= mem128[bskey]; bskey += 16;\
	t6 ^= b2;\
	  b2 aligned= mem128[bskey]; bskey += 16;\
	t4 ^= b3;\
	  b3 aligned= mem128[bskey]; bskey += 16;\
	t2 ^= b4;\
	  b4 aligned= mem128[bskey]; bskey += 16;\
	t7 ^= b5;\
	  b5 aligned= mem128[bskey]; bskey += 16;\
	t3 ^= b6;\
	  b6 aligned= mem128[bskey]; bskey += 16;\
	t5 ^= b7;\
	  b7 aligned= mem128[bskey]; bskey += 16;\

@define lastround(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, bskey) \
	b0 ^= t0;\
	  z = &SR_stack;\
	  SR aligned= mem128[z];\
	b1 ^= t1;\
	  oneshiftrowlast(b0);\
	b2 ^= t2;\
	  oneshiftrowlast(b1);\
	b3 ^= t3;\
	  oneshiftrowlast(b2);\
	b4 ^= t4;\
	  oneshiftrowlast(b3);\
	    b2 ^= b1;\
	b5 ^= t5;\
	  oneshiftrowlast(b4);\
	    b3 ^= b0;\
	b6 ^= t6;\
	  oneshiftrowlast(b5);\
	b7 ^= t7;\
	  oneshiftrowlast(b6);\
	    b5 ^= b6;\
	  oneshiftrowlast(b7);\
	    b5 ^= b0;\
	    b6 ^= b2;\
	    b6 ^= b3;\
	    b3 ^= b7;\
	    b7 ^= b5;\
	    b3 ^= b4;\
	    b4 ^= b5;\
	    b3 ^= b1;\
	    b2 ^= b7;\
	    b1 ^= b5;\
        Inv_GF256(b6, b5, b0, b3, b7, b1, b4, b2, t0, t1, t2, t3, t4, t5, t6, t7); \
	b7 ^= b0;\
	b1 ^= b6;\
	b4 ^= b7;\
	b6 ^= b0;\
	b0 ^= b1;\
	b1 ^= b5;\
	b5 ^= b2;\
	b2 ^= b3;\
	b3 ^= b5;\
	b4 ^= b5;\
	b6 ^= b3;\
	t0 aligned= mem128[bskey]; bskey += 16;\
	b0 ^= t0;\
	t1 aligned= mem128[bskey]; bskey += 16;\
	b1 ^= t1;\
	t2 aligned= mem128[bskey]; bskey += 16;\
	b4 ^= t2;\
	t3 aligned= mem128[bskey]; bskey += 16;\
	b6 ^= t3;\
	t4 aligned= mem128[bskey]; bskey += 16;\
	b3 ^= t4;\
	t5 aligned= mem128[bskey]; bskey += 16;\
	b7 ^= t5;\
	t6 aligned= mem128[bskey]; bskey += 16;\
	b2 ^= t6;\
	t7 aligned= mem128[bskey]; bskey += 16;\
	b5 ^= t7;\

@define aesrounds(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, bskey) \
	bitslice(b7,b6,b5,b4,b3,b2,b1,b0);\
	loadkey(t0,t1,t2,t3,t4,t5,t6,t7,bskey);\
	aesround(b0,b1,b2,b3,b4,b5,b6,b7,t0,t1,t2,t3,t4,t5,t6,t7,bskey);\
	aesround(t0,t1,t2,t3,t4,t5,t6,t7,b0,b1,b2,b3,b4,b5,b6,b7,bskey);\
	aesround(b0,b1,b2,b3,b4,b5,b6,b7,t0,t1,t2,t3,t4,t5,t6,t7,bskey);\
	aesround(t0,t1,t2,t3,t4,t5,t6,t7,b0,b1,b2,b3,b4,b5,b6,b7,bskey);\
	aesround(b0,b1,b2,b3,b4,b5,b6,b7,t0,t1,t2,t3,t4,t5,t6,t7,bskey);\
	aesround(t0,t1,t2,t3,t4,t5,t6,t7,b0,b1,b2,b3,b4,b5,b6,b7,bskey);\
	aesround(b0,b1,b2,b3,b4,b5,b6,b7,t0,t1,t2,t3,t4,t5,t6,t7,bskey);\
	aesround(t0,t1,t2,t3,t4,t5,t6,t7,b0,b1,b2,b3,b4,b5,b6,b7,bskey);\
	aesround(b0,b1,b2,b3,b4,b5,b6,b7,t0,t1,t2,t3,t4,t5,t6,t7,bskey);\
	lastround(t0,t1,t2,t3,t4,t5,t6,t7,b0,b1,b2,b3,b4,b5,b6,b7,bskey);\
	bitslice(t5,t2,t7,t3,t6,t4,t1,t0);\

@define swapmove(x0, x1, n) \
	2x t = x1 unsigned>> n;\
	t ^= x0;\
	t &= u;\
	x0 ^= t;\
	2x t <<= n;\
	x1 ^= t;\

@define swapmove4(x0, x1, x2, x3, x4, x5, x6, x7, n) \
	2x t0 = x1 unsigned>> n;\
	  2x t2 = x3 unsigned>> n;\
	    2x t4 = x5 unsigned>> n;\
	      2x t6 = x7 unsigned>> n;\
	t0 ^= x0;\
	  t2 ^= x2;\
	    t4 ^= x4;\
	      t6 ^= x6;\
	t0 &= u;\
	  t2 &= u;\
	    t4 &= u;\
	      t6 &= u;\
	x0 ^= t0;\
	  x2 ^= t2;\
	    x4 ^= t4;\
	      x6 ^= t6;\
	2x t0 <<= n;\
	  2x t2 <<= n;\
	    2x t4 <<= n;\
	      2x t6 <<= n;\
	x1 ^= t0;\
	  x3 ^= t2;\
	    x5 ^= t4;\
	      x7 ^= t6;\

@define bitslice(x0, x1, x2, x3, x4, x5, x6, x7) \
	u = 0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55;\
	swapmove4(x0, x1, x2, x3, x4, x5, x6, x7, 1);\
	;\
	u = 0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33;\
	swapmove4(x0, x2, x1, x3, x4, x6, x5, x7, 2);\
	;\
	u = 0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f;\
	swapmove4(x0, x4, x1, x5, x2, x6, x3, x7, 4);\


@define sbox(b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, s0, s1, s2, s3) \
	b5 ^= b6;\
	b2 ^= b1;\
	b5 ^= b0;\
	b6 ^= b2;\
	b3 ^= b0;\
	b6 ^= b3;\
	b3 ^= b7;\
	b7 ^= b5;\
	b3 ^= b4;\
	b4 ^= b5;\
	b3 ^= b1;\
	b2 ^= b7;\
	b1 ^= b5;\
        Inv_GF256(b6, b5, b0, b3, b7, b1, b4, b2, t0, t1, t2, t3, s0, s1, s2, s3); \
	b7 ^= b0;\
	b1 ^= b6;\
	b4 ^= b7;\
	b6 ^= b0;\
	b0 ^= b1;\
	b1 ^= b5;\
	b5 ^= b2;\
	b2 ^= b3;\
	b3 ^= b5;\
	b4 ^= b5;\
	b6 ^= b3;\

@define Inv_GF256(x0,  x1, x2, x3, x4, x5, x6, x7, t0, t1, t2, t3, s0, s1, s2, s3) \
	t3 = x4 ^ x6;\
	t2 = x5 ^ x7;\
	t1 = x1 ^ x3;\
	s1 = x7 ^ x6;\
	s0 = x0 ^ x2;\
	t0 = t2 & t1;\
	s2 = t3 & s0;\
	s3 = t3 ^ t2;\
	t3 |= s0;\
	s0 ^= t1;\
	t2 |= t1;\
	s3 &= s0;\
	s0 = x3 ^ x2;\
	t3 ^= s3;\
	s1 &= s0;\
	t2 ^= s2;\
	t3 ^= s1;\
	t2 ^= s1;\
	s1 = x4 ^ x5;\
	s0 = x1 ^ x0;\
	t0 ^= s2;\
	t1 = s1 | s0;\
	s1 &= s0;\
	t1 ^= s3;\
	t0 ^= s1;\
	t1 ^= s2;\
	s0 = x7 & x3;\
	s1 = x6 & x2;\
	t3 ^= s0;\
	t2 ^= s1;\
	s2 = x5 & x1;\
  s0 = t3 ^ t2;\
	s3 = x4 | x0;\
	t1 ^= s2;\
	t0 ^= s3;\
  t3 &= t1;\
  s1 = t1 ^ t0;\
  s2 = t0 ^ t3;\
  t3 ^= t2;\
  s3 = s0 & s2;\
  s1 &= t3;\
  s3 ^= t2;\
  s1 ^= t0;\
  ;\
  t2 = s2 ^ s1;\
  t1 ^= s1;\
  t2 &= t0;\
	t0 = x1 ^ x3;\
  s2 ^= t2;\
  t1 ^= t2;\
  s2 &= s3;\
  ;\
  s2 ^= s0;\
	s0 = x0 ^ x2;\
	t2 = s3 ^ s2;\
	;\
	t2 &= x0;\
	x0 ^= x1;\
	x1 &= s3;\
	x0 &= s2;\
	s2 ^= t1;\
	s3 ^= s1;\
	x0 ^= x1;\
	t3 = s3 ^ s2;\
	x1 ^= t2;\
	t3 &= s0;\
	s0 ^= t0;\
	t0 &= s3;\
	s0 &= s2;\
	t2 = s1 ^ t1;\
	t0 ^= s0;\
	s0 ^= t3;\
	t2 &= x2;\
	x2 ^= x3;\
	x3 &= s1;\
	x2 &= t1;\
	x0 ^= s0;\
	x2 ^= x3;\
	x3 ^= t2;\
	x2 ^= s0;\
	x1 ^= t0;\
	x3 ^= t0;\
	s0 = x4 ^ x6;\
	t3 = s3 ^ s2;\
	t0 = x5 ^ x7;\
	t3 &= s0;\
	s0 ^= t0;\
	t0 &= s3;\
	s0 &= s2;\
	t2 = s1 ^ t1;\
	t0 ^= s0;\
	s0 ^= t3;\
	t2 &= x6;\
	x6 ^= x7;\
	x7 &= s1;\
	x6 &= t1;\
	s3 ^= s1;\
	s2 ^= t1;\
	x6 ^= x7;\
	t3 = s3 ^ s2;\
	x7 ^= t2;\
	t3 &= x4;\
	x4 ^= x5;\
	x5 &= s3;\
	x4 &= s2;\
	x6 ^= s0;\
	x4 ^= x5;\
	x5 ^= t3;\
	x4 ^= s0;\
	x5 ^= t0;\
	x7 ^= t0;\

