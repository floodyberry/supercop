/* finite field arithmetic */

/* reduction modulus X^192+X^19+1 (shift-and-add) */
#define ffa_red_192_019_001(rd_a, rd_b, rd_c, rd_d, rd_e, rd_f, re_0, re_1, re_2);\
    re_2 = _mm_xor_si128(rd_c, rd_f);\
    re_1 = _mm_xor_si128(rd_b, rd_e);\
    re_2 = _mm_xor_si128(re_2, _mm_slli_epi64(rd_f, 19));\
    re_1 = _mm_xor_si128(re_1, _mm_slli_epi64(rd_e, 19));\
    re_2 = _mm_xor_si128(re_2, _mm_srli_epi64(rd_e, 45));\
    re_1 = _mm_xor_si128(re_1, _mm_srli_epi64(rd_d, 45));\
    re_0 = _mm_xor_si128(rd_d, _mm_srli_epi64(rd_f, 45));\
    re_0 = _mm_xor_si128(re_0, _mm_slli_epi64(re_0, 19));\
    re_0 = _mm_xor_si128(re_0, rd_a);

/* basic step of the reduction modulus 63-term polynomial f(x) = X^149 + ... + 1 (mul-and-add) */
#define ffa_red_149_stp(p_00,p_01,tp_0,tp_1,tp_2,p_149_0,p_149_1)\
    tp_0 = _mm_srli_epi64(p_01, 21);\
    tp_2 = _mm_clmulepi64_si128(p_149_0, tp_0, 0x00);\
    tp_1 = _mm_clmulepi64_si128(p_149_0, tp_0, 0x01);\
    tp_0 = _mm_clmulepi64_si128(p_149_1, tp_0, 0x00);\
    tp_2 = _mm_xor_si128(tp_2, _mm_slli_si128(tp_1, 8));\
    tp_0 = _mm_xor_si128(tp_0, _mm_srli_si128(tp_1, 8));\
    p_00 = _mm_xor_si128(p_00, tp_2);\
    p_01 = _mm_xor_si128(p_01, tp_0);

/* reduction modulus 63-term polynomial f(x) = X^149 + ... + 1 (mul-and-add) */
void ffa_red_149(__m128i *re_0, __m128i *re_1, __m128i *re_2, 
                 __m128i rd_a, __m128i rd_b, __m128i rd_c) {
    /* var */
    __m128i a_00, a_01, b_00, b_01;
    __m128i p_149_0, p_149_1;
    __m128i tp_0, tp_1, tp_2;

    /* pre */
    /* uninterleaving */
    a_00 = _mm_unpacklo_epi64(rd_a, rd_b);
    a_01 = _mm_move_epi64(rd_c);
    b_00 = _mm_unpackhi_epi64(rd_a, rd_b);
    b_01 = _mm_srli_si128(rd_c, 8);

    /* ini */ 
    p_149_0 = _mm_set_epi64x(0x0EA69E085C6B68DB, 0x806B0FE814879E0F);
    p_149_1 = _mm_set_epi64x(0x0, 0x24BE02);

    /* man */
    /* constant term reduction */
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);

    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);

    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(a_00, a_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);

    /* linear term reduction */
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);

    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);

    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);
    ffa_red_149_stp(b_00, b_01, tp_0, tp_1, tp_2, p_149_0, p_149_1);

    /* end */
    /* interleaving */
    *re_0 = _mm_unpacklo_epi64(a_00, b_00);
    *re_1 = _mm_unpackhi_epi64(a_00, b_00);
    *re_2 = _mm_unpacklo_epi64(a_01, b_01);
    return;
}

/* addition */
#define ffa_add(re_0, re_1, re_2, ba_0, ba_1, ba_2, dc_0, dc_1, dc_2)\
    re_0 = _mm_xor_si128(ba_0, dc_0);\
    re_1 = _mm_xor_si128(ba_1, dc_1);\
    re_2 = _mm_xor_si128(ba_2, dc_2);

