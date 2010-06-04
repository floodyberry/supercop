/******************************************************************************
 * Blue Midnight Wish SHA-3 candidate SUPERCOP API hash function.
 *
 * Derived from the Sep 15 2009 NIST API submission by
 * Danilo Gligoroski <danilog@item.ntnu.no>. Citations refer to Danilo
 * Gligoroski er.al., "Cryptographic Hash Function Blue Midnight Wish", NTNU,
 * September 2009.
 *
 * Big endian implementation by Jorn Amundsen <jorn.amundsen@ntnu.no>.
 *-----------------------------------------------------------------------------
 * $Id: hash.c 84 2010-05-31 10:44:08Z joern $
 ******************************************************************************/

#include "crypto_hash.h"
#include "BlueMidnightWish.h"
#if (EXPAND_1_ROUNDS != 2)
#error designed for ExpandRounds1==2 only
#endif

/* make 32- and 64-bit code as similar as possible */
#define rl rotl32
#define ld_swap ld_swap32
#if defined(MACHINE_IS_BIG_ENDIAN)
#define LD_SWAP(s,d,i) ld_swap(s+i, d##i)
#else
#define LD_SWAP(s,d,i) {}
#endif
typedef uint32_t uword_t;

/* tabulated values K*j */
#if defined(_AIX)
static uword_t K[N_BLOCK_WORDS] = {
#else
static const uword_t K[N_BLOCK_WORDS] = {
#endif
	0x55555550ul, 0x5aaaaaa5ul, 0x5ffffffaul, 0x6555554ful,
	0x6aaaaaa4ul, 0x6ffffff9ul, 0x7555554eul, 0x7aaaaaa3ul,
	0x7ffffff8ul, 0x8555554dul, 0x8aaaaaa2ul, 0x8ffffff7ul,
	0x9555554cul, 0x9aaaaaa1ul, 0x9ffffff6ul, 0xa555554bul
};

/* finalization double pipe value (ch. 1.2) */
static const uword_t C_final[N_BLOCK_WORDS] = {
	0xaaaaaaa0ul, 0xaaaaaaa1ul, 0xaaaaaaa2ul, 0xaaaaaaa3ul,
	0xaaaaaaa4ul, 0xaaaaaaa5ul, 0xaaaaaaa6ul, 0xaaaaaaa7ul,
	0xaaaaaaa8ul, 0xaaaaaaa9ul, 0xaaaaaaaaul, 0xaaaaaaabul,
	0xaaaaaaacul, 0xaaaaaaadul, 0xaaaaaaaeul, 0xaaaaaaaful
};

/* logic functions (table 1.3, ch 1.4) */
#define s_0(x) (shr(x, 1) ^ shl(x, 3) ^ rl(x,  4) ^ rl(x, 19))
#define s_1(x) (shr(x, 1) ^ shl(x, 2) ^ rl(x,  8) ^ rl(x, 23))
#define s_2(x) (shr(x, 2) ^ shl(x, 1) ^ rl(x, 12) ^ rl(x, 25))
#define s_3(x) (shr(x, 2) ^ shl(x, 2) ^ rl(x, 15) ^ rl(x, 29))
#define s_4(x) (shr(x, 1) ^ (x))
#define s_5(x) (shr(x, 2) ^ (x))
#define r_1(x) rl(x,  3)
#define r_2(x) rl(x,  7)
#define r_3(x) rl(x, 13)
#define r_4(x) rl(x, 16)
#define r_5(x) rl(x, 19)
#define r_6(x) rl(x, 23)
#define r_7(x) rl(x, 27)

/* forward declaration of internals */
static void Compression256_loop(uword_t *M, uword_t *H,  uint64_t nbytes);



int
crypto_hash(unsigned char *out, const unsigned char *in,
			unsigned long long inlen)
{
	uword_t M_tail[N_DOUBLEBLOCK_WORDS]; /* e.g. padding and finalization */
	uword_t dp[N_BLOCK_WORDS];
	uword_t *M, *H;
	int n_tail;

	/* unpadded part of hash computation (part 2, table 2.1, ch. 2.1.1) */
	M = (uword_t *)in, H = dp;
	Compression256_loop(M, H, inlen);

	/* pad and hash the message tail (part 1a and 2, table 2.1, ch. 2.1.1) */
	{
		uint64_t bitlen;
		uword_t padmask;
		unsigned i, m, npad, padbytes, padoffs;

		/* 1: copy message tail into pad buffer */
		m = inlen & (unsigned long long)(N_BMW256_BLOCK_BYTES-1);
		padoffs = m >> N_BMW256_BYTES_2_WORDS;
		M = (uword_t *)(in + inlen - m);
		for (i = 0; i < padoffs; i++)
			ld_swap(M+i, M_tail[i]);

		/* 2: insert pad word, if necessary merge with message tail */
		bitlen = inlen << N_BYTES_2_BITS;
		padmask = (uword_t)N_PAD_BIT0 << (bitlen & (N_BMW256_WORD_BITS-8));
		if (m) {
			uword_t mask = ~(~0ul << (bitlen & (N_BMW256_WORD_BITS-1)));

			ld_swap(M+padoffs, M_tail[padoffs]);
			M_tail[padoffs] = (M_tail[padoffs] & mask) | padmask;
		} else
			M_tail[padoffs] = padmask;

		/* 3: fill in the zero words */
		padbytes = (m < N_BMW256_BLOCK_BYTES-8 ?
					N_BMW256_BLOCK_BYTES : 2*N_BMW256_BLOCK_BYTES) - m;
		npad = (m+padbytes) >> N_BMW256_BYTES_2_WORDS;
		for (i = padoffs+1; i < npad-2; i++)
			M_tail[i] = 0ul;

		/* 4: add message length */
#if defined(MACHINE_IS_BIG_ENDIAN)
		M_tail[npad-2] = bitlen & ~(uword_t)0;
		M_tail[npad-1] = bitlen >> 32;
#else
		*(uint64_t *)(M_tail+npad-2) = bitlen;
#endif

		n_tail = npad & N_DOUBLEBLOCK_WORDS ? 2 : 1;
	}

	/* hash the pad-expanded tail and the finalization part */
	M = M_tail;
	while (n_tail >= 0) {
		uword_t q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,qa,qb,qc,qd,qe,qf; /*Q[ 0-15]*/
		uword_t Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Qa,Qb,Qc,Qd,Qe,Qf; /*Q[16-31]*/

		{
			uword_t u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,ua,ub,uc,ud,ue,uf;
			uword_t w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,wa,wb,wc,wd,we,wf; /*W[0-15]*/
			uword_t t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,ta;

			/* bijection f0, part 1 (table 2.2, ch. 2.1.1) */
			u0 = M[ 0] ^ H[ 0], u1 = M[ 1] ^ H[ 1];
			u2 = M[ 2] ^ H[ 2], u3 = M[ 3] ^ H[ 3];
			u4 = M[ 4] ^ H[ 4], u5 = M[ 5] ^ H[ 5];
			u6 = M[ 6] ^ H[ 6], u7 = M[ 7] ^ H[ 7];
			u8 = M[ 8] ^ H[ 8], u9 = M[ 9] ^ H[ 9];
			ua = M[10] ^ H[10], ub = M[11] ^ H[11];
			uc = M[12] ^ H[12], ud = M[13] ^ H[13];
			ue = M[14] ^ H[14], uf = M[15] ^ H[15];
	
			t0 = ue - u7, t1 = uf + u8;
			t2 = uc - u9, t3 = ua + u1;
			t4 = u1 - ue, t5 = uf - u2;
			t6 = u3 - uc, t7 = ud - u6;
			t8 = u6 - u3, t9 = u4 + u7;
			ta = u8 - u5;

			w0 = u5 + t0 + ua + ud, w1 = u6 - t1 + ub + ue;
			w2 = u0 + u7 - t2 + uf, w3 = u0 - t3 + u8 + ud;
			w4 = t4 + u2 + u9 - ub, w5 = t5 + t6 + ua;
			w6 = u4 - u0 - u3 - ub + ud, w7 = t4 - u4 - u5 - uc;
			w8 = t7 - t5 - u5, w9 = u0 + t8 + t0;
			wa = t1 - u1 - t9, wb = ta - u0 - u2 + u9;
			wc = t3 - t8 - u9, wd = u2 + t9 + ua + ub;
			we = t6 + ta - ub, wf = t2 - u4 + t7;

			/* bijection f0, part 2 (table 2.2, ch. 2.1.1) */
			q0 = s_0(w0) + H[ 1], q1 = s_1(w1) + H[ 2];
			q2 = s_2(w2) + H[ 3], q3 = s_3(w3) + H[ 4];
			q4 = s_4(w4) + H[ 5], q5 = s_0(w5) + H[ 6];
			q6 = s_1(w6) + H[ 7], q7 = s_2(w7) + H[ 8];
			q8 = s_3(w8) + H[ 9], q9 = s_4(w9) + H[10];
			qa = s_0(wa) + H[11], qb = s_1(wb) + H[12];
			qc = s_2(wc) + H[13], qd = s_3(wd) + H[14];
			qe = s_4(we) + H[15], qf = s_0(wf) + H[ 0];
		}

		/* expansion f1 (table 2.3, ch. 2.1.1) */
		{
			uword_t m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,ma,mb,mc,md,me,mf;

			/* find AddElement for all quad pipe values q0-15 and Q0-15 */
			m2 = rl(M[2], 3), m9 = rl(M[9], 10), mf = rl(M[15], 16);
			Qf = (K[15] + m2 - m9 + mf) ^ H[ 6];
			m1 = rl(M[1], 2), m8 = rl(M[8], 9), me = rl(M[14], 15);
			Qe = (K[14] + m1 - m8 + me) ^ H[ 5];
			m0 = rl(M[0], 1), m7 = rl(M[7], 8), md = rl(M[13], 14);
			Qd = (K[13] + m0 - m7 + md) ^ H[ 4];
			m6 = rl(M[6], 7);
			Q6 = (K[ 6] - m0 + m6 + m9) ^ H[13];
			m5 = rl(M[5], 6);
			Q5 = (K[ 5] + m5 + m8 - mf) ^ H[12];
			mc = rl(M[12], 13);
			Qc = (K[12] - m6 + mc + mf) ^ H[ 3];
			Q2 = (K[ 2] + m2 + m5 - mc) ^ H[ 9];
			mb = rl(M[11], 12);
			Qb = (K[11] - m5 + mb + me) ^ H[ 2];
			ma = rl(M[10], 11);
			Q8 = (K[ 8] - m2 + m8 + mb) ^ H[15];
			Q7 = (K[ 7] - m1 + m7 + ma) ^ H[14];
			m4 = rl(M[4], 5);
			Qa = (K[10] - m4 + ma + md) ^ H[ 1];
			Q4 = (K[ 4] + m4 + m7 - me) ^ H[11];
			Q1 = (K[ 1] + m1 + m4 - mb) ^ H[ 8];
			m3 = rl(M[3], 4);
			Q9 = (K[ 9] - m3 + m9 + mc) ^ H[ 0];
			Q3 = (K[ 3] + m3 + m6 - md) ^ H[10];
			Q0 = (K[ 0] + m0 + m3 - ma) ^ H[ 7];
		}

		{
			uword_t s, sb,sc,sd,sf, S0, te,to;

			/* part 1.1, ExpandRounds1 */
			Q0 += s_1(q0) + s_2(q1) + s_0(q3) + s_2(q5) + s_0(q7) + s_2(q9)
				+ s_2(qd);
			sb = rl(qb, 19), sf = rl(qf, 19);
			Q0 += (shr(qb, 1) ^ shl(qb, 3) ^ rl(qb,  4) ^ sb)
				+ (shr(qf, 1) ^ shl(qf, 3) ^ rl(qf,  4) ^ sf);
			Q1 += s_1(q1) + s_3(q3) + s_1(q5) + s_3(q7) + s_1(q9) + s_3(qb)
				+ s_3(qf);
			s = shr(q2, 2);
			sd = rl(qd, 23);
			Q0 += s ^ shl(q2, 2) ^ rl(q2, 15) ^ rl(q2, 29);
			Q1 += (s ^ shl(q2, 1) ^ rl(q2, 12) ^ rl(q2, 25))
				+ (shr(qd, 1) ^ shl(qd, 2) ^ rl(qd,  8) ^ sd);
			s = shr(q4, 1);
			Q0 += s ^ shl(q4, 2) ^ rl(q4,  8) ^ rl(q4, 23);
			Q1 += s ^ shl(q4, 3) ^ rl(q4,  4) ^ rl(q4, 19);
			s = shr(q6, 2);
			Q0 += s ^ shl(q6, 2) ^ rl(q6, 15) ^ rl(q6, 29);
			Q1 += s ^ shl(q6, 1) ^ rl(q6, 12) ^ rl(q6, 25);
			s = shr(q8, 1);
			Q0 += s ^ shl(q8, 2) ^ rl(q8,  8) ^ rl(q8, 23);
			Q1 += s ^ shl(q8, 3) ^ rl(q8,  4) ^ rl(q8, 19);
			s = shr(qa, 2);
			Q0 += s ^ shl(qa, 2) ^ rl(qa, 15) ^ rl(qa, 29);
			Q1 += s ^ shl(qa, 1) ^ rl(qa, 12) ^ rl(qa, 25);
			s = shr(qc, 1);
			sc = rl(qc, 19);
			Q0 += s ^ shl(qc, 2) ^ rl(qc,  8) ^ rl(qc, 23);
			Q1 += s ^ shl(qc, 3) ^ rl(qc,  4) ^ sc;
			s = shr(qe, 2);
			Q0 += s ^ shl(qe, 2) ^ rl(qe, 15) ^ rl(qe, 29); /*Q^i_16*/
			Q1 += s ^ shl(qe, 1) ^ rl(qe, 12) ^ rl(qe, 25);
			s = shr(Q0, 1);
			S0 = rl(Q0, 19);
			Q1 += s ^ shl(Q0, 3) ^ rl(Q0,  4) ^ S0;         /*Q^i_17*/

			/* part 1.2, ExpandRounds2 */
			Q2 += (s ^ Q0) + s_5(Q1);
			Qe += qe;
			te = qc + qe, Qc += te;
			te += qa, Qa += te;
			te += q8, Q8 += te;
			te += q6, Q6 += te;
			te += q4, Q4 += te;
			te += q2, Q2 += te + r_1(q3) + r_2(q5) + r_3(q7) + r_4(q9) + sb	+ sd
				+ r_7(qf);                               /*Q^i_18*/
			Qf += qf;
			to = qd + qf, Qd += to;
			to += qb, Qb += to;
			to += q9, Q9 += to;
			to += q7, Q7 += to;
			to += q5, Q5 += to;
			to += q3, Q3 += to + r_1(q4) + r_2(q6) + r_3(q8) + r_4(qa) + sc
				+ r_6(qe) + r_7(Q0) + s_4(Q1) + s_5(Q2); /*Q^i_19*/
			Q4 += Q0 + r_1(q5) + r_2(q7) + r_3(q9) + r_4(qb) + r_5(qd)
				+ r_6(qf) + r_7(Q1) + s_4(Q2) + s_5(Q3); /*Q^i_20*/
			Q5 += Q1 + r_1(q6) + r_2(q8) + r_3(qa) + r_4(qc) + r_5(qe)
				+ r_6(Q0) + r_7(Q2) + s_4(Q3) + s_5(Q4); /*Q^i_21*/
			te = Q0 + Q2, Q6 += te + r_1(q7) + r_2(q9) + r_3(qb) + r_4(qd) + sf
				+ r_6(Q1) + r_7(Q3) + s_4(Q4) + s_5(Q5); /*Q^i_22*/
			to = Q1 + Q3, Q7 += to + r_1(q8) + r_2(qa) + r_3(qc) + r_4(qe) + S0
				+ r_6(Q2) + r_7(Q4) + s_4(Q5) + s_5(Q6); /*Q^i_23*/
			te += Q4, Q8 += te + r_1(q9) + r_2(qb) + r_3(qd) + r_4(qf) + r_5(Q1)
				+ r_6(Q3) + r_7(Q5) + s_4(Q6) + s_5(Q7); /*Q^i_24*/
			to += Q5, Q9 += to + r_1(qa) + r_2(qc) + r_3(qe) + r_4(Q0) + r_5(Q2)
				+ r_6(Q4) + r_7(Q6) + s_4(Q7) + s_5(Q8); /*Q^i_25*/
			te += Q6, Qa += te + r_1(qb) + r_2(qd) + r_3(qf) + r_4(Q1) + r_5(Q3)
				+ r_6(Q5) + r_7(Q7) + s_4(Q8) + s_5(Q9); /*Q^i_26*/
			to += Q7, Qb += to + r_1(qc) + r_2(qe) + r_3(Q0) + r_4(Q2) + r_5(Q4)
				+ r_6(Q6) + r_7(Q8) + s_4(Q9) + s_5(Qa); /*Q^i_27*/
			te += Q8, Qc += te + r_1(qd) + r_2(qf) + r_3(Q1) + r_4(Q3) + r_5(Q5)
				+ r_6(Q7) + r_7(Q9) + s_4(Qa) + s_5(Qb); /*Q^i_28*/
			to += Q9, Qd += to + r_1(qe) + r_2(Q0) + r_3(Q2) + r_4(Q4) + r_5(Q6)
				+ r_6(Q8) + r_7(Qa) + s_4(Qb) + s_5(Qc); /*Q^i_29*/
			te += Qa, Qe += te + r_1(qf) + r_2(Q1) + r_3(Q3) + r_4(Q5) + r_5(Q7)
				+ r_6(Q9) + r_7(Qb) + s_4(Qc) + s_5(Qd); /*Q^i_30*/
			to += Qb, Qf += to + r_1(Q0) + r_2(Q2) + r_3(Q4) + r_4(Q6) + r_5(Q8)
				+ r_6(Qa) + r_7(Qc) + s_4(Qd) + s_5(Qe); /*Q^i_31*/
		}

		{
			uword_t tl,th, xl,xh;

			/* folding f2, part 1 (table 2.4, ch. 2.1.1) */
			xl = Q0 ^ Q1 ^ Q2 ^ Q3 ^ Q4 ^ Q5 ^ Q6 ^ Q7;
			tl = xl ^ Q8;
			th = tl ^ Q9 ^ Qa ^ Qb ^ Qc ^ Qd ^ Qe;
			xh = th ^ Qf;

			/* folding f2, part 2 (table 2.4, ch. 2.1.1) */
			H[ 0] = (shl(xh, 5) ^ shr(Q0, 5) ^ M[ 0]) + (tl ^      q0);
			H[ 1] = (shr(xh, 7) ^ shl(Q1, 8) ^ M[ 1]) + (xl ^ Q9 ^ q1);
			H[ 2] = (shr(xh, 5) ^ shl(Q2, 5) ^ M[ 2]) + (xl ^ Qa ^ q2);
			H[ 3] = (shr(xh, 1) ^ shl(Q3, 5) ^ M[ 3]) + (xl ^ Qb ^ q3);
			H[ 4] = (shr(xh, 3) ^        Q4  ^ M[ 4]) + (xl ^ Qc ^ q4);
			H[ 5] = (shl(xh, 6) ^ shr(Q5, 6) ^ M[ 5]) + (xl ^ Qd ^ q5);
			H[ 6] = (shr(xh, 4) ^ shl(Q6, 6) ^ M[ 6]) + (xl ^ Qe ^ q6);
			H[ 7] = (shr(xh,11) ^ shl(Q7, 2) ^ M[ 7]) + (xl ^ Qf ^ q7);

			H[ 8] = rl(H[4], 9) + (xh ^ Q8 ^ M[ 8]) + (shl(xl, 8) ^ Q7 ^ q8);
			H[ 9] = rl(H[5],10) + (xh ^ Q9 ^ M[ 9]) + (shr(xl, 6) ^ Q0 ^ q9);
			H[10] = rl(H[6],11) + (xh ^ Qa ^ M[10]) + (shl(xl, 6) ^ Q1 ^ qa);
			H[11] = rl(H[7],12) + (xh ^ Qb ^ M[11]) + (shl(xl, 4) ^ Q2 ^ qb);
			H[12] = rl(H[0],13) + (xh ^ Qc ^ M[12]) + (shr(xl, 3) ^ Q3 ^ qc);
			H[13] = rl(H[1],14) + (xh ^ Qd ^ M[13]) + (shr(xl, 4) ^ Q4 ^ qd);
			H[14] = rl(H[2],15) + (xh ^ Qe ^ M[14]) + (shr(xl, 7) ^ Q5 ^ qe);
			H[15] = rl(H[3],16) + (th ^      M[15]) + (shr(xl, 2) ^ Q6 ^ qf);
		}

		/* update to next message input block*/
		if (--n_tail) {
			M += N_BLOCK_WORDS;
		} else {
			/* finalization part */
			M = H, H = M_tail;
			memcpy(H, C_final, sizeof(C_final));
		}
	}

	/* output the least significant bits (part 4, table 2.1, ch. 2.1.1) */
	H = M_tail+8;
#if defined(MACHINE_IS_BIG_ENDIAN)
	{
		uword_t *dst = (uword_t *)out;
		unsigned i;

		for (i = 0; i < N_BMW256_DIGEST_BYTES >> N_BMW256_BYTES_2_WORDS; i++)
			st_swap32(H[i], dst+i);
	}
#else
	memcpy(out, H, N_BMW256_DIGEST_BYTES);
#endif

	return 0;
}

#if defined(MACHINE_IS_BIG_ENDIAN)
#define M(i) swp##i
#else
#define M(i) msg[i]
#endif

void
Compression256_loop(uword_t *msg, uword_t *H, uint64_t nbytes)
{
	uword_t q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,qa,qb,qc,qd,qe,qf; /*Q[ 0-15]*/
	uword_t Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Qa,Qb,Qc,Qd,Qe,Qf; /*Q[16-31]*/
#if defined(MACHINE_IS_BIG_ENDIAN)
	uword_t swp0,swp1,swp2,swp3,swp4,swp5,swp6,swp7,swp8,swp9,swp10,swp11,
		swp12,swp13,swp14,swp15;      /*need 0-15 because of LD_SWAP()*/
#endif
	uint64_t nblocks;
	unsigned i;

	/* initialize the double pipe (part 1c, table 2.1, ch. 2.1.1) */
	for (i = 0; i < N_BLOCK_WORDS; i++)
		H[i] = N_BMW256_DP_INIT + i*N_BMW256_DP_INCR;

	for (nblocks = 0; nblocks < nbytes >> N_BMW256_BLOCK_BYTES_2; nblocks++) {
		{
			uword_t u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,ua,ub,uc,ud,ue,uf;
			uword_t w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,wa,wb,wc,wd,we,wf; /*W[0-15]*/
			uword_t t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,ta;

			/* bijection f0, part 1 (table 2.2, ch. 2.1.1) */
			LD_SWAP(msg, swp, 0); LD_SWAP(msg, swp, 1);
			u0 = M( 0) ^ H[ 0], u1 = M( 1) ^ H[ 1];
			LD_SWAP(msg, swp, 2); LD_SWAP(msg, swp, 3);
			u2 = M( 2) ^ H[ 2], u3 = M( 3) ^ H[ 3];
			LD_SWAP(msg, swp, 4); LD_SWAP(msg, swp, 5);
			u4 = M( 4) ^ H[ 4], u5 = M( 5) ^ H[ 5];
			LD_SWAP(msg, swp, 6); LD_SWAP(msg, swp, 7);
			u6 = M( 6) ^ H[ 6], u7 = M( 7) ^ H[ 7];
			LD_SWAP(msg, swp, 8); LD_SWAP(msg, swp, 9);
			u8 = M( 8) ^ H[ 8], u9 = M( 9) ^ H[ 9];
			LD_SWAP(msg, swp,10); LD_SWAP(msg, swp,11);
			ua = M(10) ^ H[10], ub = M(11) ^ H[11];
			LD_SWAP(msg, swp,12); LD_SWAP(msg, swp,13);
			uc = M(12) ^ H[12], ud = M(13) ^ H[13];
			LD_SWAP(msg, swp,14); LD_SWAP(msg, swp,15);
			ue = M(14) ^ H[14], uf = M(15) ^ H[15];
	
			t0 = ue - u7, t1 = uf + u8;
			t2 = uc - u9, t3 = ua + u1;
			t4 = u1 - ue, t5 = uf - u2;
			t6 = u3 - uc, t7 = ud - u6;
			t8 = u6 - u3, t9 = u4 + u7;
			ta = u8 - u5;

			w0 = u5 + t0 + ua + ud, w1 = u6 - t1 + ub + ue;
			w2 = u0 + u7 - t2 + uf, w3 = u0 - t3 + u8 + ud;
			w4 = t4 + u2 + u9 - ub, w5 = t5 + t6 + ua;
			w6 = u4 - u0 - u3 - ub + ud, w7 = t4 - u4 - u5 - uc;
			w8 = t7 - t5 - u5, w9 = u0 + t8 + t0;
			wa = t1 - u1 - t9, wb = ta - u0 - u2 + u9;
			wc = t3 - t8 - u9, wd = u2 + t9 + ua + ub;
			we = t6 + ta - ub, wf = t2 - u4 + t7;

			/* bijection f0, part 2 (table 2.2, ch. 2.1.1) */
			q0 = s_0(w0) + H[ 1], q1 = s_1(w1) + H[ 2];
			q2 = s_2(w2) + H[ 3], q3 = s_3(w3) + H[ 4];
			q4 = s_4(w4) + H[ 5], q5 = s_0(w5) + H[ 6];
			q6 = s_1(w6) + H[ 7], q7 = s_2(w7) + H[ 8];
			q8 = s_3(w8) + H[ 9], q9 = s_4(w9) + H[10];
			qa = s_0(wa) + H[11], qb = s_1(wb) + H[12];
			qc = s_2(wc) + H[13], qd = s_3(wd) + H[14];
			qe = s_4(we) + H[15], qf = s_0(wf) + H[ 0];
		}

		/* expansion f1 (table 2.3, ch. 2.1.1) */
		{
			uword_t m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,ma,mb,mc,md,me,mf;

			/* find AddElement for all quad pipe values q0-15 and Q0-15 */
			m2 = rl(M(2), 3), m9 = rl(M(9), 10), mf = rl(M(15), 16);
			Qf = (K[15] + m2 - m9 + mf) ^ H[ 6];
			m1 = rl(M(1), 2), m8 = rl(M(8), 9), me = rl(M(14), 15);
			Qe = (K[14] + m1 - m8 + me) ^ H[ 5];
			m0 = rl(M(0), 1), m7 = rl(M(7), 8), md = rl(M(13), 14);
			Qd = (K[13] + m0 - m7 + md) ^ H[ 4];
			m6 = rl(M(6), 7);
			Q6 = (K[ 6] - m0 + m6 + m9) ^ H[13];
			m5 = rl(M(5), 6);
			Q5 = (K[ 5] + m5 + m8 - mf) ^ H[12];
			mc = rl(M(12), 13);
			Qc = (K[12] - m6 + mc + mf) ^ H[ 3];
			Q2 = (K[ 2] + m2 + m5 - mc) ^ H[ 9];
			mb = rl(M(11), 12);
			Qb = (K[11] - m5 + mb + me) ^ H[ 2];
			ma = rl(M(10), 11);
			Q8 = (K[ 8] - m2 + m8 + mb) ^ H[15];
			Q7 = (K[ 7] - m1 + m7 + ma) ^ H[14];
			m4 = rl(M(4), 5);
			Qa = (K[10] - m4 + ma + md) ^ H[ 1];
			Q4 = (K[ 4] + m4 + m7 - me) ^ H[11];
			Q1 = (K[ 1] + m1 + m4 - mb) ^ H[ 8];
			m3 = rl(M(3), 4);
			Q9 = (K[ 9] - m3 + m9 + mc) ^ H[ 0];
			Q3 = (K[ 3] + m3 + m6 - md) ^ H[10];
			Q0 = (K[ 0] + m0 + m3 - ma) ^ H[ 7];
		}

		{
			uword_t s, sb,sc,sd,sf, S0, te,to;

			/* part 1.1, ExpandRounds1 */
			Q0 += s_1(q0) + s_2(q1) + s_0(q3) + s_2(q5) + s_0(q7) + s_2(q9)
				+ s_2(qd);
			sb = rl(qb, 19), sf = rl(qf, 19);
			Q0 += (shr(qb, 1) ^ shl(qb, 3) ^ rl(qb,  4) ^ sb)
				+ (shr(qf, 1) ^ shl(qf, 3) ^ rl(qf,  4) ^ sf);
			Q1 += s_1(q1) + s_3(q3) + s_1(q5) + s_3(q7) + s_1(q9) + s_3(qb)
				+ s_3(qf);
			s = shr(q2, 2);
			sd = rl(qd, 23);
			Q0 += s ^ shl(q2, 2) ^ rl(q2, 15) ^ rl(q2, 29);
			Q1 += (s ^ shl(q2, 1) ^ rl(q2, 12) ^ rl(q2, 25))
				+ (shr(qd, 1) ^ shl(qd, 2) ^ rl(qd,  8) ^ sd);
			s = shr(q4, 1);
			Q0 += s ^ shl(q4, 2) ^ rl(q4,  8) ^ rl(q4, 23);
			Q1 += s ^ shl(q4, 3) ^ rl(q4,  4) ^ rl(q4, 19);
			s = shr(q6, 2);
			Q0 += s ^ shl(q6, 2) ^ rl(q6, 15) ^ rl(q6, 29);
			Q1 += s ^ shl(q6, 1) ^ rl(q6, 12) ^ rl(q6, 25);
			s = shr(q8, 1);
			Q0 += s ^ shl(q8, 2) ^ rl(q8,  8) ^ rl(q8, 23);
			Q1 += s ^ shl(q8, 3) ^ rl(q8,  4) ^ rl(q8, 19);
			s = shr(qa, 2);
			Q0 += s ^ shl(qa, 2) ^ rl(qa, 15) ^ rl(qa, 29);
			Q1 += s ^ shl(qa, 1) ^ rl(qa, 12) ^ rl(qa, 25);
			s = shr(qc, 1);
			sc = rl(qc, 19);
			Q0 += s ^ shl(qc, 2) ^ rl(qc,  8) ^ rl(qc, 23);
			Q1 += s ^ shl(qc, 3) ^ rl(qc,  4) ^ sc;
			s = shr(qe, 2);
			Q0 += s ^ shl(qe, 2) ^ rl(qe, 15) ^ rl(qe, 29); /*Q^i_16*/
			Q1 += s ^ shl(qe, 1) ^ rl(qe, 12) ^ rl(qe, 25);
			s = shr(Q0, 1);
			S0 = rl(Q0, 19);
			Q1 += s ^ shl(Q0, 3) ^ rl(Q0,  4) ^ S0;         /*Q^i_17*/

			/* part 1.2, ExpandRounds2 */
			Q2 += (s ^ Q0) + s_5(Q1);
			Qe += qe;
			te = qc + qe, Qc += te;
			te += qa, Qa += te;
			te += q8, Q8 += te;
			te += q6, Q6 += te;
			te += q4, Q4 += te;
			te += q2, Q2 += te + r_1(q3) + r_2(q5) + r_3(q7) + r_4(q9) + sb	+ sd
				+ r_7(qf);                               /*Q^i_18*/
			Qf += qf;
			to = qd + qf, Qd += to;
			to += qb, Qb += to;
			to += q9, Q9 += to;
			to += q7, Q7 += to;
			to += q5, Q5 += to;
			to += q3, Q3 += to + r_1(q4) + r_2(q6) + r_3(q8) + r_4(qa) + sc
				+ r_6(qe) + r_7(Q0) + s_4(Q1) + s_5(Q2); /*Q^i_19*/
			Q4 += Q0 + r_1(q5) + r_2(q7) + r_3(q9) + r_4(qb) + r_5(qd)
				+ r_6(qf) + r_7(Q1) + s_4(Q2) + s_5(Q3); /*Q^i_20*/
			Q5 += Q1 + r_1(q6) + r_2(q8) + r_3(qa) + r_4(qc) + r_5(qe)
				+ r_6(Q0) + r_7(Q2) + s_4(Q3) + s_5(Q4); /*Q^i_21*/
			te = Q0 + Q2, Q6 += te + r_1(q7) + r_2(q9) + r_3(qb) + r_4(qd) + sf
				+ r_6(Q1) + r_7(Q3) + s_4(Q4) + s_5(Q5); /*Q^i_22*/
			to = Q1 + Q3, Q7 += to + r_1(q8) + r_2(qa) + r_3(qc) + r_4(qe) + S0
				+ r_6(Q2) + r_7(Q4) + s_4(Q5) + s_5(Q6); /*Q^i_23*/
			te += Q4, Q8 += te + r_1(q9) + r_2(qb) + r_3(qd) + r_4(qf) + r_5(Q1)
				+ r_6(Q3) + r_7(Q5) + s_4(Q6) + s_5(Q7); /*Q^i_24*/
			to += Q5, Q9 += to + r_1(qa) + r_2(qc) + r_3(qe) + r_4(Q0) + r_5(Q2)
				+ r_6(Q4) + r_7(Q6) + s_4(Q7) + s_5(Q8); /*Q^i_25*/
			te += Q6, Qa += te + r_1(qb) + r_2(qd) + r_3(qf) + r_4(Q1) + r_5(Q3)
				+ r_6(Q5) + r_7(Q7) + s_4(Q8) + s_5(Q9); /*Q^i_26*/
			to += Q7, Qb += to + r_1(qc) + r_2(qe) + r_3(Q0) + r_4(Q2) + r_5(Q4)
				+ r_6(Q6) + r_7(Q8) + s_4(Q9) + s_5(Qa); /*Q^i_27*/
			te += Q8, Qc += te + r_1(qd) + r_2(qf) + r_3(Q1) + r_4(Q3) + r_5(Q5)
				+ r_6(Q7) + r_7(Q9) + s_4(Qa) + s_5(Qb); /*Q^i_28*/
			to += Q9, Qd += to + r_1(qe) + r_2(Q0) + r_3(Q2) + r_4(Q4) + r_5(Q6)
				+ r_6(Q8) + r_7(Qa) + s_4(Qb) + s_5(Qc); /*Q^i_29*/
			te += Qa, Qe += te + r_1(qf) + r_2(Q1) + r_3(Q3) + r_4(Q5) + r_5(Q7)
				+ r_6(Q9) + r_7(Qb) + s_4(Qc) + s_5(Qd); /*Q^i_30*/
			to += Qb, Qf += to + r_1(Q0) + r_2(Q2) + r_3(Q4) + r_4(Q6) + r_5(Q8)
				+ r_6(Qa) + r_7(Qc) + s_4(Qd) + s_5(Qe); /*Q^i_31*/
		}

		{
			uword_t tl,th, xl,xh;

			/* folding f2, part 1 (table 2.4, ch. 2.1.1) */
			xl = Q0 ^ Q1 ^ Q2 ^ Q3 ^ Q4 ^ Q5 ^ Q6 ^ Q7;
			tl = xl ^ Q8;
			th = tl ^ Q9 ^ Qa ^ Qb ^ Qc ^ Qd ^ Qe;
			xh = th ^ Qf;

			/* folding f2, part 2 (table 2.4, ch. 2.1.1) */
			H[ 0] = (shl(xh, 5) ^ shr(Q0, 5) ^ M( 0)) + (tl ^      q0);
			H[ 1] = (shr(xh, 7) ^ shl(Q1, 8) ^ M( 1)) + (xl ^ Q9 ^ q1);
			H[ 2] = (shr(xh, 5) ^ shl(Q2, 5) ^ M( 2)) + (xl ^ Qa ^ q2);
			H[ 3] = (shr(xh, 1) ^ shl(Q3, 5) ^ M( 3)) + (xl ^ Qb ^ q3);
			H[ 4] = (shr(xh, 3) ^        Q4  ^ M( 4)) + (xl ^ Qc ^ q4);
			H[ 5] = (shl(xh, 6) ^ shr(Q5, 6) ^ M( 5)) + (xl ^ Qd ^ q5);
			H[ 6] = (shr(xh, 4) ^ shl(Q6, 6) ^ M( 6)) + (xl ^ Qe ^ q6);
			H[ 7] = (shr(xh,11) ^ shl(Q7, 2) ^ M( 7)) + (xl ^ Qf ^ q7);

			H[ 8] = rl(H[4], 9) + (xh ^ Q8 ^ M( 8)) + (shl(xl, 8) ^ Q7 ^ q8);
			H[ 9] = rl(H[5],10) + (xh ^ Q9 ^ M( 9)) + (shr(xl, 6) ^ Q0 ^ q9);
			H[10] = rl(H[6],11) + (xh ^ Qa ^ M(10)) + (shl(xl, 6) ^ Q1 ^ qa);
			H[11] = rl(H[7],12) + (xh ^ Qb ^ M(11)) + (shl(xl, 4) ^ Q2 ^ qb);
			H[12] = rl(H[0],13) + (xh ^ Qc ^ M(12)) + (shr(xl, 3) ^ Q3 ^ qc);
			H[13] = rl(H[1],14) + (xh ^ Qd ^ M(13)) + (shr(xl, 4) ^ Q4 ^ qd);
			H[14] = rl(H[2],15) + (xh ^ Qe ^ M(14)) + (shr(xl, 7) ^ Q5 ^ qe);
			H[15] = rl(H[3],16) + (th ^      M(15)) + (shr(xl, 2) ^ Q6 ^ qf);
		}

		/* update to next message input block*/
		msg += N_BLOCK_WORDS;
	}
}

#undef M
