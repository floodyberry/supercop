/*
 * CPASSREF/formatc.c
 *
 *  Copyright 2013 John M. Schanck
 *
 *  This file is part of CPASSREF.
 *
 *  CPASSREF is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  CPASSREF is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with CPASSREF.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdlib.h>
#include <string.h>

#include "constants.h"
#include "pass_types.h"
#include "hash.h"
#include "formatc.h"

/* TODO: Standardize a format function */

int
formatc(b_sparse_poly *c, const unsigned char *digest)
{
  int i;
  int j;
  uint64 v;
  unsigned int indx;
  unsigned char pool[HASH_BYTES];
  unsigned char hash_state[HASH_BYTES];

  memcpy(pool, digest, HASH_BYTES);

/*XXX: Maximum b = 64 */
  v =  pool[0]; v <<= 8;
  v |= pool[1]; v <<= 8;
  v |= pool[2]; v <<= 8;
  v |= pool[3]; v <<= 8;
  v |= pool[4]; v <<= 8;
  v |= pool[5]; v <<= 8;
  v |= pool[6]; v <<= 8;
  v |= pool[7];

  i=0;
  j = 8;
  while(i < PASS_b){
    if(j >= (HASH_BYTES - 1)) {
      j = 0;
      memcpy(hash_state, pool, HASH_BYTES);
      crypto_hash_sha512(pool, hash_state, HASH_BYTES);
      continue;
    }

    indx = ((pool[j] << 8) | (pool[j+1]));
    j += 2;

    if(indx >= UNSAFE_RAND_N) continue;

    indx %= PASS_N;

    if(c->val[indx] != 0) continue;

    c->ind[i] = indx;
    c->val[indx] = 2 * (v & 0x01) - 1;
    v >>= 1;
    i++;
  }

  return 0;
}