/* karatsuba multiplication step */
#define ffa_kts_stp(o_00, o_01, o_02, s_01, s_02, s_12)\
    o_00 = _mm_clmulepi64_si128(o_00, o_00, 0x01);\
    o_01 = _mm_clmulepi64_si128(o_01, o_01, 0x01);\
    o_02 = _mm_clmulepi64_si128(o_02, o_02, 0x01);\
    s_01 = _mm_clmulepi64_si128(s_01, s_01, 0x01);\
    s_02 = _mm_clmulepi64_si128(s_02, s_02, 0x01);\
    s_12 = _mm_clmulepi64_si128(s_12, s_12, 0x01);\
    s_12 = _mm_xor_si128(s_12, o_01);\
    s_12 = _mm_xor_si128(s_12, o_02);\
    o_01 = _mm_xor_si128(o_01, o_00);\
    s_02 = _mm_xor_si128(s_02, o_01);\
    s_02 = _mm_xor_si128(s_02, o_02);\
    s_01 = _mm_xor_si128(s_01, o_01);\
    o_00 = _mm_xor_si128(o_00, _mm_slli_si128(s_01, 8));\
    o_02 = _mm_xor_si128(o_02, _mm_srli_si128(s_12, 8));\
    o_01 = _mm_xor_si128(s_02, _mm_alignr_epi8(s_12, s_01, 8));

/* multiplication */
void ffa_mul(__m128i *re_0, __m128i *re_1, __m128i *re_2, 
             __m128i ba_0, __m128i ba_1, __m128i ba_2,
             __m128i dc_0, __m128i dc_1, __m128i dc_2) {
    /* var */
    __m128i ca_0, ca_1, ca_2;
    __m128i db_0, db_1, db_2;
    __m128i su_0, su_1, su_2;

    __m128i g_01, g_02, g_12;
    __m128i h_01, h_02, h_12;
    __m128i i_01, i_02, i_12;

    __m128i rd_a, rd_b, rd_c;
    __m128i rd_d, rd_e, rd_f;

    /* pre */
    ca_0 = _mm_unpacklo_epi64(ba_0, dc_0);
    ca_1 = _mm_unpacklo_epi64(ba_1, dc_1);
    ca_2 = _mm_unpacklo_epi64(ba_2, dc_2);

    db_0 = _mm_unpackhi_epi64(ba_0, dc_0);
    db_1 = _mm_unpackhi_epi64(ba_1, dc_1);
    db_2 = _mm_unpackhi_epi64(ba_2, dc_2);

    su_0 = _mm_xor_si128(ca_0, db_0);
    su_1 = _mm_xor_si128(ca_1, db_1);
    su_2 = _mm_xor_si128(ca_2, db_2);

    i_01 = _mm_xor_si128(su_0, su_1);
    i_02 = _mm_xor_si128(su_0, su_2);
    i_12 = _mm_xor_si128(su_1, su_2);

    g_01 = _mm_xor_si128(ca_0, ca_1);
    g_02 = _mm_xor_si128(ca_0, ca_2);
    g_12 = _mm_xor_si128(ca_1, ca_2);

    h_01 = _mm_xor_si128(db_0, db_1);
    h_02 = _mm_xor_si128(db_0, db_2);
    h_12 = _mm_xor_si128(db_1, db_2);

    /* man */
    /* multiplication */
    ffa_kts_stp(ca_0, ca_1, ca_2, g_01, g_02, g_12);
    ffa_kts_stp(db_0, db_1, db_2, h_01, h_02, h_12);
    ffa_kts_stp(su_0, su_1, su_2, i_01, i_02, i_12);

    /* addition */
    db_0 = _mm_xor_si128(db_0, ca_0);
    db_1 = _mm_xor_si128(db_1, ca_1);
    db_2 = _mm_xor_si128(db_2, ca_2);
    su_0 = _mm_xor_si128(su_0, ca_0);
    su_1 = _mm_xor_si128(su_1, ca_1);
    su_2 = _mm_xor_si128(su_2, ca_2);

    /* reduction */
    rd_a = _mm_unpacklo_epi64(db_0, su_0);
    rd_b = _mm_unpackhi_epi64(db_0, su_0);
    rd_c = _mm_unpacklo_epi64(db_1, su_1);
    rd_d = _mm_unpackhi_epi64(db_1, su_1);
    rd_e = _mm_unpacklo_epi64(db_2, su_2);
    rd_f = _mm_unpackhi_epi64(db_2, su_2);
    ffa_red_192_019_001(rd_a, rd_b, rd_c, rd_d, rd_e, rd_f, *re_0, *re_1, *re_2);

    /* end */
    return;
}

