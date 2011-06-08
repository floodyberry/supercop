/*
 * $Id: BLAS.c 3272 2009-06-15 00:18:41Z daven $
 */
#include "GF.h"
#include "BLAS.h"
#include <string.h>

extern unsigned char logtab[];
extern unsigned char alogtab[];

void BLAS_prod_A(int dim, byte *C, byte *A, byte *B)
{
	int i, j, k;
	for(i = 0; i < dim; i++)
	{
		for(j = 0; j < dim; j++)
		{
			C[i*dim+j] = 0;
			for(k = 0; k < dim; k++)
			{
				C[i*dim+j] ^= GF_256_mul(A[i*dim+k], B[k*dim+j]);
			}
		}
	}
	return;
}

void BLAS_elemRowOpIII(int dim, byte *A, int i, int j, byte m)
{
	int k;
	if(m)
	{
		for(k = 0; k < dim; k++)
		{
			A[i*dim+k] ^= GF_256_mul(A[j*dim+k], m);
		}
	}
	return;
}

int BLAS_gusElimHomoEqs(int dim, byte *A, byte *res)
{
	int i, j, k, l, byte_copy;
	byte *tmp, *Aptr, *Aptr2, *Aptr3;

	tmp = (byte *)malloc(sizeof(byte)*dim);
	Aptr = A;
	for (j = 0;j<dim-1;++j)
	{
		l = dim-2-j;
		if(*Aptr==0)
		{
			Aptr2 = Aptr+dim;
			for(k = l;k>=0;--k)
			{
				if(*Aptr2)
				{
					byte_copy = dim-j;
					memcpy(tmp, Aptr2, byte_copy);
					memcpy(Aptr2, Aptr, byte_copy);
					memcpy(Aptr, tmp, byte_copy);
					break;
				}
				Aptr2 += dim;
			}
			//return 0;
		}  /// end if( A(j,j) == 0  )
		if((0 == *Aptr))
		{
#ifdef DEBUG
			printf("hah=%d\n", j);
			dump_mat(dim, dim, A);
#endif
			break;
		}
 		/// First divide j-th row with A_jj
		Aptr2 = Aptr+1;
		for (k = l;k>=0;k--)
		{
			*Aptr2 = GF_256_div(*Aptr2,*Aptr);
			Aptr2++;
		}
		*Aptr = 1;
		/// For subsequent rows, perform row_i -= A_ij*row_j
		Aptr2 = Aptr+dim+1;
		for (i=l;i>=0;i--)
		{
			*tmp = *(Aptr2-1);
			if(*tmp)
			{
				Aptr3 = Aptr+1;
				for (k = l;k>=0;k--)
				{
					/// In GF256, plus and minus are a same thing
					/// Below reads: A_ik -= A_ij*A_jk
					*Aptr2 ^= GF_256_mul(*tmp,*Aptr3);
					Aptr3++;
					Aptr2++;
				}
				Aptr2 += j+1;
			}
			else
			{
				Aptr2 += dim;
			}
		}
		Aptr += dim+1;
	}
#ifdef DEBUG
	//if( 0 == A[(dim-2)*dim + dim-2] ) 
	if(0 == A[dim*(dim-1)-2])
	{
		printf("In gauss elimination: Rank != dim - 1\n");
		getchar();
		free(tmp);
		return 0;
	}
#endif
	memset(res , 0, dim);
	res[j] = 1;
	Aptr3 = res+j-1;
	for(k = j - 1 ; k >= 0 ; k-- )
	{
		Aptr = A+k*dim+k+1;
		for( i = k+1 ; i < dim ; i++ )
		{
			*Aptr3 ^= GF_256_mul( *Aptr , res[i] );
			Aptr++;
		}
		Aptr3--;
	}
	free(tmp);
	return 1;
}

void BLAS_ivsD(int dim, byte *Di, byte *D)
{
	int i;
	for(i = 0; i < dim; i++)
	{
		Di[i*dim+i] = GF_256_inv(D[i*dim+i]);
	}
	return;
}

void BLAS_ivsL(int dim, byte *Li, byte *L)
{
	int i, j;
	for(i = 0; i < dim; i++)
	{
		Li[i*dim+i] = 1;
	}
	for(j = 0; j < dim-1; j++)
	{
		for(i = j+1; i < dim; i++)
		{
			BLAS_elemRowOpIII(dim, Li, i, j, L[i*dim+j]);
		}
	}
	return;
}

void BLAS_ivsU(int dim, byte *Ui, byte *U)
{
	int i, j;
	for(i = 0; i < dim; i++)
	{
		Ui[i*dim+i] = 1;
	}
	for(j = dim-1; j >= 1; j--)
	{
		for(i = j-1; i >= 0; i--)
		{
			BLAS_elemRowOpIII(dim, Ui, i, j, U[i*dim+j]);
		}
	}
	return;
}

