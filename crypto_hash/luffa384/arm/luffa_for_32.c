/*
 * luffa_for_32.c
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

#include "luffa_for_32.h"


#ifdef HASH_BIG_ENDIAN
# define BYTES_SWAP32(x) x
# define BYTES_SWAP64(x) x
#else
# define BYTES_SWAP32(x)                                                \
    ((x << 24) | ((x & 0x0000ff00) << 8) | ((x & 0x00ff0000) >> 8) | (x >> 24))

# define BYTES_SWAP64(x)                                                \
    (((u64)(BYTES_SWAP32((u32)(x))) << 32) | (u64)(BYTES_SWAP32((u32)((x) >> 32))))
#endif /* HASH_BIG_ENDIAN */

/* BYTES_SWAP256(x) stores each 32-bit word of 256 bits data in little-endian convention */
#define BYTES_SWAP256(x) {                                      \
    int _i = 8; while(_i--){x[_i] = BYTES_SWAP32(x[_i]);}   \
    }

/* BYTES_SWAP512(x) stores each 64-bit word of 512 bits data in little-endian convention */
#define BYTES_SWAP512(x) {                                      \
    int _i = 8; while(_i--){x[_i] = BYTES_SWAP64(x[_i]);}   \
    }

#define MULT2_1(a)\
    a[3] ^= a[7];\
    a[2] ^= a[7];\
    a[0] ^= a[7];

#define MULT2_2(a)\
    a[2] ^= a[6];\
    a[1] ^= a[6];\
    a[7] ^= a[6];

#define MULT2_3(a)\
    a[1] ^= a[5];\
    a[0] ^= a[5];\
    a[6] ^= a[5];

#define MULT2_4(a)\
    a[0] ^= a[4];\
    a[7] ^= a[4];\
    a[5] ^= a[4];

#define TWEAK(a,j)\
    *(a+4) = (*(a+4)<<(j))|(*(a+4)>>(32-j));\
    *(a+5) = (*(a+5)<<(j))|(*(a+5)>>(32-j));\
    *(a+6) = (*(a+6)<<(j))|(*(a+6)>>(32-j));\
    *(a+7) = (*(a+7)<<(j))|(*(a+7)>>(32-j));

#define STEP_PART(a,c,tmp)\
    SUBCRUMB(*a,*(a+1),*(a+2),*(a+3),tmp);\
    SUBCRUMB(*(a+5),*(a+6),*(a+7),*(a+4),tmp);\
    MIXWORD(*a,*(a+4));\
    MIXWORD(*(a+1),*(a+5));\
    MIXWORD(*(a+2),*(a+6));\
    MIXWORD(*(a+3),*(a+7));\
    ADD_CONSTANT(*a,*(a+4),c);

#define SUBCRUMB(a0,a1,a2,a3,a4)\
    a4  = a0;\
    a0 |= a1;\
    a2 ^= a3;\
    a1  = ~a1;\
    a0 ^= a3;\
    a3 &= a4;\
    a1 ^= a3;\
    a3 ^= a2;\
    a2 &= a0;\
    a0  = ~a0;\
    a2 ^= a1;\
    a1 |= a3;\
    a4 ^= a1;\
    a3 ^= a2;\
    a2 &= a1;\
    a1 ^= a0;\
    a0  = a4;

#define MIXWORD(a0,a4)\
    a4 ^= a0;\
    a0  = (a0<<2) | (a0>>(30));\
    a0 ^= a4;\
    a4  = (a4<<14) | (a4>>(18));\
    a4 ^= a0;\
    a0  = (a0<<10) | (a0>>(22));\
    a0 ^= a4;\
    a4  = (a4<<1) | (a4>>(31));

#define ADD_CONSTANT(a0,b0,c)\
    a0 ^= *c;\
    b0 ^= *(c+1);

void Update256(hashState *state, const BitSequence *data, DataLength databitlen);
void Update384(hashState *state, const BitSequence *data, DataLength databitlen);
void Update512(hashState *state, const BitSequence *data, DataLength databitlen);
void rnd256(hashState *state);
void rnd384(hashState *state);
void rnd512(hashState *state);
void finalization224(hashState *state, uint32 *b);
void finalization256(hashState *state, uint32 *b);
void finalization384(hashState *state, uint32 *b);
void finalization512(hashState *state, uint32 *b);
void process_last_msgs256(hashState *state);
void process_last_msgs384(hashState *state);
void process_last_msgs512(hashState *state);

