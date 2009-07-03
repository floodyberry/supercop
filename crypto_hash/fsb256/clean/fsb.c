/* Author: Peter Schwabe, based on the ebash reference implementation
 * 2009-06-02
 */

#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>

#include "fsb.h"
#include "Whirlpool.h"

extern unsigned char fsb256_first_line [4276224];
extern void performHash256(hashState * state);

HashReturn Init(hashState * state, int hashbitlen) {
  
  if (hashbitlen != FSB256_HASHBITLEN)
    return BAD_HASHBITLEN;

  state->nbitshashed= 0;
  state->syndrome     = (unsigned char *) malloc(LULL(FSB256_R) * sizeof(unsigned long long));
  memset(state->syndrome, 0, LULL(FSB256_R) * sizeof(unsigned long long));

  state->new_syndrome = (unsigned long long *) malloc(LULL(FSB256_R) * sizeof(unsigned long long));
  // one more byte because of computeIndex
  state->buffer = (unsigned char*) malloc((FSB256_INPUTSIZE>>3)+1);
  state->bufbits = 0;

  return SUCCESS;
}

HashReturn Update(hashState * state, const unsigned char *data, unsigned long long databitlen) {
  int tmp,i;
  unsigned char remaining;
  if (databitlen == 0) {
    return SUCCESS;
  }
  /* we check if this Update will fill one buffer */
  if(databitlen + state->bufbits < FSB256_INPUTSIZE) 
  {
    /* we simply need to copy data to the buffer. Either it is aligned or not. */
    if((state->bufbits & 7) == 0) {
      memcpy(&(state->buffer[state->bufbits>>3]), data, ((databitlen-1)>>3) + 1);
      state->nbitshashed+= databitlen;
      state->bufbits += databitlen;
      return SUCCESS;
    } 
    else 
    {
      state->buffer[state->bufbits>>3] ^= state->buffer[state->bufbits>>3] & ((1<<(8-(state->bufbits&7)))-1);
      for (i=0; i<=(databitlen>>3); i++) 
      {
        state->buffer[(state->bufbits>>3)+i] ^= data[i]>>(state->bufbits&7);
        state->buffer[(state->bufbits>>3)+i+1] = data[i]<<(8-(state->bufbits&7));
      }
      state->nbitshashed += databitlen;
      state->bufbits+= databitlen;
      return SUCCESS;
    }
  } 
  else 
  {
    /* we fill up the buffer, perform a hash and recursively call Update */
    if((state->bufbits& 7) == 0) {
      tmp = FSB256_INPUTSIZE - state->bufbits;
      memcpy(&(state->buffer[state->bufbits>>3]), data, tmp>>3);
      state->nbitshashed += tmp;
      state->bufbits += tmp;
      performHash256(state);
      //performHash(state);

      return Update(state, &(data[tmp>>3]), databitlen-tmp);
    } 
    else 
    {
      /* tmp contains the number of bits we have to read to fill up the buffer */
      tmp = FSB256_INPUTSIZE - state->bufbits;
      state->buffer[state->bufbits>>3] ^= state->buffer[state->bufbits>>3] & ((1<<(8-(state->bufbits&7)))-1);
      for (i=0; i<(tmp>>3); i++) 
      {
        state->buffer[(state->bufbits>>3)+i] ^= data[i]>>(state->bufbits&7);
        state->buffer[(state->bufbits>>3)+i+1] = data[i]<<(8-(state->bufbits&7));
      }
      state->buffer[(FSB256_INPUTSIZE>>3)-1] ^= data[tmp>>3]>>(state->bufbits&7);
      /* perform this round's hash */
      state->nbitshashed += tmp;
      state->bufbits += tmp;
      performHash256(state);
      //performHash(state);

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
      } 
      else 
      {
        return SUCCESS;
      }
    }
  }
}

