/*
    This file is part of the mqq-sig package for SUPERCOP.
    Copyright (C) 2010 Rune E. Jensen (runeerle@stud.ntnu.no), 
	               Danilo Gligoroski (danilog@item.ntnu.no)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#ifndef MQQ_H
#define MQQ_H

#include <sys/types.h>
#include <stdint.h>

// Enables the main() that makes key-pair files.
#define MAIN_KEYGEN 0

// Select stand-alone or supercop build environment.
#define MQQ_SUPERCOP_BUILD 1

/*
 N selects the bit size, for example N=160 gives MQQSIG160.
 The current implementation do not handle small values of N the way its supposed too.
 The lowest N that works for the entire key-gen, sign and verify chain is 80.
 For some values of N (like 88, 136) the determinant of S seems to always be 0,
 preventing key generation from completing.
*/
#define N 192

// Precompute look-up tables from the private key.
// This increases the signature speed significantly but is not suitable for smart-cards implementations
#define PRIVATE_KEY_LOOKUP_TABLES 1

// Select the number of bytes stored in each row of the public key.
// Padded with zeroes if needed for performance reasons (SSE2).
#if N==160
// MQQ160 only, for SSE code path:
#define PUBLICKEY_SIZE_S (128/8)
#else
// Other standard sizes:
#define PUBLICKEY_SIZE_S (((N*3)/4)/8)
#endif

// Select how many rows to include in the public key.
#define PUBLICKEY_ROWS_TO_STORE ((N*3)/4)


// The ranks of the quasigroup h1 must all have this value, or greater. Affects key generation
// speed and (possibly) the security.
// Conditions (3a) and (3b) in the Technical Description Paper
#define MIN_RANK_QUASIGROUP 12
// The max rank is only intended to be changed for debugging (MQQ cracking).
#define MAX_RANK_QUASIGROUP 16
// At least one of the ranks in h1 must be this value.
// Note: Ranks are always even, and can never be larger than 14. 
#define MIN_RANK_ONCE_QUASIGROUP 14
// Set minimum count of the number of MIN_RANK_ONCE_QUASIGROUP
#define MIN_RANK_ONCE_QUASIGROUP_COUNT 1

#if N <= 256
#define SIGMA_ELEMENT_BYTE_SIZE 1
typedef uint8_t uint_sigma;
#else
#define SIGMA_ELEMENT_BYTE_SIZE 2
typedef uint16_t uint_sigma;
#endif

#if N < 256
typedef uint8_t uint_sigma_calc;
#else
typedef uint16_t uint_sigma_calc;
#endif


// Example: for N=160, 1+160+(160*160-160)/2 = 12881
#define SYMBOLIC_NN_SIZE (1+N+(N*N-N)/2)
#define PUBLICKEY_SIZE_L (SYMBOLIC_NN_SIZE+1)
#define PUBLICKEY_FIRST_ROW (N-PUBLICKEY_ROWS_TO_STORE)
#define PUBLICKEY_LAST_ROW (PUBLICKEY_FIRST_ROW+PUBLICKEY_ROWS_TO_STORE)

#define PUBLIC_KEY_SIZE_BYTES (PUBLICKEY_SIZE_L*PUBLICKEY_SIZE_S)

#if PRIVATE_KEY_LOOKUP_TABLES == 0
#define PRIVATE_KEY_SIZE_BYTES (N*SIGMA_ELEMENT_BYTE_SIZE*2+9*9)
#elif PRIVATE_KEY_LOOKUP_TABLES == 1
#define PRIVATE_KEY_SIZE_BYTES (N*SIGMA_ELEMENT_BYTE_SIZE*2+9*9)
//#define PRIVATE_KEY_SIZE_BYTES (N*SIGMA_ELEMENT_BYTE_SIZE*2+9*9+2*256*256)
#else
#error "PRIVATE_KEY_LOOKUP_TABLES is out of range"
#endif


#if N < 80
#error "N is too low!"
#endif

#if PUBLICKEY_ROWS_TO_STORE > N
#error "Number of rows (PUBLICKEY_ROWS_TO_STORE) greater than N"
#endif

#if PUBLICKEY_ROWS_TO_STORE > PUBLICKEY_SIZE_S*8
#error "Public key size (PUBLICKEY_SIZE_S) to small"
#endif

#if PUBLICKEY_ROWS_TO_STORE % 8 > 0
#error "Public key size (PUBLICKEY_ROWS_TO_STORE) must be a factor of 8."
#endif

#if PUBLICKEY_LAST_ROW > N
#error "PUBLICKEY_LAST_ROW is out of range"
#endif

#if N < PUBLICKEY_SIZE_S*8
#error "Public key size (PUBLICKEY_SIZE_S) too large."
#endif

#if PUBLICKEY_SIZE_S < 0
#error "Public key size (PUBLICKEY_SIZE_S) too small."
#endif

// Print/debug related options [0,1]:
#define SYMBOLIC_INDEX_START 1
// Select the print style (~Mathematica or ~Magma), for some arrays only [0,1]:
#define MAGMA_STYLE 1

// 0 - No printing
// 1 - Random seed only
// 2 - Private key
// 5 - Various stuff
// 10 - All data not thrown away
// 20 - All data (like failed Candidates and quasigroups)
#define PRINT_LEVEL 0

// Print xx before multiplication
#define PRINT_XX 0

// Print xxFinale
#define PRINT_XX_Finale 0


/* 
This is the private key of MQQ defined by one 
multivariate quadratic quasigroup of order 2^8 given 
as 81 uint8_ts and one non-singular matrix SInv
given as two arrays of random permutations 
sigma1[] and sigmaK[].
*/
uint8_t __attribute__ ((aligned (16))) mqq_a[9*9-1+1];
//uint8_t *mqq_a;
uint8_t __attribute__ ((aligned (16))) cc1[9];
uint8_t __attribute__ ((aligned (16))) cc2[9];

/* The matrix SInv is stored in ROM as two one-dimensional 
arrays sigma1[] and sigmaK[] of N uint8_t's (or uint16_t's if N > 256).
In a minimal design only ceil(log2(N))*N*2 bits are needed */
uint_sigma __attribute__ ((aligned (16))) mqq_sigma1[N];
uint_sigma __attribute__ ((aligned (16))) mqq_sigmaK[N];
//uint_sigma *mqq_sigma1;
//uint_sigma *mqq_sigmaK;


// The look-up tables for the private key. Only used if enabled with PRIVATE_KEY_LOOKUP_TABLES
uint8_t __attribute__ ((aligned (16))) lookup_table_private_key[256*256*2];


#endif /*  MQQ_H */
