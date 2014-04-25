/*
 * CPASSREF/pass.h
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

#ifndef CPASSREF_PASS_H_
#define CPASSREF_PASS_H_


/* Return values for verify */
#define VALID 0
#define INVALID (-1)


static const int64 S[PASS_t] = {
#include PASS_EVAL_POINTS
  };

int
init_fast_prng();

int
mknoise(int64 *y);

int
reject(const int64 *z);


int crypto_sign_keypair(
   unsigned char *pk, unsigned char *sk
 );

int crypto_sign(
   unsigned char *sm,unsigned long long *smlen,
   const unsigned char *m,unsigned long long mlen,
   const unsigned char *sk
 );

int crypto_sign_open(
   unsigned char *m,unsigned long long *mlen,
   const unsigned char *sm,unsigned long long smlen,
   const unsigned char *pk
 );

#endif
