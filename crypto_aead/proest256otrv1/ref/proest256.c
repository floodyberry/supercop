#include "proest256.h"

#define RORLANE(x,d) (((x >> (d&0x1f)) | (x << (8*PROEST_LANEBYTES-(d&0x1f)))) & 0xffffffff)
#define ROLLANE(x,d) (((x << (d&0x1f)) | (x >> (8*PROEST_LANEBYTES-(d&0x1f)))) & 0xffffffff)

void SubBits(proest_ctx *x)
{
  lane p,q;
  int i;

  for(i=0;i<4;i++)
  {
    p = x->a[i][0];
    q = x->a[i][1];

    x->a[i][0] = x->a[i][2] ^ (p & q);
    x->a[i][1] = x->a[i][3] ^ (q & x->a[i][2]);
    x->a[i][2] = p          ^ (x->a[i][0] & x->a[i][1]);
    x->a[i][3] = q          ^ (x->a[i][1] & x->a[i][2]);
  }
}

void MixColumns(proest_ctx *x)
{
  lane oldx[16];
  lane newx[16];

  oldx[ 0] = x->a[0][0];
  oldx[ 1] = x->a[0][1];
  oldx[ 2] = x->a[0][2];
  oldx[ 3] = x->a[0][3];
  oldx[ 4] = x->a[1][0];
  oldx[ 5] = x->a[1][1];
  oldx[ 6] = x->a[1][2];
  oldx[ 7] = x->a[1][3];
  oldx[ 8] = x->a[2][0];
  oldx[ 9] = x->a[2][1];
  oldx[10] = x->a[2][2];
  oldx[11] = x->a[2][3];
  oldx[12] = x->a[3][0];
  oldx[13] = x->a[3][1];
  oldx[14] = x->a[3][2];
  oldx[15] = x->a[3][3];

/* Multiply by MDS Matrix */
/*1000100100101011*/
  newx[ 0] = oldx[ 0] ^ oldx[ 4] ^ oldx[ 7] ^ oldx[10] ^ oldx[12] ^ oldx[14] ^ oldx[15];
/*0100100000011001*/
  newx[ 1] = oldx[ 1] ^ oldx[ 4] ^ oldx[11] ^ oldx[12] ^ oldx[15];
/*0010010011001000*/
  newx[ 2] = oldx[ 2] ^ oldx[ 5] ^ oldx[ 8] ^ oldx[ 9] ^ oldx[12];
/*0001001001100100*/
  newx[ 3] = oldx[ 3] ^ oldx[ 6] ^ oldx[ 9] ^ oldx[10] ^ oldx[13];
/*1001100010110010*/
  newx[ 4] = oldx[ 0] ^ oldx[ 3] ^ oldx[ 4] ^ oldx[ 8] ^ oldx[10] ^ oldx[11] ^ oldx[14];
/*1000010010010001*/
  newx[ 5] = oldx[ 0] ^ oldx[ 5] ^ oldx[ 8] ^ oldx[11] ^ oldx[15];
/*0100001010001100*/
  newx[ 6] = oldx[ 1] ^ oldx[ 6] ^ oldx[ 8] ^ oldx[12] ^ oldx[13];
/*0010000101000110*/
  newx[ 7] = oldx[ 2] ^ oldx[ 7] ^ oldx[ 9] ^ oldx[13] ^ oldx[14];
/*0010101110001001*/
  newx[ 8] = oldx[ 2] ^ oldx[ 4] ^ oldx[ 6] ^ oldx[ 7] ^ oldx[ 8] ^ oldx[12] ^ oldx[15];
/*0001100101001000*/
  newx[ 9] = oldx[ 3] ^ oldx[ 4] ^ oldx[ 7] ^ oldx[ 9] ^ oldx[12];
/*1100100000100100*/
  newx[10] = oldx[ 0] ^ oldx[ 1] ^ oldx[ 4] ^ oldx[10] ^ oldx[13];
/*0110010000010010*/
  newx[11] = oldx[ 1] ^ oldx[ 2] ^ oldx[ 5] ^ oldx[11] ^ oldx[14];
/*1011001010011000*/
  newx[12] = oldx[ 0] ^ oldx[ 2] ^ oldx[ 3] ^ oldx[ 6] ^ oldx[ 8] ^ oldx[11] ^ oldx[12];
/*1001000110000100*/
  newx[13] = oldx[ 0] ^ oldx[ 3] ^ oldx[ 7] ^ oldx[ 8] ^ oldx[13];
/*1000110001000010*/
  newx[14] = oldx[ 0] ^ oldx[ 4] ^ oldx[ 5] ^ oldx[ 9] ^ oldx[14];
/*0100011000100001*/
  newx[15] = oldx[ 1] ^ oldx[ 5] ^ oldx[ 6] ^ oldx[10] ^ oldx[15];

  x->a[0][0] = newx[ 0];;
  x->a[0][1] = newx[ 1];;
  x->a[0][2] = newx[ 2];;
  x->a[0][3] = newx[ 3];;
  x->a[1][0] = newx[ 4];;
  x->a[1][1] = newx[ 5];;
  x->a[1][2] = newx[ 6];;
  x->a[1][3] = newx[ 7];;
  x->a[2][0] = newx[ 8];;
  x->a[2][1] = newx[ 9];;
  x->a[2][2] = newx[10];;
  x->a[2][3] = newx[11];;
  x->a[3][0] = newx[12];;
  x->a[3][1] = newx[13];;
  x->a[3][2] = newx[14];;
  x->a[3][3] = newx[15];;
}

