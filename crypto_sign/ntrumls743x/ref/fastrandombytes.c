/*
 * CPQREF/fastrandombytes.c
 *
 *  Copyright 2014 John M. Schanck
 *
 *  This file is part of CPQREF.
 *
 *  CPQREF is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  CPQREF is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with CPQREF.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdlib.h>
#include <stdint.h>

#include "crypto_stream_salsa20.h"
#include "shred.h"
#include "randombytes.h"

#define RAND_LEN_BYTES (4096)

static int init = 0;
static unsigned char key[crypto_stream_salsa20_KEYBYTES];
static unsigned char nonce[crypto_stream_salsa20_NONCEBYTES] = {0};
static unsigned char randpool[RAND_LEN_BYTES];
static uint16_t randpos = RAND_LEN_BYTES;


/* fastrandombytes from:
 * lattisigns512-20130329/fastrandombytes.c
 * Author: Gim Güneysu, Tobias Oder, Thomas Pöppelmann, Peter Schwabe
 * Public Domain
 */
void
fastrandombytes(unsigned char *r, unsigned long long rlen)
{
  unsigned long long n=0;
  uint8_t i;
  if(!init)
  {
    randombytes(key, crypto_stream_salsa20_KEYBYTES);
    init = 1;
  }
  crypto_stream_salsa20(r,rlen,nonce,key);

  // Increase 64-bit counter (nonce)
  for(i=0;i<8;i++)
    n ^= ((unsigned long long)nonce[i]) << 8*i;
  n++;
  for(i=0;i<8;i++)
    nonce[i] = (n >> 8*i) & 0xff;
}


void rng_cleanup()
{
  if(init)
  {
    init = 0;
    shred(key, crypto_stream_salsa20_KEYBYTES);
    shred(nonce, crypto_stream_salsa20_KEYBYTES);
    shred(randpool, crypto_stream_salsa20_KEYBYTES);
  }
}


void
rng_init()
{
  fastrandombytes(randpool, RAND_LEN_BYTES);
  randpos = 0;
}


void
rng_uint16(uint16_t *r)
{
  if(randpos >= (RAND_LEN_BYTES - sizeof(uint16_t)))
  {
    fastrandombytes(randpool, RAND_LEN_BYTES);
    randpos = 0;
  }
  *r = (uint16_t)(randpool[randpos++] & 0xff) << 8;
  *r |= (uint16_t)(randpool[randpos++] & 0xff);

  return;
}


void
rng_uint64(uint64_t *r)
{
  if(randpos >= RAND_LEN_BYTES - sizeof(uint64_t))
  {
    fastrandombytes(randpool, RAND_LEN_BYTES);
    randpos = 0;
  }
  *r  = ((uint64_t)(randpool[randpos++] & 0xff)) << 070;
  *r |= ((uint64_t)(randpool[randpos++] & 0xff)) << 060;
  *r |= ((uint64_t)(randpool[randpos++] & 0xff)) << 050;
  *r |= ((uint64_t)(randpool[randpos++] & 0xff)) << 040;
  *r |= ((uint64_t)(randpool[randpos++] & 0xff)) << 030;
  *r |= ((uint64_t)(randpool[randpos++] & 0xff)) << 020;
  *r |= ((uint64_t)(randpool[randpos++] & 0xff)) << 010;
  *r |= ((uint64_t)(randpool[randpos++] & 0xff));

  return;
}
