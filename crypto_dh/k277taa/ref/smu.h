/* scalar multiplication */

/*
# 192-bit integer addition
c = c + a

< inp
[uint64_t] a0, a1, a2 : operand 0
[uint64_t] c0, c1, c2 : operand 1
> out
[uint64_t] c0, c1, c2 : result
*/

#define smu_sum_192(c0, c1, c2, a0, a1, a2)\
    asm ("addq %3, %0 \n\t"\
         "adcq %4, %1 \n\t"\
         "adcq %5, %2"\
    : "+r" (c0), "+r" (c1), "+r" (c2)\
    : "r" (a0), "r" (a1), "r" (a2) : "cc"\
    );

/*
# retrieve digit sign (sig) and absolute value (abs)

< inp
[uint64_t] vec : digits vector
[uint64_t] idx : digit index
[uint64_t] msk : mask to negate (temporary value)
> out
[uint64_t] sig : digit sign (0 even, 1 odd)
[uint64_t] abs : digit absolute value
*/

#define smu_get_flg(vec,idx,msk,abs,sig)\
    sig = vec[idx] >> 63;\
    abs = vec[idx];\
    msk = (0 - sig);\
    abs = ((abs ^ msk) + sig) >> 1;

/*
# linear pass even/odd scalar

< inp
[__m128i] msk : linear pass masks
[__m128i] src : vector with values to be retrieved
> out
[__m128i] dst : retrieved value
*/

#define smu_lps_eve(dst,src,msk)\
    dst = _mm_setzero_si128();\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[0], msk[0]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[1], msk[1]));

/*
# 5-naf linear pass for reading

< inp
[__m128i] msk : linear pass masks
[__m128i] src : vector with values to be retrieved
> out
[__m128i] dst : retrieved value
*/

#define smu_lps_red_5nf(dst,src,msk)\
    dst = _mm_setzero_si128();\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[0], msk[0]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[1], msk[1]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[2], msk[2]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[3], msk[3]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[4], msk[4]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[5], msk[5]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[6], msk[6]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[7], msk[7]));

/*
# 5-naf regular recoding
naf digits < in_00 + in_01\tau

< inp
[uint64_t] in_00 : scalar
[uint64_t] in_01 : scalar
> out
[uint64_t] naf : naf digits
*/

