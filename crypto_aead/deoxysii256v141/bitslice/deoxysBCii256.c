/*
 * Deoxys-II-256 Bit-Sliced C Implementation
 *
 * Copyright 2016:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 *     Ivica Nikolic <inikolic@ntu.edu.sg>
 *     Haoyang Wang <wang1153@e.ntu.edu.sg>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 */

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <tmmintrin.h>
#include "deoxysii256.macros"

#define G256_newbasisA2X(x7,x6,x5,x4,x3,x2,x1,x0) do{\
    __m128i y0,y1;\
    y0=XOR(XOR(XOR(XOR(x0,x1),x2),x3),x6);\
    y1=XOR(XOR(x0,x5),x6);\
    x5=XOR(y1,x1);\
    x6=XOR(y1,x4);\
    x3=XOR(XOR(XOR(XOR(x0,x1),x3),x4),x7);\
    x4=XOR(y1,x7);\
    x7=XOR(XOR(x5,x2),x7);\
    x2=x0;\
    x0=y0; x1=y1;\
}while(0);

#define G256_newbasisX2S(x7,x6,x5,x4,x3,x2,x1,x0) do{\
    __m128i y0,y2,y1,y3,y4,y7;\
    y7=XOR(x3,x5);\
    y2=XOR(x1,x4);\
    y0=XOR(y2,x6);\
    y1=XOR(y2,x5);\
    y4=XOR(x7,y7);\
    x5=XOR(x0,x6);\
    x2=XOR(XOR(x5,x2),y7);\
    y3=XOR(XOR(x4,x6),y4);\
    x6=XOR(x3,x7);\
    x0=y0; x1=y1; x3=y3; x4=y4; x7=y7;\
}while(0);

#define G256_newbasisS2X(x7,x6,x5,x4,x3,x2,x1,x0) do{\
    __m128i y1,y4,y5;\
    y1=XOR(XOR(x0,x3),x4);\
    x2=XOR(XOR(x2,x5),x7);\
    y5=XOR(x4,x6);\
    y4=XOR(XOR(XOR(x0,x1),x3),x6);\
    x3=XOR(y5,x7);\
    x6=XOR(XOR(x0,x1),y5);\
    x7=XOR(x4,x7);\
    x0=XOR(x5,x6);\
    x1=y1; x5=y5; x4=y4;\
}while(0);

#define G256_newbasisX2A(x7,x6,x5,x4,x3,x2,x1,x0) do{\
    __m128i t,y2,y4,y7;\
    t=XOR(XOR(XOR(XOR(x0,x3),x5),x6),x7);\
    x0=x2;\
    y7=XOR(x1,x4);\
    y4=XOR(x1,x6);\
    x6=XOR(x1,t);\
    x1=XOR(x1,x5);\
    y2=XOR(XOR(x4,x7),x1);\
    x3=XOR(XOR(XOR(XOR(x2,x3),x4),x5),y4);\
    x5=XOR(x2,t);\
    x2=y2; x4=y4; x7=y7;\
}while(0);


#define G16_mul(x3,x2,x1,x0,y3,y2,y1,y0) do{\
    __m128i a0,a1,a2,a3,e,q,b;\
    a3=XOR(x3,x1); a2=XOR(x2,x0); a1=XOR(y3,y1); a0=XOR(y2,y0);\
    e=AND(XOR(a3,a2),XOR(a1,a0));\
    b=XOR(AND(a2,a0),e); q=XOR(AND(a3,a1),AND(a2,a0));\
    e=AND(XOR(x3,x2),XOR(y3,y2));\
    y3=XOR(XOR(AND(x3,y3),e),b);\
    y2=XOR(XOR(AND(x2,y2),e),q);\
    e=AND(XOR(x1,x0),XOR(y1,y0));\
    y1=XOR(XOR(AND(x1,y1),e),b);\
    y0=XOR(XOR(AND(x0,y0),e),q);\
}while(0);