HashReturn Final(hashState * state, unsigned char *hashval) {
  unsigned char* padding, *whirlOutput;
  int i;
  struct NESSIEstruct * whirlpoolState;
  unsigned long long databitlen = state->nbitshashed;
  if (state->bufbits+65 > FSB256_INPUTSIZE) {
    padding = (unsigned char*) calloc(FSB256_INPUTSIZE>>3,1);
    padding[0] = 1<<7;
    Update(state,padding,FSB256_INPUTSIZE-state->bufbits);
    padding[0] = 0;
    for (i=0; i<8; i++) {
      padding[(FSB256_INPUTSIZE>>3)-1-i] = (unsigned char) (databitlen>>(8*i));
    }
    Update(state,padding,FSB256_INPUTSIZE);
  } else {
    padding = (unsigned char*) calloc(((FSB256_INPUTSIZE-state->bufbits)>>3)+1,1);
    padding[0] = 1<<7;
    Update(state,padding,FSB256_INPUTSIZE-state->bufbits-64);
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

  NESSIEadd(state->syndrome,FSB256_R,whirlpoolState);
  NESSIEfinalize(whirlpoolState, whirlOutput);

  for(i=0; i<(FSB256_HASHBITLEN>>3); i++) {
    hashval[i] = whirlOutput[i];
  }

  /*
   * Now we also have to free all the memory allocated during Init
   */
  free(whirlOutput);
  free(whirlpoolState);
  free(state->syndrome);
  free(state->new_syndrome);
  free(state->buffer);
  return SUCCESS;
}

HashReturn Hash(int hashbitlen, const unsigned char *data, unsigned long long databitlen, unsigned char *hashval) {
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

HashReturn HashFile(int hashbitlen, FILE* file_to_hash, unsigned char* hashval) {
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

void printHash(unsigned char* hashval, int hashbitlen) {
  int i;
  // HASHLEN overrides hashbitlen
#ifdef HASHLEN
  hashbitlen = HASHLEN;
#endif
  for (i=0; i<hashbitlen; i+=8) {
    printf("%.2x",(unsigned int) (hashval[i>>3]));
  }
}

#define computeIndex256(i) \
\
  index = i<<FSB256_BPC;\
  index ^= state->syndrome[i];\
\
  k = (i * 6) >> 3;\
  l = 16 - 6 - ((i * 6) & 7);\
  /*\
   * one more (useless) byte has been allocated to in state->buffer to make sure we \
   * can access to state->buffer[k+1]\
   */\
  index ^= ((((state->buffer[k]<<8) ^ state->buffer[k+1]) >> l) & ((1 << 6) - 1)) << 8;\
\
  bidx = index >> 10;         /* bidx = index/FSB256_R */\
  index &= 1023;\
\
  /* we have finished computing the vector index and shift, now we XOR it! */\
  temp = (unsigned long long*) (fsb256_first_line + 2088 * bidx + (index&7) * 261 + 128-(index>>3)); \

void performHash(hashState * state) {
  unsigned int bidx, k, l, index;
  
  int i = 0;
  unsigned long long *temp; //= (unsigned long long*) &fsb256_first_line;

  computeIndex256(0);
  state->new_syndrome[0] = temp[0];
  state->new_syndrome[1] = temp[1];
  state->new_syndrome[2] = temp[2];
  state->new_syndrome[3] = temp[3];
  state->new_syndrome[4] = temp[4];
  state->new_syndrome[5] = temp[5];
  state->new_syndrome[6] = temp[6];
  state->new_syndrome[7] = temp[7];
  state->new_syndrome[8] = temp[8];
  state->new_syndrome[9] = temp[9];
  state->new_syndrome[10] = temp[10];
  state->new_syndrome[11] = temp[11];
  state->new_syndrome[12] = temp[12];
  state->new_syndrome[13] = temp[13];
  state->new_syndrome[14] = temp[14];
  state->new_syndrome[15] = temp[15];
  
  for (i=1; i<128; i++) {
    computeIndex256(i);
    state->new_syndrome[0] ^= temp[0];
    state->new_syndrome[1] ^= temp[1];
    state->new_syndrome[2] ^= temp[2];
    state->new_syndrome[3] ^= temp[3];
    state->new_syndrome[4] ^= temp[4];
    state->new_syndrome[5] ^= temp[5];
    state->new_syndrome[6] ^= temp[6];
    state->new_syndrome[7] ^= temp[7];
    state->new_syndrome[8] ^= temp[8];
    state->new_syndrome[9] ^= temp[9];
    state->new_syndrome[10] ^= temp[10];
    state->new_syndrome[11] ^= temp[11];
    state->new_syndrome[12] ^= temp[12];
    state->new_syndrome[13] ^= temp[13];
    state->new_syndrome[14] ^= temp[14];
    state->new_syndrome[15] ^= temp[15];
  }

  temp = state->new_syndrome;
  state->new_syndrome = (unsigned long long*) state->syndrome;
  state->syndrome = (unsigned char*) temp;
  state->bufbits = 0;
}