void smu_rec_5nf(uint64_t *naf, uint64_t *in_00, uint64_t *in_01) {
    /* var */
    uint64_t i, j;
    uint64_t r_00[3], r_01[3];
    uint64_t dig, sig, hiv, tp_00, tp_01, tp_02;
    uint64_t DIG_BET, DIG_GAM, DIG_MDS, SIG_BET, SIG_GAM, SIG_MDS;
    uint64_t dig_bet, dig_gam, dig_mds, sig_bet, sig_gam, sig_mds;

    /* ini */
    r_00[0] = in_00[0]; r_00[1] = in_00[1]; r_00[2] = in_00[2];
    r_01[0] = in_01[0]; r_01[1] = in_01[1]; r_01[2] = in_01[2];

    DIG_BET = 0x0101010301010301; SIG_BET = 0x0000010100010100;
    DIG_GAM = 0x0302020201010100; SIG_GAM = 0x0001010101010100;
    DIG_MDS = 0x13579BCFFCB97531; SIG_MDS = 0x1111111100000000;

    /* man */
    for (i=0;i<70;i++) {
        dig = ((r_00[0] + (r_01[0] << 4) + (r_01[0] << 3) + (r_01[0] << 1)) & 0x1F) - 16;
        naf[i] = dig;

        sig = dig >> 63;
        hiv = 0 - sig;
        dig = ((dig^hiv) + sig) >> 1;

        tp_00 = dig << 3;
        dig_bet = (DIG_BET >> tp_00) & 0x0f;
        dig_gam = (DIG_GAM >> tp_00) & 0x0f;
        sig_bet = (SIG_BET >> tp_00) & 0x0f;
        sig_gam = (SIG_GAM >> tp_00) & 0x0f;

        sig_bet = sig_bet ^ (1 - sig);
        sig_gam = sig_gam ^ (1 - sig);

        /* r_00 */
        hiv = 0 - sig_bet;
        dig_bet = (dig_bet ^ hiv) + sig_bet;
        sig_bet = dig_bet >> 63;
        hiv = 0 - sig_bet;
        smu_sum_192(r_00[0], r_00[1], r_00[2], dig_bet, hiv, hiv);

        /* r_01 */
        hiv = 0 - sig_gam;
        dig_gam = (dig_gam ^ hiv) + sig_gam;
        sig_gam = dig_gam >> 63;
        hiv = 0 - sig_gam;
        smu_sum_192(r_01[0], r_01[1], r_01[2], dig_gam, hiv, hiv);

        for (j=0;j<4;j++) {
            tp_00 = ~r_00[0]; tp_01 = ~r_00[1]; tp_02 = ~r_00[2];
            smu_sum_192(tp_00, tp_01, tp_02, (uint64_t) 1, (uint64_t) 0, (uint64_t) 0);
            sig = tp_02 & 0x8000000000000000;

            tp_00 = (tp_00 >> 1) | (tp_01 << 63);
            tp_01 = (tp_01 >> 1) | (tp_02 << 63);
            tp_02 = (tp_02 >> 1) | sig;

            smu_sum_192(r_01[0], r_01[1], r_01[2], tp_00, tp_01, tp_02);
            r_00[0] = r_01[0]; r_00[1] = r_01[1]; r_00[2] = r_01[2];
            r_01[0] = tp_00; r_01[1] = tp_01; r_01[2] = tp_02;
        }
    }

    /* last digit */
    dig = r_00[0] + (r_01[0] << 1) + (r_01[0] << 3) + (r_01[0] << 4);
    sig = dig >> 63;
    hiv = 0 - sig;
    dig = ((dig^hiv) + sig) >> 1;

    tp_00 = dig << 2;
    dig_mds = (DIG_MDS >> tp_00) & 0xf;
    sig_mds = (SIG_MDS >> tp_00) & 0xf;

    sig = sig ^ sig_mds;
    hiv = 0 - sig;
    dig_mds = (dig_mds^hiv) + sig;

    naf[70] = dig_mds;

    /* end */
    return;
}

/*
# 5-naf pre-computation

< inp
[__m128i] px_00, px_01, px_02 : P x coordinate
[__m128i] py_00, py_01, py_02 : P l coordinate
> out
[__m128i] *ax_00, *ax_01, *ax_02 : precomputed points x coordinate
[__m128i] *al_00, *al_01, *al_02 : precomputed points l coordinate
*/