#define G16_inv(x3,x2,x1,x0) do{\
    __m128i a0,a1,m,p0,p1,p2,p3,e;\
    a1=XOR(x3,x1); a0=XOR(XOR(a1,x2),x0);\
    e=AND(XOR(x3,x2),XOR(x1,x0));\
    p0=XOR(AND(x3,x1),e);\
    p1=XOR(AND(x2,x0),e);\
    p0=XOR(p0,a1); p1=XOR(p1,a0); m=XOR(p0,p1);\
    e=AND(m,XOR(x1,x0));\
    p3=XOR(AND(p1,x1),e);\
    p2=XOR(AND(p0,x0),e);\
    e=AND(m,XOR(x3,x2));\
    x1=XOR(AND(p1,x3),e);\
    x0=XOR(AND(p0,x2),e);\
    x3=p3; x2=p2;\
}while(0);

#define G256_inv(x7,x6,x5,x4,x3,x2,x1,x0) do{\
   __m128i  a1,a2,a3,a0,  e, b,q,p, m1,m2,m3,m4,  y0,y1,y2,y3;\
    m4=XOR(x7,x3); m3=XOR(x6,x2); m2=XOR(x5,x1); m1=XOR(x4,x0);\
    y3=XOR(m3,m1); y2=XOR(m4,m2); y1=XOR(m1,m2); y0=m1;\
    a3=XOR(x7,x5); a2=XOR(x6,x4); a1=XOR(x3,x1); a0=XOR(x2,x0);\
    e=AND(XOR(a3,a2),XOR(a1,a0));\
    b=AND(a2,a0);\
    p=XOR(b,e); q=XOR(AND(a3,a1),b);\
    e=AND(XOR(x7,x6),XOR(x3,x2)); y3=XOR(XOR(XOR(AND(x7,x3),e),p),y3); y2=XOR(XOR(XOR(AND(x6,x2),e),q),y2);\
    e=AND(XOR(x5,x4),XOR(x1,x0)); y1=XOR(XOR(XOR(AND(x5,x1),e),p),y1); y0=XOR(XOR(XOR(AND(x4,x0),e),q),y0);\
    G16_inv(y3,y2,y1,y0);\
    G16_mul(y3,y2,y1,y0,x3,x2,x1,x0);\
    G16_mul(y3,y2,y1,y0,x7,x6,x5,x4);\
    m1=x7; m2=x6; m3=x5; m4=x4;\
    x7=x3; x6=x2; x5=x1; x4=x0;\
    x3=m1; x2=m2; x1=m3; x0=m4;\
} while(0);


#define Sbox(x) do{\
    G256_newbasisA2X((x)[7],(x)[6],(x)[5],(x)[4],(x)[3],(x)[2],(x)[1],(x)[0]);\
    G256_inv((x)[7],(x)[6],(x)[5],(x)[4],(x)[3],(x)[2],(x)[1],(x)[0]);\
    G256_newbasisX2S((x)[7],(x)[6],(x)[5],(x)[4],(x)[3],(x)[2],(x)[1],(x)[0]);\
    (x)[6]=XOR((x)[6],mask_f); (x)[5]=XOR((x)[5],mask_f);\
    (x)[1]=XOR((x)[1],mask_f); (x)[0]=XOR((x)[0],mask_f);\
}while(0);

#define SHIFTROWS(x,y) do{\
    (y)[0]=shuffle_sr((x)[0]);\
    (y)[1]=shuffle_sr((x)[1]);\
    (y)[2]=shuffle_sr((x)[2]);\
    (y)[3]=shuffle_sr((x)[3]);\
    (y)[4]=shuffle_sr((x)[4]);\
    (y)[5]=shuffle_sr((x)[5]);\
    (y)[6]=shuffle_sr((x)[6]);\
    (y)[7]=shuffle_sr((x)[7]);\
}while(0);