void BLAS_genMatGF16(int dim, byte *M, byte *Mi)
{
	int i, j;
	int dim_div_2, MM_size;
	byte *Mp, *Mip, *L, *D, *U, *MM, *Li, *Di, *Ui;

	MM_size = dim*dim;

	L = (byte *)malloc(sizeof(byte)*MM_size);
	D = (byte *)malloc(sizeof(byte)*MM_size);
	U = (byte *)malloc(sizeof(byte)*MM_size);
	MM = (byte *)malloc(sizeof(byte)*MM_size);
	Li = (byte *)malloc(sizeof(byte)*MM_size);
	Di = (byte *)malloc(sizeof(byte)*MM_size);
	Ui = (byte *)malloc(sizeof(byte)*MM_size);
	Mp = (byte *)malloc(sizeof(byte)*MM_size);
	Mip = (byte *)malloc(sizeof(byte)*MM_size);

	memset(L, 0, sizeof(byte)*MM_size);
	memset(D, 0, sizeof(byte)*MM_size);
	memset(U, 0, sizeof(byte)*MM_size);
	memset(MM, 0, sizeof(byte)*MM_size);
	memset(Li, 0, sizeof(byte)*MM_size);
	memset(Di, 0, sizeof(byte)*MM_size);
	memset(Ui, 0, sizeof(byte)*MM_size);

	for(i = 0; i < dim; i++)
	{
		L[i*dim+i] = 1;
		//D[i*dim+i] = 1;
		while( 0 == (D[i*dim+i] = GF_16_rand()) ) ;
		U[i*dim+i] = 1;
		for(j = 0; j < i; j++)
		{
			L[i*dim+j] = GF_16_rand();
			U[j*dim+i] = GF_16_rand();
		}
	}
	BLAS_prod_A(dim, MM, D, U);
	BLAS_prod_A(dim, Mp, L, MM);

	BLAS_ivsL(dim, Li, L);
	BLAS_ivsD(dim, Di, D);
	BLAS_ivsU(dim, Ui, U);
	
	BLAS_prod_A(dim, MM, Di, Li);
	BLAS_prod_A(dim, Mip, Ui, MM);

	/* merge into compact mode for further faster table look up
	 */
	dim_div_2 = dim >> 1;
	for(i = 0; i < dim_div_2; i++)
	{
		for(j = 0; j < dim_div_2; j++)
		{
			M[i*dim+2*j] = logtab[(Mp[2*j*dim+2*i]&0x0f) ^ ((Mp[(2*j+1)*dim+2*i]<<4)&0xf0)];
			M[i*dim+2*j+1] = logtab[(Mp[2*j*dim+2*i+1]&0x0f) ^ ((Mp[(2*j+1)*dim+2*i+1]<<4)&0xf0)];
		}
	}
	for(i = 0; i < dim_div_2; i++)
	{
		for(j = 0; j < dim_div_2; j++)
		{
			Mi[i*dim+2*j] = logtab[(Mip[2*j*dim+2*i]&0x0f) ^ ((Mip[(2*j+1)*dim+2*i]<<4)&0xf0)];
			Mi[i*dim+2*j+1] = logtab[(Mip[2*j*dim+2*i+1]&0x0f) ^ ((Mip[(2*j+1)*dim+2*i+1]<<4)&0xf0)];
		}
	}

	free(L);
	free(D);
	free(U);
	free(MM);
	free(Li);
	free(Di);
	free(Ui);
	free(Mp);
	free(Mip);
	return;
}

void BLAS_genVec(int dim, byte *V)
{
	int i;
	for(i = 0; i < dim; i++)
	{
		V[i] = GF_256_rand();
	}
	return;
}

void BLAS_affineGF16(int dim, byte *b, byte *A, byte *x, byte *c)
{
	int i, dim_div_2;
	byte *y, *ytmp;

	dim_div_2 = dim >> 1;
	y = malloc(sizeof(byte)*dim);
	ytmp = y;
	for(i = 0; i < dim_div_2; i++)
	{
		ytmp[0] = logtab[x[i]&0x0f];
		ytmp[1] = logtab[(x[i]&0xf0)>>4];
		ytmp += 2;
	}
	memset(b, 0, sizeof(byte)*dim_div_2);
	BLAS_aLinearGF16(dim, b, A, y);
	for(i = 0; i < dim_div_2; i++)
	{
		b[i] ^= c[i];
	}
	free(y);
	return;
}

void BLAS_ivsAffineGF16(int dim, byte *b, byte *A, byte *x, byte *c)
{
	int i, dim_div_2, tmp;
	byte *y, *ytmp;

	dim_div_2 = dim >> 1;
	y = (byte *)malloc(sizeof(byte)*dim);
	ytmp = y;
	for(i = 0; i < dim_div_2; i++)
	{
		tmp = x[i] ^ c[i];
		ytmp[0] = logtab[tmp&0x0f];
		ytmp[1] = logtab[(tmp&0xf0)>>4];
		ytmp += 2;
	}
	memset(b, 0, sizeof(byte)*dim_div_2);
	BLAS_aLinearGF16(dim, b, A, y);
	free(y);
	return;
}

