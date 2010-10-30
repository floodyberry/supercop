/* hash.c */
/*
    This file is part of the bg-generic packet for SUPERCOP.
    Copyright (C) 2010  Daniel Otte (daniel.otte@rub.de)

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

#include "crypto_hash.h"
#include "bmw_small.h"

int crypto_hash(
	unsigned char *out,
	const unsigned char *in,
	unsigned long long inlen
   )
{
	bmw_small_ctx_t ctx;
	bmw256_init(&ctx);
	while(inlen>=BMW256_BLOCKSIZE_B){
		bmw256_nextBlock(&ctx, in);
		inlen -= BMW256_BLOCKSIZE_B;
		in += BMW256_BLOCKSIZE_B;	
	}
	bmw256_lastBlock(&ctx, in, inlen*8);
	bmw256_ctx2hash(out, &ctx);
	return 0;
}

