/* Permute block for byteslice, write, and update checksum */
void write128(v16qu *in128, uint8_t* out8, int outlen,
	      v16qu *cksum, int cklen) {

#define X(i) in128[8*(i%2)+(i/2)]
  
  // Transpose matrix
#define INTERLEAVE(i,j)					     \
  do {							     \
    uint8x16x2_t c__ = vzipq_u8 (X(i), X(j));		     \
    X(i) = c__.val[0];					     \
    X(j) = c__.val[1];					     \
  } while(0)
  
  INTERLEAVE( 0,  8);
  INTERLEAVE( 1,  9);
  INTERLEAVE( 2, 10);
  INTERLEAVE( 3, 11);
  INTERLEAVE( 4, 12);
  INTERLEAVE( 5, 13);
  INTERLEAVE( 6, 14);
  INTERLEAVE( 7, 15);

  INTERLEAVE( 0,  4);
  INTERLEAVE( 1,  5);
  INTERLEAVE( 2,  6);
  INTERLEAVE( 3,  7);
  INTERLEAVE( 8, 12);
  INTERLEAVE( 9, 13);
  INTERLEAVE(10, 14);
  INTERLEAVE(11, 15);

  INTERLEAVE( 0,  2);
  INTERLEAVE( 1,  3);
  INTERLEAVE( 4,  6);
  INTERLEAVE( 5,  7);
  INTERLEAVE( 8, 10);
  INTERLEAVE( 9, 11);
  INTERLEAVE(12, 14);
  INTERLEAVE(13, 15);

  INTERLEAVE( 0,  1);
  INTERLEAVE( 2,  3);
  INTERLEAVE( 4,  5);
  INTERLEAVE( 6,  7);
  INTERLEAVE( 8,  9);
  INTERLEAVE(10, 11);
  INTERLEAVE(12, 13);
  INTERLEAVE(14, 15);

  // Write data
  if (out8) {
    switch (outlen) {
    case 16:
    neon_store(out8+16*15, X(15));
    case 15:
    neon_store(out8+16*14, X(14));
    case 14:
    neon_store(out8+16*13, X(13));
    case 13:
    neon_store(out8+16*12, X(12));
    case 12:
    neon_store(out8+16*11, X(11));
    case 11:
    neon_store(out8+16*10, X(10));
    case 10:
    neon_store(out8+16*9 , X(9 ));
    case 9:
    neon_store(out8+16*8 , X(8 ));
    case 8:
    neon_store(out8+16*7 , X(7 ));
    case 7:
    neon_store(out8+16*6 , X(6 ));
    case 6:
    neon_store(out8+16*5 , X(5 ));
    case 5:
    neon_store(out8+16*4 , X(4 ));
    case 4:
    neon_store(out8+16*3 , X(3 ));
    case 3:
    neon_store(out8+16*2 , X(2 ));
    case 2:
    neon_store(out8+16*1 , X(1 ));
    case 1:
    neon_store(out8+16*0 , X(0 ));
    case 0:
      ;
    }
  }

  // Update checksum
  if (cksum) {
    switch (cklen) {
    case 16:
      *cksum ^= X(15);
    case 15:
      *cksum ^= X(14);
    case 14:
      *cksum ^= X(13);
    case 13:
      *cksum ^= X(12);
    case 12:
      *cksum ^= X(11);
    case 11:
      *cksum ^= X(10);
    case 10:
      *cksum ^= X(9 );
    case 9:
      *cksum ^= X(8 );
    case 8:
      *cksum ^= X(7 );
    case 7:
      *cksum ^= X(6 );
    case 6:
      *cksum ^= X(5 );
    case 5:
      *cksum ^= X(4 );
    case 4:
      *cksum ^= X(3 );
    case 3:
      *cksum ^= X(2 );
    case 2:
      *cksum ^= X(1 );
    case 1:
      *cksum ^= X(0 );
    case 0:
      ;
    }
  }
#undef X
#undef INTERLEAVE  
}

