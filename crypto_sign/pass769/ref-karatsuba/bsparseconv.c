/*
 * CPASSREF/bsparseconv.c
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

#include "constants.h"
#include "pass_types.h"
#include "bsparseconv.h"

/* Computes c += a*b for a sparse trinary polynomial b */
int
bsparseconv (int64 *c, const char *a, const b_sparse_poly *b)
{
  int64 i = 0;
  int64 j = 0;
  int64 k = 0;

  for (i = 0; i < PASS_b; i++) {
    k = b->ind[i];

    if(b->val[k] > 0) {
      for (j = k; j < PASS_N; j++) {
        c[j] += a[j-k];
      }
      for (j = 0; j < k; j++) {
        c[j] += a[j-k+PASS_N];
      }
    }else{ /* b->val[i] == -1 */
      for (j = k; j < PASS_N; j++) {
        c[j] -= a[j-k];
      }
      for (j = 0; j < k; j++) {
        c[j] -= a[j-k+PASS_N];
      }
    }
  }

  return 0;
}