/* multiplication by element "y" */
void ffa_muy(__m128i *re_0, __m128i *re_1, __m128i *re_2, __m128i op00, __m128i op01, __m128i op02) {
    /* var */
    __m128i tp_0, tp_1, tp_2;

    /* man */
    /* switch constant and linear parts */
    tp_0 = _mm_alignr_epi8(op00, op00, 8);
    tp_1 = _mm_alignr_epi8(op01, op01, 8);
    tp_2 = _mm_alignr_epi8(op02, op02, 8);

    *re_0 = _mm_slli_si128(tp_0, 8);
    *re_1 = _mm_slli_si128(tp_1, 8);
    *re_2 = _mm_slli_si128(tp_2, 8);

    /* add constant and linear parts */
    *re_0 = _mm_xor_si128(*re_0, tp_0);
    *re_1 = _mm_xor_si128(*re_1, tp_1);
    *re_2 = _mm_xor_si128(*re_2, tp_2);

    /* end */
    return;
}

/* squaring step */
#define ffa_sqr_stp(sq_0,sq_1,sq_2,sq_3,sq_4,sq_5,o_00,o_01,o_02)\
    sq_0 = _mm_clmulepi64_si128(o_00, o_00, 0x00);\
    sq_1 = _mm_clmulepi64_si128(o_00, o_00, 0x11);\
    sq_2 = _mm_clmulepi64_si128(o_01, o_01, 0x00);\
    sq_3 = _mm_clmulepi64_si128(o_01, o_01, 0x11);\
    sq_4 = _mm_clmulepi64_si128(o_02, o_02, 0x00);\
    sq_5 = _mm_clmulepi64_si128(o_02, o_02, 0x11)

/* squaring */
void ffa_sqr(__m128i *re_0, __m128i *re_1, __m128i *re_2, __m128i ba_0, __m128i ba_1, __m128i ba_2) {
    /* var */
    __m128i tp_0, tp_1, tp_2;
    __m128i sq_0, sq_1, sq_2, sq_3, sq_4, sq_5;

    /* ini */
    tp_0 = _mm_shuffle_epi32(ba_0, 0xD8);
    tp_1 = _mm_shuffle_epi32(ba_1, 0xD8);
    tp_2 = _mm_shuffle_epi32(ba_2, 0xD8);

    /* man */
    /* squaring */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, tp_0, tp_1, tp_2);

    /* reduction */
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, *re_0, *re_1, *re_2);

    /* end */
    /* interleaving */
    tp_0 = _mm_srli_si128(*re_0, 8);
    tp_1 = _mm_srli_si128(*re_1, 8);
    tp_2 = _mm_srli_si128(*re_2, 8);
    *re_0 = _mm_xor_si128(*re_0, tp_0);
    *re_1 = _mm_xor_si128(*re_1, tp_1);
    *re_2 = _mm_xor_si128(*re_2, tp_2);
    return;
}

/* multisquaring tables */
typedef uint64_t uint64_3[3];
#include "msq_04.h"
#include "msq_08.h"
#include "msq_16.h"
#include "msq_33.h"
#include "msq_74.h"

/* multisquaring variables */
#define ffa_msq_var()\
    uint64_t op64[6], acc[3];\
    uint64_t i;\
    uint64_t *ptr;\
    const uint64_t WORD_SIZE = 2;\
    const uint64_t LOOP_SIZE = 16;

