/**
 * AES-128TS.h
 *
 * @author Daniel Penazzi
 *
 * Optimised ANSI C code for AES with key of only 128 bits,
 *  Based on version 3.0 (December 2000)
 * of rijndael-alg-fst.h made by authors Vincent Rijmen 
 *  Antoon Bosselaers 
 * and Paulo Barreto 
 * however there are several significant changes explained in the .c file
 *
 * This code is hereby placed in the public domain.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ''AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef __AES_128TS_H
#define __AES_128TS_H

typedef unsigned char u8;	

#if __GNUC__ || (__STDC_VERSION__ >= 199901L)
#include <stdint.h>
typedef uint64_t u64;
typedef uint32_t u32;
#else
typedef unsigned long long u64;
typedef unsigned int u32;
#endif





int rijndaelKeySetupEnc(u32 rk[44], u32 cipherKey[4]);
void rijndaelEncrypt( u32 rk[44],  u32 pt[4], u32 ct[4]);
void rijndaelDecrypt( u32 rk[44],  u32 ct[4], u32 pt[4]);
/*multiply  rk by the inverse of AES matrix*/
u32 INVERT(u32 rk);
/*converts encryption keys to decryption keys*/
void CONVERT2DECKEY(u32* erk,u32* drk);

/*===========
above are for normal AES, below is for Silver specifically
===========*/
void SilverEncrypt( u32 pt[4], u32 ct[4],u32 rk[44],u32 counter[4]);
void SilverDecrypt( u32 ct[4], u32 pt[4],u32 rk[44],u32 counter[4]);



#endif /*  __AES_128TS_H */
