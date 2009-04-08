#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <string.h>

#include "pi.h"
#include "fsb.h"
#include "Whirlpool.h"

/* parameters of FSB, hardcoded for each output length */
#define NUMBER_OF_PARAMETERS 6
const int parameters[NUMBER_OF_PARAMETERS][5] = {
  /*
   * parameters of FSB in order:
   * {hashbitlen, n, w, r, p}
   */
  {48, 3<<17, 24, 192, 197},
  {160, 5<<18, 80, 640, 653},
  {224, 7<<18, 112, 896, 907},
  {256, 1<<21, 1<<7, 1<<10, 1061},
  {384, 23<<16, 184, 1472, 1483},
  {512, 31<<16, 248, 1984, 1987}
};

HashReturn Init(hashState * state, int hashbitlen) {
  int i,j,k,l;
  const unsigned char* Pi_line;

  // HASHLEN overrides hashbitlen
#ifdef HASHLEN
  hashbitlen = HASHLEN;
#endif
  for (i=0; i<NUMBER_OF_PARAMETERS; i++) {
    if (hashbitlen == parameters[i][0]) {
      state->n = parameters[i][1];
      state->w = parameters[i][2];
      state->r = parameters[i][3];
      state->p = parameters[i][4];
      state->b = state->n/state->r;
      state->bpc = logarithm(state->n/state->w);
      state->inputsize = state->w*state->bpc-state->r;
      state->bfiv = state->r/state->w;
      state->bfm = state->inputsize/state->w;
      state->hashbitlen = hashbitlen;
      state->databitlen = 0;

      /* 
       * Uncomment this to display the various parameters of FSB before hashing.
       * Useful only if you want to create your very own set of parameters!
       *
       * printf("n=%u w=%u r=%u p=%u b=%u bpc=%u input=%u bfiv=%u bfm=%u\n",state->n, state->w, state->r, state->p, state->b, state->bpc, state->inputsize, state->bfiv, state->bfm);
       */

      /* compute the first QC matrix line */
      state->first_line = (unsigned char***) malloc(state->b*sizeof(unsigned char**));
      for (k=0; k<state->b; k++) {
	state->first_line[k] = (unsigned char**) malloc(8*sizeof(unsigned char*));
	state->first_line[k][0] = (unsigned char*) calloc(((state->p+state->r)>>3)+1,1);
	Pi_line = &(Pi[k*((state->p>>3)+1)]);
	for (j=0; j<(state->p>>3); j++) {
	  state->first_line[k][0][(state->r>>3)+j] = Pi_line[j];
	}
	state->first_line[k][0][(state->p+state->r)>>3] = Pi_line[state->p>>3]&(((1<<(state->p&7))-1)<<(8-(state->p&7)));
	for (j=0; j<(state->r>>3); j++) {
	  state->first_line[k][0][j] = state->first_line[k][0][(state->p>>3)+j]<<(state->p&7);
	  state->first_line[k][0][j] ^= state->first_line[k][0][(state->p>>3)+j+1]>>(8-(state->p&7));
	}
	for (j=1; j<8; j++) {
  	  state->first_line[k][j] = (unsigned char*) calloc(((state->p+state->r)>>3)+1,1);
  	  for (l=0; l<(state->p+state->r)>>3; l++) {
  	    state->first_line[k][j][l] ^= state->first_line[k][0][l] >> j;
  	    state->first_line[k][j][l+1] ^= state->first_line[k][0][l] << (8-j);
  	  }
	}	
      }

      state->syndrome = (unsigned char*) calloc(LUI(state->r),sizeof(unsigned int));
      state->new_syndrome = (unsigned int*) calloc(LUI(state->r),sizeof(unsigned int));
      // one more byte because of computeIndex
      state->buffer = (unsigned char*) malloc((state->inputsize>>3)+1);
      state->count = 0;
      return SUCCESS;
    }
  }
  return BAD_HASHBITLEN;
}

