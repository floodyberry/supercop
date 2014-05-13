/*
 * Kiasu= bitslice C Implementation
 * 
 * Copyright 2014:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 *     Ivica Nikolic <INikolic@ntu.edu.sg>
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 * 
 */

#include <stdint.h>

/* Kiasu high-level operations */
void kiasu_aead_encrypt(const uint8_t *ass_data, size_t ass_data_len, 
			            const uint8_t *message, size_t m_len, 
			            const uint8_t *key, 
			            const uint8_t *nonce, 
			            uint8_t *ciphertext, size_t *c_len);

int  kiasu_aead_decrypt(const uint8_t *ass_data, size_t ass_data_len, 
			            uint8_t *message, size_t *m_len, 
			            const uint8_t *key, 
			            const uint8_t *nonce, 
			            const uint8_t *ciphertext, size_t c_len);
