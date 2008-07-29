/*
 * hector/src/conversion.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include <assert.h>

#include "divclass.h"
#include "mpfq.h"


/* Conversion between different representations */

void kelt_to_bytearray(unsigned char *rop, const Kelt op)
{
	unsigned int i,j;
	unsigned int byte_count = 0;
	for(i = 0; i < LIMBS_PER_KELT; i++)
	{
		mp_limb_t c = op[i];
		for(j = 0; j < BYTES_PER_LIMB && byte_count < BYTES_PER_KELT; j++)
		{
			rop[BYTES_PER_LIMB*i+j] = c & 255;
			c >>= 8;
			byte_count++;
		}
	}
}

void bytearray_to_kelt(Kelt rop, const unsigned char *byte_array)
{
	/* byte_array must have length BYTES_PER_KELT */
	int i, j;
	unsigned int byte_count = 0;
	for (i = 0; i < LIMBS_PER_KELT; ++i) 
	{
		mp_limb_t c = 0;
		for (j = 0; j < BYTES_PER_LIMB && byte_count < BYTES_PER_KELT; j++)
		{
			c |= ( (mp_limb_t)(byte_array[BYTES_PER_LIMB * i + j]) ) << 8 * j;
			byte_count++;
		}
		rop[i] = c;
	}
}
void bytearray_to_divclass(divclass rop, const unsigned char *byte_array)
{
	/* byte_array must have length 4 * BYTES_PER_KELT */
	bytearray_to_kelt(rop->m_U1, byte_array);
	bytearray_to_kelt(rop->m_U0, byte_array + BYTES_PER_KELT);
	bytearray_to_kelt(rop->m_V1, byte_array + 2 * BYTES_PER_KELT);
	bytearray_to_kelt(rop->m_V0, byte_array + 3 * BYTES_PER_KELT);
	Kset_uipoly(rop->m_Z, 1);
	Kset_uipoly(rop->m_z, 1);
}

void divclass_to_bytearray(unsigned char* rop, const divclass op)
{
	divclass d;
	divclass_init(d);
	divclass_make_affine(d, op);
	kelt_to_bytearray(rop, d->m_U1);
	kelt_to_bytearray(rop + BYTES_PER_KELT, d->m_U0);
	kelt_to_bytearray(rop + 2 * BYTES_PER_KELT, d->m_V1);
	kelt_to_bytearray(rop + 3 * BYTES_PER_KELT, d->m_V0);
	divclass_clear(d);
}

void bytearray_to_mpz_t(mpz_t rop, const unsigned char *byte_array, const size_t array_length)
{
	int i;
	mpz_set_ui(rop, 0);
	for(i = array_length - 1; i > 0; i--)
	{
		mpz_add_ui(rop, rop, (unsigned long) byte_array[i]);
		mpz_mul_2exp(rop, rop, 8);
	}
	mpz_add_ui(rop, rop, (unsigned long) byte_array[0]);
}

void mpz_t_to_bytearray(unsigned char* rop, const size_t roplen, const mpz_t op)
{
	size_t bitsize = mpz_sizeinbase(op, 2);
	size_t min_len = (bitsize + 7) / 8;
	assert(roplen >= min_len);

	int i;
	for(i = 0; i < roplen; i++)
		rop[i] = 0;

	mpz_t dummy;
	mpz_init_set(dummy, op);

	i = 0;
	do
	{
		rop[i] = (unsigned char) (mpz_get_ui(dummy) & 0xff);
		mpz_fdiv_q_2exp(dummy, dummy, 8);
		i++;
	}
	while(mpz_cmp_ui(dummy, 0));

	mpz_clear(dummy);
}

void scrambled_bytearray_to_mpz_t(mpz_t rop, const unsigned char *byte_array, const size_t array_length)
{
	signed int i, j, mask;
	mpz_set_ui(rop, 0);
	for(i = 7; i >= 0; i--)
	{
		mask = (1 << i);
		for(j = array_length - 1; j >= 0; j--)
		{
			mpz_mul_2exp(rop, rop, 1);
			if((byte_array[j] & mask) >> i) mpz_setbit(rop, 0);
		}
	}
}

void mpz_t_to_scrambled_bytearray(unsigned char *rop, const size_t roplen, const mpz_t op)
{
	size_t bitsize = mpz_sizeinbase(op, 2);
	size_t min_len = (bitsize + 7) / 8;
	assert(roplen >= min_len);
	int i, j;

	for(i = 0; i < roplen; i++)
		rop[i] = 0;

	unsigned char shift = 0;
	for(i = 0; i < bitsize; )
	{
		for(j = 0; j < roplen && i < bitsize; j++)
		{
			rop[j] ^= (unsigned char) mpz_tstbit(op, i) << shift;
			i++;
		/*	
			printf("j = %d\n",j);
			printf("i = %d\n",i);
		*/	
		}
		shift++;
	}
}

void kelt_to_mpz_t(mpz_t rop, const Kelt op)
{
	mpz_realloc(rop, LIMBS_PER_KELT);
	Kget_uipoly_wide(rop->_mp_d, LIMBS_PER_KELT, op);
	rop->_mp_size = LIMBS_PER_KELT;
}


