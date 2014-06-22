
#ifndef CPQREF_CONVERT_H_
#define CPQREF_CONVERT_H_

int
int64_trits_2_bits(
        int64_t       *poly,
        uint16_t      N,
        size_t        out_len,
        unsigned char *out);

int
bits_2_int64_trits(
        const size_t        in_len,
        const unsigned char *in,
        int64_t             *poly,
        uint16_t            N);

int
int64_elements_2_octets(
    uint16_t        in_len,         /*  in - no. of elements to be packed */
    uint64_t const *in,             /*  in - ptr to elements to be packed */
    uint8_t         n_bits,         /*  in - no. of bits in input element */
    uint8_t        *out);           /* out - addr for output octets */

int
octets_2_int64_elements(
    uint32_t        in_len,         /*  in - no. of octets to be unpacked */
    uint8_t const  *in,             /*  in - ptr to octets to be unpacked */
    uint8_t         n_bits,         /*  in - no. of bits in output element */
    uint64_t       *out);           /* out - addr for output elements */

int
int16_elements_2_octets(
    uint16_t        in_len,         /*  in - no. of elements to be packed */
    uint16_t const *in,             /*  in - ptr to elements to be packed */
    uint8_t         n_bits,         /*  in - no. of bits in input element */
    uint8_t        *out);           /* out - addr for output octets */


int
octets_2_int16_elements(
    uint16_t        in_len,         /*  in - no. of octets to be unpacked */
    uint8_t const  *in,             /*  in - ptr to octets to be unpacked */
    uint8_t         n_bits,         /*  in - no. of bits in output element */
    uint16_t       *out);           /* out - addr for output elements */
#endif
