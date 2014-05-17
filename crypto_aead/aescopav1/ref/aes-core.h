/*
 * AES-128 implementation, adapted from https://code.google.com/p/aes128-byte-oriented/
 *
 * Authors:
 * - Filippo Sironi (filippo.sironi@gmail.com)
 * - Matteo Villa (villa.matteo@gmail.com)
 *
 * New BSD License
 */

#ifndef __AES_CORE_H
#define __AES_CORE_H

void aesc_keyexp(const uint8_t key[], uint8_t key_sched[]);

void aesc_encrypt(const uint8_t plain_text[], uint8_t cipher_text[], const uint8_t key_sched[]);
void aesc_decrypt(const uint8_t cipher_text[], uint8_t plain_text[], const uint8_t key_sched[]);

#endif