#define MIXBYTES(x,y) do{\
    __m128i rl32_x[8], temp[8];\
    rl32_x[0]=rl32((x)[0]),  rl32_x[4]=rl32((x)[4]);\
    rl32_x[1]=rl32((x)[1]),  rl32_x[5]=rl32((x)[5]);\
    rl32_x[2]=rl32((x)[2]),  rl32_x[6]=rl32((x)[6]);\
    rl32_x[3]=rl32((x)[3]),  rl32_x[7]=rl32((x)[7]);\
    temp[0]=XOR((x)[0], rl32_x[0]);  temp[1]=XOR((x)[1], rl32_x[1]);\
    temp[2]=XOR((x)[2], rl32_x[2]);  temp[3]=XOR((x)[3], rl32_x[3]);\
    temp[4]=XOR((x)[4], rl32_x[4]);  temp[5]=XOR((x)[5], rl32_x[5]);\
    temp[6]=XOR((x)[6], rl32_x[6]);  temp[7]=XOR((x)[7], rl32_x[7]);\
	(y)[0]= XOR(XOR(temp[7], rl32_x[0]),               rl64(temp[0]) );\
	(y)[1]= XOR(XOR(XOR(temp[0], temp[7]), rl32_x[1]), rl64(temp[1]) );\
	(y)[2]= XOR(XOR(temp[1], rl32_x[2]),               rl64(temp[2]) );\
	(y)[3]= XOR(XOR(XOR(temp[2], temp[7]), rl32_x[3]), rl64(temp[3]) );\
	(y)[4]= XOR(XOR(XOR(temp[3], temp[7]), rl32_x[4]), rl64(temp[4]) );\
	(y)[5]= XOR(XOR(temp[4], rl32_x[5]),               rl64(temp[5]) );\
	(y)[6]= XOR(XOR(temp[5], rl32_x[6]),               rl64(temp[6]) );\
	(y)[7]= XOR(XOR(temp[6], rl32_x[7]),               rl64(temp[7]) );\
}while(0);

#define ADDKEY(x,rk) do{\
    unsigned j;\
    for(j=0;j<8;j++)\
        (x)[j]=XOR((x)[j],(rk)[j]);\
}while(0);

#define InvSbox(x) do{\
    (x)[6]=XOR((x)[6],mask_f); (x)[5]=XOR((x)[5],mask_f);\
    (x)[1]=XOR((x)[1],mask_f); (x)[0]=XOR((x)[0],mask_f);\
    G256_newbasisS2X((x)[7],(x)[6],(x)[5],(x)[4],(x)[3],(x)[2],(x)[1],(x)[0]);\
    G256_inv((x)[7],(x)[6],(x)[5],(x)[4],(x)[3],(x)[2],(x)[1],(x)[0]);\
    G256_newbasisX2A((x)[7],(x)[6],(x)[5],(x)[4],(x)[3],(x)[2],(x)[1],(x)[0]);\
}while(0);

#define InvSHIFTROWS(x,y) do{\
    (y)[0]=shuffle_isr((x)[0]);\
    (y)[1]=shuffle_isr((x)[1]);\
    (y)[2]=shuffle_isr((x)[2]);\
    (y)[3]=shuffle_isr((x)[3]);\
    (y)[4]=shuffle_isr((x)[4]);\
    (y)[5]=shuffle_isr((x)[5]);\
    (y)[6]=shuffle_isr((x)[6]);\
    (y)[7]=shuffle_isr((x)[7]);\
}while(0);

