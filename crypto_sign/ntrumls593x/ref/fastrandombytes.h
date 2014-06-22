/*
 * CPQREF/fastrandombytes.c
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

#ifndef CPQREF_FASTRANDOMBYTES_H_
#define CPQREF_FASTRANDOMBYTES_H_

void fastrandombytes(unsigned char *r, unsigned long long rlen);

void rng_init();
void rng_cleanup();
void rng_uint16(uint16_t *r);
void rng_uint64(uint64_t *r);

#endif
