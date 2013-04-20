/*
 * File:   lattisigns512-20130329/poly.c
 * Author: Gim Güneysu, Tobias Oder, Thomas Pöppelmann, Peter Schwabe
 * Public Domain
 */

#include <immintrin.h>
#include "poly.h"
#include "fastrandombytes.h"
#include "crypto_int16.h"
#include "crypto_int32.h"
#include "crypto_uint32.h"
#include <stdio.h>
#include <math.h>

const poly param_a = {
#include "a.data"
};

const poly psis = {
#include "psis.data"
};

const poly inverse_psi_n = {
#include "inverse_psi_n.data"
};

const double __attribute__ ((aligned (32))) omegas[512] = {
#include "omegas.data"
};

const double __attribute__ ((aligned (32))) inverse_omegas[512] = {
#include "inverse_omegas.data"
};

extern void ntt_transform(poly r, const double o[511]);

//Map coefficients in [-(p-1)/2, (p-1)/2]
void poly_coeffreduce(poly r)
{
  int i;
  __m256d t,c,pinv,p;

  pinv = _mm256_set_pd(PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE);
  p    = _mm256_set_pd(8383489., 8383489., 8383489., 8383489.);

  for(i=0;i<POLY_DEG;i+=4)
  {
    t = _mm256_loadu_pd(r+i);
    c = _mm256_mul_pd(t, pinv);
    c = _mm256_round_pd(c,0x08);
    c = _mm256_mul_pd(c, p);
    t = _mm256_sub_pd(t,c);
    _mm256_storeu_pd(r+i,t);
  }
}

//XXX: not static for measurement
void ntt(poly out)
{
  ntt_transform(out, omegas);
}


//XXX: not static for measurement
void inverse_ntt(double *out)
{
  ntt_transform(out, inverse_omegas);
}

void poly_pack(unsigned char r[3*POLY_DEG], const poly f)
{ 
  int i;
  signed long long t;
  for(i=0;i<POLY_DEG;i++)
  {
    t = (unsigned long long)f[i];
    t = ((t % PARAM_P) + PARAM_P) % PARAM_P; 
    r[3*i+0] = t         & 0xff;
    r[3*i+1] = (t >>  8) & 0xff;
    r[3*i+2] = (t >> 16) & 0xff;
  }
}

// All coefficients of f have to be in [-k+32,k-32]
void poly_smallcoeff_pack(unsigned char r[2*POLY_DEG], const poly f)
{
  int i;
  for(i=0;i<POLY_DEG;i++)
    *(crypto_int16 *)(r+2*i) = (crypto_int16) f[i];
}

int poly_smallcoeff_unpack(poly r, const unsigned char a[1024])
{
  int i;
  for(i=0;i<POLY_DEG;i++)
  {
    r[i] = (double)(*(crypto_int16 *)(a+2*i));
    if(r[i] > PARAM_KM32 || r[i] < -PARAM_KM32) return 0;
  }
  return 1;
}

void poly_unpack(poly r, const unsigned char a[3*POLY_DEG])
{ 
  int i;
  signed long long t;
  for(i=0;i<POLY_DEG;i++)
  {
    t = a[3*i] ^ (a[3*i+1] << 8) ^ (a[3*i+2] << 16);
    r[i] = (double)t;
  }
}