/* multisquaring initialization */
#define ffa_msq_ini()\
    _mm_store_si128((__m128i *) &op64[0], op00);\
    _mm_store_si128((__m128i *) &op64[2], op01);\
    _mm_store_si128((__m128i *) &op64[4], op02);\
    acc[0] = 0; acc[1] = 0; acc[2] = 0;

/* multisquaring end */
#define ffa_msq_end()\
    *re_0 = _mm_loadl_epi64((__m128i *) &acc[0]);\
    *re_1 = _mm_loadl_epi64((__m128i *) &acc[1]);\
    *re_2 = _mm_loadl_epi64((__m128i *) &acc[2]);

/* multisquaring main */
#define ffa_msq_man(table)\
     for (i=0;i<LOOP_SIZE;i++) {\
        ptr = table[i][(op64[0] >> (i << WORD_SIZE)) & 0x0F];\
        acc[0] = acc[0] ^ (uint64_t) ptr[0];\
        acc[1] = acc[1] ^ (uint64_t) ptr[1];\
        acc[2] = acc[2] ^ (uint64_t) ptr[2];\
        ptr = table[i+16][(op64[2] >> (i << WORD_SIZE)) & 0x0F];\
        acc[0] = acc[0] ^ (uint64_t) ptr[0];\
        acc[1] = acc[1] ^ (uint64_t) ptr[1];\
        acc[2] = acc[2] ^ (uint64_t) ptr[2];\
        ptr = table[i+32][(op64[4] >> (i << WORD_SIZE)) & 0x0F];\
        acc[0] = acc[0] ^ (uint64_t) ptr[0];\
        acc[1] = acc[1] ^ (uint64_t) ptr[1];\
        acc[2] = acc[2] ^ (uint64_t) ptr[2];\
    }

/* multisquaring x^(2^4) */
void ffa_msq_004(__m128i *re_0, __m128i *re_1, __m128i *re_2,
                 __m128i op00, __m128i op01, __m128i op02) {
    ffa_msq_var();
    ffa_msq_ini();
    ffa_msq_man(tbl_sqr04);
    ffa_msq_end();
    return;
}

/* multisquaring x^(2^8) */
void ffa_msq_008(__m128i *re_0, __m128i *re_1, __m128i *re_2,
                 __m128i op00, __m128i op01, __m128i op02) {
    ffa_msq_var();
    ffa_msq_ini();
    ffa_msq_man(tbl_sqr08);
    ffa_msq_end();
    return;
}

/* multisquaring x^(2^16) */
void ffa_msq_016(__m128i *re_0, __m128i *re_1, __m128i *re_2,
                 __m128i op00, __m128i op01, __m128i op02) {
    ffa_msq_var();
    ffa_msq_ini();
    ffa_msq_man(tbl_sqr16);
    ffa_msq_end();
    return;
}

/* multisquaring x^(2^33) */
void ffa_msq_033(__m128i *re_0, __m128i *re_1, __m128i *re_2,
                __m128i op00, __m128i op01, __m128i op02) {
    ffa_msq_var();
    ffa_msq_ini();
    ffa_msq_man(tbl_sqr33);
    ffa_msq_end();
    return;
}

/* multisquaring x^(2^74) */
void ffa_msq_074(__m128i *re_0, __m128i *re_1, __m128i *re_2,
                __m128i op00, __m128i op01, __m128i op02) {
    ffa_msq_var();
    ffa_msq_ini();
    ffa_msq_man(tbl_sqr74);
    ffa_msq_end();
    return;
}