void ShiftRegisters(proest_ctx *x, int round)
{	
  if(!(round & 1)) // even rounds
  {
    x->a[1][0] = RORLANE(x->a[1][0],4);
    x->a[1][1] = RORLANE(x->a[1][1],4);
    x->a[1][2] = RORLANE(x->a[1][2],4);
    x->a[1][3] = RORLANE(x->a[1][3],4);

    x->a[2][0] = RORLANE(x->a[2][0],12);
    x->a[2][1] = RORLANE(x->a[2][1],12);
    x->a[2][2] = RORLANE(x->a[2][2],12);
    x->a[2][3] = RORLANE(x->a[2][3],12);

    x->a[3][0] = RORLANE(x->a[3][0],26);
    x->a[3][1] = RORLANE(x->a[3][1],26);
    x->a[3][2] = RORLANE(x->a[3][2],26);
    x->a[3][3] = RORLANE(x->a[3][3],26);
  }
  else
  {
	x->a[0][0] = RORLANE(x->a[0][0],1);
    x->a[0][1] = RORLANE(x->a[0][1],1);
    x->a[0][2] = RORLANE(x->a[0][2],1);
    x->a[0][3] = RORLANE(x->a[0][3],1);
    
    x->a[1][0] = RORLANE(x->a[1][0],24);
    x->a[1][1] = RORLANE(x->a[1][1],24);
    x->a[1][2] = RORLANE(x->a[1][2],24);
    x->a[1][3] = RORLANE(x->a[1][3],24);

    x->a[2][0] = RORLANE(x->a[2][0],26);
    x->a[2][1] = RORLANE(x->a[2][1],26);
    x->a[2][2] = RORLANE(x->a[2][2],26);
    x->a[2][3] = RORLANE(x->a[2][3],26);

    x->a[3][0] = RORLANE(x->a[3][0],31);
    x->a[3][1] = RORLANE(x->a[3][1],31);
    x->a[3][2] = RORLANE(x->a[3][2],31);
    x->a[3][3] = RORLANE(x->a[3][3],31);
  }
}

void ShiftRegistersInverse(proest_ctx *x, int round)
{	
  if(!(round & 1)) // even rounds
  {
    x->a[1][0] = ROLLANE(x->a[1][0],4);
    x->a[1][1] = ROLLANE(x->a[1][1],4);
    x->a[1][2] = ROLLANE(x->a[1][2],4);
    x->a[1][3] = ROLLANE(x->a[1][3],4);

    x->a[2][0] = ROLLANE(x->a[2][0],12);
    x->a[2][1] = ROLLANE(x->a[2][1],12);
    x->a[2][2] = ROLLANE(x->a[2][2],12);
    x->a[2][3] = ROLLANE(x->a[2][3],12);

    x->a[3][0] = ROLLANE(x->a[3][0],26);
    x->a[3][1] = ROLLANE(x->a[3][1],26);
    x->a[3][2] = ROLLANE(x->a[3][2],26);
    x->a[3][3] = ROLLANE(x->a[3][3],26);
  }
  else
  {
	x->a[0][0] = ROLLANE(x->a[0][0],1);
    x->a[0][1] = ROLLANE(x->a[0][1],1);
    x->a[0][2] = ROLLANE(x->a[0][2],1);
    x->a[0][3] = ROLLANE(x->a[0][3],1);
    
    x->a[1][0] = ROLLANE(x->a[1][0],24);
    x->a[1][1] = ROLLANE(x->a[1][1],24);
    x->a[1][2] = ROLLANE(x->a[1][2],24);
    x->a[1][3] = ROLLANE(x->a[1][3],24);

    x->a[2][0] = ROLLANE(x->a[2][0],26);
    x->a[2][1] = ROLLANE(x->a[2][1],26);
    x->a[2][2] = ROLLANE(x->a[2][2],26);
    x->a[2][3] = ROLLANE(x->a[2][3],26);

    x->a[3][0] = ROLLANE(x->a[3][0],31);
    x->a[3][1] = ROLLANE(x->a[3][1],31);
    x->a[3][2] = ROLLANE(x->a[3][2],31);
    x->a[3][3] = ROLLANE(x->a[3][3],31);
  }
}

