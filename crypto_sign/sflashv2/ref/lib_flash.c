#include <memory.h>
#include <stdio.h>
#include <stdlib.h>
#include "crypto_hash_sha1.h"
#include "randombytes.h"
#include "lib_flash.h"
#include "table_flash.h"


static unsigned char rando(void)
{
  unsigned char c;
  randombytes(&c,1);
  return c & 127;
}

void
add37(unsigned char z[37], unsigned char x[37], unsigned char y[37])
{
	int i;
	for(i=0;i<37;i++)
	{
		z[i] = (unsigned char) (x[i] ^ y[i]);
	}
}


void
lineaire(unsigned char z[37], unsigned char x[37], unsigned char s1[37][37])
{
	int i,j;

	memset(z,0,37);
	for(i=0; i<37; i++)
	{
		for(j=0; j<37; j++)
		{
			if(s1[j][i])
				z[i] ^= x[j];
		}
	}
}

void
inv_affine(unsigned char z[37], unsigned char x1[37], unsigned char s1[37][37], unsigned char s2[37], unsigned char M[128*128])
{
	int i,j;
	unsigned char x[37];

	memcpy(x,x1,37);
	for(i=0;i<37;i++)
	{
		x[i] ^= s2[i];
	}
	
	memset(z,0,37);
	for(i=0; i<37; i++)
	{
		for(j=0; j<37; j++)
		{
			z[i] ^= M[(((unsigned long) x[j])<<7) + (unsigned long) s1[j][i]];
		}
	}

}
void
quadratic(unsigned char z[26], unsigned char x[37], unsigned char A[26][37][37], unsigned char B[26][37], unsigned char C[26], unsigned char M[128*128])
{
	int i,j,k;

	for(i=0;i<26;i++)
	{
		z[i] = C[i];
		for(j=0;j<37;j++)
		{
			z[i] ^= M[(((unsigned long) B[i][j])<<7) + (unsigned long) x[j]];
			for(k=j;k<37;k++)
			{
				z[i] ^=  M[(((unsigned long) A[i][j][k])<<7) + (unsigned long) M[(((unsigned long) x[j])<<7) + (unsigned long) x[k]]];
			}
		}
	}
}
void
sqsq37(unsigned char z[37], unsigned char x[37], unsigned char M[128*128])
{
	int i;

	unsigned char temp,zz[73];

	memset(zz,0,73);

	for(i=0;i<37;i++)
	{
			zz[2*i] = M[(((unsigned long) x[i])<<7) + (unsigned long) x[i]];
	}

	for(i=72;i>36;i--)
	{
		if(zz[i])
		{
			temp = zz[i];
			zz[i-(37-12)] ^= temp;
			zz[i-(37-10)] ^= temp;
			zz[i-(37- 2)] ^= temp;
			zz[i-(37- 0)] ^= temp;
		}
	}

	memcpy(z,zz,37);
}
void
mul37(unsigned char z[37], unsigned char x[37], unsigned char y[37], unsigned char M[128*128])
{
	int i,j;

	unsigned char temp,zz[73];

	memset(zz,0,73);

	for(i=0;i<37;i++)
	{
		for(j=0;j<37;j++)
		{
			zz[i+j] ^= M[(((unsigned long) x[i])<<7) + (unsigned long) y[j]];
		}
	}

	for(i=72;i>36;i--)
	{
		if(zz[i])
		{
			temp = zz[i];
			zz[i-(37-12)] ^= temp;
			zz[i-(37-10)] ^= temp;
			zz[i-(37- 2)] ^= temp;
			zz[i-(37- 0)] ^= temp;
		}
	}

	memcpy(z,zz,37);
}
void
Bij_Aff(unsigned char T[37][37], unsigned char I[37][37], unsigned char V[37], unsigned char M[128*128])
{
	int i,j,k;

	unsigned char L[37][37], U[37][37], IL[37][37], IU[37][37];

	for(i=0; i<37; i++)			/* Generate L and U and V*/
	{
		V[i] = rando();
		for(j=0; j<37; j++)
		{
			if(i<j)
			{
				U[i][j] = rando();
				L[i][j] = 0;
			}
			else if(i>j)
			{
				L[i][j] = rando();
				U[i][j] = 0;
			}
			else if(i==j)
			{
				L[i][j] = 1;
				U[i][j] = 1;
			}

		}
		
	}

	for(i=0; i<37; i++)			/* T = L.U */
	{
		for(j=0; j<37; j++)
		{
			T[i][j] = 0;
			for(k=0; k<37; k++)
			{
				T[i][j] ^= M[(((unsigned long) L[i][k])<<7) + (unsigned long) U[k][j]];
			}
		}
	}

	for(j=0; j<37; j++)			/*  IL = 1/L  */
	{
		for(i=0; i<37; i++)
		{
			if(i<j)
			{
				IL[i][j] = 0;
			}
			else if(i>j)
			{
				IL[i][j] = 0;
				for(k=j; k<i; k++)
				{
					IL[i][j] ^= M[(((unsigned long) IL[k][j])<<7) + (unsigned long) L[i][k]];
				}
			}
			else if(i==j)
			{
				IL[i][j] = 1;
			}
		}
	}

	for(i=0; i<37; i++)			/*  IU = 1/I  */
	{
		for(j=0; j<37; j++)
		{
			if(i>j)
			{
				IU[i][j] = 0;
			}
			else if(i<j)
			{
				IU[i][j] = 0;
				for(k=i; k<j; k++)
				{
					IU[i][j] ^= M[(((unsigned long) IU[i][k])<<7) + (unsigned long) U[k][j]];
				}
			}
			else if(i==j)
			{
				IU[i][j] = 1;
			}
		}
	}

	for(i=0; i<37; i++)			/* I =IU.IL */
	{
		for(j=0; j<37; j++)
		{
			I[i][j] = 0;
			for(k=0; k<37; k++)
			{
				I[i][j] ^= M[(((unsigned long) IU[i][k])<<7) + (unsigned long) IL[k][j]];
			}
		}
	}
}