void poly_fromhash(poly r, const unsigned char h[20])
{
  int i;
  unsigned char b;

  for(i=0;i<POLY_DEG;i++)
    r[i] = 0.;

  b = 2*((h[0] >> 4)&1);
  r[(h[0] & 0xf) + 0] = (double)(1-b);

  b = 2*((h[1] >> 1)&1);
  r[((h[0] >> 5) ^ ((h[1] & 1) << 3)) + 16] = (double)(1-b);

  b = 2*((h[1] >> 6)&1);
  r[((h[1] >> 2) & 0xf) + 32] = (double)(1-b);

  b = 2*((h[2] >> 3)&1);
  r[((h[1] >> 7) ^ ((h[2] & 7) << 1)) + 48] = (double)(1-b);

  b = 2*(h[3] &1);
  r[(h[2] >> 4) + 64] = (double)(1-b);

  b = 2*((h[3] >> 5)&1);
  r[((h[3] >> 1) & 0xf) + 80] = (double)(1-b);

  b = 2*((h[4] >> 2)&1);
  r[((h[3] >> 6) ^ ((h[4] & 3) << 2)) + 96] = (double)(1-b);

  b = 2*(h[4] >> 7);
   r[((h[4] >> 3) & 0xf) + 112] = (double)(1-b);

  b = 2*((h[5] >> 4)&1);
   r[(h[5] & 0xf) + 128] = (double)(1-b);

  b = 2*((h[6] >> 1)&1);
   r[((h[5] >> 5) ^ ((h[6] & 1) << 3)) + 144] = (double)(1-b);

  b = 2*((h[6] >> 6)&1);
   r[((h[6] >> 2) & 0xf) + 160] = (double)(1-b);

  b = 2*((h[7] >> 3)&1);
   r[((h[6] >> 7) ^ ((h[7] & 7) << 1)) + 176] = (double)(1-b);

  b = 2*(h[8] &1);
   r[(h[7] >> 4) + 192] = (double)(1-b);

  b = 2*((h[8] >> 5)&1);
   r[((h[8] >> 1) & 0xf) + 208] = (double)(1-b);

  b = 2*((h[9] >> 2)&1);
   r[((h[8] >> 6) ^ ((h[9] & 3) << 2)) + 224] = (double)(1-b);

  b = 2*(h[9] >> 7);
   r[((h[9] >> 3) & 0xf) + 240] = (double)(1-b);

  b = 2*((h[10] >> 4)&1);
   r[(h[10] & 0xf) + 256] = (double)(1-b);

  b = 2*((h[11] >> 1)&1);
   r[((h[10] >> 5) ^ ((h[11] & 1) << 3)) + 272] = (double)(1-b);

  b = 2*((h[11] >> 6)&1);
   r[((h[11] >> 2) & 0xf) + 288] = (double)(1-b);
  
  b = 2*((h[12] >> 3)&1);
   r[((h[11] >> 7) ^ ((h[12] & 7) << 1)) + 304] = (double)(1-b);

  b = 2*(h[13] &1);
   r[(h[12] >> 4) + 320] = (double)(1-b);

  b = 2*((h[13] >> 5)&1);
   r[((h[13] >> 1) & 0xf) + 336] = (double)(1-b);

  b = 2*((h[14] >> 2)&1);
   r[((h[13] >> 6) ^ ((h[14] & 3) << 2)) + 352] = (double)(1-b);

  b = 2*(h[14] >> 7);
   r[((h[14] >> 3) & 0xf) + 368] = (double)(1-b);

  b = 2*((h[15] >> 4)&1);
   r[(h[15] & 0xf) + 384] = (double)(1-b);

  b = 2*((h[16] >> 1)&1);
   r[((h[15] >> 5) ^ ((h[16] & 1) << 3)) + 400] = (double)(1-b);

  b = 2*((h[16] >> 6)&1);
   r[((h[16] >> 2) & 0xf) + 416] = (double)(1-b);

  b = 2*((h[17] >> 3)&1);
   r[((h[16] >> 7) ^ ((h[17] & 7) << 1)) + 432] = (double)(1-b);

  b = 2*(h[18] &1);
   r[(h[17] >> 4) + 448] = (double)(1-b);

  b = 2*((h[18] >> 5)&1);
   r[((h[18] >> 1) & 0xf) + 464] = (double)(1-b);

  b = 2*((h[19] >> 2)&1);
   r[((h[18] >> 6) ^ ((h[19] & 3) << 2)) + 480] = (double)(1-b);

  b = 2*(h[19] >> 7);
   r[((h[19] >> 3) & 0xf) + 496] = (double)(1-b);
}


// Return random polynomial with uniformly distributed coefficients in [-k,k]
void poly_setrandom_max1(poly r)
{
  int randlen = POLY_DEG+64; // 10 are additional elements for the case that some elements of t are larger than p * (\lfloor 2^32/p \rfloor)
  unsigned char t[randlen];
  int i=0,pos=0;
//  unsigned long long d = ((1ULL<<8) / 3);
//  unsigned long long limit = d*3;
  const unsigned char limit = 255;

  fastrandombytes((unsigned char *)t, randlen*sizeof(unsigned char));
  do{
    if(pos == randlen) // This should almost never happen
    {
      fastrandombytes((unsigned char *)t, randlen*sizeof(unsigned char));
      pos = 0;
    }
    if(t[pos] >= limit)
      pos++;
    else
    {
      r[i] = (double)(t[pos] % 3) - 1;
      pos++;
      i++;
    }
  }
  while(i<POLY_DEG);
}