void smu_pre_5nf(__m128i *ax_00, __m128i *ax_01, __m128i *ax_02,
                 __m128i *al_00, __m128i *al_01, __m128i *al_02,
                 __m128i px_00,  __m128i px_01, __m128i px_02,
                 __m128i pl_00,  __m128i pl_01, __m128i pl_02) {
    /* var */
    __m128i az_00[8], az_01[8], az_02[8];
    __m128i tx_00[8], tx_01[8], tx_02[8];
    __m128i tl_00[8], tl_01[8], tl_02[8];
    __m128i tz_00[8], tz_01[8], tz_02[8];

    __m128i ppx_00, ppx_01, ppx_02;
    __m128i ppl_00, ppl_01, ppl_02;
    __m128i pmx_00, pmx_01, pmx_02;
    __m128i pml_00, pml_01, pml_02;

    __m128i one;

    /* ini */
    one = _mm_set_epi64x(0x0, 0x1);
    ppx_00 = px_00; ppx_01 = px_01; ppx_02 = px_02;
    ppl_00 = pl_00; ppl_01 = pl_01; ppl_02 = pl_02;
    pmx_00 = px_00; pmx_01 = px_01; pmx_02 = px_02;
    pml_00 = _mm_xor_si128(pl_00, one); pml_01 = pl_01; pml_02 = pl_02;

    /* man */
    /* P1 */
    ax_00[0] = px_00; ax_01[0] = px_01; ax_02[0] = px_02;
    al_00[0] = pl_00; al_01[0] = pl_01; al_02[0] = pl_02;
    az_00[0] = one; az_01[0] = _mm_setzero_si128(); az_02[0] = _mm_setzero_si128();

    /* P3 */
    eca_tau_aff(&tx_00[0], &tx_01[0], &tx_02[0], &tl_00[0], &tl_01[0], &tl_02[0],
                px_00, px_01, px_02, pl_00, pl_01, pl_02);

    eca_tau_aff(&tx_00[0], &tx_01[0], &tx_02[0], &tl_00[0], &tl_01[0], &tl_02[0],
                tx_00[0], tx_01[0], tx_02[0], tl_00[0], tl_01[0], tl_02[0]);

    eca_add_mix(&ax_00[1], &ax_01[1], &ax_02[1],
                &al_00[1], &al_01[1], &al_02[1],
                &az_00[1], &az_01[1], &az_02[1],
                pmx_00, pmx_01, pmx_02,
                pml_00, pml_01, pml_02,
                az_00[0], az_01[0], az_02[0],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[0], tl_01[0], tl_02[0]);

    /* P5 */
    eca_add_mix(&ax_00[2], &ax_01[2], &ax_02[2],
                &al_00[2], &al_01[2], &al_02[2],
                &az_00[2], &az_01[2], &az_02[2],
                ppx_00, ppx_01, ppx_02,
                ppl_00, ppl_01, ppl_02,
                az_00[0], az_01[0], az_02[0],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[0], tl_01[0], tl_02[0]);

    /* P7 */
    eca_tau_aff(&tx_00[0], &tx_01[0], &tx_02[0], &tl_00[0], &tl_01[0], &tl_02[0],
                tx_00[0], tx_01[0], tx_02[0], tl_00[0], tl_01[0], tl_02[0]);

    eca_add_mix(&ax_00[3], &ax_01[3], &ax_02[3],
                &al_00[3], &al_01[3], &al_02[3],
                &az_00[3], &az_01[3], &az_02[3],
                pmx_00, pmx_01, pmx_02,
                pml_00, pml_01, pml_02,
                az_00[0], az_01[0], az_02[0],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[0], tl_01[0], tl_02[0]);

    /* P15 */
    eca_tau_pro(&tx_00[0], &tx_01[0], &tx_02[0],
                &tl_00[0], &tl_01[0], &tl_02[0],
                &tz_00[0], &tz_01[0], &tz_02[0],
                ax_00[2], ax_01[2], ax_02[2],
                al_00[2], al_01[2], al_02[2],
                az_00[2], az_01[2], az_02[2]);

    eca_tau_pro(&tx_00[0], &tx_01[0], &tx_02[0],
                &tl_00[0], &tl_01[0], &tl_02[0],
                &tz_00[0], &tz_01[0], &tz_02[0],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[0], tl_01[0], tl_02[0],
                tz_00[0], tz_01[0], tz_02[0]);

    ffa_add(tl_00[1], tl_01[1], tl_02[1], al_00[2], al_01[2], al_02[2], az_00[2], az_01[2], az_02[2]);

    eca_add_ful(&ax_00[7], &ax_01[7], &ax_02[7],
                &al_00[7], &al_01[7], &al_02[7],
                &az_00[7], &az_01[7], &az_02[7],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[0], tl_01[0], tl_02[0],
                tz_00[0], tz_01[0], tz_02[0],
                ax_00[2], ax_01[2], ax_02[2],
                tl_00[1], tl_01[1], tl_02[1],
                az_00[2], az_01[2], az_02[2]);

    /* P13 */
    ffa_add(tl_00[1], tl_01[1], tl_02[1], tl_00[0], tl_01[0], tl_02[0], tz_00[0], tz_01[0], tz_02[0]);

    eca_add_mix(&ax_00[6], &ax_01[6], &ax_02[6],
                &al_00[6], &al_01[6], &al_02[6],
                &az_00[6], &az_01[6], &az_02[6],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[1], tl_01[1], tl_02[1],
                tz_00[0], tz_01[0], tz_02[0],
                ppx_00, ppx_01, ppx_02,
                ppl_00, ppl_01, ppl_02);

    /* P11 */
    eca_add_mix(&ax_00[5], &ax_01[5], &ax_02[5],
                &al_00[5], &al_01[5], &al_02[5],
                &az_00[5], &az_01[5], &az_02[5],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[1], tl_01[1], tl_02[1],
                tz_00[0], tz_01[0], tz_02[0],
                pmx_00, pmx_01, pmx_02,
                pml_00, pml_01, pml_02);

    /* P9 */
    eca_tau_pro(&tx_00[0], &tx_01[0], &tx_02[0],
                &tl_00[0], &tl_01[0], &tl_02[0],
                &tz_00[0], &tz_01[0], &tz_02[0],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[0], tl_01[0], tl_02[0],
                tz_00[0], tz_01[0], tz_02[0]);

    eca_add_mix(&ax_00[4], &ax_01[4], &ax_02[4],
                &al_00[4], &al_01[4], &al_02[4],
                &az_00[4], &az_01[4], &az_02[4],
                tx_00[0], tx_01[0], tx_02[0],
                tl_00[0], tl_01[0], tl_02[0],
                tz_00[0], tz_01[0], tz_02[0],
                ppx_00, ppx_01, ppx_02,
                ppl_00, ppl_01, ppl_02);

    /* montgomery */
    /* pt I */
    ffa_mul(&tz_00[1], &tz_01[1], &tz_02[1],
            az_00[1], az_01[1], az_02[1],
            az_00[2], az_01[2], az_02[2]);

    ffa_mul(&tz_00[2], &tz_01[2], &tz_02[2],
            tz_00[1], tz_01[1], tz_02[1],
            az_00[3], az_01[3], az_02[3]);

    ffa_mul(&tz_00[3], &tz_01[3], &tz_02[3],
            tz_00[2], tz_01[2], tz_02[2],
            az_00[4], az_01[4], az_02[4]);

    ffa_mul(&tz_00[4], &tz_01[4], &tz_02[4],
            tz_00[3], tz_01[3], tz_02[3],
            az_00[5], az_01[5], az_02[5]);

    ffa_mul(&tz_00[5], &tz_01[5], &tz_02[5],
            tz_00[4], tz_01[4], tz_02[4],
            az_00[6], az_01[6], az_02[6]);

    ffa_mul(&tz_00[6], &tz_01[6], &tz_02[6],
            tz_00[5], tz_01[5], tz_02[5],
            az_00[7], az_01[7], az_02[7]);

    /* inv */
    ffa_inv(&tz_00[6], &tz_01[6], &tz_02[6], tz_00[6], tz_01[6], tz_02[6]);

    /* a[7]^-1 */
    ffa_mul(&tz_00[7], &tz_01[7], &tz_02[7],
            tz_00[6], tz_01[6], tz_02[6],
            tz_00[5], tz_01[5], tz_02[5]);

    ffa_mul(&tz_00[6], &tz_01[6], &tz_02[6],
            tz_00[6], tz_01[6], tz_02[6],
            az_00[7], az_01[7], az_02[7]);

    az_00[7] = tz_00[7]; az_01[7] = tz_01[7]; az_02[7] = tz_02[7];

    /* a[6]^-1 */
    ffa_mul(&tz_00[7], &tz_01[7], &tz_02[7],
            tz_00[6], tz_01[6], tz_02[6],
            tz_00[4], tz_01[4], tz_02[4]);

    ffa_mul(&tz_00[6], &tz_01[6], &tz_02[6],
            tz_00[6], tz_01[6], tz_02[6],
            az_00[6], az_01[6], az_02[6]);

    az_00[6] = tz_00[7]; az_01[6] = tz_01[7]; az_02[6] = tz_02[7];

    /* a[5]^-1 */
    ffa_mul(&tz_00[7], &tz_01[7], &tz_02[7],
            tz_00[6], tz_01[6], tz_02[6],
            tz_00[3], tz_01[3], tz_02[3]);

    ffa_mul(&tz_00[6], &tz_01[6], &tz_02[6],
            tz_00[6], tz_01[6], tz_02[6],
            az_00[5], az_01[5], az_02[5]);

    az_00[5] = tz_00[7]; az_01[5] = tz_01[7]; az_02[5] = tz_02[7];

    /* a[4]^-1 */
    ffa_mul(&tz_00[7], &tz_01[7], &tz_02[7],
            tz_00[6], tz_01[6], tz_02[6],
            tz_00[2], tz_01[2], tz_02[2]);

    ffa_mul(&tz_00[6], &tz_01[6], &tz_02[6],
            tz_00[6], tz_01[6], tz_02[6],
            az_00[4], az_01[4], az_02[4]);

    az_00[4] = tz_00[7]; az_01[4] = tz_01[7]; az_02[4] = tz_02[7];

    /* a[3]^-1 */
    ffa_mul(&tz_00[7], &tz_01[7], &tz_02[7],
            tz_00[6], tz_01[6], tz_02[6],
            tz_00[1], tz_01[1], tz_02[1]);

    ffa_mul(&tz_00[6], &tz_01[6], &tz_02[6],
            tz_00[6], tz_01[6], tz_02[6],
            az_00[3], az_01[3], az_02[3]);

    az_00[3] = tz_00[7]; az_01[3] = tz_01[7]; az_02[3] = tz_02[7];

    /* a[2]^-1 */
    ffa_mul(&tz_00[7], &tz_01[7], &tz_02[7],
            tz_00[6], tz_01[6], tz_02[6],
            az_00[1], az_01[1], az_02[1]);

    /* a[1]^-1 */
    ffa_mul(&tz_00[6], &tz_01[6], &tz_02[6],
            tz_00[6], tz_01[6], tz_02[6],
            az_00[2], az_01[2], az_02[2]);

    az_00[2] = tz_00[7]; az_01[2] = tz_01[7]; az_02[2] = tz_02[7];
    az_00[1] = tz_00[6]; az_01[1] = tz_01[6]; az_02[1] = tz_02[6];

    /* end */
    /* to affine */
    ffa_mul(&ax_00[1], &ax_01[1], &ax_02[1],
            az_00[1], az_01[1], az_02[1],
            ax_00[1], ax_01[1], ax_02[1]);

    ffa_mul(&al_00[1], &al_01[1], &al_02[1],
            az_00[1], az_01[1], az_02[1],
            al_00[1], al_01[1], al_02[1]);

    ffa_mul(&ax_00[2], &ax_01[2], &ax_02[2],
            az_00[2], az_01[2], az_02[2],
            ax_00[2], ax_01[2], ax_02[2]);

    ffa_mul(&al_00[2], &al_01[2], &al_02[2],
            az_00[2], az_01[2], az_02[2],
            al_00[2], al_01[2], al_02[2]);

    ffa_mul(&ax_00[3], &ax_01[3], &ax_02[3],
            az_00[3], az_01[3], az_02[3],
            ax_00[3], ax_01[3], ax_02[3]);

    ffa_mul(&al_00[3], &al_01[3], &al_02[3],
            az_00[3], az_01[3], az_02[3],
            al_00[3], al_01[3], al_02[3]);

    ffa_mul(&ax_00[4], &ax_01[4], &ax_02[4],
            az_00[4], az_01[4], az_02[4],
            ax_00[4], ax_01[4], ax_02[4]);

    ffa_mul(&al_00[4], &al_01[4], &al_02[4],
            az_00[4], az_01[4], az_02[4],
            al_00[4], al_01[4], al_02[4]);

    ffa_mul(&ax_00[5], &ax_01[5], &ax_02[5],
            az_00[5], az_01[5], az_02[5],
            ax_00[5], ax_01[5], ax_02[5]);

    ffa_mul(&al_00[5], &al_01[5], &al_02[5],
            az_00[5], az_01[5], az_02[5],
            al_00[5], al_01[5], al_02[5]);

    ffa_mul(&ax_00[6], &ax_01[6], &ax_02[6],
            az_00[6], az_01[6], az_02[6],
            ax_00[6], ax_01[6], ax_02[6]);

    ffa_mul(&al_00[6], &al_01[6], &al_02[6],
            az_00[6], az_01[6], az_02[6],
            al_00[6], al_01[6], al_02[6]);

    ffa_mul(&ax_00[7], &ax_01[7], &ax_02[7],
            az_00[7], az_01[7], az_02[7],
            ax_00[7], ax_01[7], ax_02[7]);

    ffa_mul(&al_00[7], &al_01[7], &al_02[7],
            az_00[7], az_01[7], az_02[7],
            al_00[7], al_01[7], al_02[7]);

    return;
}

