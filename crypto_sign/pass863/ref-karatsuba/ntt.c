/*
 * CPASSREF/ntt.c
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
#include "poly.h"
#include "ntt.h"

static const int64 nth_roots[PASS_pad] = {
#include PASS_RADER_POLY
    };

static const int64 perm[NTT_LEN+1] = {
#include PASS_PERMUTATION
  , 1};


/* Space efficient Karatsuba multiplication.
 * See: Thomé, "Karatsuba multiplication with temporary space of size \le n"
 * http://www.loria.fr/~thome/files/kara.pdf
 *
 * Note: Inputs should be of smooth length with many 2's. (i.e. 2^u*3^v)
 */
static int
karatsuba(int64 *res, int64 *tmp, const int64 *a, const int64 *b, const int64 k)
{
  /* Assumes k is even */
  int64 i;
  int64 j;
  const int64 p = k>>1;

  /* Grade school multiplication for small / odd inputs */
  if(k <= 38 || k%2 != 0) {
    memset(res, 0, 2*k*sizeof(int64));
    for(i=0; i<k; i++) {
      if(a[i] == 0) continue;
      for(j=0; j<k; j++) {
        res[i+j] += a[i]*b[j];
      }
    }

    return 0;
  }

  /* res = [[c = al - ah]/p [d = bl - bh]/p [__]/2p] */
  /* tmp = [[__]/2p] */
  for(i=0; i<p; i++){
    res[i] = a[i] - a[i+p];
    res[i+p] = b[i+p] - b[i];
  }

  /* res = [[c]/p [d]/p [__]/2p] */
  /* tmp = [[c*d]/2p] */
  karatsuba(tmp, res+k, res, res+p, p);

  /* res = [[__]/p [__]/p [h = H{a}*H{b}]/2p] */
  /* tmp = [[c*d]/2p] */
  karatsuba(res+k,res,a+p,b+p,p);

  /* res = [[__]/p [__]/p [h]/2p] */
  /* tmp = [[L{c*d} L{h}]/p [H{c*d} + H{h}]/p] */
  for(i=0; i<k; i++) {
    tmp[i] += res[k+i];
  }

  /* res = [[__]/p [L{c*d} + L{h}]/p [h]/2p] */
  /* tmp = [[L{c*d} L{h}]/p [H{c*d} + H{h}]/p] */
  memcpy(res+p,tmp,p*sizeof(int64));

  /* res = [[__]/p [L{c*d} + L{h}]/p [L{h} + H{c*d} + H{h}]/p [H{h}]/p] */
  /* tmp = [[L{c*d} L{h}]/p [H{c*d} + H{h}]/p] */
  for(i=0; i<p; i++) {
    res[k+i] += tmp[p+i];
  }

  /* res = [[__]/p [L{c*d} + L{h}]/p [L{h} + H{c*d} + H{h}]/p [H{h}]/p] */
  /* tmp = [[l = L{a}*L{b}]/2p] */
  karatsuba(tmp,res,a,b,p);

  /* res = [[L{l}]/p [L{c*d} + L{h}]/p [L{h} + H{c*d} + H{h}]/p [H{h}]/p] */
  /* tmp = [[L{l}]/p [H{l}]/p] */
  memcpy(res,tmp,p*sizeof(int64));

  /* res = [[L{l}]/p [H{l} + L{c*d} + L{h}]/p [L{h} + H{c*d} + H{h}]/p [H{h}]/p] */
  /* tmp = [[L{l}]/p [H{l}]/p] */
  for(i=0; i<p; i++) {
    res[p+i] += tmp[i] + tmp[p+i];
  }

  /* res = [[L{l}]/p [H{l} + L{l} + L{h} + L{c*d}]/p [L{h} + H{l} + H{h} + H{c*d}]/p [H{h}]/p]
         = [[L{l}]/p [H{l} + L{a}*H{b} + L{b}*H{a} + L{h}]/2p [H{h}]/p]
     tmp = [[L{L{a}*L{b}}]/p [H{L{a}*L{b}}]/p] */
  for(i=p; i<k; i++) {
    res[p+i] += tmp[i];
  }

  return 0;
}

int
ntt(int64 *Fw, const int64 *w)
{
  int64 i;
  int64 res[2*PASS_pad];
  int64 tmp[PASS_pad];
  int64 a[PASS_pad];

  for(i=0; i<NTT_LEN; i++){
    a[i] = w[perm[i]];
  }
  for(i=NTT_LEN; i<PASS_pad; i++){
    a[i] = 0;
  }

  karatsuba(res, tmp, a, nth_roots, PASS_pad);

  for(i=0; i<NTT_LEN; i++) {
    Fw[perm[NTT_LEN-i]] = cmod(w[0] + res[i] + res[i+NTT_LEN]);
  }

  return 0;
}