void AddConstant(proest_ctx *x, int round)
{
  lane c1 = 0x75817b9d;
  lane c2 = 0xb2c5fef0;

  x->a[0][0] ^= ROLLANE(c1,((round+0)));
  x->a[0][1] ^= ROLLANE(c2,((round+1)));
  x->a[0][2] ^= ROLLANE(c1,((round+2)));
  x->a[0][3] ^= ROLLANE(c2,((round+3)));
  x->a[1][0] ^= ROLLANE(c1,((round+4)));
  x->a[1][1] ^= ROLLANE(c2,((round+5)));
  x->a[1][2] ^= ROLLANE(c1,((round+6)));
  x->a[1][3] ^= ROLLANE(c2,((round+7)));
  x->a[2][0] ^= ROLLANE(c1,((round+8)));
  x->a[2][1] ^= ROLLANE(c2,((round+9)));
  x->a[2][2] ^= ROLLANE(c1,((round+10)));
  x->a[2][3] ^= ROLLANE(c2,((round+11)));
  x->a[3][0] ^= ROLLANE(c1,((round+12)));
  x->a[3][1] ^= ROLLANE(c2,((round+13)));
  x->a[3][2] ^= ROLLANE(c1,((round+14)));
  x->a[3][3] ^= ROLLANE(c2,((round+15)));
}

void proest_readstate(proest_ctx *r, const unsigned char in[PROEST_ROWS*PROEST_COLUMNS*PROEST_LANEBYTES])
{  
  r->a[0][0] = in[ 0] | ((uint32_t)in[ 1] << 8) | ((uint32_t)in[ 2] << 16) | ((uint32_t)in[ 3] << 24);
  r->a[0][1] = in[ 4] | ((uint32_t)in[ 5] << 8) | ((uint32_t)in[ 6] << 16) | ((uint32_t)in[ 7] << 24);
  r->a[0][2] = in[ 8] | ((uint32_t)in[ 9] << 8) | ((uint32_t)in[10] << 16) | ((uint32_t)in[11] << 24);
  r->a[0][3] = in[12] | ((uint32_t)in[13] << 8) | ((uint32_t)in[14] << 16) | ((uint32_t)in[15] << 24);
  r->a[1][0] = in[16] | ((uint32_t)in[17] << 8) | ((uint32_t)in[18] << 16) | ((uint32_t)in[19] << 24);
  r->a[1][1] = in[20] | ((uint32_t)in[21] << 8) | ((uint32_t)in[22] << 16) | ((uint32_t)in[23] << 24);
  r->a[1][2] = in[24] | ((uint32_t)in[25] << 8) | ((uint32_t)in[26] << 16) | ((uint32_t)in[27] << 24);
  r->a[1][3] = in[28] | ((uint32_t)in[29] << 8) | ((uint32_t)in[30] << 16) | ((uint32_t)in[31] << 24);
  r->a[2][0] = in[32] | ((uint32_t)in[33] << 8) | ((uint32_t)in[34] << 16) | ((uint32_t)in[35] << 24);
  r->a[2][1] = in[36] | ((uint32_t)in[37] << 8) | ((uint32_t)in[38] << 16) | ((uint32_t)in[39] << 24);
  r->a[2][2] = in[40] | ((uint32_t)in[41] << 8) | ((uint32_t)in[42] << 16) | ((uint32_t)in[43] << 24);
  r->a[2][3] = in[44] | ((uint32_t)in[45] << 8) | ((uint32_t)in[46] << 16) | ((uint32_t)in[47] << 24);
  r->a[3][0] = in[48] | ((uint32_t)in[49] << 8) | ((uint32_t)in[50] << 16) | ((uint32_t)in[51] << 24);
  r->a[3][1] = in[52] | ((uint32_t)in[53] << 8) | ((uint32_t)in[54] << 16) | ((uint32_t)in[55] << 24);
  r->a[3][2] = in[56] | ((uint32_t)in[57] << 8) | ((uint32_t)in[58] << 16) | ((uint32_t)in[59] << 24);
  r->a[3][3] = in[60] | ((uint32_t)in[61] << 8) | ((uint32_t)in[62] << 16) | ((uint32_t)in[63] << 24);
}

