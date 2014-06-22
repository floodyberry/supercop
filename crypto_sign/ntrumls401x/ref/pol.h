/*
 * CPQREF/pol.h
 *
 *  Copyright 2013 John M. Schanck
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

#ifndef CPQREF_POL_H_
#define CPQREF_POL_H_


void
pol_gen_product(
    uint16_t        *ai,
    const uint8_t   d1,
    const uint8_t   d2,
    const uint8_t   d3,
    const uint16_t  N);


void
pol_unidrnd_pZ(
    int64_t          *v,
    const uint16_t   N,
    const int64_t    q,
    const int8_t     p);


int
pol_inv_modp(
    int64_t         *ainvp,
    const int64_t   *a,
    const uint16_t  N,
    const int64_t   p);


int
pol_inv_mod2(
    int64_t        *a_inv,
    const int64_t  *a,
    const uint16_t N);


void
pol_mul_product(
    int64_t         *c,
    const int64_t   *a,
    const uint16_t  b1i_len,
    const uint16_t  b2i_len,
    const uint16_t  b3i_len,
    const uint16_t  *bi,
    const uint16_t  N,
    int64_t         *t);


void
pol_mul_coefficients(
     int64_t         *c,
     const int64_t   *a,
     const int64_t   *b,
     const uint16_t  N,
     const uint16_t  padN,
     const  int64_t  q,
     int64_t         *tmp);


int64_t cmod(const int64_t a, const int64_t p);


#endif //CPQREF_POL_H_