// Return random polynomial with uniformly distributed coefficients in [-k,k]
void poly_setrandom_maxk(poly r)
{
  int randlen = POLY_DEG+16; // 10 are additional elements for the case that some elements of t are larger than p * (\lfloor 2^32/p \rfloor)
  crypto_uint32 t[randlen];
  int i=0,pos=0;
//  unsigned long long d = ((1ULL<<32) / (2*PARAM_K+1));
//  unsigned long long limit = d*(2*PARAM_K+1);
//  printf("limit: %llu\n",limit);
  crypto_uint32 limit = 4294967292;

  fastrandombytes((unsigned char *)t, randlen*sizeof(crypto_uint32));
  do{
    if(pos == randlen) // This should almost never happen
    {
      fastrandombytes((unsigned char *)t, randlen*sizeof(crypto_uint32));
      pos = 0;
    }
    if(t[pos] >= limit)
      pos++;
    else
    {
      r[i] = (double)(t[pos] % (2*PARAM_K+1)) - PARAM_K;
      pos++;
      i++;
    }
  }
  while(i<POLY_DEG);
}

void poly_add_nored(poly r, const poly f, const poly g)
{
  int i;
  __m256d vf, vg;
  
  for(i = 0; i<POLY_DEG; i+=4)
  {
    vf = _mm256_load_pd(f+i);
    vg = _mm256_load_pd(g+i);
    vf = _mm256_add_pd(vf,vg);
    _mm256_store_pd(r+i,vf);
  }
}

void poly_sub_nored(poly r, const poly f, const poly g)
{
  int i;
  __m256d vf, vg;
  
  for(i = 0; i<POLY_DEG; i+=4)
  {
    vf = _mm256_load_pd(f+i);
    vg = _mm256_load_pd(g+i);
    vf = _mm256_sub_pd(vf,vg);
    _mm256_store_pd(r+i,vf);
  }
}

void poly_mul(poly r, const poly x, const poly y)
{
    poly first, second;
    poly res;
    int i;
    __m256d vt, vx, pinv, p, vc;

    pinv = _mm256_set_pd(PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE);
    p    = _mm256_set_pd(8383489., 8383489., 8383489., 8383489.);
   
    //psi loop
    for(i = 0; i<POLY_DEG; i+=4)
    {
      vx = _mm256_loadu_pd(x+i);
      vt = _mm256_loadu_pd(psis+i);
      vt = _mm256_mul_pd(vx,vt);
      vc = _mm256_mul_pd(vt, pinv);
      vc = _mm256_floor_pd(vc);
      vc = _mm256_mul_pd(vc, p);
      vt = _mm256_sub_pd(vt,vc);
      _mm256_storeu_pd(first+i,vt);

      vx = _mm256_loadu_pd(y+i);
      vt = _mm256_loadu_pd(psis+i);
      vt = _mm256_mul_pd(vx,vt);
      vc = _mm256_mul_pd(vt, pinv);
      vc = _mm256_floor_pd(vc);
      vc = _mm256_mul_pd(vc, p);
      vt = _mm256_sub_pd(vt,vc);
      _mm256_storeu_pd(second+i,vt);
    }

    ntt(first);
    ntt(second);

    //point multiplication
    for(i = 0; i<POLY_DEG; i+=4)
    {
      vx = _mm256_loadu_pd(first+i);
      vt = _mm256_loadu_pd(second+i);
      vt = _mm256_mul_pd(vx,vt);
      vc = _mm256_mul_pd(vt, pinv);
      vc = _mm256_floor_pd(vc);
      vc = _mm256_mul_pd(vc, p);
      vt = _mm256_sub_pd(vt,vc);
      _mm256_storeu_pd(res+i,vt);
    }

    inverse_ntt(res);

    //psi loop
    for(i = 0; i<POLY_DEG; i+=4)
    {
      vx = _mm256_loadu_pd(res+i);
      vt = _mm256_loadu_pd(inverse_psi_n+i);
      vt = _mm256_mul_pd(vx,vt);
      vc = _mm256_mul_pd(vt, pinv);
      vc = _mm256_floor_pd(vc);
      vc = _mm256_mul_pd(vc, p);
      vt = _mm256_sub_pd(vt,vc);
      _mm256_storeu_pd(r+i,vt);
    }
}


