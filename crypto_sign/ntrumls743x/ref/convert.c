/******************************************************************************
 * NTRU Cryptography Reference Source Code
 * Copyright (c) 2009-2013, by Security Innovation, Inc. All rights reserved. 
 *
 * ntru_crypto_ntru_convert.c is a component of ntru-crypto.
 *
 * Copyright (C) 2009-2013  Security Innovation
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 *****************************************************************************/
 
/******************************************************************************
 *
 * File: ntru_crypto_ntru_convert.c
 *
 * Contents: Conversion routines for NTRUEncrypt, including packing, unpacking,
 *           and others.
 *
 *****************************************************************************/

#include <stdlib.h>
#include <stdint.h>

#include "convert.h"
#include "pqerror.h"

/* Table to aid converting 8 bits in {0..242} to 5 trits.
 * Let j = a*81 + b*27 + c*9 + d*3 + e.
 * Then byte_2_trits[j] = a << 8 + b << 6  + c << 4  + d << 2 + e;
 */
static uint16_t const byte_2_trits[] = 
    {   0, 1, 2, 4, 5, 6, 8, 9, 10,
        16, 17, 18, 20, 21, 22, 24, 25, 26,
        32, 33, 34, 36, 37, 38, 40, 41, 42,
        64, 65, 66, 68, 69, 70, 72, 73, 74,
        80, 81, 82, 84, 85, 86, 88, 89, 90,
        96, 97, 98, 100, 101, 102, 104, 105, 106,
        128, 129, 130, 132, 133, 134, 136, 137, 138,
        144, 145, 146, 148, 149, 150, 152, 153, 154,
        160, 161, 162, 164, 165, 166, 168, 169, 170,
        256, 257, 258, 260, 261, 262, 264, 265, 266,
        272, 273, 274, 276, 277, 278, 280, 281, 282,
        288, 289, 290, 292, 293, 294, 296, 297, 298,
        320, 321, 322, 324, 325, 326, 328, 329, 330,
        336, 337, 338, 340, 341, 342, 344, 345, 346,
        352, 353, 354, 356, 357, 358, 360, 361, 362,
        384, 385, 386, 388, 389, 390, 392, 393, 394,
        400, 401, 402, 404, 405, 406, 408, 409, 410,
        416, 417, 418, 420, 421, 422, 424, 425, 426,
        512, 513, 514, 516, 517, 518, 520, 521, 522,
        528, 529, 530, 532, 533, 534, 536, 537, 538,
        544, 545, 546, 548, 549, 550, 552, 553, 554,
        576, 577, 578, 580, 581, 582, 584, 585, 586,
        592, 593, 594, 596, 597, 598, 600, 601, 602,
        608, 609, 610, 612, 613, 614, 616, 617, 618,
        640, 641, 642, 644, 645, 646, 648, 649, 650,
        656, 657, 658, 660, 661, 662, 664, 665, 666,
        672, 673, 674, 676, 677, 678, 680, 681, 682
    };

/* Encode 5 trits as 8 bits
 * Expects poly coefficients in {0, 1, 2} */
int
int64_trits_2_bits(
        int64_t       *poly,
        uint16_t      N,
        size_t        out_len,
        unsigned char *out)
{
    int64_t tmp;
    uint16_t i;
    uint16_t j;
    uint16_t k;

    if(!poly || !out)
    {
        return PQNTRU_ERROR;
    }

    if(out_len < ((N+4)/5))
    {
        return PQNTRU_ERROR;
    }

    j = 0;
    for(i=0; (i+4)<N; i+=5)
    {
        /* Assuming poly coefficients are initially >= -3,
         * gets a representative of each trit in {0,1,2}
         * and lift 5 trits to a base 3^5 value {0..242}.
         */
        tmp =  81 * ((  poly[i] + 3) % 3);
        tmp += 27 * ((poly[i+1] + 3) % 3);
        tmp += 9  * ((poly[i+2] + 3) % 3);
        tmp += 3  * ((poly[i+3] + 3) % 3);
        tmp +=      ((poly[i+4] + 3) % 3);

        out[j] = tmp;
        ++j;
    }

    k = 5;
    out[j] = 0;
    for(; i<N; i++)
    {
        out[j] *= 3;
        out[j] += ((poly[i] + 3) % 3);
        --k;
    }

    while(k > 0)
    {
        out[j] *= 3;
        --k;
    }

    return PQNTRU_OK;
}

