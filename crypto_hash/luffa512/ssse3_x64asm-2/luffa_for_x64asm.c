/*
 * luffa_for_x64asm.c
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

#include "luffa_for_x64asm.h"
#include "luffa_x64asm.h"


static void Update256(hashState *state, const BitSequence *data, DataLength databitlen); 
static void Update384(hashState *state, const BitSequence *data, DataLength databitlen);
static void Update512(hashState *state, const BitSequence *data, DataLength databitlen);
static void process_last_msgs256(hashState *state);
static void process_last_msgs384(hashState *state);
static void process_last_msgs512(hashState *state);


HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval) 
{
    hashState state;
    HashReturn ret;

    ret = Init(&state, hashbitlen);
    if (ret != SUCCESS) {
        return ret;
    }

    ret = Update(&state, data, databitlen);
    if (ret != SUCCESS) {
        return ret;
    }

    ret = Final(&state, hashval);
    if (ret != SUCCESS) {
        return ret;
    }
    return SUCCESS;
}

HashReturn Init(hashState *state, int hashbitlen)
{
    int i;
    state->hashbitlen = hashbitlen;

    switch(hashbitlen) {
        case 224:
        case 256:
            luffa256_init(state->chainv);
            break;

        case 384:
            luffa384_init(state->chainv);
            break;

        case 512:
            luffa512_init(state->chainv);
            break;

        default:
            return BAD_HASHBITLEN;
    }

    state->bitlen[0] = 0;
    state->bitlen[1] = 0;
    state->rembitlen = 0;

    for (i=0;i<8;i++) {
        state->buffer[i] = 0;
    }

    return SUCCESS;
}

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
    HashReturn ret=SUCCESS;

    switch(state->hashbitlen) {
        case 224:
        case 256:
            Update256(state, data, databitlen);
            break;
        case 384:
            Update384(state, data, databitlen);
            break;
        case 512:
            Update512(state, data, databitlen);
            break;
        default:
            ret = BAD_HASHBITLEN;
            break;
    }

    return ret;
}

static void Update256(hashState *state, const BitSequence *data, DataLength databitlen) 
{
    uint64 round_num;
    uint32 cpylen;
    uint32 len;
    uint32 i;
    uint8 *p = (uint8*)state->buffer;

    state->bitlen[0] += databitlen;

    if (state->rembitlen + databitlen >= MSG_BLOCK_BIT_LEN) {
        cpylen = MSG_BLOCK_BYTE_LEN - (state->rembitlen >> 3);

        if (!state->rembitlen) {
            for (i=0;i<8;i++) {
                state->buffer[i] = ((uint32*)data)[i];
            }
        } else {
            for (i=0;i<cpylen;i++) {
                ((uint8 *)state->buffer)[(state->rembitlen >> 3) + i] = data[i];
            }
        }

        luffa256(state->chainv, (uint8*)state->buffer, 1);

        databitlen -= (cpylen << 3);
        data += cpylen;
        state->rembitlen = 0;

        round_num = databitlen / MSG_BLOCK_BIT_LEN;

        if (round_num > 0) {
            luffa256(state->chainv, data, round_num);
        }

        databitlen -= (MSG_BLOCK_BIT_LEN * round_num);
        data += (MSG_BLOCK_BYTE_LEN * round_num);
    }

    /* All remaining data copy to buffer */
    if (databitlen) {
        len = databitlen >> 3;
        if (databitlen % 8 != 0) {
            len += 1;
        }

        for (i=0;i<len;i++) {
            p[state->rembitlen/8+i] = data[i];
        }
        state->rembitlen += databitlen;
    }

    return;
}

static void Update384(hashState *state, const BitSequence *data, DataLength databitlen) 
{
    uint64 round_num;
    uint32 cpylen;
    uint32 len;
    uint32 i;
    uint8 *p = (uint8*)state->buffer;

    if((state->bitlen[1] += databitlen)<databitlen) {
        state->bitlen[0] += 1;
    }

    if (state->rembitlen + databitlen >= MSG_BLOCK_BIT_LEN) {
        cpylen = MSG_BLOCK_BYTE_LEN - (state->rembitlen >> 3);

        if(!state->rembitlen) {
            for (i=0;i<8;i++) {
                state->buffer[i] = ((uint32*)data)[i];
            }
        } else {
            for (i=0;i<cpylen;i++) {
                ((uint8*)state->buffer)[(state->rembitlen >> 3) + i] = data[i];
            }
        }

        luffa384(state->chainv, (uint8*)state->buffer, 1);

        databitlen -= (cpylen << 3);
        data += cpylen;
        state->rembitlen = 0;

        round_num = databitlen / MSG_BLOCK_BIT_LEN;

        if (round_num > 0) {
            luffa384(state->chainv, data, round_num);
        }

        databitlen -= (MSG_BLOCK_BIT_LEN * round_num);
        data += (MSG_BLOCK_BYTE_LEN * round_num);
    }

    /* All remaining data copy to buffer */
    if (databitlen) {
        len = databitlen >> 3;
        if (databitlen % 8 != 0) {
            len += 1;
        }

        for (i=0;i<len;i++) {
            p[state->rembitlen / 8 + i] = data[i];
        }
        state->rembitlen += databitlen;
    }

    return;
}