HashReturn Update(hashState * state, const BitSequence *data, DataLength databitlen) {
  int tmp,i;
  unsigned char remaining;
  if (databitlen == 0) {
    return SUCCESS;
  }
  /* we check if this Update will fill one buffer */
  if(databitlen + state->count < state->inputsize) {
    /* we simply need to copy data to the buffer. Either it is aligned or not. */
    if((state->count & 7) == 0) {
      memcpy(&(state->buffer[state->count>>3]), data, ((databitlen-1)>>3) + 1);
      state->databitlen += databitlen;
      state->count += databitlen;
      return SUCCESS;
    } else {
      state->buffer[state->count>>3] ^= state->buffer[state->count>>3] & ((1<<(8-(state->count&7)))-1);
      for (i=0; i<=(databitlen>>3); i++) {
	state->buffer[(state->count>>3)+i] ^= data[i]>>(state->count&7);
	state->buffer[(state->count>>3)+i+1] = data[i]<<(8-(state->count&7));
      }
      state->databitlen += databitlen;
      state->count += databitlen;
      return SUCCESS;
    }
  } else {
    /* we fill up the buffer, perform a hash and recursively call Update */
    if((state->count & 7) == 0) {
      tmp = state->inputsize - state->count;
      memcpy(&(state->buffer[state->count>>3]), data, tmp>>3);
      state->databitlen += tmp;
      state->count += tmp;
      performHash(state);
      return Update(state, &(data[tmp>>3]), databitlen-tmp);
    } else {
      /* tmp contains the number of bits we have to read to fill up the buffer */
      tmp = state->inputsize - state->count;
      state->buffer[state->count>>3] ^= state->buffer[state->count>>3] & ((1<<(8-(state->count&7)))-1);
      for (i=0; i<(tmp>>3); i++) {
	state->buffer[(state->count>>3)+i] ^= data[i]>>(state->count&7);
	state->buffer[(state->count>>3)+i+1] = data[i]<<(8-(state->count&7));
      }
      state->buffer[(state->inputsize>>3)-1] ^= data[tmp>>3]>>(state->count&7);
      /* perform this round's hash */
      state->databitlen += tmp;
      state->count += tmp;
      performHash(state);
      /* we check if there are still some bits to input */
      if (databitlen > tmp) {
	/* we check if these bits are stored in more than the end of the byte data[tmp>>3] already read */
	if (databitlen > (((tmp>>3)+1)<<3)) {
	  /* we first re-input the remaining bits in data[tmp>>3] then perform the recursive call */
	  remaining = data[tmp>>3] << (tmp&7) ;
	  Update(state, &remaining, 8-(tmp&7));
	  return Update(state, &(data[tmp>>3]), databitlen-(((tmp>>3)+1)<<3));
	} else {
	  /* we simply input the remaining bits of data[tmp>>3] */
	  remaining = data[tmp>>3] << (tmp&7) ;
	  return Update(state, &remaining, databitlen - tmp);	  
	}
      } else {
	return SUCCESS;
      }
    }
  }
}