int
bits_2_int64_trits(
        const size_t        in_len,
        const unsigned char *in,
        int64_t             *poly,
        uint16_t            N)
{
    uint16_t i;
    uint16_t j;
    uint16_t tmp;
    uint8_t all_trits_ok = 1;

    if((N+4)/5 != in_len)
    {
        return PQNTRU_ERROR;
    }

    for(i=0; i<in_len; i+=5)
    {
        all_trits_ok &= (in[i] < 243);
    }

    if(!all_trits_ok)
    {
        return PQNTRU_ERROR;
    }

    j=0;
    for(i=0; (i+4)<N; i+=5)
    {
        tmp = byte_2_trits[in[j]];
        ++j;

        poly[i]   = (tmp & 768) >> 8;
        poly[i+1] = (tmp & 192) >> 6;
        poly[i+2] = (tmp & 48) >> 4;
        poly[i+3] = (tmp & 12) >> 2;
        poly[i+4] = (tmp & 3);
    }

    tmp = byte_2_trits[in[j]];
    for(; i<N; i++)
    {
        poly[i] = (tmp & 768) >> 8;
        tmp <<= 2;
    }

    return PQNTRU_OK;
}


/* elements_2_octets
 *
 * Packs an array of n-bit elements into an array of
 * ((in_len * n_bits) + 7) / 8 octets, 8 < n_bits < 16.
 */

int
int64_elements_2_octets(
    uint16_t        in_len,         /*  in - no. of elements to be packed */
    uint64_t const *in,             /*  in - ptr to elements to be packed */
    uint8_t         n_bits,         /*  in - no. of bits in input element */
    uint8_t        *out)            /* out - addr for output octets */
{
    uint64_t  temp;
    int       shift;
    uint16_t  i;

    if(!in || !out || (n_bits < 8) || (n_bits > 64))
    {
        return PQNTRU_ERROR;
    }

    /* pack */

    temp = 0;
    shift = n_bits - 8;
    i = 0;
    while (i < in_len)
    {

        /* add bits to temp to fill an octet and output the octet */

        temp |= (in[i] >> shift) & ((1 << (n_bits-shift)) - 1);
        *out++ = (uint8_t)(temp & 0xff);
        shift = 8 - shift;
        if (shift < 0) 
        {
            /* next full octet is in current input word */

            shift += n_bits;
            temp = 0;
        }
        else
        {
            /* put remaining bits of input word in temp as partial octet,
             * and increment index to next input word
             */
            temp = in[i] << (uint16_t)shift;

            ++i;
        }

        shift = n_bits - shift;
    }

    /* output any bits remaining in last input word */

    if (shift != n_bits - 8)
    {
        *out++ = (uint8_t)(temp & 0xff);
    }

    return PQNTRU_OK;
}


/* octets_2_elements
 *
 * Unpacks an octet string into an array of ((in_len * 8) / n_bits)
 * n-bit elements, 8 < n_bits < 16.  Any extra bits are discarded.
 */