static void Update512(hashState *state, const BitSequence *data, DataLength databitlen) 
{
    uint64 round_num;
    uint32 cpylen;
    uint32 len;
    uint32 i;
    uint8 *p = (uint8*)state->buffer;

    if ((state->bitlen[1] += databitlen) < databitlen) {
        state->bitlen[0] += 1;
    }

    if (state->rembitlen + databitlen >= MSG_BLOCK_BIT_LEN) {
        cpylen = MSG_BLOCK_BYTE_LEN - (state->rembitlen >> 3);

        if(!state->rembitlen) {
            for (i=0;i<8;i++) {
                state->buffer[i] = ((uint32*)data)[i];
            }
        } else {
            for (i=0; i<cpylen; i++) {
                ((uint8 *)state->buffer)[(state->rembitlen >> 3) + i] = data[i];
            }
        }

        luffa512(state->chainv, (uint8*)state->buffer, 1);

        databitlen -= (cpylen << 3);
        data += cpylen;
        state->rembitlen = 0;

        round_num = databitlen / MSG_BLOCK_BIT_LEN;

        if (round_num > 0) {
            luffa512(state->chainv, data, round_num);
        }

        databitlen -= (MSG_BLOCK_BIT_LEN * round_num);
        data += (MSG_BLOCK_BYTE_LEN * round_num);
    }

    /* All remaining data copy to buffer */
    if (databitlen) {
        len = databitlen >> 3;
        if (databitlen % 8 != 0) {
            len += 1;
        }

        for(i=0;i<len;i++) {
            p[state->rembitlen / 8 + i] = data[i];
        }
        state->rembitlen += databitlen;
    }

    return;
}

HashReturn Final(hashState *state, BitSequence *hashval) 
{
    HashReturn ret;
    uint32 output[16];
    int i;

    switch(state->hashbitlen) {
        case 224:
            process_last_msgs256(state);
            luffa256_final(state->chainv, output);

            for(i=0;i<7;i++) ((uint32*)hashval)[i] = output[i];

            ret = SUCCESS;
            break;

        case 256:
            process_last_msgs256(state);
            luffa256_final(state->chainv, output);

            for(i=0;i<8;i++) ((uint32*)hashval)[i] = output[i];

            ret = SUCCESS;
            break;

        case 384:
            process_last_msgs384(state);
            luffa384_final(state->chainv, output);

            for(i=0;i<12;i++) ((uint32*)hashval)[i] = output[i];

            ret = SUCCESS;
            break;

        case 512:
            process_last_msgs512(state);
            luffa512_final(state->chainv, output);

            for(i=0;i<16;i++) ((uint32*)hashval)[i] = output[i];

            ret = SUCCESS;
            break;

        default:
            ret = BAD_HASHBITLEN;
            break;
    }

    return ret;
}

/******************************/
/* Process of the last blocks */
/* state: hash context        */
static void process_last_msgs256(hashState *state)
{
    uint32 tail_len;
    int i = 0;

    tail_len = ((uint32) state->bitlen[0]) % MSG_BLOCK_BIT_LEN;

    i = tail_len / 8;

    if (!(tail_len % 8)) {
        ((uint8*)state->buffer)[i] = 0x80;
    } else {
        ((uint8*)state->buffer)[i] &= (0xff << (8 - (tail_len % 8)));
        ((uint8*)state->buffer)[i] |= (0x80 >> (tail_len % 8));
    }

    i++;

    for (;i<32;i++) ((uint8*)state->buffer)[i] = 0;

    luffa256(state->chainv, (uint8*)state->buffer, 1);

    return;
}

static void process_last_msgs384(hashState *state)
{
    uint32 tail_len;
    int i = 0;

    tail_len = ((uint32) state->bitlen[1]) % MSG_BLOCK_BIT_LEN;

    i = tail_len / 8;

    if (!(tail_len % 8)) {
        ((uint8*)state->buffer)[i] = 0x80;
    } else {
        ((uint8*)state->buffer)[i] &= (0xff << (8 -(tail_len % 8)));
        ((uint8*)state->buffer)[i] |= (0x80 >> (tail_len % 8));
    }

    i++;

    for (;i<32;i++) ((uint8*)state->buffer)[i] = 0;

    luffa384(state->chainv, (uint8*)state->buffer, 1);

    return;
}

static void process_last_msgs512(hashState *state)
{
    uint32 tail_len;
    int i = 0;

    tail_len = ((uint32) state->bitlen[1]) % MSG_BLOCK_BIT_LEN;

    i = tail_len / 8;

    if (!(tail_len % 8)) {
        ((uint8*)state->buffer)[i] = 0x80;
    } else {
        ((uint8*)state->buffer)[i] &= (0xff << (8 - (tail_len % 8)));
        ((uint8*)state->buffer)[i] |= (0x80 >> (tail_len % 8));
    }

    i++;

    for (;i<32;i++) ((uint8*)state->buffer)[i] = 0;

    luffa512(state->chainv, (uint8*)state->buffer, 1);

    return;
}