void proest_writestate(unsigned char out[PROEST_ROWS*PROEST_COLUMNS*PROEST_LANEBYTES], const proest_ctx *x)
{
  out[ 0] =  x->a[0][0] & 0xff;
  out[ 1] = (x->a[0][0] >>  8) & 0xff;
  out[ 2] = (x->a[0][0] >> 16) & 0xff;
  out[ 3] =  x->a[0][0] >> 24;
  out[ 4] =  x->a[0][1] & 0xff;
  out[ 5] = (x->a[0][1] >>  8) & 0xff;
  out[ 6] = (x->a[0][1] >> 16) & 0xff;
  out[ 7] =  x->a[0][1] >> 24;
  out[ 8] =  x->a[0][2] & 0xff;
  out[ 9] = (x->a[0][2] >>  8) & 0xff;
  out[10] = (x->a[0][2] >> 16) & 0xff;
  out[11] =  x->a[0][2] >> 24;
  out[12] =  x->a[0][3] & 0xff;
  out[13] = (x->a[0][3] >>  8) & 0xff;
  out[14] = (x->a[0][3] >> 16) & 0xff;
  out[15] =  x->a[0][3] >> 24;
  out[16] =  x->a[1][0] & 0xff;
  out[17] = (x->a[1][0] >>  8) & 0xff;
  out[18] = (x->a[1][0] >> 16) & 0xff;
  out[19] =  x->a[1][0] >> 24;
  out[20] =  x->a[1][1] & 0xff;
  out[21] = (x->a[1][1] >>  8) & 0xff;
  out[22] = (x->a[1][1] >> 16) & 0xff;
  out[23] =  x->a[1][1] >> 24;
  out[24] =  x->a[1][2] & 0xff;
  out[25] = (x->a[1][2] >>  8) & 0xff;
  out[26] = (x->a[1][2] >> 16) & 0xff;
  out[27] =  x->a[1][2] >> 24;
  out[28] =  x->a[1][3] & 0xff;
  out[29] = (x->a[1][3] >>  8) & 0xff;
  out[30] = (x->a[1][3] >> 16) & 0xff;
  out[31] =  x->a[1][3] >> 24;
  out[32] =  x->a[2][0] & 0xff;
  out[33] = (x->a[2][0] >>  8) & 0xff;
  out[34] = (x->a[2][0] >> 16) & 0xff;
  out[35] =  x->a[2][0] >> 24;
  out[36] =  x->a[2][1] & 0xff;
  out[37] = (x->a[2][1] >>  8) & 0xff;
  out[38] = (x->a[2][1] >> 16) & 0xff;
  out[39] =  x->a[2][1] >> 24;
  out[40] =  x->a[2][2] & 0xff;
  out[41] = (x->a[2][2] >>  8) & 0xff;
  out[42] = (x->a[2][2] >> 16) & 0xff;
  out[43] =  x->a[2][2] >> 24;
  out[44] =  x->a[2][3] & 0xff;
  out[45] = (x->a[2][3] >>  8) & 0xff;
  out[46] = (x->a[2][3] >> 16) & 0xff;
  out[47] =  x->a[2][3] >> 24;
  out[48] =  x->a[3][0] & 0xff;
  out[49] = (x->a[3][0] >>  8) & 0xff;
  out[50] = (x->a[3][0] >> 16) & 0xff;
  out[51] =  x->a[3][0] >> 24;
  out[52] =  x->a[3][1] & 0xff;
  out[53] = (x->a[3][1] >>  8) & 0xff;
  out[54] = (x->a[3][1] >> 16) & 0xff;
  out[55] =  x->a[3][1] >> 24;
  out[56] =  x->a[3][2] & 0xff;
  out[57] = (x->a[3][2] >>  8) & 0xff;
  out[58] = (x->a[3][2] >> 16) & 0xff;
  out[59] =  x->a[3][2] >> 24;
  out[60] =  x->a[3][3] & 0xff;
  out[61] = (x->a[3][3] >>  8) & 0xff;
  out[62] = (x->a[3][3] >> 16) & 0xff;
  out[63] =  x->a[3][3] >> 24;
}

void proest_permute(proest_ctx *x)
{
  int round;

  for(round=0;round<PROEST_NROUNDS;round++)
  {
    SubBits(x);
    MixColumns(x);
    ShiftRegisters(x,round);
    AddConstant(x,round);
  }
}

void proest_inverse_permute(proest_ctx *x) {
	int round;
	
	for (round = PROEST_NROUNDS-1; round >= 0; --round) {
		AddConstant(x, round);
		ShiftRegistersInverse(x, round);
		MixColumns(x);
		SubBits(x);
	}
}

