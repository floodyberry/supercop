/*
 * CPQREF/pqntrusign.h
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

#ifndef CPQREF_PQNTRUSIGN_H_
#define CPQREF_PQNTRUSIGN_H_

int
pq_gen_key(
    PQ_PARAM_SET  *params,
    size_t        *privkey_blob_len,
    unsigned char *privkey_blob,
    size_t        *pubkey_blob_len,
    unsigned char *pubkey_blob);

int
pq_sign(
    size_t              *packed_sig_len,
    unsigned char       *packed_sig,
    const size_t        private_key_len,
    const unsigned char *private_key_blob,
    const size_t        public_key_len,
    const unsigned char *public_key_blob,
    const size_t        msg_len,
    const unsigned char *msg);

int
pq_verify(
    const size_t        packed_sig_len,
    const unsigned char *packed_sig,
    const size_t        public_key_len,
    const unsigned char *public_key_blob,
    const size_t        msg_len,
    const unsigned char *msg);

#endif
