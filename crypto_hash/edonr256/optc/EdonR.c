#include <string.h> 
#include "EdonR.h"
#include "byteorder.h"

/* EdonR224 initial double chaining pipe */
const u_int32_t i224p2[16] = {
    0x00010203ul, 0x04050607ul, 0x08090a0bul, 0x0c0d0e0ful,
    0x10111213ul, 0x14151617ul, 0x18191a1bul, 0x1c1d1e1ful,
    0x20212223ul, 0x24252627ul, 0x28292a2bul, 0x2c2d2e2ful,
    0x30313233ul, 0x24353637ul, 0x38393a3bul, 0x3c3d3e3ful,
};
/* EdonR256 initial double chaining pipe */
const u_int32_t i256p2[16] = {
    0x40414243ul, 0x44454647ul, 0x48494a4bul, 0x4c4d4e4ful,
    0x50515253ul, 0x54555657ul, 0x58595a5bul, 0x5c5d5e5ful,
    0x60616263ul, 0x64656667ul, 0x68696a6bul, 0x6c6d6e6ful,
    0x70717273ul, 0x74757677ul, 0x78797a7bul, 0x7c7d7e7ful,
};

/* EdonR384 initial double chaining pipe */
const u_int64_t i384p2[16] = {
    0x0001020304050607ull, 0x08090a0b0c0d0e0full,
    0x1011121314151617ull, 0x18191a1b1c1d1e1full,
    0x2021222324252627ull, 0x28292a2b2c2d2e2full,
    0x3031323324353637ull, 0x38393a3b3c3d3e3full,
    0x4041424344454647ull, 0x48494a4b4c4d4e4full,
    0x5051525354555657ull, 0x58595a5b5c5d5e5full,
    0x6061626364656667ull, 0x68696a6b6c6d6e6full,
    0x7071727374757677ull, 0x78797a7b7c7d7e7full
};

/* EdonR512 initial double chaining pipe */
const u_int64_t i512p2[16] = {
    0x8081828384858687ull, 0x88898a8b8c8d8e8full,
    0x9091929394959697ull, 0x98999a9b9c9d9e9full,
    0xa0a1a2a3a4a5a6a7ull, 0xa8a9aaabacadaeafull,
    0xb0b1b2b3b4b5b6b7ull, 0xb8b9babbbcbdbebfull,
    0xc0c1c2c3c4c5c6c7ull, 0xc8c9cacbcccdcecfull,
    0xd0d1d2d3d4d5d6d7ull, 0xd8d9dadbdcdddedfull,
    0xe0e1e2e3e4e5e6e7ull, 0xe8e9eaebecedeeefull,
    0xf0f1f2f3f4f5f6f7ull, 0xf8f9fafbfcfdfeffull
};