void
exponent(unsigned char Z[37], unsigned char X[37], unsigned char *e, int n, unsigned char M[128*128])
{

	int i;
	unsigned char tp[37];

	memcpy(Z,X,37);

	for(i=n-2; i>=0; i--)
	{
		sqsq37(tp,Z,M);
		
		if(e[i])
		{
			mul37(Z,tp,X,M);
		}
		else
		{
			memcpy(Z,tp,37);
		}
	}	
}
void priv_pub(unsigned char QUAD[37][37][37], unsigned char LIN[37][37], unsigned char CONS[37], unsigned char S1[37][37],unsigned char S2[37], unsigned char T1[37][37],unsigned char T2[37],  unsigned char M[16384])
{
	int i,j,k,l,m;
	unsigned char X[37], Y[37], EXP[37][37], QUAD3[37][37][37], LIN3[37][37], CONS3[37];

	unsigned char expo3[78] /*128^11 */ = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1};


	for(i=0;i<37;i++)	/* Construction de ^ (256^11) */
	{
		memset(X,0,37);
		X[i] = 1;
		exponent(EXP[i],X,expo3,78,M);
	}

	for(i=0; i<37; i++)	/* Construction de la forme quad produit */
	{
		memset(X,0,37);
		X[i] = 1;
		for(j=0; j<37; j++)
		{
			memset(Y,0,37);
			Y[j] = 1;
			mul37(QUAD3[i][j],X,Y,M);
		}
	}

	for(i=0;i<37;i++)	/* Compos‚e des 2*/
	{
		for(j=0;j<37;j++)
		{
			for(k=0;k<37;k++)
			{
				QUAD[i][j][k] = 0;
			}
		}
	}

	for(i=0;i<37;i++)
	{
		for(j=0;j<37;j++)
		{
			for(k=0;k<37;k++)
			{
				for(l=0;l<37;l++)
				{
					QUAD[l][j][k] ^= M[(((unsigned long) EXP[j][i])<<7) + (unsigned long) QUAD3[i][k][l]];
				}
			}
		}
	}


	for(i=0; i<37; i++)	
	{
		CONS3[i]=0;
		for(j=0; j<37; j++)	
		{
			LIN3[i][j]=0;
			for(k=0; k<37; k++)	
			{
				QUAD3[i][j][k]=0;
			}
		}
	}

	for(i=0; i<37; i++)	
	{
		for(j=0; j<37; j++)	
		{
			for(k=0; k<37; k++)	
			{
				CONS3[i] ^= M[(((unsigned long) QUAD[i][j][k])<<7) + (unsigned long) M[(((unsigned long) S2[j])<<7) + (unsigned long) S2[k]]];
				
				for(l=0; l<37; l++)	
				{
					LIN3[i][l] ^= M[(((unsigned long) QUAD[i][j][k])<<7) + (unsigned long) M[(((unsigned long) S2[j])<<7) + (unsigned long) S1[l][k]]];
					LIN3[i][l] ^= M[(((unsigned long) QUAD[i][j][k])<<7) + (unsigned long) M[(((unsigned long) S2[k])<<7) + (unsigned long) S1[l][j]]];
				}
				
				
				for(l=0; l<37; l++)	
				{
					for(m=0; m<37; m++)	
					{
						QUAD3[i][l][m] ^= M[(((unsigned long) QUAD[i][j][k])<<7) + (unsigned long) M[(((unsigned long) S1[l][j])<<7) + (unsigned long) S1[m][k]]];
					}
				}
			}
		}
	}

	for(i=0; i<37; i++)	
	{
		CONS[i]=0;
		for(j=0; j<37; j++)	
		{
			LIN[i][j]=0;
			for(k=0; k<37; k++)	
			{
				QUAD[i][j][k]=0;
			}
		}
	}


	for(i=0;i<37;i++)
	{
		CONS[i] ^= T2[i];
		for(j=0;j<37;j++)
		{
			CONS[i] ^= M[(((unsigned long) CONS3[j])<<7) + (unsigned long) T1[j][i]];
			for(k=0;k<37;k++)
			{
				LIN[i][k] ^= M[(((unsigned long) LIN3[j][k])<<7) + (unsigned long) T1[j][i]];
				for(l=0;l<37;l++)
				{
					QUAD[i][k][l] ^= M[(((unsigned long) QUAD3[j][k][l])<<7) +(unsigned long) T1[j][i]];
				}
			}
		}
	}

	for(i=0;i<37;i++)	/* regroupement des termes symetriques, attention a ne pas laisser j a la place de j+1 */
	{
		for(j=0;j<37;j++)
		{
			for(k=j+1;k<37;k++)
			{
				QUAD[i][j][k] ^= QUAD[i][k][j];
			}
		}
	}
}
void
Flash_build_complete_key(Flash_Complete_Key CK)
{
	int i;

	init_table_flash(CK->M,/*CK->I,*/CK->M1/*,CK->M2/* /*,CK->M3*/);
	Bij_Aff(CK->S1,CK->IS1,CK->S2,CK->M);
	Bij_Aff(CK->T1,CK->IT1,CK->T2,CK->M);
	priv_pub(CK->Q,CK->L,CK->C,CK->S1,CK->S2,CK->T1,CK->T2,CK->M);

	for(i=0;i<11;i++)
	{
		CK->delta[i] = rando();
	}
	CK->delta[0] = CK->delta[0] & 3;

}