HashReturn Final(hashState * state, BitSequence *hashval) {
  unsigned char* padding, *whirlOutput;
  int i,j;
  struct NESSIEstruct * whirlpoolState;
  DataLength databitlen = state->databitlen;
  if (state->count+65 > state->inputsize) {
    padding = (unsigned char*) calloc(state->inputsize>>3,1);
    padding[0] = 1<<7;
    Update(state,padding,state->inputsize-state->count);
    padding[0] = 0;
    for (i=0; i<8; i++) {
      padding[(state->inputsize>>3)-1-i] = (unsigned char) (databitlen>>(8*i));
    }
    Update(state,padding,state->inputsize);
  } else {
    padding = (unsigned char*) calloc(((state->inputsize-state->count)>>3)+1,1);
    padding[0] = 1<<7;
    Update(state,padding,state->inputsize-state->count-64);
    for (i=0; i<8; i++) {
      padding[7-i] = (unsigned char) (databitlen>>(8*i)) ;
    }
    Update(state,padding,64);
  }
  free(padding);

  /* The final round of FSB is finished, now we simply apply the final transform: Whirlpool */
  whirlpoolState = (struct NESSIEstruct *) malloc(sizeof(struct NESSIEstruct));
  whirlOutput = (unsigned char*) malloc(64);
  NESSIEinit(whirlpoolState);
  
  NESSIEadd(state->syndrome,state->r,whirlpoolState);
  NESSIEfinalize(whirlpoolState, whirlOutput);
  
  for(i=0; i<(state->hashbitlen>>3); i++) {
    hashval[i] = whirlOutput[i];
  }

  /*
   * Now we also have to free all the memory allocated during Init
   */
  free(whirlOutput);
  free(whirlpoolState);
  for (i=0; i<state->b; i++) {
    for (j=0; j<8; j++) {
      free(state->first_line[i][j]);
    }
    free(state->first_line[i]);
  }
  free(state->first_line);
  free(state->syndrome);
  free(state->new_syndrome);
  free(state->buffer);
  return SUCCESS;
}

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval) {
  hashState* state = (hashState*) malloc(sizeof(hashState));
  HashReturn return_value;
  return_value = Init(state, hashbitlen);
  if (return_value != SUCCESS) {
    return return_value;
  }
  return_value = Update(state, data, databitlen);
  if (return_value != SUCCESS) {
    return return_value;
  }
  return_value = Final(state, hashval);
  free(state);
  return return_value;  
}

HashReturn HashFile(int hashbitlen, FILE* file_to_hash, BitSequence* hashval) {
  int size;
  HashReturn return_value;

  hashState* state = (hashState*) malloc(sizeof(hashState));
  unsigned char* buffer = (unsigned char*) malloc(4096*sizeof(unsigned char));

  return_value = Init(state, hashbitlen);
  if (return_value != SUCCESS) {
    return return_value;
  }
  
  while (!feof(file_to_hash)) {
    size = fread(buffer, 1, 4096, file_to_hash);
    return_value = Update(state, buffer, size<<3);
    if (return_value != SUCCESS) {
      return return_value;
    }
  }
  free(buffer);
  
  return_value = Final(state, hashval);
  free(state);

  return return_value;
}

void printHash(BitSequence* hashval, int hashbitlen) {
  int i;
  // HASHLEN overrides hashbitlen
#ifdef HASHLEN
  hashbitlen = HASHLEN;
#endif
  for (i=0; i<hashbitlen; i+=8) {
    printf("%.2x",(unsigned int) (hashval[i>>3]));
  }
}

unsigned int * computeIndex(hashState * state, int i) {
  int bidx, j, l, index;
  unsigned int * temp;

  index = i<<state->bpc;
  index ^= state->syndrome[i];

  j = (i * state->bfm) >> 3;
  l = 16 - state->bfm - ((i * state->bfm) & 7);
  // one more (useless) byte has been allocated to in state->buffer to make sure we
  // can access to state->buffer[j+1]
  index ^= ((((state->buffer[j]<<8) ^ state->buffer[j+1]) >> l)
	    & ((1 << state->bfm) - 1)) << 8;

  bidx = index/state->r; /* index of the vector */
  index = index - bidx*state->r; /* shift to perform on the vector */

  /* we have finished computing the vector index and shift, now we XOR it! */
  temp = (unsigned int*) &(state->first_line[bidx][index&7][state->w-(index>>3)]);
  return temp;
}

unsigned int * computeIndex512(hashState * state, int i) {
  int bidx, j, l, index;
  unsigned int * temp;

  index = i<<13;
  index ^= state->syndrome[i];

  j = (i * 5) >> 3;
  l = 16 - 5 - ((i * 5) & 7);
  // one more (useless) byte has been allocated to in state->buffer to make sure we
  // can access to state->buffer[j+1]
  index ^= ((((state->buffer[j]<<8) ^ state->buffer[j+1]) >> l)
	    & ((1 << 5) - 1)) << 8;

  bidx = index/1984; /* index of the vector */
  index = index - bidx*1984; /* shift to perform on the vector */

  /* we have finished computing the vector index and shift, now we XOR it! */
  temp = (unsigned int*) &(state->first_line[bidx][index&7][248-(index>>3)]);
  return temp;
}

