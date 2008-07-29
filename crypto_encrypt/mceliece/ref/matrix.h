#ifndef _MATRIX_H
#define _MATRIX_H

#define BITS_PER_LONG (8 * sizeof (unsigned long))

typedef struct matrix{
   int rown;//number of rows.
   int coln;//number of columns.
   int rwdcnt;//number of words in a row
   int alloc_size;//number of allocated bytes
   unsigned long *elem;//row index.
   }*MAT;

#define mat_coeff(A, i, j) (((A)->elem[(i) * A->rwdcnt + (j) / BITS_PER_LONG] >> (j % BITS_PER_LONG)) & 1)
//#define mat_row(A, i) ((A)->elem + ((i) * A->rwdcnt))
#define mat_set_coeff_to_one(A, i, j) ((A)->elem[(i) * A->rwdcnt + (j) / BITS_PER_LONG] |= (1UL << ((j) % BITS_PER_LONG)))
#define mat_change_coeff(A, i, j) ((A)->elem[(i) * A->rwdcnt + (j) / BITS_PER_LONG] ^= (1UL << ((j) % BITS_PER_LONG)))
#define mat_set_to_zero(R) memset((R)->elem,0,(R)->alloc_size);


MAT mat_ini(int rown, int coln);
MAT mat_ini_from_string(int rown, int coln, const unsigned char * s);
void mat_free(MAT A);
MAT mat_copy(MAT A);
MAT mat_rowxor(MAT A,int a, int b);
int * mat_rref(MAT A);
void mat_vec_mul(unsigned long *cR, unsigned char *x, MAT A);
MAT mat_mul(MAT A, MAT B);

#endif