#define Q256(x0,x1,x2,x3,x4,x5,x6,x7,y0,y1,y2,y3,y4,y5,y6,y7,z0,z1,z2,z3,z4,z5,z6,z7) \
{\
/* First Latin Square\
0   7   1   3   2   4   6   5\
4   1   7   6   3   0   5   2\
7   0   4   2   5   3   1   6\
1   4   0   5   6   2   7   3\
2   3   6   7   1   5   0   4\
5   2   3   1   7   6   4   0\
3   6   5   0   4   7   2   1\
6   5   2   4   0   1   3   7\
*/\
	t8  = x0  + x4;\
	t9  = x1  + x7;\
	t12 = t8  + t9;\
	t10 = x2  + x3;\
	t11 = x5  + x6;\
	t13 = t10 + t11;\
    t0  = 0xaaaaaaaa +\
	      t12     + x2          ;\
    t1  = t12     + x3          ;\
    t1  = rotl32((t1), 4);\
    t2  = t12          + x6     ;\
    t2  = rotl32((t2), 8);\
    t3  = t13               + x7;\
    t3  = rotl32((t3),13);\
    t4  = x1 + t13              ;\
    t4  = rotl32((t4),17);\
    t5  = t8 + t10          + x5;\
    t5  = rotl32((t5),22);\
    t6  = x0 + t9 + t11         ;\
    t6  = rotl32((t6),24);\
    t7  = t13      +x4          ;\
    t7  = rotl32((t7),29);\
\
	t16 = t0 ^ t4;\
	t17 = t1 ^ t7;\
	t18 = t2 ^ t3;\
	t19 = t5 ^ t6;\
    t8  = t3 ^ t19    ;\
    t9  = t2 ^ t19    ;\
    t10 = t18     ^ t5;\
    t11 = t16^ t1     ;\
    t12 = t16     ^ t7;\
    t13 = t17^ t6     ;\
    t14 = t18     ^ t4;\
    t15 = t0 ^ t17    ;\
\
/* Second Orthogonal Latin Square\
0   4   2   3   1   6   5   7\
7   6   3   2   5   4   1   0\
5   3   1   6   0   2   7   4\
1   0   5   4   3   7   2   6\
2   1   0   7   4   5   6   3\
3   5   7   0   6   1   4   2\
4   7   6   1   2   0   3   5\
6   2   4   5   7   3   0   1\
*/\
    t16 = y0  + y1;\
	t17 = y2  + y5;\
	t20 = t16 + t17;\
	t18 = y3  + y4;\
	t22 = t16 + t18;\
	t19 = y6  + y7;\
	t21 = t18 + t19;\
	t23 = t17 + t19;\
    t0  = 0x55555555 +\
          t20               + y7;\
    t1  = t22               + y6;\
    t1  = rotl32((t1), 5);\
    t2  = t20          + y3     ;\
    t2  = rotl32((t2), 9);\
    t3  = y2 + t21              ;\
    t3  = rotl32((t3),11);\
    t4  = t22               + y5;\
    t4  = rotl32((t4),15);\
    t5  = t23+ y4               ;\
    t5  = rotl32((t5),20);\
    t6  = y1 + t23              ;\
    t6  = rotl32((t6),25);\
    t7  = y0 + t21              ;\
    t7  = rotl32((t7),27);\
\
	t16  = t0 ^ t1;\
	t17  = t2 ^ t5;\
	t18  = t3 ^ t4;\
	t19  = t6 ^ t7;\
    z5   = t8  + (t18     ^ t6);\
    z6   = t9  + (t17     ^ t7);\
    z7   = t10 + (t4 ^ t19    );\
    z0   = t11 + (t16     ^ t5);\
    z1   = t12 + (t2 ^ t19    );\
    z2   = t13 + (t16     ^ t3);\
    z3   = t14 + (t0 ^ t18    );\
    z4   = t15 + (t1 ^ t17    );\
}