/* initial values of chaining variables */
const uint32 IV[40] = {
    0x6d251e69,0x44b051e0,0x4eaa6fb4,0xdbf78465,
    0x6e292011,0x90152df4,0xee058139,0xdef610bb,
    0xc3b44b95,0xd9d2f256,0x70eee9a0,0xde099fa3,
    0x5d9b0557,0x8fc944b3,0xcf1ccf0e,0x746cd581,
    0xf7efc89d,0x5dba5781,0x04016ce5,0xad659c05,
    0x0306194f,0x666d1836,0x24aa230a,0x8b264ae7,
    0x858075d5,0x36d79cce,0xe571f7d7,0x204b1f67,
    0x35870c6a,0x57e9e923,0x14bcb808,0x7cde72ce,
    0x6c68e9be,0x5ec41e22,0xc825b7c7,0xaffb4363,
    0xf5df3999,0x0fc688f1,0xb07224cc,0x03e86cea
};

uint32 CNS[80] = {
    0x303994a6,0xe0337818,0xc0e65299,0x441ba90d,
    0x6cc33a12,0x7f34d442,0xdc56983e,0x9389217f,
    0x1e00108f,0xe5a8bce6,0x7800423d,0x5274baf4,
    0x8f5b7882,0x26889ba7,0x96e1db12,0x9a226e9d,
    0xb6de10ed,0x01685f3d,0x70f47aae,0x05a17cf4,
    0x0707a3d4,0xbd09caca,0x1c1e8f51,0xf4272b28,
    0x707a3d45,0x144ae5cc,0xaeb28562,0xfaa7ae2b,
    0xbaca1589,0x2e48f1c1,0x40a46f3e,0xb923c704,
    0xfc20d9d2,0xe25e72c1,0x34552e25,0xe623bb72,
    0x7ad8818f,0x5c58a4a4,0x8438764a,0x1e38e2e7,
    0xbb6de032,0x78e38b9d,0xedb780c8,0x27586719,
    0xd9847356,0x36eda57f,0xa2c78434,0x703aace7,
    0xb213afa5,0xe028c9bf,0xc84ebe95,0x44756f91,
    0x4e608a22,0x7e8fce32,0x56d858fe,0x956548be,
    0x343b138f,0xfe191be2,0xd0ec4e3d,0x3cb226e5,
    0x2ceb4882,0x5944a28e,0xb3ad2208,0xa1c4c355,
    0xf0d2e9e3,0x5090d577,0xac11d7fa,0x2d1925ab,
    0x1bcb66f2,0xb46496ac,0x6f2d9bc9,0xd1925ab0,
    0x78602649,0x29131ab6,0x8edae952,0x0fc053c3,
    0x3b6ba548,0x3f014f0c,0xedae9520,0xfc053c31
};


HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval) 
{
    hashState state;
    HashReturn ret;

    ret = Init(&state, hashbitlen);
    if(ret != SUCCESS) {
        return ret;
    }

    ret = Update(&state, data, databitlen);
    if(ret != SUCCESS) {
        return ret;
    }

    ret = Final(&state, hashval);
    if(ret != SUCCESS) {
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
        state->bitlen[0] = 0;
        for(i=0;i<24;i++) state->chainv[i] = IV[i];
        break;

    case 256:
        state->bitlen[0] = 0;
        for(i=0;i<24;i++) state->chainv[i] = IV[i];
        break;

    case 384:
        state->bitlen[0] = 0;
        state->bitlen[1] = 0;
        for(i=0;i<32;i++) state->chainv[i] = IV[i];
        break;

    case 512:
        state->bitlen[0] = 0;
        state->bitlen[1] = 0;
        for(i=0;i<40;i++) state->chainv[i] = IV[i];
        break;

    default:
        return BAD_HASHBITLEN;
    }

    state->rembitlen = 0;

    for(i=0;i<8;i++) state->buffer[i] = 0;

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


void Update256(hashState *state, const BitSequence *data, DataLength databitlen) 
{
    int i;
    uint8 *p = (uint8*)state->buffer;
    uint32 cpylen;
    uint32 len;

    state->bitlen[0] += databitlen;

    if(state->rembitlen + databitlen >= MSG_BLOCK_BIT_LEN) {
        cpylen = MSG_BLOCK_BYTE_LEN - (state->rembitlen >> 3);

        if(!state->rembitlen) for(i=0;i<8;i++) state->buffer[i] = ((uint32*)data)[i];
        else{ for(i=0;i<cpylen;i++) ((uint8*)state->buffer)[(state->rembitlen>>3)+i] = data[i];}

        BYTES_SWAP256(state->buffer);

        rnd256(state);

        databitlen -= (cpylen << 3);
        data += cpylen;
        state->rembitlen = 0;

        while (databitlen >= MSG_BLOCK_BIT_LEN) {
            for(i=0;i<8;i++) state->buffer[i] = ((uint32*)data)[i];

            BYTES_SWAP256(state->buffer);

            rnd256(state);

            databitlen -= MSG_BLOCK_BIT_LEN;
            data += MSG_BLOCK_BYTE_LEN;
        }
    }

    /* All remaining data copy to buffer */
    if(databitlen) {
        len = databitlen >> 3;
        if(databitlen % 8 != 0) {
            len += 1;
        }

        for(i=0;i<len;i++) p[state->rembitlen/8+i]=data[i];
        state->rembitlen += databitlen;
    }

    return;
}


void Update384(hashState *state, const BitSequence *data, DataLength databitlen) 
{
    int i;
    uint8 *p = (uint8*)state->buffer;
    uint32 cpylen;
    uint32 len;

    if((state->bitlen[1] += databitlen)<databitlen) {
        state->bitlen[0]+=1;
    }

    if(state->rembitlen + databitlen >= MSG_BLOCK_BIT_LEN) {
        cpylen = MSG_BLOCK_BYTE_LEN - (state->rembitlen >> 3);

        if(!state->rembitlen) for(i=0;i<8;i++) state->buffer[i] = ((uint32*)data)[i];
        else{ for(i=0;i<cpylen;i++) ((uint8*)state->buffer)[(state->rembitlen>>3)+i] = data[i];}

        BYTES_SWAP256(state->buffer);

        rnd384(state);

        databitlen -= (cpylen << 3);
        data += cpylen;
        state->rembitlen = 0;

        while (databitlen >= MSG_BLOCK_BIT_LEN) {
            for(i=0;i<8;i++) state->buffer[i] = ((uint32*)data)[i];

            BYTES_SWAP256(state->buffer);

            rnd384(state);

            databitlen -= MSG_BLOCK_BIT_LEN;
            data += MSG_BLOCK_BYTE_LEN;
        }
    }

    /* All remaining data copy to buffer */
    if(databitlen) {
        len = databitlen >> 3;
        if(databitlen % 8 != 0) {
            len += 1;
        }

        for(i=0;i<len;i++) p[state->rembitlen/8+i]=data[i];
        state->rembitlen += databitlen;
    }

    return;
}


void Update512(hashState *state, const BitSequence *data, DataLength databitlen) 
{
    int i;
    uint8 *p = (uint8*)state->buffer;
    uint32 cpylen;
    uint32 len;

    if((state->bitlen[1] += databitlen)<databitlen) {
        state->bitlen[0]+=1;
    }

    if(state->rembitlen + databitlen >= MSG_BLOCK_BIT_LEN) {
        cpylen = MSG_BLOCK_BYTE_LEN - (state->rembitlen >> 3);

        if(!state->rembitlen) for(i=0;i<8;i++) state->buffer[i] = ((uint32*)data)[i];
        else{ for(i=0;i<cpylen;i++) ((uint8*)state->buffer)[(state->rembitlen>>3)+i] = data[i];}

        BYTES_SWAP256(state->buffer);

        rnd512(state);

        databitlen -= (cpylen << 3);
        data += cpylen;
        state->rembitlen = 0;

        while (databitlen >= MSG_BLOCK_BIT_LEN) {
            for(i=0;i<8;i++) state->buffer[i] = ((uint32*)data)[i];

            BYTES_SWAP256(state->buffer);

            rnd512(state);

            databitlen -= MSG_BLOCK_BIT_LEN;
            data += MSG_BLOCK_BYTE_LEN;
        }
    }

    /* All remaining data copy to buffer */
    if(databitlen) {
        len = databitlen >> 3;
        if(databitlen % 8 != 0) {
            len += 1;
        }

        for(i=0;i<len;i++) p[state->rembitlen/8+i]=data[i];
        state->rembitlen += databitlen;
    }

    return;
}


HashReturn Final(hashState *state, BitSequence *hashval) 
{
    HashReturn ret;

    switch(state->hashbitlen) {

    case 224:
        process_last_msgs256(state);
        finalization224(state, (uint32*) hashval);
        ret = SUCCESS;
        break;
    case 256:
        process_last_msgs256(state);
        finalization256(state, (uint32*) hashval);
        ret = SUCCESS;
        break;
    case 384:
        process_last_msgs384(state);
        finalization384(state, (uint32*) hashval);
        ret = SUCCESS;
        break;
    case 512:
        process_last_msgs512(state);
        finalization512(state, (uint32*) hashval);
        ret = SUCCESS;
        break;

    default:
        ret = BAD_HASHBITLEN;
        break;
    }

    return ret;
}


/***************************************************/
/* Round function         */
/* state: hash context    */
void rnd256(hashState *state)
{
    int i,j;
    uint32 t[8];

    for(i=0;i<8;i++) {
        t[i]=0;
        for(j=0;j<3;j++) {
            t[i] ^= state->chainv[i+8*j];
        }
    }

    MULT2_1(t);
    state->chainv[0] ^= t[7] ^ state->buffer[0];
    state->chainv[1] ^= t[0] ^ state->buffer[1];
    state->chainv[2] ^= t[1] ^ state->buffer[2];
    state->chainv[3] ^= t[2] ^ state->buffer[3];
    state->chainv[4] ^= t[3] ^ state->buffer[4];
    state->chainv[5] ^= t[4] ^ state->buffer[5];
    state->chainv[6] ^= t[5] ^ state->buffer[6];
    state->chainv[7] ^= t[6] ^ state->buffer[7];

    MULT2_1(state->buffer);
    state->chainv[8] ^= t[7] ^ state->buffer[7];
    state->chainv[9] ^= t[0] ^ state->buffer[0];
    state->chainv[10] ^= t[1] ^ state->buffer[1];
    state->chainv[11] ^= t[2] ^ state->buffer[2];
    state->chainv[12] ^= t[3] ^ state->buffer[3];
    state->chainv[13] ^= t[4] ^ state->buffer[4];
    state->chainv[14] ^= t[5] ^ state->buffer[5];
    state->chainv[15] ^= t[6] ^ state->buffer[6];

    MULT2_2(state->buffer);
    state->chainv[16] ^= t[7] ^ state->buffer[6];
    state->chainv[17] ^= t[0] ^ state->buffer[7];
    state->chainv[18] ^= t[1] ^ state->buffer[0];
    state->chainv[19] ^= t[2] ^ state->buffer[1];
    state->chainv[20] ^= t[3] ^ state->buffer[2];
    state->chainv[21] ^= t[4] ^ state->buffer[3];
    state->chainv[22] ^= t[5] ^ state->buffer[4];
    state->chainv[23] ^= t[6] ^ state->buffer[5];

    for(j=0;j<3;j++) {
        TWEAK(&state->chainv[8*j],j);
        for(i=0;i<8;i++) {
            STEP_PART(&state->chainv[8*j], &CNS[2*i + 16*j], t[0]);
        }
    }

    return;
}


void rnd384(hashState *state)
{
    int i,j;
    uint32 t[9];

    for(i=0;i<8;i++) {
        t[i]=0;
        for(j=0;j<4;j++) {
            t[i] ^= state->chainv[i+8*j];
        }
    }

    MULT2_1(t);
    for(j=0;j<4;j++) {
        state->chainv[8*j] ^= t[7];
        state->chainv[8*j+1] ^= t[0];
        state->chainv[8*j+2] ^= t[1];
        state->chainv[8*j+3] ^= t[2];
        state->chainv[8*j+4] ^= t[3];
        state->chainv[8*j+5] ^= t[4];
        state->chainv[8*j+6] ^= t[5];
        state->chainv[8*j+7] ^= t[6];
    }

    t[7] = state->chainv[7];
    state->chainv[7] = state->chainv[6] ^ state->chainv[31];
    t[6] = state->chainv[6];
    state->chainv[6] = state->chainv[5] ^ state->chainv[30];
    t[5] = state->chainv[5];
    state->chainv[5] = state->chainv[4] ^ state->chainv[29];
    t[4] = state->chainv[4];
    state->chainv[4] = state->chainv[3] ^ t[7] ^ state->chainv[28];
    t[3] = state->chainv[3];
    state->chainv[3] = state->chainv[2] ^ t[7] ^ state->chainv[27];
    t[2] = state->chainv[2];
    state->chainv[2] = state->chainv[1] ^ state->chainv[26];
    t[1] = state->chainv[1];
    state->chainv[1] = state->chainv[0] ^ t[7] ^ state->chainv[25];
    t[0] = state->chainv[0];
    state->chainv[0] = t[7] ^ state->chainv[24];

    t[8] = state->chainv[31];
    state->chainv[31] = state->chainv[30] ^ state->chainv[23];
    state->chainv[30] = state->chainv[29] ^ state->chainv[22];
    state->chainv[29] = state->chainv[28] ^ state->chainv[21];
    state->chainv[28] = state->chainv[27] ^ t[8] ^ state->chainv[20];
    state->chainv[27] = state->chainv[26] ^ t[8] ^ state->chainv[19];
    state->chainv[26] = state->chainv[25] ^ state->chainv[18];
    state->chainv[25] = state->chainv[24] ^ t[8] ^ state->chainv[17];
    state->chainv[24] = t[8] ^ state->chainv[16];

    t[8] = state->chainv[23];
    state->chainv[23] = state->chainv[22] ^ state->chainv[15];
    state->chainv[22] = state->chainv[21] ^ state->chainv[14];
    state->chainv[21] = state->chainv[20] ^ state->chainv[13];
    state->chainv[20] = state->chainv[19] ^ t[8] ^ state->chainv[12];
    state->chainv[19] = state->chainv[18] ^ t[8] ^ state->chainv[11];
    state->chainv[18] = state->chainv[17] ^ state->chainv[10];
    state->chainv[17] = state->chainv[16] ^ t[8] ^ state->chainv[9];
    state->chainv[16] = t[8] ^ state->chainv[8];

    t[8] = state->chainv[15];
    state->chainv[15] = state->chainv[14] ^ t[7];
    state->chainv[14] = state->chainv[13] ^ t[6];
    state->chainv[13] = state->chainv[12] ^ t[5];
    state->chainv[12] = state->chainv[11] ^ t[8] ^ t[4];
    state->chainv[11] = state->chainv[10] ^ t[8] ^ t[3];
    state->chainv[10] = state->chainv[9] ^ t[2];
    state->chainv[9] = state->chainv[8] ^ t[8] ^ t[1];
    state->chainv[8] = t[8] ^ t[0];

    MULT2_1(t);
    state->chainv[0] ^= state->buffer[0];
    state->chainv[1] ^= state->buffer[1];
    state->chainv[2] ^= state->buffer[2];
    state->chainv[3] ^= state->buffer[3];
    state->chainv[4] ^= state->buffer[4];
    state->chainv[5] ^= state->buffer[5];
    state->chainv[6] ^= state->buffer[6];
    state->chainv[7] ^= state->buffer[7];

    MULT2_1(state->buffer);
    state->chainv[8]  ^= state->buffer[7];
    state->chainv[9]  ^= state->buffer[0];
    state->chainv[10] ^= state->buffer[1];
    state->chainv[11] ^= state->buffer[2];
    state->chainv[12] ^= state->buffer[3];
    state->chainv[13] ^= state->buffer[4];
    state->chainv[14] ^= state->buffer[5];
    state->chainv[15] ^= state->buffer[6];

    MULT2_2(state->buffer);
    state->chainv[16] ^= state->buffer[6];
    state->chainv[17] ^= state->buffer[7];
    state->chainv[18] ^= state->buffer[0];
    state->chainv[19] ^= state->buffer[1];
    state->chainv[20] ^= state->buffer[2];
    state->chainv[21] ^= state->buffer[3];
    state->chainv[22] ^= state->buffer[4];
    state->chainv[23] ^= state->buffer[5];

    MULT2_3(state->buffer);
    state->chainv[24] ^= state->buffer[5];
    state->chainv[25] ^= state->buffer[6];
    state->chainv[26] ^= state->buffer[7];
    state->chainv[27] ^= state->buffer[0];
    state->chainv[28] ^= state->buffer[1];
    state->chainv[29] ^= state->buffer[2];
    state->chainv[30] ^= state->buffer[3];
    state->chainv[31] ^= state->buffer[4];

    for(j=0;j<4;j++) {
        TWEAK(&state->chainv[8*j],j);
        for(i=0;i<8;i++) {
            STEP_PART(&state->chainv[8*j], &CNS[2*i + 16*j], t[0]);
        }
    }

    return;
}


void rnd512(hashState *state)
{
    int i,j;
    uint32 t[9];

    for(i=0;i<8;i++) {
        t[i]=0;
        for(j=0;j<5;j++) {
            t[i] ^= state->chainv[i+8*j];
        }
    }

    MULT2_1(t);
    for(j=0;j<5;j++) {
        state->chainv[8*j] ^= t[7];
        state->chainv[8*j+1] ^= t[0];
        state->chainv[8*j+2] ^= t[1];
        state->chainv[8*j+3] ^= t[2];
        state->chainv[8*j+4] ^= t[3];
        state->chainv[8*j+5] ^= t[4];
        state->chainv[8*j+6] ^= t[5];
        state->chainv[8*j+7] ^= t[6];
    }

    t[7] = state->chainv[7];
    state->chainv[7] = state->chainv[6] ^ state->chainv[15];
    t[6] = state->chainv[6];
    state->chainv[6] = state->chainv[5] ^ state->chainv[14];
    t[5] = state->chainv[5];
    state->chainv[5] = state->chainv[4] ^ state->chainv[13];
    t[4] = state->chainv[4];
    state->chainv[4] = state->chainv[3] ^ t[7] ^ state->chainv[12];
    t[3] = state->chainv[3];
    state->chainv[3] = state->chainv[2] ^ t[7] ^ state->chainv[11];
    t[2] = state->chainv[2];
    state->chainv[2] = state->chainv[1] ^ state->chainv[10];
    t[1] = state->chainv[1];
    state->chainv[1] = state->chainv[0] ^ t[7] ^ state->chainv[9];
    t[0] = state->chainv[0];
    state->chainv[0] = t[7] ^ state->chainv[8];

    t[8] = state->chainv[15];
    state->chainv[15] = state->chainv[14] ^ state->chainv[23];
    state->chainv[14] = state->chainv[13] ^ state->chainv[22];
    state->chainv[13] = state->chainv[12] ^ state->chainv[21];
    state->chainv[12] = state->chainv[11] ^ t[8] ^ state->chainv[20];
    state->chainv[11] = state->chainv[10] ^ t[8] ^ state->chainv[19];
    state->chainv[10] = state->chainv[9] ^ state->chainv[18];
    state->chainv[9] = state->chainv[8] ^ t[8] ^ state->chainv[17];
    state->chainv[8] = t[8] ^ state->chainv[16];

    t[8] = state->chainv[23];
    state->chainv[23] = state->chainv[22] ^ state->chainv[31];
    state->chainv[22] = state->chainv[21] ^ state->chainv[30];
    state->chainv[21] = state->chainv[20] ^ state->chainv[29];
    state->chainv[20] = state->chainv[19] ^ t[8] ^ state->chainv[28];
    state->chainv[19] = state->chainv[18] ^ t[8] ^ state->chainv[27];
    state->chainv[18] = state->chainv[17] ^ state->chainv[26];
    state->chainv[17] = state->chainv[16] ^ t[8] ^ state->chainv[25];
    state->chainv[16] = t[8] ^ state->chainv[24];

    t[8] = state->chainv[31];
    state->chainv[31] = state->chainv[30] ^ state->chainv[39];
    state->chainv[30] = state->chainv[29] ^ state->chainv[38];
    state->chainv[29] = state->chainv[28] ^ state->chainv[37];
    state->chainv[28] = state->chainv[27] ^ t[8] ^ state->chainv[36];
    state->chainv[27] = state->chainv[26] ^ t[8] ^ state->chainv[35];
    state->chainv[26] = state->chainv[25] ^ state->chainv[34];
    state->chainv[25] = state->chainv[24] ^ t[8] ^ state->chainv[33];
    state->chainv[24] = t[8] ^ state->chainv[32];

    t[8] = state->chainv[39];
    state->chainv[39] = state->chainv[38] ^ t[7];
    state->chainv[38] = state->chainv[37] ^ t[6];
    state->chainv[37] = state->chainv[36] ^ t[5];
    state->chainv[36] = state->chainv[35] ^ t[8] ^ t[4];
    state->chainv[35] = state->chainv[34] ^ t[8] ^ t[3];
    state->chainv[34] = state->chainv[33] ^ t[2];
    state->chainv[33] = state->chainv[32] ^ t[8] ^ t[1];
    state->chainv[32] = t[8] ^ t[0];

    t[7] = state->chainv[7];
    state->chainv[7] = state->chainv[6] ^ state->chainv[39];
    t[6] = state->chainv[6];
    state->chainv[6] = state->chainv[5] ^ state->chainv[38];
    t[5] = state->chainv[5];
    state->chainv[5] = state->chainv[4] ^ state->chainv[37];
    t[4] = state->chainv[4];
    state->chainv[4] = state->chainv[3] ^ t[7] ^ state->chainv[36];
    t[3] = state->chainv[3];
    state->chainv[3] = state->chainv[2] ^ t[7] ^ state->chainv[35];
    t[2] = state->chainv[2];
    state->chainv[2] = state->chainv[1] ^ state->chainv[34];
    t[1] = state->chainv[1];
    state->chainv[1] = state->chainv[0] ^ t[7] ^ state->chainv[33];
    t[0] = state->chainv[0];
    state->chainv[0] = t[7] ^ state->chainv[32];

    t[8] = state->chainv[39];
    state->chainv[39] = state->chainv[38] ^ state->chainv[31];
    state->chainv[38] = state->chainv[37] ^ state->chainv[30];
    state->chainv[37] = state->chainv[36] ^ state->chainv[29];
    state->chainv[36] = state->chainv[35] ^ t[8] ^ state->chainv[28];
    state->chainv[35] = state->chainv[34] ^ t[8] ^ state->chainv[27];
    state->chainv[34] = state->chainv[33] ^ state->chainv[26];
    state->chainv[33] = state->chainv[32] ^ t[8] ^ state->chainv[25];
    state->chainv[32] = t[8] ^ state->chainv[24];

    t[8] = state->chainv[31];
    state->chainv[31] = state->chainv[30] ^ state->chainv[23];
    state->chainv[30] = state->chainv[29] ^ state->chainv[22];
    state->chainv[29] = state->chainv[28] ^ state->chainv[21];
    state->chainv[28] = state->chainv[27] ^ t[8] ^ state->chainv[20];
    state->chainv[27] = state->chainv[26] ^ t[8] ^ state->chainv[19];
    state->chainv[26] = state->chainv[25] ^ state->chainv[18];
    state->chainv[25] = state->chainv[24] ^ t[8] ^ state->chainv[17];
    state->chainv[24] = t[8] ^ state->chainv[16];

    t[8] = state->chainv[23];
    state->chainv[23] = state->chainv[22] ^ state->chainv[15];
    state->chainv[22] = state->chainv[21] ^ state->chainv[14];
    state->chainv[21] = state->chainv[20] ^ state->chainv[13];
    state->chainv[20] = state->chainv[19] ^ t[8] ^ state->chainv[12];
    state->chainv[19] = state->chainv[18] ^ t[8] ^ state->chainv[11];
    state->chainv[18] = state->chainv[17] ^ state->chainv[10];
    state->chainv[17] = state->chainv[16] ^ t[8] ^ state->chainv[9];
    state->chainv[16] = t[8] ^ state->chainv[8];

    t[8] = state->chainv[15];
    state->chainv[15] = state->chainv[14] ^ t[7];
    state->chainv[14] = state->chainv[13] ^ t[6];
    state->chainv[13] = state->chainv[12] ^ t[5];
    state->chainv[12] = state->chainv[11] ^ t[8] ^ t[4];
    state->chainv[11] = state->chainv[10] ^ t[8] ^ t[3];
    state->chainv[10] = state->chainv[9] ^ t[2];
    state->chainv[9] = state->chainv[8] ^ t[8] ^ t[1];
    state->chainv[8] = t[8] ^ t[0];

    MULT2_1(t);
    state->chainv[0] ^= state->buffer[0];
    state->chainv[1] ^= state->buffer[1];
    state->chainv[2] ^= state->buffer[2];
    state->chainv[3] ^= state->buffer[3];
    state->chainv[4] ^= state->buffer[4];
    state->chainv[5] ^= state->buffer[5];
    state->chainv[6] ^= state->buffer[6];
    state->chainv[7] ^= state->buffer[7];

    MULT2_1(state->buffer);
    state->chainv[8]  ^= state->buffer[7];
    state->chainv[9]  ^= state->buffer[0];
    state->chainv[10] ^= state->buffer[1];
    state->chainv[11] ^= state->buffer[2];
    state->chainv[12] ^= state->buffer[3];
    state->chainv[13] ^= state->buffer[4];
    state->chainv[14] ^= state->buffer[5];
    state->chainv[15] ^= state->buffer[6];

    MULT2_2(state->buffer);
    state->chainv[16] ^= state->buffer[6];
    state->chainv[17] ^= state->buffer[7];
    state->chainv[18] ^= state->buffer[0];
    state->chainv[19] ^= state->buffer[1];
    state->chainv[20] ^= state->buffer[2];
    state->chainv[21] ^= state->buffer[3];
    state->chainv[22] ^= state->buffer[4];
    state->chainv[23] ^= state->buffer[5];

    MULT2_3(state->buffer);
    state->chainv[24] ^= state->buffer[5];
    state->chainv[25] ^= state->buffer[6];
    state->chainv[26] ^= state->buffer[7];
    state->chainv[27] ^= state->buffer[0];
    state->chainv[28] ^= state->buffer[1];
    state->chainv[29] ^= state->buffer[2];
    state->chainv[30] ^= state->buffer[3];
    state->chainv[31] ^= state->buffer[4];

    MULT2_4(state->buffer);
    state->chainv[32] ^= state->buffer[4];
    state->chainv[33] ^= state->buffer[5];
    state->chainv[34] ^= state->buffer[6];
    state->chainv[35] ^= state->buffer[7];
    state->chainv[36] ^= state->buffer[0];
    state->chainv[37] ^= state->buffer[1];
    state->chainv[38] ^= state->buffer[2];
    state->chainv[39] ^= state->buffer[3];

    for(j=0;j<5;j++) {
        TWEAK(&state->chainv[8*j],j);
        for(i=0;i<8;i++) {
            STEP_PART(&state->chainv[8*j], &CNS[2*i + 16*j], t[0]);
        }
    }

    return;
}


/***************************************************/
/* Finalization function  */
/* state: hash context    */
/* b[8]: hash values      */
void finalization224(hashState *state, uint32 *b)
{
    int i,j;

    /*---- blank round with m=0 ----*/
    for(i=0;i<8;i++) state->buffer[i] =0;
    rnd256(state);

    for(i=0;i<7;i++) {
        b[i] = 0;
        for(j=0;j<3;j++) {
            b[i] ^= state->chainv[i+8*j];
        }
        b[i] = BYTES_SWAP32((b[i]));
    }

    return;
}


void finalization256(hashState *state, uint32 *b)
{
    int i,j;

    /*---- blank round with m=0 ----*/
    for(i=0;i<8;i++) state->buffer[i] =0;
    rnd256(state);

    for(i=0;i<8;i++) {
        b[i] = 0;
        for(j=0;j<3;j++) {
            b[i] ^= state->chainv[i+8*j];
        }
        b[i] = BYTES_SWAP32((b[i]));
    }

    return;
}


void finalization384(hashState *state, uint32 *b)
{
    int i,j;

    /*---- blank round with m=0 ----*/
    for(i=0;i<8;i++) state->buffer[i] =0;
    rnd384(state);

    for(i=0;i<8;i++) {
        b[i] = 0;
        for(j=0;j<4;j++) {
            b[i] ^= state->chainv[i+8*j];
        }
        b[i] = BYTES_SWAP32((b[i]));
    }

    for(i=0;i<8;i++) state->buffer[i]=0;
    rnd384(state);

    for(i=0;i<4;i++) {
        b[8+i] = 0;
        for(j=0;j<4;j++) {
            b[8+i] ^= state->chainv[i+8*j];
        }
        b[8+i] = BYTES_SWAP32((b[8+i]));
    }

    return;
}


void finalization512(hashState *state, uint32 *b)
{
    int i,j;

    /*---- blank round with m=0 ----*/
    for(i=0;i<8;i++) state->buffer[i] =0;
    rnd512(state);

    for(i=0;i<8;i++) {
        b[i] = 0;
        for(j=0;j<5;j++) {
            b[i] ^= state->chainv[i+8*j];
        }
        b[i] = BYTES_SWAP32((b[i]));
    }

    for(i=0;i<8;i++) state->buffer[i]=0;
    rnd512(state);

    for(i=0;i<8;i++) {
        b[8+i] = 0;
        for(j=0;j<5;j++) {
            b[8+i] ^= state->chainv[i+8*j];
        }
        b[8+i] = BYTES_SWAP32((b[8+i]));
    }

    return;
}


/***************************************************/
/* Process of the last blocks */
/* state: hash context        */
void process_last_msgs256(hashState *state)
{
    int i=0;
    uint32 tail_len;

    tail_len = ((uint32) state->bitlen[0])%MSG_BLOCK_BIT_LEN;

    i= tail_len/8;

    if(!(tail_len%8)) {
        ((uint8*)state->buffer)[i] = 0x80;
    }
    else {
        ((uint8*)state->buffer)[i] &= (0xff<<(8-(tail_len%8)));
        ((uint8*)state->buffer)[i] |= (0x80>>(tail_len%8));
    }

    i++;

    for(;i<32;i++)
        ((uint8*)state->buffer)[i] = 0;

    for(i=0;i<8;i++) {
        state->buffer[i] = BYTES_SWAP32((state->buffer[i]));
    }

    rnd256(state);

    return;
}


void process_last_msgs384(hashState *state)
{
    int i=0;
    uint32 tail_len;

    tail_len = ((uint32) state->bitlen[1])%MSG_BLOCK_BIT_LEN;

    i= tail_len/8;

    if(!(tail_len%8)) {
        ((uint8*)state->buffer)[i] = 0x80;
    }
    else {
        ((uint8*)state->buffer)[i] &= (0xff<<(8-(tail_len%8)));
        ((uint8*)state->buffer)[i] |= (0x80>>(tail_len%8));
    }

    i++;

    for(;i<32;i++)
        ((uint8*)state->buffer)[i] = 0;

    for(i=0;i<8;i++) {
        state->buffer[i] = BYTES_SWAP32((state->buffer[i]));
    }

    rnd384(state);

    return;
}


void process_last_msgs512(hashState *state)
{
    int i=0;
    uint32 tail_len;

    tail_len = ((uint32) state->bitlen[1])%MSG_BLOCK_BIT_LEN;

    i= tail_len/8;

    if(!(tail_len%8)) {
        ((uint8*)state->buffer)[i] = 0x80;
    }
    else {
        ((uint8*)state->buffer)[i] &= (0xff<<(8-(tail_len%8)));
        ((uint8*)state->buffer)[i] |= (0x80>>(tail_len%8));
    }

    i++;

    for(;i<32;i++)
        ((uint8*)state->buffer)[i] = 0;

    for(i=0;i<8;i++) {
        state->buffer[i] = BYTES_SWAP32((state->buffer[i]));
    }

    rnd512(state);

    return;

}

/***************************************************/
