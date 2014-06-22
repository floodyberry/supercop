/*
 * CPQREF/params.h
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

#ifndef CPQREF_PARAMS_H_
#define CPQREF_PARAMS_H_

typedef enum _PQ_PARAM_SET_ID PQ_PARAM_SET_ID;
typedef const struct _PQ_PARAM_SET  PQ_PARAM_SET;


enum _PQ_PARAM_SET_ID {
    DRAFT_401,
    DRAFT_439,
    DRAFT_593,
    DRAFT_743,
};


struct _PQ_PARAM_SET {
  PQ_PARAM_SET_ID  id;          /* parameter set id */
  const char       *name;       /* human readable name */
  const uint8_t    OID[3];      /* OID */
  uint8_t          N_bits;      /* ceil(log2(N)) */
  uint8_t          q_bits;      /* ceil(log2(q)) */
  uint16_t         N;           /* ring degree */
  int8_t           p;           /* message space prime */
  int64_t          q;           /* ring modulus */
  int64_t          B_s;         /* max norm of f*a convolution */
  int64_t          B_t;         /* max norm of g*a convolution */
  int64_t          norm_bound_s;/* q/2 - B_s */
  int64_t          norm_bound_t;/* q/2 - B_t */
  uint8_t          d1;          /* Product form +1/-1 counts */
  uint8_t          d2;
  uint8_t          d3;
  uint16_t         padded_N;    /* # Polynomial coefficients for Karatsuba */
};


PQ_PARAM_SET *
pq_get_param_set_by_id(PQ_PARAM_SET_ID id);

PQ_PARAM_SET *
pq_get_param_set_by_oid(const uint8_t *oid);

#endif
