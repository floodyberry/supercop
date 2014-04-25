/*
 * CPASSREF/constants.h
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

#ifndef CPASSREF_CONST_H_
#define CPASSREF_CONST_H_

/* Parameters */
#define PASS_N 863
#define PASS_p 1040779
#define PASS_g 21901
#define PASS_k 32767
#define PASS_b 28
#define PASS_t 444
#define PASS_pad 864
#define PASS_RADER_POLY "data/863_rader.dat"
#define PASS_PERMUTATION "data/863_perm.dat"
#define PASS_EVAL_POINTS "data/863_points.dat"

#define UNSAFE_RAND_N (65536 - (65536 % PASS_N))
#define UNSAFE_RAND_k (65536 - (65536 % (2 * PASS_k + 1)))

/* Basic parameter checks */
#if (PASS_k) & (PASS_k + 1)
#error "Parameter k should be one less than a power of two"
#endif

/* Limit required by mknoise in sign.c */
#if PASS_k >= 32768
#error "Parameter k too large."
#endif

/* Limit required by formatc */
#if PASS_b >= 64
#error "Parameter b too large."
#endif

#endif
