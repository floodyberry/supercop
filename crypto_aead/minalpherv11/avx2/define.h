/*
  Minalpher v1.1 header file for optimized code on AVX2 environment version 1.1.0

Copyright (c) 2014-2015
NTT (Nippon Telegraph and Telephone Corporation)
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


/*== include ==*/
#include"api.h"
#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<string.h>
#include<iostream>
#ifdef _MSC_VER
  #include <Windows.h>
  #include <intrin.h>
  #include <immintrin.h>
  #define cpuid    __cpuid
  #pragma intrinsic(__rdtsc)
#else
  #include <x86intrin.h>
  //  GCC Inline Assembly
  inline void __cpuid(int CPUInfo[4],int InfoType){
    __asm__ __volatile__ (
      "cpuid":
      "=a" (CPUInfo[0]),
      "=b" (CPUInfo[1]),
      "=c" (CPUInfo[2]),
      "=d" (CPUInfo[3]) :
      "a" (InfoType)
    );
  }
#endif

/*== alignment ==*/
#ifdef _MSC_VER
  #define MIE_ALIGN(x) __declspec(align(x))
#else
  #define MIE_ALIGN(x) __attribute__((aligned(x)))
  inline void *_aligned_malloc(size_t size, size_t alignment)
  {
    void *p;
    int ret = posix_memalign(&p, alignment, size);
    return (ret == 0) ? p : 0;
  }
  #define _aligned_free(a) free(a)
#endif
#define ROUND 17




/*==== Macros ====*/
#define Copy(p1,p2,n) do{int u; for( u=0; u<n; u++ ) p1[u]  = p2[u];}while(0)
#define Xor(p1,p2,n)  do{int u; for( u=0; u<n; u++ ) p1[u] ^= p2[u];}while(0)
#define Clear(p,n)    do{int u; for( u=0; u<n; u++ ) p[u] = 0x00;}while(0)

/*==== System parameters ====*/
#define BLOCK_SIZE 32
#define TAGBYTES   16
#define RNUM       17

#define FLG_AD  0x00
#define FLG_M   0x40
#define FLG_MAC 0x80

/*== Directions of Permutation ==*/
#define FORWARD  0
#define BACKWARD 1