void poly_mul_a(poly r, const poly x)
{
    poly first;
    poly res;
    int i;
    __m256d vt, vx, pinv, p, vc;

    pinv = _mm256_set_pd(PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE);
    p    = _mm256_set_pd(8383489., 8383489., 8383489., 8383489.);
   
    //psi loop
    for(i = 0; i<POLY_DEG; i+=4)
    {
      vx = _mm256_loadu_pd(x+i);
      vt = _mm256_loadu_pd(psis+i);
      vt = _mm256_mul_pd(vx,vt);
      vc = _mm256_mul_pd(vt, pinv);
      vc = _mm256_floor_pd(vc);
      vc = _mm256_mul_pd(vc, p);
      vt = _mm256_sub_pd(vt,vc);
      _mm256_storeu_pd(first+i,vt);
    }

    ntt(first);

    //point multiplication
    for(i = 0; i<POLY_DEG; i+=4)
    {
      vx = _mm256_loadu_pd(first+i);
      vt = _mm256_loadu_pd(param_a+i);
      vt = _mm256_mul_pd(vx,vt);
      vc = _mm256_mul_pd(vt, pinv);
      vc = _mm256_floor_pd(vc);
      vc = _mm256_mul_pd(vc, p);
      vt = _mm256_sub_pd(vt,vc);
      _mm256_storeu_pd(res+i,vt);
    }

    inverse_ntt(res);

    //psi loop
    for(i = 0; i<POLY_DEG; i+=4)
    {
      vx = _mm256_loadu_pd(res+i);
      vt = _mm256_loadu_pd(inverse_psi_n+i);
      vt = _mm256_mul_pd(vx,vt);
      vc = _mm256_mul_pd(vt, pinv);
      vc = _mm256_floor_pd(vc);
      vc = _mm256_mul_pd(vc, p);
      vt = _mm256_sub_pd(vt,vc);
      _mm256_storeu_pd(r+i,vt);
    }
}

// XXX: Could store ty here and reuse for compression later
int poly_cannotcompress(const poly y, const poly z)
{
  int i;
  poly ty;
  __m256d vt,vc,pinv,p;
  crypto_int32 d=0;
  const crypto_int32 upper_bound =  (((PARAM_P-1)/2)-PARAM_KM32); 
  const crypto_int32 lower_bound = -(((PARAM_P-1)/2)-PARAM_KM32);
        
  pinv = _mm256_set_pd(PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE);
  p    = _mm256_set_pd(8383489., 8383489., 8383489., 8383489.);
  
  //map coefficients of y into the range from -(p-1)/2 to (p-1)/2
  for(i=0;i<POLY_DEG;i+=4)
  {
    vt = _mm256_loadu_pd(y+i);
    vc = _mm256_mul_pd(vt, pinv);
    vc = _mm256_round_pd(vc,0x08);
    vc = _mm256_mul_pd(vc, p);
    vt = _mm256_sub_pd(vt,vc);
    _mm256_storeu_pd(ty+i,vt);
  }

  // count coefficients outside the bounds
  for(i = 0; i<POLY_DEG;i++)
  {
    d += ((upper_bound - (crypto_int32)ty[i]) >> 31) & 1;
    d += (((crypto_int32)ty[i] - lower_bound) >> 31) & 1;
  }
  return ((6-d) >> 31) & 1;
}