int
octets_2_int64_elements(
    uint32_t        in_len,         /*  in - no. of octets to be unpacked */
    uint8_t const  *in,             /*  in - ptr to octets to be unpacked */
    uint8_t         n_bits,         /*  in - no. of bits in output element */
    uint64_t       *out)            /* out - addr for output elements */
{
    uint64_t  temp;
    uint64_t  mask = (1 << n_bits) - 1;
    int       shift;
    uint16_t  i;

    if(!in || !out || (n_bits < 8) || (n_bits > 64))
    {
        return PQNTRU_ERROR;
    }

    /* unpack */

    temp = 0;
    shift = n_bits;
    i = 0;

    while (i < in_len)
    {
        shift = 8 - shift;
        if (shift < 1)
        {
            /* the current octet will not fill the current element */

            shift += n_bits;
        }
        else
        {
            /* add bits from the current octet to fill the current element and
             * output the element
             */

            temp |= ((uint64_t)in[i]) >> shift;
            *out++ = temp & mask;
            temp = 0;
        }

        /* add the remaining bits of the current octet to start an element */

        shift = n_bits - shift;
        temp |= ((uint64_t)in[i]) << shift;
        ++i;
    }

    return PQNTRU_OK;
}



/* elements_2_octets
 *
 * Packs an array of n-bit elements into an array of
 * ((in_len * n_bits) + 7) / 8 octets, 8 < n_bits < 16.
 */

int
int16_elements_2_octets(
    uint16_t        in_len,         /*  in - no. of elements to be packed */
    uint16_t const *in,             /*  in - ptr to elements to be packed */
    uint8_t         n_bits,         /*  in - no. of bits in input element */
    uint8_t        *out)            /* out - addr for output octets */
{
    uint16_t  temp;
    int       shift;
    uint16_t  i;

    if(!in || !out || (n_bits < 8) || (n_bits > 16))
    {
        return PQNTRU_ERROR;
    }

    /* pack */

    temp = 0;
    shift = n_bits - 8;
    i = 0;
    while (i < in_len)
    {

        /* add bits to temp to fill an octet and output the octet */

        temp |= (in[i] >> shift) & ((1 << (n_bits-shift)) - 1);
        *out++ = (uint8_t)(temp & 0xff);
        shift = 8 - shift;
        if (shift < 1) 
        {
            /* next full octet is in current input word */

            shift += n_bits;
            temp = 0;
        }
        else
        {
            /* put remaining bits of input word in temp as partial octet,
             * and increment index to next input word
             */
            temp = in[i] << (uint16_t)shift;

            ++i;
        }

        shift = n_bits - shift;
    }

    /* output any bits remaining in last input word */

    if (shift != n_bits - 8)
    {
        *out++ = (uint8_t)(temp & 0xff);
    }

    return PQNTRU_OK;
}


/* octets_2_elements
 *
 * Unpacks an octet string into an array of ((in_len * 8) / n_bits)
 * n-bit elements, 8 < n_bits < 16.  Any extra bits are discarded.
 */

int
octets_2_int16_elements(
    uint16_t        in_len,         /*  in - no. of octets to be unpacked */
    uint8_t const  *in,             /*  in - ptr to octets to be unpacked */
    uint8_t         n_bits,         /*  in - no. of bits in output element */
    uint16_t       *out)            /* out - addr for output elements */
{
    uint16_t  temp;
    uint16_t  mask = (1 << n_bits) - 1;
    int       shift;
    uint16_t  i;

    if(!in || !out || (n_bits < 8) || (n_bits > 16))
    {
        return PQNTRU_ERROR;
    }

    /* unpack */

    temp = 0;
    shift = n_bits;
    i = 0;

    while (i < in_len) 
    {
        shift = 8 - shift;
        if (shift < 0) 
        {
            /* the current octet will not fill the current element */

            shift += n_bits;
        } 
        else 
        {
            /* add bits from the current octet to fill the current element and
             * output the element
             */

            temp |= ((uint16_t)in[i]) >> shift;
            *out++ = temp & mask;
            temp = 0;
        }

        /* add the remaining bits of the current octet to start an element */

        shift = n_bits - shift;
        temp |= ((uint16_t)in[i]) << shift;
        ++i;
    }

    return PQNTRU_OK;
}