/* Read block, permute for byteslice, and update checksum */
void read128(const uint8_t *in8, v16qu *out128, v16qu *cksum, int len) {
  // Read data
  register v16qu
    X0  = neon_load(in8+16*0 ),
    X1  = neon_load(in8+16*1 ),
    X2  = neon_load(in8+16*2 ),
    X3  = neon_load(in8+16*3 ),
    X4  = neon_load(in8+16*4 ),
    X5  = neon_load(in8+16*5 ),
    X6  = neon_load(in8+16*6 ),
    X7  = neon_load(in8+16*7 ),
    X8  = neon_load(in8+16*8 ),
    X9  = neon_load(in8+16*9 ),
    X10 = neon_load(in8+16*10),
    X11 = neon_load(in8+16*11),
    X12 = neon_load(in8+16*12),
    X13 = neon_load(in8+16*13),
    X14 = neon_load(in8+16*14),
    X15 = neon_load(in8+16*15);

#define X(i) X##i

  // Update checksum
  if (cksum) {
    switch (len) {
    case 16:
      *cksum ^= X(15);
    case 15:
      *cksum ^= X(14);
    case 14:
      *cksum ^= X(13);
    case 13:
      *cksum ^= X(12);
    case 12:
      *cksum ^= X(11);
    case 11:
      *cksum ^= X(10);
    case 10:
      *cksum ^= X(9 );
    case 9:
      *cksum ^= X(8 );
    case 8:
      *cksum ^= X(7 );
    case 7:
      *cksum ^= X(6 );
    case 6:
      *cksum ^= X(5 );
    case 5:
      *cksum ^= X(4 );
    case 4:
      *cksum ^= X(3 );
    case 3:
      *cksum ^= X(2 );
    case 2:
      *cksum ^= X(1 );
    case 1:
      *cksum ^= X(0 );
    case 0:
      ;
    }
  }
  
  // Transpose matrix
#define INTERLEAVE(i,j)					     \
  do {							     \
    uint8x16x2_t c__ = vzipq_u8 (X(i), X(j));		     \
    X(i) = c__.val[0];					     \
    X(j) = c__.val[1];					     \
  } while(0)
  

  INTERLEAVE( 0,  8);
  INTERLEAVE( 1,  9);
  INTERLEAVE( 2, 10);
  INTERLEAVE( 3, 11);
  INTERLEAVE( 4, 12);
  INTERLEAVE( 5, 13);
  INTERLEAVE( 6, 14);
  INTERLEAVE( 7, 15);

  INTERLEAVE( 0,  4);
  INTERLEAVE( 1,  5);
  INTERLEAVE( 2,  6);
  INTERLEAVE( 3,  7);
  INTERLEAVE( 8, 12);
  INTERLEAVE( 9, 13);
  INTERLEAVE(10, 14);
  INTERLEAVE(11, 15);

  INTERLEAVE( 0,  2);
  INTERLEAVE( 1,  3);
  INTERLEAVE( 4,  6);
  INTERLEAVE( 5,  7);
  INTERLEAVE( 8, 10);
  INTERLEAVE( 9, 11);
  INTERLEAVE(12, 14);
  INTERLEAVE(13, 15);

  INTERLEAVE( 0,  1);
  INTERLEAVE( 2,  3);
  INTERLEAVE( 4,  5);
  INTERLEAVE( 6,  7);
  INTERLEAVE( 8,  9);
  INTERLEAVE(10, 11);
  INTERLEAVE(12, 13);
  INTERLEAVE(14, 15);

  // Write data
  out128[0 ] = X(0 );
  out128[1 ] = X(2 );
  out128[2 ] = X(4 );
  out128[3 ] = X(6 );
  out128[4 ] = X(8 );
  out128[5 ] = X(10);
  out128[6 ] = X(12);
  out128[7 ] = X(14);
  out128[8 ] = X(1 );
  out128[9 ] = X(3 );
  out128[10] = X(5 );
  out128[11] = X(7 );
  out128[12] = X(9 );
  out128[13] = X(11);
  out128[14] = X(13);
  out128[15] = X(15);

#undef X
#undef INTERLEAVE
}

static void encrypt_tweakey (v16qu *restrict X, v16qu *restrict TK);
static void decrypt_tweakey (v16qu *restrict X, v16qu *restrict TK);

__attribute__((flatten)) void encrypt_bloc128(const unsigned char* in,
		     unsigned char *out, int outlen,
		     v16qu *tweakey,
		     v16qu* ck_r, int n_r,
		     v16qu* ck_w, int n_w) {
  v16qu data[16];
  read128(in, data, ck_r, n_r);
  encrypt_tweakey(data, tweakey);
  write128(data, out, outlen, ck_w, n_w);
}

__attribute__((flatten)) void decrypt_bloc128(const unsigned char* in,
	             unsigned char *out, int outlen,
		     v16qu *tweakey,
		     v16qu* ck_r, int n_r,
		     v16qu* ck_w, int n_w) {
  v16qu data[16];
  read128(in, data, ck_r, n_r);
  decrypt_tweakey(data, tweakey);
  write128(data, out, outlen, ck_w, n_w);
}