//return 0 for success, -1 for fail
// All coefficients of z have to be in [0,k-32] or [p-(k-32),p-1] 
void poly_compress(unsigned char r[POLY_DEG/4+6*2], const poly y, const poly z)
{
  int i,j,o=POLY_DEG/4;
  poly ty, tz;
  double cz[4];
  __m256d vy,vz,vt,vc,pinv,p,vlow,vlowinv;

  pinv = _mm256_set_pd(PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE, PARAM_APPROX_P_INVERSE);
  p    = _mm256_set_pd(8383489., 8383489., 8383489., 8383489.);
  vlow = _mm256_set_pd(2*(double)PARAM_KM32+1, 2*(double)PARAM_KM32+1, 2*(double)PARAM_KM32+1, 2*(double)PARAM_KM32+1);
  vlowinv = _mm256_set_pd(1/(2*(double)PARAM_KM32+1), 1/(2*(double)PARAM_KM32+1), 1/(2*(double)PARAM_KM32+1), 1/(2*(double)PARAM_KM32+1));

  //map coefficients of z and y into the range from -(p-1)/2 to (p-1)/2
  for(i=0;i<POLY_DEG;i+=4)
  {
    vt = _mm256_loadu_pd(y+i);
    vc = _mm256_mul_pd(vt, pinv);
    vc = _mm256_round_pd(vc,0x08);
    vc = _mm256_mul_pd(vc, p);
    vt = _mm256_sub_pd(vt,vc);
    _mm256_storeu_pd(ty+i,vt);
  }

  for(i=0;i<POLY_DEG;i+=4)
  {
    vt = _mm256_loadu_pd(z+i);
    vc = _mm256_mul_pd(vt, pinv);
    vc = _mm256_round_pd(vc,0x08);
    vc = _mm256_mul_pd(vc, p);
    vt = _mm256_sub_pd(vt,vc);
    _mm256_storeu_pd(tz+i,vt);
  }

  for(i = 0; i<POLY_DEG;i+=4)
  {
    r[i/4] = 0;
    {
      vy = _mm256_load_pd(ty+i);
      vz = _mm256_load_pd(tz+i);
      vt = _mm256_mul_pd(vy, vlowinv);
      vt = _mm256_round_pd(vt, 0x08);
      vt = _mm256_mul_pd(vt, vlow);
      vt = _mm256_sub_pd(vy, vt);
      vt = _mm256_add_pd(vt, vz);
      _mm256_storeu_pd(cz, vt);

      for(j=0;j<4;j++)
      {
        if(ty[i+j] > (((PARAM_P-1)/2)-PARAM_KM32) || ty[i+j] < -(((PARAM_P-1)/2)-PARAM_KM32))
        {
          // This assumes that the polynomial can be compressed, i.e. that poly_cannotcompress returned 0
          r[i/4] ^= 0x3 << (2*j);
          if(tz[i+j] > PARAM_KM32) tz[i+j] -= PARAM_P;
          *(crypto_int16 *)(r+o) = (crypto_int16) tz[i+j];
          o+=2;
        }
        else
        {
          if(cz[j] > PARAM_KM32)
            r[i/4] ^= 0x1 << (2*j);
          else if(cz[j] < -PARAM_KM32)
            r[i/4] ^= 0x2 << (2*j);
        }
      }
    }
  }
//  printf("d: %u\n",(o-POLY_DEG/4)/2);
}

int poly_decompress(poly r, const unsigned char a[POLY_DEG/4+6*2])
{
  int i,j,o;
  char t;

  o = POLY_DEG/4;
  for(i=0;i<POLY_DEG/4;i++)
  {
    for(j=0;j<4;j++)
    {
      t = (a[i] >> (2*j)) & 0x3;
      if(t == 0)
        r[4*i+j] = 0;
      else if(t == 1)
        r[4*i+j] = PARAM_KM32;
      else if(t == 2)
        r[4*i+j] = -PARAM_KM32;
      else if(t == 3)
      {
        if(o < (POLY_DEG/4+6*2))
        {
          r[4*i+j] = (double)(*(crypto_int16 *)(a + o));
          if(r[4*i+j] > PARAM_KM32 || r[4*i+j] < -PARAM_KM32) 
            return 0;
          o += 2;
        }
        else
          return 0;
      }
    }
  }
  return 1;
}

void poly_extract_high_bits(unsigned char hibits[POLY_DEG], poly f) /* XXX: make f const again */
{
  int i;

  __m256d vinv, t;
  double m[4];
  const double threshold = 2*PARAM_KM32+1;
  const double invthreshold = 1./threshold;

  poly_coeffreduce(f);

  vinv = _mm256_set_pd(invthreshold, invthreshold, invthreshold, invthreshold);

  for(i = 0;i<POLY_DEG;i+=4)
  {
    t = _mm256_loadu_pd(f+i);
    t = _mm256_mul_pd(t,vinv);
    t = _mm256_round_pd(t, 0x08); // round to nearest
    _mm256_storeu_pd(m, t);
    //first byte sufficient because sufficient because floor((p-1)/2*k+1) = 255 
    hibits[i+0] = (char)m[0];
    hibits[i+1] = (char)m[1];
    hibits[i+2] = (char)m[2];
    hibits[i+3] = (char)m[3];
  }

}


void poly_print(const poly f)
{
  int i;
  for(i=0; i<POLY_DEG; i++){
    printf("%0.f ", f[i]);
  }
}
