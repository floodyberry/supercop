/*
 * $Id: GFword.h 1006 2008-05-06 15:01:28Z owenhsin $
 */

#ifndef _GFWORD_H
#define _GFWORD_H

#include "GF.h"

/* GF(256^2) = GF(256)[x]/(x^2 + x + 9*16)
 * GF(256^4) = GF(256^2)[x]/(x^2 + x + 9*16*256)
 * GF(256^12) = GF(256^4)[x]/(x^3 + x + 1)
 * GF(256^8) = GF(256^4)[x]/(x^2 + x + 9*16*256*(256^2))
 * GF(256^16) = GF(256^8)[x]/(x^2 + x + 9*16*256*(256^2)*(256^4))
 */

/**
 * \brief		GF(256^2), extension field multiplication
 *
 * \param x		input GF(256^2) element
 * \param y		input GF(256^2) element
 *
 * \return ret		output GF(256^2) element, ret = x * y
 */
word_t GF_word_mul(word_t x, word_t y);

/**
 * \brief		GF(256^2), extension field specialized multiplication
 *
 * \param x		input GF(256^2) element
 *
 * \return ret		output GF(256^2) element, ret = x * (9*16*256)
 */
word_t GF_word_mul_g(word_t x);

/**
 * \brief		GF(256^2), extension field specialized multiplication
 *
 * \param x		input GF(256^2) element
 *
 * \return ret		output GF(256^2) element, ret = x * (9*16*256)^2
 */
word_t GF_word_mul_gg(word_t x);

/**
 * \brief		GF(256^2), extension field specialized multiplication
 *
 * \param x		input GF(256^2) element
 *
 * \return ret		output GF(256^2) element, ret = x * (9*16*256)^3
 */
word_t GF_word_mul_ggg(word_t x);

/**
 * \brief               GF(256^2), extension field inversion
 * 
 * \param x             input GF(256^2) element
 *
 * \return ret          output GF(256^2) element, ret = x^2
 */
word_t GF_word_sqr(word_t x);

/**
 * \brief		GF(256^2), extension field inversion
 * 
 * \param x		input GF(256^2) element
 *
 * \return ret		output GF(256^2) element, ret = 1 / x
 */
word_t GF_word_inv(word_t x);

/**
 * \brief		GF(256^2), extension field division
 *
 * \param x		input GF(256^2) element
 * \param y		input GF(256^2) element
 *
 * \return ret		output GF(256^2) element, ret = x / y
 */
word_t GF_word_div(word_t x, word_t y);

/**
 * \brief		GF(256^2), extension field square root
 *
 * \param x		input GF(256^2) element
 *
 * \return ret		output GF(256^2) element, ret = sqrt(x)
 */
word_t GF_word_sqrt(word_t x);

/* GF(256^4) = GF(256^2)[x]/(x^2+x+144*256)
 */

/**
 * \brief		GF(256^4), extension field multiplication
 *
 * \param x		input GF(256^4) element
 * \param y		input GF(256^4) element
 *
 * \return ret		output GF(256^4) element, ret = x * y
 */
dword_t GF_dword_mul(dword_t x, dword_t y);

/**
 * \brief		GF(256^4), extension field specialized multiplication
 *
 * \param x		input GF(256^4) element
 *
 * \return ret		output GF(256^4) element, ret = x * 9*16*256*(256^2)
 */
dword_t GF_dword_mul_g(dword_t x);

/**
 * \brief		GF(256^4), extension field specialized multiplication
 *
 * \param x		input GF(256^4) element
 *
 * \return ret		output GF(256^4) element, ret = x * [9*16*256*(256^2)]^2
 */
dword_t GF_dword_mul_gg(dword_t x);

/**
 * \brief               GF(256^4), extension field inversion
 *
 * \param x             input GF(256^4) element
 *
 * \return ret          output GF(256^4) element, ret = x^2
 */
dword_t GF_dword_sqr(dword_t x);

/**
 * \brief		GF(256^4), extension field inversion
 *
 * \param x		input GF(256^4) element
 *
 * \return ret		output GF(256^4) element, ret = 1 / x
 */
dword_t GF_dword_inv(dword_t x);

/**
 * \brief		GF(256^4), extension field division
 *
 * \param x		input GF(256^4) element
 * \param y		input GF(256^4) element
 *
 * \return ret		output GF(256^4) element, ret = x / y
 */
dword_t GF_dword_div(dword_t x, dword_t y);

/**
 * \brief		GF(256^4), extension field square root
 *
 * \param x		input GF(256^4) element
 * 
 * \return ret		output GF(256^4) element, ret = sqrt(x)
 */
dword_t GF_dword_sqrt(dword_t x);

/* GF(256^12) = GF(256^4)[x]/(x^3+x+1)
 */

/**
 * \brief		GF(256^12), extension field multiplication
 *			without inplacement
 *
 * \param x		input GF(256^12) element pointer
 * \param y		input GF(256^12) element pointer
 * \param outZ		output GF(256^12) element pointer, outZ[0..2] = x[0..2] * y[0..2]
 */
void GF_256_12_mul(dword_t *outZ, dword_t *x, dword_t *y);

/**
 * \brief		GF(256^12), extension field inversion
 *			without inplacement
 *
 * \param x		input GF(256^12) element pointer
 *
 * \return outZ		output GF(256^12) element pointer, outZ[0..2] = 1 / x[0..2]
 */
void GF_256_12_inv(dword_t *outZ, dword_t *x);

/**
 * \brief		GF(256^12), extension field division
 *			without inplacement
 *
 * \param x		input GF(256^12) element pointer
 * \param y		input GF(256^12) element pointer
 *
 * \return outZ		output GF(256^12) element pointer, outZ[0..2] = x[0..2] / y[0..2]
 */
void GF_256_12_div(dword_t *outZ, dword_t *x, dword_t *y);

/**
 * \brief		GF(256^12), extension field square root
 *			without inplacement
 *
 * \param x		input GF(256^12) element pointer
 *
 * \return outZ		output GF(256^12) element pointer, outZ[0..2] = sqrt(x[0..2])
 */
void GF_256_12_sqrt(dword_t *outZ, dword_t *x);

void GF_256_8_mul(dword_t *outZ, dword_t *x, dword_t *y);

void GF_256_8_mul_g(dword_t *outZ, dword_t *x);

void GF_256_8_sqr(dword_t *outZ, dword_t *x);

void GF_256_8_inv(dword_t *outZ, dword_t *x);

void GF_256_8_div(dword_t *outZ, dword_t *x, dword_t *y);

void GF_256_8_sqrt(dword_t *outZ, dword_t *x);

void GF_256_16_mul(dword_t *outZ, dword_t *x, dword_t *y);

void GF_256_16_inv(dword_t *outZ, dword_t *x);

void GF_256_16_div(dword_t *outZ, dword_t *x, dword_t *y);

void GF_256_16_sqrt(dword_t *outZ, dword_t *x);

#endif
/*
 * GFword.h
 */