void 
Flash_complete2public(Flash_Complete_Key CK, Flash_Complete_Key PK)
{
	unsigned char i,j;

	memcpy(PK->C,CK->C,26);
	for(i=0; i<26; i++)
	{
		memcpy(PK->L[i],CK->L[i],37);
		for(j=0; j<37; j++)
		{
			memcpy(PK->Q[i][j],CK->Q[i][j],37);
		}
	}

//	memcpy(PK->I,CK->I,128);
	memcpy(PK->M,CK->M,128*128);
}

void 
Flash_complete2private(Flash_Complete_Key CK, Flash_Complete_Key PK)
{
	unsigned char i;

	memcpy(PK->S2,CK->S2,37);
	memcpy(PK->T2,CK->T2,37);

	for(i=0; i<37; i++)
	{
		memcpy(PK->IS1[i],CK->IS1[i],37);
		memcpy(PK->IT1[i],CK->IT1[i],37);
		memcpy(PK->M1[i],CK->M1[i],37);
		//memcpy(PK->M2[i],CK->M2[i],37);
		//memcpy(PK->M3[i],CK->M3[i],37);
	}

	//memcpy(PK->I,CK->I,128);
	memcpy(PK->M,CK->M,128*128);
}

void
Flash_encrypt(unsigned char out[26], unsigned char in[37], Flash_Complete_Key PK)
{
	quadratic(out,in,PK->Q,PK->L,PK->C,PK->M);	
}