#define Q512(x0,x1,x2,x3,x4,x5,x6,x7,y0,y1,y2,y3,y4,y5,y6,y7,z0,z1,z2,z3,z4,z5,z6,z7) \
{\
/* First Latin Square\
0   7   1   3   2   4   6   5\
4   1   7   6   3   0   5   2\
7   0   4   2   5   3   1   6\
1   4   0   5   6   2   7   3\
2   3   6   7   1   5   0   4\
5   2   3   1   7   6   4   0\
3   6   5   0   4   7   2   1\
6   5   2   4   0   1   3   7\
*/\
	tt8  = x0 + x4;\
	tt9  = x1 + x7;\
	tt12 = tt8  + tt9;\
	tt10 = x2 + x3;\
	tt11 = x5 + x6;\
	tt13 = tt10 + tt11;\
    tt0  = 0xaaaaaaaaaaaaaaaaull +\
	       tt12      + x2          ;\
    tt1  = tt12      + x3          ;\
    tt1  = rotl64((tt1), 5);\
    tt2  = tt12           + x6     ;\
    tt2  = rotl64((tt2),15);\
    tt3  = tt13                + x7;\
    tt3  = rotl64((tt3),22);\
    tt4  = x1 + tt13               ;\
    tt4  = rotl64((tt4),31);\
    tt5  = tt8 + tt10          + x5;\
    tt5  = rotl64((tt5),40);\
    tt6  = x0 + tt9 + tt11         ;\
    tt6  = rotl64((tt6),50);\
    tt7  = tt13     + x4           ;\
    tt7  = rotl64((tt7),59);\
\
	tt16 = tt0 ^ tt4;\
	tt17 = tt1 ^ tt7;\
	tt18 = tt2 ^ tt3;\
	tt19 = tt5 ^ tt6;\
    tt8  = tt3 ^ tt19    ;\
    tt9  = tt2 ^ tt19    ;\
    tt10 = tt18     ^ tt5;\
    tt11 = tt16^ tt1     ;\
    tt12 = tt16     ^ tt7;\
    tt13 = tt17^ tt6     ;\
    tt14 = tt18     ^ tt4;\
    tt15 = tt0 ^ tt17    ;\
\
/* Second Orthogonal Latin Square\
0   4   2   3   1   6   5   7\
7   6   3   2   5   4   1   0\
5   3   1   6   0   2   7   4\
1   0   5   4   3   7   2   6\
2   1   0   7   4   5   6   3\
3   5   7   0   6   1   4   2\
4   7   6   1   2   0   3   5\
6   2   4   5   7   3   0   1\
*/\
    tt16 = y0  + y1;\
	tt17 = y2  + y5;\
	tt20 = tt16 + tt17;\
	tt18 = y3  + y4;\
	tt22 = tt16 + tt18;\
	tt19 = y6  + y7;\
	tt21 = tt18 + tt19;\
	tt23 = tt17 + tt19;\
    tt0  = 0x5555555555555555ull +\
          tt20               + y7;\
    tt1  = tt22               + y6;\
    tt1  = rotl64((tt1),10);\
    tt2  = tt20          + y3     ;\
    tt2  = rotl64((tt2),19);\
    tt3  = y2 + tt21              ;\
    tt3  = rotl64((tt3),29);\
    tt4  = tt22               + y5;\
    tt4  = rotl64((tt4),36);\
    tt5  = tt23+ y4               ;\
    tt5  = rotl64((tt5),44);\
    tt6  = y1 + tt23              ;\
    tt6  = rotl64((tt6),48);\
    tt7  = y0 + tt21              ;\
    tt7  = rotl64((tt7),55);\
\
	tt16  = tt0 ^ tt1;\
	tt17  = tt2 ^ tt5;\
	tt18  = tt3 ^ tt4;\
	tt19  = tt6 ^ tt7;\
    z5   = tt8  + (tt18     ^ tt6);\
    z6   = tt9  + (tt17     ^ tt7);\
    z7   = tt10 + (tt4 ^ tt19    );\
    z0   = tt11 + (tt16     ^ tt5);\
    z1   = tt12 + (tt2 ^ tt19    );\
    z2   = tt13 + (tt16     ^ tt3);\
    z3   = tt14 + (tt0 ^ tt18    );\
    z4   = tt15 + (tt1 ^ tt17    );\
}

HashReturn Init(hashState *state, int hashbitlen)
{
	switch(hashbitlen)
	{
		case 224:
		state->hashbitlen = 224;
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState224(state)->DoublePipe, i224p2,  16 * sizeof(u_int32_t));
		return(SUCCESS);

		case 256:
		state->hashbitlen = 256;
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState256(state)->DoublePipe, i256p2,  16 * sizeof(u_int32_t));
		return(SUCCESS);

		case 384:		
		state->hashbitlen = 384;
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState384(state)->DoublePipe, i384p2,  16 * sizeof(u_int64_t));
		return(SUCCESS);

		case 512:
		state->hashbitlen = 512;
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState224(state)->DoublePipe, i512p2,  16 * sizeof(u_int64_t));
		return(SUCCESS);

        default:    return(BAD_HASHLEN);
    }
}




HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
	u_int32_t *data32, *p256;
	u_int32_t t0,  t1,  t2,  t3,  t4,  t5,  t6,  t7;
	u_int32_t t8,  t9, t10, t11, t12, t13, t14, t15;
	u_int32_t t16, t17,t18, t19, t20, t21, t22, t23;
	u_int32_t p16, p17, p18, p19, p20, p21, p22, p23;
	u_int32_t p24, p25, p26, p27, p28, p29, p30, p31;

	u_int64_t *data64, *p512;
	u_int64_t tt0,  tt1,  tt2,  tt3,  tt4,  tt5,  tt6,  tt7;
	u_int64_t tt8,  tt9, tt10, tt11, tt12, tt13, tt14, tt15;
	u_int64_t tt16, tt17,tt18, tt19, tt20, tt21, tt22, tt23;
	u_int64_t pp16, pp17, pp18, pp19, pp20, pp21, pp22, pp23;
	u_int64_t pp24, pp25, pp26, pp27, pp28, pp29, pp30, pp31;

	int LastBytes;

	switch(state->hashbitlen)
	{
		case 224:
		case 256:
			if (state->unprocessed_bits > 0)
			{
				if ( state->unprocessed_bits + databitlen > EdonR256_BLOCK_SIZE * 8)
				{
					return BAD_CONSECUTIVE_CALL_TO_UPDATE;
				}
				else
				{
					LastBytes = (int)databitlen >> 3; // LastBytes = databitlen / 8
					memcpy(hashState256(state)->LastPart + (state->unprocessed_bits >> 3), data, LastBytes );
					state->unprocessed_bits += (int)databitlen;
					databitlen = state->unprocessed_bits;
					data32 = (u_int32_t *)hashState256(state)->LastPart;
				}
			}
			else 
				data32 = (u_int32_t *)data;

			p256   = hashState256(state)->DoublePipe;
			while (databitlen >= EdonR256_BLOCK_SIZE * 8)
			{
#if defined(MACHINE_IS_BIG_ENDIAN)
				u_int32_t swp[32];
				register int j;

				for (j = 0; j < 32; j++)
					swp[j] = swap32(data32+j);
#define d32(j) swp[j]
#else
#define d32(j) data32[j]
#endif
				databitlen -= EdonR256_BLOCK_SIZE * 8;

				state->bits_processed += EdonR256_BLOCK_SIZE * 8;

				/* First row of quasigroup e-transformations */
				Q256( d32(15),  d32(14),  d32(13),  d32(12),  d32(11),  d32(10),  d32( 9),  d32( 8),
				      d32( 0),  d32( 1),  d32( 2),  d32( 3),  d32( 4),  d32( 5),  d32( 6),  d32( 7),
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 );
				Q256(       p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
				      d32( 8),  d32( 9),  d32(10),  d32(11),  d32(12),  d32(13),  d32(14),  d32(15),
				            p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 );

				/* Second row of quasigroup e-transformations */
				Q256(   p256[ 8],    p256[ 9],    p256[10],    p256[11],    p256[12],    p256[13],    p256[14],    p256[15],
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 );
				Q256(       p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
					        p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 ,
				            p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 );

				/* Third row of quasigroup e-transformations */
				Q256(       p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
					    p256[ 0],    p256[ 1],    p256[ 2],    p256[ 3],    p256[ 4],    p256[ 5],    p256[ 6],    p256[ 7],
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 );
				Q256(       p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 ,
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
				            p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 );

				/* Fourth row of quasigroup e-transformations */
				Q256( d32( 7),  d32( 6),  d32( 5),  d32( 4),  d32( 3),  d32( 2),  d32( 1),  d32( 0),
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
				        p256[ 0],    p256[ 1],    p256[ 2],    p256[ 3],    p256[ 4],    p256[ 5],    p256[ 6],    p256[ 7]);
				Q256(   p256[ 0],    p256[ 1],    p256[ 2],    p256[ 3],    p256[ 4],    p256[ 5],    p256[ 6],    p256[ 7],
				            p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 ,
				        p256[ 8],    p256[ 9],    p256[10],    p256[11],    p256[12],    p256[13],    p256[14],    p256[15]);
#undef d32
				data32 += 16;
			}
			state->unprocessed_bits = (int)databitlen;
			if (databitlen > 0)
			{
				LastBytes = ((~(((- (int)databitlen)>>3) & 0x01ff)) + 1) & 0x01ff;  // LastBytes = Ceil(databitlen / 8)
				memcpy(hashState256(state)->LastPart, data32, LastBytes );
			}
			return(SUCCESS);


		case 384:
		case 512:
			if (state->unprocessed_bits > 0)
			{
				if ( state->unprocessed_bits + databitlen > EdonR512_BLOCK_SIZE * 8)
				{
					return BAD_CONSECUTIVE_CALL_TO_UPDATE;
				}
				else
				{
					LastBytes = (int)databitlen >> 3; // LastBytes = databitlen / 8
					memcpy(hashState512(state)->LastPart + (state->unprocessed_bits >> 3), data, LastBytes );
					state->unprocessed_bits += (int)databitlen;
					databitlen = state->unprocessed_bits;
					data64 = (u_int64_t *)hashState512(state)->LastPart;
				}
			}
			else 
				data64 = (u_int64_t *)data;

			p512   = hashState512(state)->DoublePipe;
			while (databitlen >= EdonR512_BLOCK_SIZE * 8)
			{
#if defined(MACHINE_IS_BIG_ENDIAN)
				u_int64_t swp[32];
				register int j;

				for (j = 0; j < 32; j++)
					swp[j] = swap64(data64+j);
#define d64(j) swp[j]
#else
#define d64(j) data64[j]
#endif
				databitlen -= EdonR512_BLOCK_SIZE * 8;

				state->bits_processed += EdonR512_BLOCK_SIZE * 8;

				/* First row of quasigroup e-transformations */
				Q512( d64(15),  d64(14),  d64(13),  d64(12),  d64(11),  d64(10),  d64( 9),  d64( 8),
				      d64( 0),  d64( 1),  d64( 2),  d64( 3),  d64( 4),  d64( 5),  d64( 6),  d64( 7),
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 );
				Q512(      pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
				      d64( 8),  d64( 9),  d64(10),  d64(11),  d64(12),  d64(13),  d64(14),  d64(15),
				           pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 );

				/* Second row of quasigroup e-transformations */
				Q512(   p512[ 8],    p512[ 9],    p512[10],    p512[11],    p512[12],    p512[13],    p512[14],    p512[15],
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 );
				Q512(      pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
					       pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 ,
				           pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 );

				/* Third row of quasigroup e-transformations */
				Q512(      pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
					    p512[ 0],    p512[ 1],    p512[ 2],    p512[ 3],    p512[ 4],    p512[ 5],    p512[ 6],    p512[ 7],
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 );
				Q512(      pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 ,
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
				           pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 );

				/* Fourth row of quasigroup e-transformations */
				Q512( d64( 7),  d64( 6),  d64( 5),  d64( 4),  d64( 3),  d64( 2),  d64( 1),  d64( 0),
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
				        p512[ 0],    p512[ 1],    p512[ 2],    p512[ 3],    p512[ 4],    p512[ 5],    p512[ 6],    p512[ 7]);
				Q512(   p512[ 0],    p512[ 1],    p512[ 2],    p512[ 3],    p512[ 4],    p512[ 5],    p512[ 6],    p512[ 7],
				           pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 ,
				        p512[ 8],    p512[ 9],    p512[10],    p512[11],    p512[12],    p512[13],    p512[14],    p512[15]);
#undef d64
				data64 += 16;
			}
			state->unprocessed_bits = (int)databitlen;
			if (databitlen > 0)
			{
				LastBytes = ((~(((- (int)databitlen)>>3) & 0x03ff)) + 1) & 0x03ff; // LastBytes = Ceil(databitlen / 8)
				memcpy(hashState512(state)->LastPart, data64, LastBytes );
			}
			return(SUCCESS);
		
		default:    return(BAD_HASHLEN); //This should never happen
	}
}