/*
# 5-naf tau-and-add scalar multiplication
Q(x,y) <- k * P(x,y)

< inp
[__m128i] px_00, px_01, px_02 : P x coordinate
[__m128i] py_00, py_01, py_02 : P y coordinate
[uint64_t] k : scalar k
> out
[__m128i] qx_00, qx_01, qx_02 : Q x coordinate
[__m128i] qy_00, qy_01, qy_02 : Q y coordinate
*/

void smu_taa_ltr_5nf(__m128i *qx_00, __m128i *qx_01, __m128i *qx_02,
                     __m128i *ql_00, __m128i *ql_01, __m128i *ql_02,
                     __m128i px_00, __m128i px_01, __m128i px_02,
                     __m128i pl_00, __m128i pl_01, __m128i pl_02,
                     uint64_t *r_00, uint64_t *r_01) {
    /* var */
    int64_t i;
    uint64_t naf[71];
    uint64_t ev_00;
    uint64_t k_00[3], k_01[3];
    uint64_t sig, abs, msk;
    __m128i ax_00[8], ax_01[8], ax_02[8];
    __m128i al_00[8], al_01[8], al_02[8];
    __m128i az_00[8], az_01[8], az_02[8];
    __m128i qz_00, qz_01, qz_02;
    __m128i dx_00, dx_01, dx_02, dl_00, dl_01, dl_02;
    __m128i cmp[8], lps[8], dig, min;
    __m128i one;

    /* ini */
    /* even k_00 */
    k_00[0] = r_00[0]; k_00[1] = r_00[1]; k_00[2] = r_00[2];
    k_01[0] = r_01[0]; k_01[1] = r_01[1]; k_01[2] = r_01[2];
    ev_00 = 1 - (k_00[0] & 0x1);
    smu_sum_192(k_00[0], k_00[1], k_00[2], ev_00, (uint64_t) 0, (uint64_t) 0);

    /* naf */
    smu_rec_5nf(&naf[0], &k_00[0], &k_01[0]);

    /* linear pass */
    one = _mm_set_epi64x(0x1, 0x1);
    cmp[0] = _mm_setzero_si128();
    cmp[1] = _mm_add_epi64(cmp[0], one);
    cmp[2] = _mm_add_epi64(cmp[1], one);
    cmp[3] = _mm_add_epi64(cmp[2], one);
    cmp[4] = _mm_add_epi64(cmp[3], one);
    cmp[5] = _mm_add_epi64(cmp[4], one);
    cmp[6] = _mm_add_epi64(cmp[5], one);
    cmp[7] = _mm_add_epi64(cmp[6], one);

    /* pre-computation */
    smu_pre_5nf(&ax_00[0], &ax_01[0], &ax_02[0],
                &al_00[0], &al_01[0], &al_02[0],
                px_00, px_01, px_02,
                pl_00, pl_01, pl_02);

    /* man */
    /* first iteration */
    smu_get_flg(naf,70,msk,abs,sig);

    /* linear pass */
    dig = _mm_set_epi64x(abs,abs);
    lps[0] = _mm_cmpeq_epi64(cmp[0], dig);
    lps[1] = _mm_cmpeq_epi64(cmp[1], dig);
    lps[2] = _mm_cmpeq_epi64(cmp[2], dig);
    lps[3] = _mm_cmpeq_epi64(cmp[3], dig);
    lps[4] = _mm_cmpeq_epi64(cmp[4], dig);
    lps[5] = _mm_cmpeq_epi64(cmp[5], dig);
    lps[6] = _mm_cmpeq_epi64(cmp[6], dig);
    lps[7] = _mm_cmpeq_epi64(cmp[7], dig);
    smu_lps_red_5nf(dx_00,ax_00,lps);
    smu_lps_red_5nf(dx_01,ax_01,lps);
    smu_lps_red_5nf(dx_02,ax_02,lps);
    smu_lps_red_5nf(dl_00,al_00,lps);
    smu_lps_red_5nf(dl_01,al_01,lps);
    smu_lps_red_5nf(dl_02,al_02,lps);

    min = _mm_set_epi64x(0x0, sig); dl_00 = _mm_xor_si128(dl_00, min);
    *qx_00 = dx_00; *qx_01 = dx_01; *qx_02 = dx_02; *ql_00 = dl_00; *ql_01 = dl_01; *ql_02 = dl_02;
    qz_00 = _mm_set_epi64x(0x0, 0x1); qz_01 = _mm_setzero_si128(); qz_02 = _mm_setzero_si128();

    /* main loop */
    for (i=69;i>=0;i--) {
        ECA_TAU_PRO(*qx,*ql,qz,*qx,*ql,qz);
        ECA_TAU_PRO(*qx,*ql,qz,*qx,*ql,qz);
        ECA_TAU_PRO(*qx,*ql,qz,*qx,*ql,qz);
        ECA_TAU_PRO(*qx,*ql,qz,*qx,*ql,qz);

        smu_get_flg(naf,i,msk,abs,sig);

        dig = _mm_set_epi64x(abs,abs);
        lps[0] = _mm_cmpeq_epi64(cmp[0], dig);
        lps[1] = _mm_cmpeq_epi64(cmp[1], dig);
        lps[2] = _mm_cmpeq_epi64(cmp[2], dig);
        lps[3] = _mm_cmpeq_epi64(cmp[3], dig);
        lps[4] = _mm_cmpeq_epi64(cmp[4], dig);
        lps[5] = _mm_cmpeq_epi64(cmp[5], dig);
        lps[6] = _mm_cmpeq_epi64(cmp[6], dig);
        lps[7] = _mm_cmpeq_epi64(cmp[7], dig);
        smu_lps_red_5nf(dx_00,ax_00,lps);
        smu_lps_red_5nf(dx_01,ax_01,lps);
        smu_lps_red_5nf(dx_02,ax_02,lps);
        smu_lps_red_5nf(dl_00,al_00,lps);
        smu_lps_red_5nf(dl_01,al_01,lps);
        smu_lps_red_5nf(dl_02,al_02,lps);

        min = _mm_set_epi64x(0x0, sig); dl_00 = _mm_xor_si128(dl_00, min);
        ECA_ADD_MIX(*qx,*ql,qz,*qx,*ql,qz,dx,dl);
    }

    /* even k0 */
    one = _mm_set_epi64x(0x0, 0x1);
    pl_00 = _mm_xor_si128(pl_00, one);

    ax_00[0] = *qx_00; ax_01[0] = *qx_01; ax_02[0] = *qx_02;
    al_00[0] = *ql_00; al_01[0] = *ql_01; al_02[0] = *ql_02;
    az_00[0] = qz_00; az_01[0] = qz_01; az_02[0] = qz_02;

    eca_add_mix(&ax_00[1], &ax_01[1], &ax_02[1],
                &al_00[1], &al_01[1], &al_02[1],
                &az_00[1], &az_01[1], &az_02[1],
                *qx_00, *qx_01, *qx_02,
                *ql_00, *ql_01, *ql_02,
                qz_00, qz_01, qz_02,
                px_00, px_01, px_02,
                pl_00, pl_01, pl_02);

    dig = _mm_set_epi64x(ev_00,ev_00);
    lps[0] = _mm_cmpeq_epi64(cmp[0], dig);
    lps[1] = _mm_cmpeq_epi64(cmp[1], dig);
    smu_lps_eve(*qx_00,ax_00,lps); smu_lps_eve(*qx_01,ax_01,lps); smu_lps_eve(*qx_02,ax_02,lps);
    smu_lps_eve(*ql_00,al_00,lps); smu_lps_eve(*ql_01,al_01,lps); smu_lps_eve(*ql_02,al_02,lps);
    smu_lps_eve(qz_00,az_00,lps); smu_lps_eve(qz_01,az_01,lps); smu_lps_eve(qz_02,az_02,lps);

    /* end */
    /* to affine */
    FFA_INV(qz, qz);
    FFA_MUL(*qx, *qx, qz);
    FFA_MUL(*ql, *ql, qz);
    FFA_RED_277(*qx, *qx);
    FFA_RED_277(*ql, *ql);

    return;
}