void
Flash_decrypt(unsigned char out[37], unsigned char in[37], Flash_Complete_Key PK)
{
	unsigned char u[37], tmp[37], tmp2[37], tmp3[37], tmp4[37];
	int i,j;

	unsigned char temp,zz[73];

	/*inv_affine correspond à T^-1 */
	inv_affine(out,in,PK->IT1,PK->T2,PK->M);

	memset(zz,0,73);
	for(i=0;i<37;i++)
	{
			zz[2*i] = PK->M[(((unsigned long) out[i])<<7) + (unsigned long) out[i]];
	}
	for(i=72;i>36;i--)
	{
		if(zz[i])
		{
			temp = zz[i];
			zz[i-(37-12)] ^= temp;
			zz[i-(37-10)] ^= temp;
			zz[i-(37- 2)] ^= temp;
			zz[i-(37- 0)] ^= temp;
		}
	}
	memcpy(u,zz,37);
	memset(zz,0,73);
	for(i=0;i<37;i++)
	{
			zz[2*i] = PK->M[(((unsigned long) u[i])<<7) + (unsigned long) u[i]];
	}
	for(i=72;i>36;i--)
	{
		if(zz[i])
		{
			temp = zz[i];
			zz[i-(37-12)] ^= temp;
			zz[i-(37-10)] ^= temp;
			zz[i-(37- 2)] ^= temp;
			zz[i-(37- 0)] ^= temp;
		}
	}
	memcpy(u,zz,37);
	//sqsq37(u,out,PK->M);
	//sqsq37(u,u,PK->M);

	memset(zz,0,73);

	for(i=0;i<37;i++)
	{
		for(j=0;j<37;j++)
		{
			zz[i+j] ^= PK->M[(((unsigned long) u[i])<<7) + (unsigned long) out[j]];
		}
	}

	for(i=72;i>36;i--)
	{
		if(zz[i])
		{
			temp = zz[i];
			zz[i-(37-12)] ^= temp;
			zz[i-(37-10)] ^= temp;
			zz[i-(37- 2)] ^= temp;
			zz[i-(37- 0)] ^= temp;
		}
	}

	memcpy(tmp,zz,37);
//	mul37(tmp,u,out,PK->M);

	memset(zz,0,73);
	for(i=0;i<37;i++)
	{
			zz[2*i] = PK->M[(((unsigned long) u[i])<<7) + (unsigned long) u[i]];
	}
	for(i=72;i>36;i--)
	{
		if(zz[i])
		{
			temp = zz[i];
			zz[i-(37-12)] ^= temp;
			zz[i-(37-10)] ^= temp;
			zz[i-(37- 2)] ^= temp;
			zz[i-(37- 0)] ^= temp;
		}
	}
	memcpy(out,zz,37);
	memset(zz,0,73);
	for(i=0;i<37;i++)
	{
			zz[2*i] = PK->M[(((unsigned long) out[i])<<7) + (unsigned long) out[i]];
	}
	for(i=72;i>36;i--)
	{
		if(zz[i])
		{
			temp = zz[i];
			zz[i-(37-12)] ^= temp;
			zz[i-(37-10)] ^= temp;
			zz[i-(37- 2)] ^= temp;
			zz[i-(37- 0)] ^= temp;
		}
	}
	memcpy(out,zz,37);
	//sqsq37(out,u,PK->M);
	//sqsq37(out,out,PK->M);
	
	memset(zz,0,73);
	for(i=0;i<37;i++)
	{
		for(j=0;j<37;j++)
		{
			zz[i+j] ^= PK->M[(((unsigned long) tmp[i])<<7) + (unsigned long) out[j]];
		}
	}
	for(i=72;i>36;i--)
	{
		if(zz[i])
		{
			temp = zz[i];
			zz[i-(37-12)] ^= temp;
			zz[i-(37-10)] ^= temp;
			zz[i-(37- 2)] ^= temp;
			zz[i-(37- 0)] ^= temp;
		}
	}
	memcpy(tmp2,zz,37);
	//mul37(tmp2,tmp,out,PK->M);

	sqsq37(tmp4,tmp2,PK->M);
	mul37(tmp4,tmp4,tmp2,PK->M);
	
	sqsq37(tmp2,out,PK->M);
	sqsq37(tmp2,tmp2,PK->M);

	//lineaire(u,tmp2,PK->M2);	
	sqsq37(u,tmp2,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	mul37(tmp,u,tmp4,PK->M);

	sqsq37(u,tmp,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	mul37(tmp3,u,tmp,PK->M);
	sqsq37(u,tmp3,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	mul37(tmp3,u,tmp,PK->M);
	sqsq37(u,tmp3,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);
	sqsq37(u,u,PK->M);

	mul37(tmp4,tmp4,u,PK->M);
	//lineaire(tmp3,tmp4,PK->M2);
	sqsq37(tmp3,tmp4,PK->M);
	sqsq37(tmp3,tmp3,PK->M);
	sqsq37(tmp3,tmp3,PK->M);
	sqsq37(tmp3,tmp3,PK->M);
	sqsq37(tmp3,tmp3,PK->M);
	sqsq37(tmp3,tmp3,PK->M);
	sqsq37(tmp4,tmp3,PK->M);
	lineaire(tmp3,tmp4,PK->M1);

	lineaire(tmp,tmp2,PK->M1);
	mul37(tmp4,tmp,u,PK->M);
	mul37(out,tmp4,tmp2,PK->M);
	mul37(tmp4,out,tmp3,PK->M);

	lineaire(tmp2,tmp4,PK->M1);
	//lineaire(tmp,tmp2,PK->M2);
	lineaire(tmp,tmp2,PK->M1);
	sqsq37(tmp,tmp,PK->M);
	sqsq37(tmp,tmp,PK->M);
	sqsq37(tmp,tmp,PK->M);
	sqsq37(tmp,tmp,PK->M);
	sqsq37(tmp,tmp,PK->M);
	sqsq37(tmp,tmp,PK->M);
	sqsq37(tmp,tmp,PK->M);
	mul37(tmp2,tmp,tmp3,PK->M);
	lineaire(tmp,tmp2,PK->M1);
	mul37(tmp2,tmp,tmp4,PK->M);

	/*multiplication matricielle par M1 qui représente la mise à la puissance 2^7^10*/
	/*Mis à la puissance 64*/
	/*mis à la puissance 2^77-1
	exponent(u,tmp,exp2,77,PK->M);
	for(i=0;i<18;i++)
	{
		/*mis à la puissance 2^7^22 de tmp 
		lineaire(out,tmp,PK->M2,PK->M);
		/*
		mul37(tmp,out,u,PK->M);
	}
   /* inversion affine de S*/	
	inv_affine(out,tmp2,PK->IS1,PK->S2,PK->M);
}
unsigned char
bit(char i, char x)
{
	return (unsigned char) ((x>>i) & 1);
}

unsigned char
nextbit(unsigned char *data, int *current)
{
	int i=(*current)/8;
	char j= (char) (7-((*current)%8));

	*current = *current + 1;
	
	return bit(j,data[i]);
}

void
format_message1(const unsigned char *in, int length, unsigned char out[37], unsigned char delta[11])
{
	int i,j;
	unsigned char M1[20], M2[20], W[20];
	unsigned char V[33];

	crypto_hash_sha1(M1,in,length / 8);
	crypto_hash_sha1(M2,M1,160 / 8);

	/* calcule V sur 182 bits soit 22.75 octets*/
	memset(V,33,0);
	for(i=0;i<20;i++)
	{
		V[i] = M1[i];
	}

	V[20] = M2[0];
	V[21] = M2[1];
	V[22] = (unsigned char) (M2[2] & 0xFC);


	V[22] |= delta[0];
	for(i=23;i<33;i++)
	{
		V[i] = delta[i-22];
	}

	crypto_hash_sha1(W,V,33);

	for(i=0,j=0;i<26;i++)
	{
		out[i] = 0;
		out[i] ^= 64 * nextbit(V,&j);
		out[i] ^= 32 * nextbit(V,&j);
		out[i] ^= 16 * nextbit(V,&j);
		out[i] ^=  8 * nextbit(V,&j);
		out[i] ^=  4 * nextbit(V,&j);
		out[i] ^=  2 * nextbit(V,&j);
		out[i] ^=  1 * nextbit(V,&j);
	}

	
	for(i=26,j=0;i<37;i++)
	{
		out[i] = 0;
		out[i] ^= 64 * nextbit(W,&j);
		out[i] ^= 32 * nextbit(W,&j);
		out[i] ^= 16 * nextbit(W,&j);
		out[i] ^=  8 * nextbit(W,&j);
		out[i] ^=  4 * nextbit(W,&j);
		out[i] ^=  2 * nextbit(W,&j);
		out[i] ^=  1 * nextbit(W,&j);
	}
}

void
format_message2(unsigned char *in, int length, unsigned char out[26])
{
	int i,j;
	unsigned char M1[20], M2[20];
	unsigned char V[23];

	crypto_hash_sha1(M1,in,length / 8);
	crypto_hash_sha1(M2,M1,160 / 8);
	
	
	/* calcule V sur 182 bits soit 22.75 octets*/
	memset(V,33,0);
	for(i=0;i<20;i++)
	{
		V[i] = M1[i];
	}
	V[20] = M2[0];
	V[21] = M2[1];
	V[22] = (unsigned char) (M2[2] & 0xFC);

	for(i=0,j=0;i<26;i++)
	{
		out[i] = 0;
		out[i] ^= 64 * nextbit(V,&j);
		out[i] ^= 32 * nextbit(V,&j);
		out[i] ^= 16 * nextbit(V,&j);
		out[i] ^=  8 * nextbit(V,&j);
		out[i] ^=  4 * nextbit(V,&j);
		out[i] ^=  2 * nextbit(V,&j);
		out[i] ^=  1 * nextbit(V,&j);
	}
}
	
void
Flash_sign(unsigned char out[37], unsigned char *data, int length, Flash_Complete_Key PK)
{
	unsigned char in[37];
	int i;

	format_message1(data,length,in,PK->delta);
	Flash_decrypt(out,in,PK);
}

void
Flash_sign2(unsigned char out[37],const unsigned char *data, int length, Flash_Complete_Key PK)
{
	unsigned char in[37];
	int i;
	
	format_message1(data,length,in,PK->delta);

	Flash_decrypt(out,in,PK);
}
int
Flash_verify(unsigned char *data, int length, unsigned char signature[37], Flash_Complete_Key PK)
{
	int i;
	unsigned char in[26];
	unsigned char out[26];
	format_message2(data, length, in);
	quadratic(out,signature,PK->Q,PK->L,PK->C,PK->M);	
	for(i=0;i<26;i++)
	{
		if(in[i]!=out[i])
		{
			return 0;
		}
	}
	return 1;
}


int
Flash_verify2(unsigned char *data, int length, unsigned char signature[37], Flash_Complete_Key PK)
{
	int i;
	unsigned char in[26];
	unsigned char out[26];

	format_message2(data, length, in);
	quadratic(out,signature,PK->Q,PK->L,PK->C,PK->M);	
	
	for(i=0;i<26;i++)
	{
		if(in[i]!=out[i])
		{
			return 0;
		}
	}
	return 1;
}
unsigned char
load_bit(unsigned char *key, int *ibit)
{
	int i=(*ibit)/8;
	char j= (char) (7-((*ibit)%8));

	*ibit = *ibit + 1;
	
	return bit(j,key[i]);
}

void
store_bit(unsigned char bit, unsigned char *key, int *ibit)
{
	int i=(*ibit)/8;
	char j= (char) (7-((*ibit)%8));

	*ibit = *ibit + 1;
	
	key[i] |= bit << j;
}
void
Flash_store2_public_key(unsigned char *pk, Flash_Complete_Key PK)
{
  int i,j,k,l;
  for(l=0,i=0;i<26;i++)
    {
      pk[l++]=PK->C[i];
      for(j=0;j<37;j++)
	{
	  pk[l++]=PK->L[i][j];
	  for(k=j;k<37;k++)
	    {
	      pk[l++]=PK->Q[i][j][k];
	    }
	}
    }
}
void
Flash_load_public_key(char *fichier, Flash_Complete_Key PK)
{
	FILE *in;
	int i,j,k,l;
	unsigned char key[19266];

	if(!(in=fopen(fichier,"rb")))
	{
		printf("Erreur de fichier de cl‚ publique: '%s'\n",fichier);
		exit(0);
	}
	fread(key,1,19266,in);	
	fclose(in);
	
	for(l=0,i=0;i<26;i++)
	{
		PK->C[i]=key[l++];
		for(j=0;j<37;j++)
		{
			PK->L[i][j]=key[l++];
			for(k=j;k<37;k++)
			{
				PK->Q[i][j][k]=key[l++];
			}
		}
	}
	init_table_flash(PK->M,/*PK->I,*/NULL);
}
void
Flash_load2_public_key(const unsigned char *pk, Flash_Complete_Key PK)
{
  int i,j,k,l;
  
  for(l=0,i=0;i<26;i++)
    {
      PK->C[i]=pk[l++];
      for(j=0;j<37;j++)
	{
	  PK->L[i][j]=pk[l++];
	  for(k=j;k<37;k++)
	    {
	      PK->Q[i][j][k]=pk[l++];
	    }
	}
   }
  init_table_flash(PK->M,/*PK->I,*/NULL);
}
void
Flash_store_private_key(char *fichier, Flash_Complete_Key PK)
{
	FILE *out;
	int i,j,l;
	
	unsigned char key[2823];

/* 	printf("\n   Private key: "); */

	for(l=0,i=0;i<37;i++)
	{
		key[l++]=PK->S2[i];
		key[l++]=PK->T2[i];
		for(j=0;j<37;j++)
		{
			key[l++]=PK->IS1[i][j];
			key[l++]=PK->IT1[i][j];
		}
	}
	for(i=0;i<11;i++)
	{
		key[l++] = PK->delta[i];
	}

	if(!(out=fopen(fichier,"wb")))
	{
		printf("Erreur ecriture du fichier de cle publique: '%s'\n",fichier);
		exit(0);
	}
	fwrite(key,1,2823,out);	
	fclose(out);
}

void
Flash_store2_private_key(unsigned char *pk, Flash_Complete_Key PK)
{
  int i,j,l;
	
  for(l=0,i=0;i<37;i++)
    {
      pk[l++]=PK->S2[i];
      pk[l++]=PK->T2[i];
      for(j=0;j<37;j++)
	{
	  pk[l++]=PK->IS1[i][j];
	  pk[l++]=PK->IT1[i][j];
	}
    }
  for(i=0;i<11;i++)
    {
      pk[l++] = PK->delta[i];
    }
  
}


void
Flash_load_private_key(char *fichier, Flash_Complete_Key PK)
{
	FILE *in;
	int i,j,l;
	
	unsigned char key[2823];

	if(!(in=fopen(fichier,"rb")))
	{
		printf("Erreur de fichier de cl‚ secrŠte: '%s'\n",fichier);
		exit(0);
	}
	fread(key,1,2823,in);	
	fclose(in);

	for(l=0,i=0;i<37;i++)
	{
		PK->S2[i]=key[l++];
		PK->T2[i]=key[l++];
		for(j=0;j<37;j++)
		{
			PK->IS1[i][j]=key[l++];
			PK->IT1[i][j]=key[l++];
		}
	}
	for(i=0;i<11;i++)
	{
		PK->delta[i] = key[l++];
	}

	init_table_flash(PK->M,/*PK->I,*/PK->M1/*,PK->M2,PK->M3*/);
}

void
Flash_load2_private_key(const unsigned char *sk, Flash_Complete_Key PK)
{
  int i,j,l;
    
  for(l=0,i=0;i<37;i++)
    {
      PK->S2[i]=sk[l++];
      PK->T2[i]=sk[l++];
      for(j=0;j<37;j++)
		{
		PK->IS1[i][j]=sk[l++];
		PK->IT1[i][j]=sk[l++];
		}
    }

  for(i=0;i<11;i++)
	{
	  PK->delta[i] = sk[l++];
	}
  
  init_table_flash(PK->M,PK->M1);
}