int BLAS_pLinearGF16(int dim, byte *b, byte *A, byte *y, int pSize)
{
	int i, j, dim_div_2, A_dist, n_row;
	byte *btmp, *btmp2, *Atmp, *ytmp;

	dim_div_2 = dim >> 1;
	memset(b, 0, sizeof(byte)*dim_div_2);
	n_row = (pSize + 1) >> 1;
	A_dist = (dim_div_2 - n_row) << 1;
	Atmp = A + dim_div_2*dim - 2;
	ytmp = y + dim - 2;
	btmp2 = b + dim_div_2 - 1;
	for(i = 0; i < dim_div_2; i++)
	{
		if(ytmp[0])
		{
			if(ytmp[1])
			{
				btmp = btmp2;
				for(j = 0; j < n_row; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(ytmp[0], Atmp[0]) ^ GF_16_mul_1_to_2(ytmp[1], Atmp[1]);
					Atmp -= 2;
					btmp--;
				}
			}
			else
			{
				btmp = btmp2;
				for(j = 0; j < n_row; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(ytmp[0], Atmp[0]);
					Atmp -= 2;
					btmp--;
				}
			}
			Atmp -= A_dist;
			ytmp -= 2;
		}
		else
		{
			if(ytmp[1])
			{
				btmp = btmp2;
				for(j = 0; j < n_row; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(ytmp[1], Atmp[1]);
					Atmp -= 2;
					btmp--;
				}
				Atmp -= A_dist;
			}
			else
			{
				Atmp -= dim;
			}
			ytmp -= 2;
		}
	}
	for(i = 0; i < pSize; i++)
	{
		if(b[dim_div_2-(i>>1)-1]&((0xf0)>>((i&0x1)*4)))
		{
			return 1;
		}
	}
	return 0;
}

void BLAS_rLinearGF16(int dim, byte *b, byte *A, byte *y, int pSize)
{
	int i, j, n_row, A_dist, dim_div_2;
	byte *btmp, *Atmp, *ytmp;

	dim_div_2 = dim >> 1;
	n_row = dim_div_2 - ((pSize + 1) >> 1);
	A_dist = (dim_div_2 - n_row) << 1;
	Atmp = A;
	ytmp = y;
	for(i = 0; i < dim_div_2; i++)
	{
		if(ytmp[0])
		{
			if(ytmp[1])
			{
				btmp = b;
				for(j = 0; j < n_row; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(ytmp[0], Atmp[0]) ^ GF_16_mul_1_to_2(ytmp[1], Atmp[1]);
					Atmp += 2;
					btmp++;
				}
			}
			else
			{
				btmp = b;
				for(j = 0; j < n_row; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(ytmp[0], Atmp[0]);
					Atmp += 2;
					btmp++;
				}
			}
			Atmp += A_dist;
			ytmp += 2;
		}
		else
		{
			if(ytmp[1])
			{
				btmp = b;
				for(j = 0; j < n_row; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(ytmp[1], Atmp[1]);
					Atmp += 2;
					btmp++;
				}
				Atmp += A_dist;
				ytmp += 2;
			}
			else
			{
				Atmp += dim;
				ytmp += 2;
			}
		}
	}
	return;
}

void BLAS_aLinearGF16(int dim, byte *b, byte *A, byte *y)
{
	int i, j, dim_div_2;
	byte *ytmp, *btmp, *Atmp;

	dim_div_2 = dim >> 1;
	Atmp = A;
	ytmp = y;
	for(i = 0; i < dim_div_2; i++)
	{
		if(ytmp[0])
		{
			if(ytmp[1])
			{
				btmp = b;
				for(j = 0; j < dim_div_2; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(ytmp[0], Atmp[0]) ^ GF_16_mul_1_to_2(ytmp[1], Atmp[1]);
					Atmp += 2;
					btmp++;
				}
			}
			else
			{
				btmp = b;
				for(j = 0; j < dim_div_2; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(ytmp[0], Atmp[0]);
					Atmp += 2;
					btmp++;
				}
			}
			ytmp += 2;
		}
		else
		{
			if(ytmp[1])
			{
				Atmp++;
				ytmp++;
				btmp = b;
				for(j = 0; j < dim_div_2; j++)
				{
					*btmp ^= GF_16_mul_1_to_2(*ytmp, *Atmp);
					Atmp += 2;
					btmp++;
				}
				Atmp--;
				ytmp++;
			}
			else
			{
				Atmp += dim;
				ytmp += 2;
			}
		}
	}
	return;
}

void BLAS_dumpMat(int dim_h, int dim_w, byte *A)
{
	int i, j;
	for(i = 0; i < dim_h; i++)
	{
		for(j = 0; j < dim_w; j++)
		{
			printf("%3d ", (int)A[i*dim_w+j]);
		}
		printf("\n");
	}
	printf("\n");
	return;
}

void BLAS_dumpVec(int dim, byte *V)
{
	int i;
	for(i = 0; i < dim; i++)
	{
		printf("%3d ", (int)V[i]);
	}
	printf("\n");
	return;
}

/*
 * BLAS.c
 */