unsigned int * computeIndex256(hashState * state, int i) {
  int bidx, j, l, index;
  unsigned int * temp;

  index = i<<14;
  index ^= state->syndrome[i];

  j = (i * 6) >> 3;
  l = 16 - 6 - ((i * 6) & 7);
  // one more (useless) byte has been allocated to in state->buffer to make sure we
  // can access to state->buffer[j+1]
  index ^= ((((state->buffer[j]<<8) ^ state->buffer[j+1]) >> l)
	    & ((1 << 6) - 1)) << 8;

  bidx = index/1024; /* index of the vector */
  index = index - bidx*1024; /* shift to perform on the vector */

  /* we have finished computing the vector index and shift, now we XOR it! */
  temp = (unsigned int*) &(state->first_line[bidx][index&7][128-(index>>3)]);
  return temp;
}

#if HASHLEN == 256
void performHash(hashState * state) {
  int i,j;
  unsigned int * temp, * temp1;

#define NB_ITER 32

  for (i=0; i<NB_ITER; i++) {
    state->new_syndrome[i] = 0;
  }

  temp = computeIndex256(state, 0);

  for (i=1; i<128; i++) {
    temp1 = computeIndex256(state, i);

    for (j=NB_ITER-1; j>=0; j--) {
      state->new_syndrome[j] ^= temp[j];
    }
    temp = temp1;
  }
  for (j=NB_ITER-1; j>=0; j--) {
    state->new_syndrome[j] ^= temp[j];
  }
  temp = state->new_syndrome;
  state->new_syndrome = (unsigned int*) state->syndrome;
  state->syndrome = (unsigned char*) temp;
  state->count = 0;
}
#else
#if HASHLEN == 512
void performHash(hashState * state) {
  int i,j;
  unsigned int * temp, * temp1;

#define NB_ITER 62

  for (i=0; i<NB_ITER; i++) {
    state->new_syndrome[i] = 0;
  }

  temp = computeIndex512(state, 0);

  for (i=1; i<248; i++) {
    temp1 = computeIndex512(state, i);

    for (j=NB_ITER-1; j>=0; j--) {
      state->new_syndrome[j] ^= temp[j];
    }
    temp = temp1;
  }
  for (j=NB_ITER-1; j>=0; j--) {
    state->new_syndrome[j] ^= temp[j];
  }
  temp = state->new_syndrome;
  state->new_syndrome = (unsigned int*) state->syndrome;
  state->syndrome = (unsigned char*) temp;
  state->count = 0;
}
#else
void performHash(hashState * state) {
  int i,j;
  unsigned int * temp, * temp1;

#ifdef HASHLEN
#define NB_ITER LUI(WEIGHT<<3)
#else
#define NB_ITER LUI(state->r)
#endif

  for (i=0; i<NB_ITER; i++) {
    state->new_syndrome[i] = 0;
  }

  temp = computeIndex(state, 0);

  for (i=1; i<state->w; i++) {
    temp1 = computeIndex(state, i);

    for (j=NB_ITER-1; j>=0; j--) {
      state->new_syndrome[j] ^= temp[j];
    }
    temp = temp1;
  }
  for (j=NB_ITER-1; j>=0; j--) {
    state->new_syndrome[j] ^= temp[j];
  }
  temp = state->new_syndrome;
  state->new_syndrome = (unsigned int*) state->syndrome;
  state->syndrome = (unsigned char*) temp;
  state->count = 0;
}
#endif
#endif

void printBuffer(hashState * state) {
  int i;
  printf("[%u] ", state->count);
  for (i=0; i<(state->count>>3); i++) {
    printf("%.2x",state->buffer[i]);
  }
  if ((state->count&7) != 0) {
    printf("%.2x",state->buffer[state->count>>3]);
  }
  printf("\n");
}

unsigned int logarithm(unsigned int a) {
  int i;
  for (i=0; i<32; i++) {
    if (a == (1<<i)) {
      return i;
    }
  }
  fprintf(stderr,"Error: bad parameters, log %u does not exists.\n",a);
  return -1;
}
