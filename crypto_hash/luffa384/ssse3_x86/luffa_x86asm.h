/*
 * luffa_x86asm.h
 * Version 2.0 (Sep 15th 2009)
 *
 * Copyright (C) 2008-2009 Hitachi, Ltd. All rights reserved.
 *
 * Hitachi, Ltd. is the owner of this software and hereby grant
 * the U.S. Government and any interested party the right to use
 * this software for the purposes of the SHA-3 evaluation process,
 * notwithstanding that this software is copyrighted.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#ifndef _LUFFA_X86ASM_H_
#define _LUFFA_X86ASM_H_

#include "typedefs.h"

void luffa256_init(uint32 *chainv);
void luffa384_init(uint32 *chainv);
void luffa512_init(uint32 *chainv);

void luffa256(uint32 *chainv, const uint8 *msg, uint32 round_num);
void luffa384(uint32 *chainv, const uint8 *msg, uint32 round_num);
void luffa512(uint32 *chainv, const uint8 *msg, uint32 round_num);

void luffa256_final(uint32 *chainv, uint32 *hashval);
void luffa384_final(uint32 *chainv, uint32 *hashval);
void luffa512_final(uint32 *chainv, uint32 *hashval);

#endif  /* _LUFFA_X86ASM_H_ */