/* inversion base field */
void ffa_inv_bas(__m128i *re_0, __m128i *re_1, __m128i *re_2, 
                 __m128i op00, __m128i op01, __m128i op02) {
    /* var */
    __m128i tmp0, tmp1, tmp2;
    __m128i t8_0, t8_1, t8_2;

    /* x_2 = x^(2^2 - 1) = x^(2^1) * x */
    ffa_sqr(re_0, re_1, re_2, op00, op01, op02);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, op00, op01, op02);

    /* x_4 = x^(2^4 - 1) = x_2^(2^2) * x_2 */
    tmp0 = *re_0; tmp1 = *re_1; tmp2 = *re_2;
    ffa_sqr(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_sqr(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, tmp0, tmp1, tmp2);

    /* x_8 = x^(2^8 - 1) = x_4^(2^4) * x_4 */
    tmp0 = *re_0; tmp1 = *re_1; tmp2 = *re_2;
    ffa_msq_004(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, tmp0, tmp1, tmp2);

    /* x_16 = x^(2^16 - 1) = x_8^(2^8) * x_8 */
    t8_0 = *re_0; t8_1 = *re_1; t8_2 = *re_2;
    ffa_msq_008(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, t8_0, t8_1, t8_2);

    /* x_32 = x^(2^32 - 1) = x_16^(2^16) * x_16 */
    tmp0 = *re_0; tmp1 = *re_1; tmp2 = *re_2;
    ffa_msq_016(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, tmp0, tmp1, tmp2);

    /* x_33 = x^(2^33 - 1) = x_32^(2^1) * x */
    ffa_sqr(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, op00, op01, op02);

    /* x_66 = x^(2^66 - 1) = x_33^(2^33) * x_33 */
    tmp0 = *re_0; tmp1 = *re_1; tmp2 = *re_2;
    ffa_msq_033(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, tmp0, tmp1, tmp2);

    /* x_74 = x^(2^74 - 1) = x_66^(2^8) * x_8 */
    ffa_msq_008(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, t8_0, t8_1, t8_2);

    /* x_148 = x^(2^148 - 1) = x_74^(2^74) * x_74 */
    tmp0 = *re_0; tmp1 = *re_1; tmp2 = *re_2;
    ffa_msq_074(re_0, re_1, re_2, *re_0, *re_1, *re_2);
    ffa_mul(re_0, re_1, re_2, *re_0, *re_1, *re_2, tmp0, tmp1, tmp2);

    /* x_inv = x^(2^149 - 2) = x_148^(2^1) */
    ffa_sqr(re_0, re_1, re_2, *re_0, *re_1, *re_2);

    /* end */
    return;
}

/* inversion quadratic field */
void ffa_inv_qdr(__m128i *re_0, __m128i *re_1, __m128i *re_2, 
                 __m128i op00, __m128i op01, __m128i op02) {
    /* var */
    __m128i a_00, a_01, a_02;
    __m128i a_10, a_11, a_12;
    __m128i t_00, t_01, t_02;
    __m128i tmp0, tmp1, tmp2;
    __m128i c_00, c_01, c_02;
    __m128i c_10, c_11, c_12;

    /* ini */
    a_00 = _mm_move_epi64(op00);
    a_01 = _mm_move_epi64(op01);
    a_02 = _mm_move_epi64(op02);

    a_10 = _mm_srli_si128(op00, 8);
    a_11 = _mm_srli_si128(op01, 8);
    a_12 = _mm_srli_si128(op02, 8);

    /* man */
    ffa_mul(&t_00, &t_01, &t_02, a_00, a_01, a_02, a_10, a_11, a_12);
    ffa_add(tmp0, tmp1, tmp2, a_00, a_01, a_02, a_10, a_11, a_12);
    ffa_sqr(&tmp0, &tmp1, &tmp2, tmp0, tmp1, tmp2);
    ffa_add(t_00, t_01, t_02, t_00, t_01, t_02, tmp0, tmp1, tmp2);
    ffa_inv_bas(&t_00, &t_01, &t_02, t_00, t_01, t_02);
    ffa_add(c_00, c_01, c_02, a_00, a_01, a_02, a_10, a_11, a_12);
    ffa_mul(&c_00, &c_01, &c_02, c_00, c_01, c_02, t_00, t_01, t_02);
    ffa_mul(&c_10, &c_11, &c_12, a_10, a_11, a_12, t_00, t_01, t_02);

    /* end */
    *re_0 = _mm_unpacklo_epi64(c_00, c_10);
    *re_1 = _mm_unpacklo_epi64(c_01, c_11);
    *re_2 = _mm_unpacklo_epi64(c_02, c_12);
    return;
}