HashReturn Final(hashState *state, BitSequence *hashval)
{
	u_int32_t *data32, *p256;
	u_int32_t t0,  t1,  t2,  t3,  t4,  t5,  t6,  t7;
	u_int32_t t8,  t9, t10, t11, t12, t13, t14, t15;
	u_int32_t t16, t17,t18, t19, t20, t21, t22, t23;
	u_int32_t p16, p17, p18, p19, p20, p21, p22, p23;
	u_int32_t p24, p25, p26, p27, p28, p29, p30, p31;

	u_int64_t *data64, *p512;
	u_int64_t tt0,  tt1,  tt2,  tt3,  tt4,  tt5,  tt6,  tt7; 
	u_int64_t tt8,  tt9, tt10, tt11, tt12, tt13, tt14, tt15; 
	u_int64_t tt16, tt17,tt18, tt19, tt20, tt21, tt22, tt23;
	u_int64_t pp16, pp17, pp18, pp19, pp20, pp21, pp22, pp23;
	u_int64_t pp24, pp25, pp26, pp27, pp28, pp29, pp30, pp31;

	u_int64_t num_bits;
	DataLength databitlen;
	int LastByte, PadOnePosition;


	num_bits = state->bits_processed + state->unprocessed_bits;

	switch(state->hashbitlen)
	{
		case 224:
		case 256:
			LastByte = (int)state->unprocessed_bits >> 3;
			PadOnePosition = 7 - (state->unprocessed_bits & 0x07);
			hashState256(state)->LastPart[LastByte] =
				(hashState256(state)->LastPart[LastByte] & (0xff << (PadOnePosition + 1)))
				^ (0x01 << PadOnePosition);
			data64 = (u_int64_t *)hashState256(state)->LastPart;

			if (state->unprocessed_bits < 448)
			{
				memset( (hashState256(state)->LastPart) + LastByte + 1, 0x00, EdonR256_BLOCK_SIZE - LastByte - 9 );
				databitlen = EdonR256_BLOCK_SIZE * 8;
#if defined(MACHINE_IS_BIG_ENDIAN)
				data64[7] = swap64(&num_bits);
#else
				data64[7] = num_bits;
#endif
			}
			else
			{
				memset( (hashState256(state)->LastPart) + LastByte + 1, 0x00, EdonR256_BLOCK_SIZE * 2 - LastByte - 9 );
				databitlen = EdonR256_BLOCK_SIZE * 16;
#if defined(MACHINE_IS_BIG_ENDIAN)
				data64[15] = swap64(&num_bits);
#else
				data64[15] = num_bits;
#endif
			}

			data32   = (u_int32_t *)hashState256(state)->LastPart;
			p256     = hashState256(state)->DoublePipe;
			while (databitlen >= EdonR256_BLOCK_SIZE * 8)
			{
#if defined(MACHINE_IS_BIG_ENDIAN)
				u_int32_t swp[32];
				register int j;

				for (j = 0; j < 32; j++)
					swp[j] = swap32(data32+j);
#define d32(j) swp[j]
#else
#define d32(j) data32[j]
#endif
				databitlen -= EdonR256_BLOCK_SIZE * 8;

				state->bits_processed += EdonR256_BLOCK_SIZE * 8;

				/* First row of quasigroup e-transformations */
				Q256( d32(15),  d32(14),  d32(13),  d32(12),  d32(11),  d32(10),  d32( 9),  d32( 8),
				      d32( 0),  d32( 1),  d32( 2),  d32( 3),  d32( 4),  d32( 5),  d32( 6),  d32( 7),
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 );
				Q256(       p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
				      d32( 8),  d32( 9),  d32(10),  d32(11),  d32(12),  d32(13),  d32(14),  d32(15),
				            p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 );

				/* Second row of quasigroup e-transformations */
				Q256(   p256[ 8],    p256[ 9],    p256[10],    p256[11],    p256[12],    p256[13],    p256[14],    p256[15],
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 );
				Q256(       p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
					        p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 ,
				            p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 );

				/* Third row of quasigroup e-transformations */
				Q256(       p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
					    p256[ 0],    p256[ 1],    p256[ 2],    p256[ 3],    p256[ 4],    p256[ 5],    p256[ 6],    p256[ 7],
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 );
				Q256(       p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 ,
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
				            p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 );

				/* Fourth row of quasigroup e-transformations */
				Q256( d32( 7),  d32( 6),  d32( 5),  d32( 4),  d32( 3),  d32( 2),  d32( 1),  d32( 0),
				            p16 ,        p17 ,        p18 ,        p19 ,        p20 ,        p21 ,        p22 ,        p23 ,
				        p256[ 0],    p256[ 1],    p256[ 2],    p256[ 3],    p256[ 4],    p256[ 5],    p256[ 6],    p256[ 7]);
				Q256(   p256[ 0],    p256[ 1],    p256[ 2],    p256[ 3],    p256[ 4],    p256[ 5],    p256[ 6],    p256[ 7],
				            p24 ,        p25 ,        p26 ,        p27 ,        p28 ,        p29 ,        p30 ,        p31 ,
				        p256[ 8],    p256[ 9],    p256[10],    p256[11],    p256[12],    p256[13],    p256[14],    p256[15]);
#undef d32
				data32 += 16;
			}
			break;

		case 384:
		case 512:
			LastByte = (int)state->unprocessed_bits >> 3;
			PadOnePosition = 7 - (state->unprocessed_bits & 0x07);
			hashState512(state)->LastPart[LastByte] =
				(hashState512(state)->LastPart[LastByte] & (0xff << (PadOnePosition + 1)))
				^ (0x01 << PadOnePosition);
			data64 = (u_int64_t *)hashState512(state)->LastPart;

			if (state->unprocessed_bits < 960)
			{
				memset( (hashState512(state)->LastPart) + LastByte + 1, 0x00, EdonR512_BLOCK_SIZE - LastByte - 9 );
				databitlen = EdonR512_BLOCK_SIZE * 8;
#if defined(MACHINE_IS_BIG_ENDIAN)
				data64[15] = swap64(&num_bits);
#else
				data64[15] = num_bits;
#endif
			}
			else
			{
				memset( (hashState512(state)->LastPart) + LastByte + 1, 0x00, EdonR512_BLOCK_SIZE * 2 - LastByte - 9 );
				databitlen = EdonR512_BLOCK_SIZE * 16;
#if defined(MACHINE_IS_BIG_ENDIAN)
				data64[31] = swap64(&num_bits);
#else
				data64[31] = num_bits;
#endif
			}

			p512   = hashState512(state)->DoublePipe;
			while (databitlen >= EdonR512_BLOCK_SIZE * 8)
			{
#if defined(MACHINE_IS_BIG_ENDIAN)
				u_int64_t swp[32];
				register int j;

				for (j = 0; j < 32; j++)
					swp[j] = swap64(data64+j);
#define d64(j) swp[j]
#else
#define d64(j) data64[j]
#endif
				databitlen -= EdonR512_BLOCK_SIZE * 8;

				state->bits_processed += EdonR512_BLOCK_SIZE * 8;

				/* First row of quasigroup e-transformations */
				Q512( d64(15),  d64(14),  d64(13),  d64(12),  d64(11),  d64(10),  d64( 9),  d64( 8),
				      d64( 0),  d64( 1),  d64( 2),  d64( 3),  d64( 4),  d64( 5),  d64( 6),  d64( 7),
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 );
				Q512(      pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
				      d64( 8),  d64( 9),  d64(10),  d64(11),  d64(12),  d64(13),  d64(14),  d64(15),
				           pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 );

				/* Second row of quasigroup e-transformations */
				Q512(   p512[ 8],    p512[ 9],    p512[10],    p512[11],    p512[12],    p512[13],    p512[14],    p512[15],
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 );
				Q512(      pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
					       pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 ,
				           pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 );

				/* Third row of quasigroup e-transformations */
				Q512(      pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
					    p512[ 0],    p512[ 1],    p512[ 2],    p512[ 3],    p512[ 4],    p512[ 5],    p512[ 6],    p512[ 7],
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 );
				Q512(      pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 ,
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
				           pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 );

				/* Fourth row of quasigroup e-transformations */
				Q512( d64( 7),  d64( 6),  d64( 5),  d64( 4),  d64( 3),  d64( 2),  d64( 1),  d64( 0),
				           pp16 ,       pp17 ,       pp18 ,       pp19 ,       pp20 ,       pp21 ,       pp22 ,       pp23 ,
				        p512[ 0],    p512[ 1],    p512[ 2],    p512[ 3],    p512[ 4],    p512[ 5],    p512[ 6],    p512[ 7]);
				Q512(   p512[ 0],    p512[ 1],    p512[ 2],    p512[ 3],    p512[ 4],    p512[ 5],    p512[ 6],    p512[ 7],
				           pp24 ,       pp25 ,       pp26 ,       pp27 ,       pp28 ,       pp29 ,       pp30 ,       pp31 ,
				        p512[ 8],    p512[ 9],    p512[10],    p512[11],    p512[12],    p512[13],    p512[14],    p512[15]);
#undef d64
				data64 += 16;
			}
			break;
		
		default:    return(BAD_HASHLEN); //This should never happen
	}


	switch(state->hashbitlen)
	{
		case 224:
#if defined(MACHINE_IS_BIG_ENDIAN)
		{
			u_int32_t *d32 = (u_int32_t *)hashval;
			u_int32_t *s32 = hashState224(state)->DoublePipe+9;
			int j;

			for (j = 0; j < EdonR224_DIGEST_SIZE>>2; j++)
				d32[j] = swap32(s32+j);
		}
#else
			memcpy(hashval, hashState256(state)->DoublePipe+9,
				   EdonR224_DIGEST_SIZE);
#endif
			return(SUCCESS);
		case 256:
#if defined(MACHINE_IS_BIG_ENDIAN)
		{
			u_int32_t *d32 = (u_int32_t *)hashval;
			u_int32_t *s32 = hashState224(state)->DoublePipe+8;
			int j;

			for (j = 0; j < EdonR256_DIGEST_SIZE>>2; j++)
				d32[j] = swap32(s32+j);
		}
#else
			memcpy(hashval, hashState256(state)->DoublePipe+8,
				   EdonR256_DIGEST_SIZE);
#endif
			return(SUCCESS);
		case 384:
#if defined(MACHINE_IS_BIG_ENDIAN)
		{
			u_int64_t *d64 = (u_int64_t *)hashval;
			u_int64_t *s64 = hashState384(state)->DoublePipe+10;
			int j;

			for (j = 0; j < EdonR384_DIGEST_SIZE>>3; j++)
			    d64[j] = swap64(s64+j);
		}
#else
			memcpy(hashval, hashState384(state)->DoublePipe+10,
				   EdonR384_DIGEST_SIZE);
#endif
			return(SUCCESS);
		case 512:
#if defined(MACHINE_IS_BIG_ENDIAN)
		{
			u_int64_t *d64 = (u_int64_t *)hashval;
			u_int64_t *s64 = hashState512(state)->DoublePipe+8;
			int j;

			for (j = 0; j < EdonR512_DIGEST_SIZE>>3; j++)
			    d64[j] = swap64(s64+j);
		}
#else
			memcpy(hashval, hashState512(state)->DoublePipe+8,
				   EdonR512_DIGEST_SIZE);
#endif
			return(SUCCESS);

		default:
			return(BAD_HASHLEN); //This should never happen
	}
}

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	HashReturn qq;
	hashState state;

	qq = Init(&state, hashbitlen);
	if (qq != SUCCESS) return(qq);
	qq = Update(&state, data, databitlen);
	if (qq != SUCCESS) return(qq);
	qq = Final(&state, hashval);
	return(qq);
}