#define InvMIXBYTES(x,y) do{\
    __m128i temp[8], rl64_temp[8], rl32_64_6, rl32_64_7;\
    temp[0]=XOR((x)[0], rl32((x)[0]));  temp[1]=XOR((x)[1], rl32((x)[1]));\
    temp[2]=XOR((x)[2], rl32((x)[2]));  temp[3]=XOR((x)[3], rl32((x)[3]));\
    temp[4]=XOR((x)[4], rl32((x)[4]));  temp[5]=XOR((x)[5], rl32((x)[5]));\
    temp[6]=XOR((x)[6], rl32((x)[6]));  temp[7]=XOR((x)[7], rl32((x)[7]));\
    rl64_temp[0]=rl64(temp[0]),  rl64_temp[4]=rl64(temp[4]);\
    rl64_temp[1]=rl64(temp[1]),  rl64_temp[5]=rl64(temp[5]);\
    rl64_temp[2]=rl64(temp[2]),  rl64_temp[6]=rl64(temp[6]);\
    rl64_temp[3]=rl64(temp[3]),  rl64_temp[7]=rl64(temp[7]);\
    rl32_64_6=rl32(XOR((x)[6], rl64((x)[6]))),  rl32_64_7=rl32(XOR((x)[7], rl64((x)[7])));\
    y[0] = XOR(XOR(XOR(XOR(XOR(XOR(XOR(                 temp[5], x[6]), x[7]),                      rl32((x)[7])), rl32((x)[0])),     rl64((x)[6])), rl64_temp[5]), rl64_temp[0]);\
    y[1] = XOR(XOR(XOR(XOR(XOR(XOR(XOR(                 temp[0], temp[5]),                          rl32((x)[7])), rl32((x)[1])),     rl64((x)[7])), rl64_temp[5]), rl64_temp[1]), rl32_64_6);\
    y[2] = XOR(XOR(XOR(XOR(XOR(XOR(XOR(                 temp[1], x[0]), temp[6]),                   rl32((x)[2])),                 rl64((x)[0])), rl64_temp[2]), rl64_temp[6]), rl32_64_7);\
    y[3] = XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR( temp[0], x[1]), temp[2]), temp[5]), x[6]),  rl32((x)[3])),                 rl64((x)[1])), rl64_temp[0]), rl64_temp[3]), rl64_temp[5]), rl64_temp[7]), rl64((x)[6]));\
    y[4] = XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR( temp[1], x[2]), temp[3]), temp[5]),         rl32((x)[4])), rl32((x)[7])),     rl64((x)[2])), rl64_temp[1]), rl64_temp[4]), rl64_temp[5]), rl64((x)[7])), rl32_64_6);\
    y[5] = XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(         temp[2], x[3]), temp[4]), temp[6]),         rl32((x)[5])),                 rl64((x)[3])), rl64_temp[2]), rl64_temp[5]), rl64_temp[6]), rl32_64_7);\
    y[6] = XOR(XOR(XOR(XOR(XOR(XOR(XOR(XOR(             temp[3], x[4]), temp[5]), temp[7]),         rl32((x)[6])),                 rl64((x)[4])), rl64_temp[3]), rl64_temp[6]), rl64_temp[7]);\
    y[7] = XOR(XOR(XOR(XOR(XOR(XOR(                     temp[4], x[5]), temp[6]),                   rl32((x)[7])),                 rl64((x)[5])), rl64_temp[4]), rl64_temp[7]);\
}while(0);

#define XOR_8(v,m)\
    m=XOR(m,v[0]); m=XOR(m,v[1]);\
    m=XOR(m,v[2]); m=XOR(m,v[3]);\
    m=XOR(m,v[4]); m=XOR(m,v[5]);\
    m=XOR(m,v[6]); m=XOR(m,v[7]);\


void DeoxysEncrypt_Auth(__m128i rk[15][8], const uint8_t* pt, __m128i* Auth) {

    __m128i a[8];
    __m128i b[8];
    unsigned int u;

    /* Load and pack the input data */
    for(u=0;u<8;u++) {
        a[u]=LOAD(pt+16*u);
    }
    packing(a);

    /* First AddRoundTweakey */
    ADDKEY(a,rk[0]);

    /*1 to Nr rounds*/
    for(u=1;u<=16;u++) {
        Sbox(a);
        SHIFTROWS(a,b);
        MIXBYTES(b,a);
        ADDKEY(a,rk[u]);
    }

    /* Unpack to get the ciphertext */
    unpacking(a);

    XOR_8(a,*Auth);
}


void DeoxysEncrypt_XOR(__m128i rk[15][8], const uint8_t* nonce_plaintext, const uint8_t* pt, uint8_t ct[128]) {

    __m128i a[8],b[8];
    __m128i plaintext[8];
    unsigned int u;

    /* Load and pack the input data */
    for(u=0;u<8;u++) {
        a[u]=LOAD(nonce_plaintext);
        plaintext[u]=LOAD(pt+16*u);
    }
    packing(a);

    /* First AddRoundTweakey */
    ADDKEY(a,rk[0]);

    /*1 to Nr rounds*/
    for(u=1;u<=16;u++) {
        Sbox(a);
        SHIFTROWS(a,b);
        MIXBYTES(b,a);
        ADDKEY(a,rk[u]);
    }

    /* Unpack to get the ciphertext */
    unpacking(a);

    //XOR_8(plaintext,a);
    a[0]=XOR(a[0], plaintext[0]), a[1]=XOR(a[1], plaintext[1]);
    a[2]=XOR(a[2], plaintext[2]), a[3]=XOR(a[3], plaintext[3]);
    a[4]=XOR(a[4], plaintext[4]), a[5]=XOR(a[5], plaintext[5]);
    a[6]=XOR(a[6], plaintext[6]), a[7]=XOR(a[7], plaintext[7]);
    for(u=0;u<8;u++){
        STORE(ct+16*u,a[u]);
    }
}

