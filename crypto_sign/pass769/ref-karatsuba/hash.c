/*
 * CPASSREF/hash.c
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

#include <string.h>

#include "constants.h"
#include "pass_types.h"
#include "hash.h"
#include "pass.h"

int
hash(unsigned char *h, const int64 *y, const unsigned char *msg_digest)
{
  int i;
  unsigned char in[PASS_t + HASH_BYTES];
  unsigned char *pos = in + HASH_BYTES;

  memcpy(in, msg_digest, HASH_BYTES);

  for(i=0; i<PASS_t; i++) {
    *pos = (unsigned char) (y[S[i]] & 0xff);
    pos++;
  }

  crypto_hash_sha512(h, in, PASS_t + HASH_BYTES);

  return 0;
}

