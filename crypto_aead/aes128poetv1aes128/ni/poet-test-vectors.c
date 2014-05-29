#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "poet.h"

void print_hex(const char *message, const uint8_t *x, const int len)
{
  int i;
  puts(message);
    for(i=0; i< len; i++)
      {
	if((i!=0) && (i%16 == 0)) puts("");
	printf("%02x ",x[i]);
      }
    printf("     %d (octets)\n\n", len);
}

/**********************************************************************/

void print_context (const struct poet_ctx *ctx)
{
  print_hex("K: ",ctx->k,      BLOCKLEN);
  print_hex("L: ", ctx->l,     BLOCKLEN);
  print_hex("LT: ", ctx->lt,   BLOCKLEN);
  print_hex("LB: ", ctx->lb,   BLOCKLEN);
  print_hex("TM: ", ctx->tm,   BLOCKLEN);
  print_hex("Tau: ", ctx->tau, BLOCKLEN);
}

/***************************************************************************/

void test_output(const struct poet_ctx *ctx,
		 const uint8_t *key, const uint32_t klen,
		 const uint8_t *ad,  const uint32_t hlen,
		 const uint8_t *m,   const uint32_t mlen,
		 const uint8_t *c,   const uint32_t clen,
		 const uint8_t *t,   const uint32_t tlen)

{
  print_hex("SK: ",key, klen);
  print_context(ctx);
  print_hex("Header/Nonce: ",ad, hlen);
  print_hex("Plaintext:", m, mlen);
  print_hex("Ciphertext:", c, clen);
  print_hex("Tag:", t, tlen);
  puts("\n\n");
}

/***************************************************************************/

/* No header + 1 block message */
int test1()
{
  struct poet_ctx ctx;
  uint8_t k[BLOCKLEN] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  uint8_t m[BLOCKLEN] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
			  0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};

  uint8_t c[BLOCKLEN];
  uint8_t t[BLOCKLEN];

  keysetup(&ctx,k);
  process_header(&ctx, NULL,0);
  encrypt_final(&ctx,m,BLOCKLEN, c, t);

  test_output(&ctx, k, BLOCKLEN, NULL, 0, m, BLOCKLEN, c, BLOCKLEN,
	      t, BLOCKLEN);
  keysetup(&ctx,k);
  process_header(&ctx, NULL,0);
  return decrypt_final(&ctx,c, BLOCKLEN, t, m);
}


/**************************************************************************/

/* 1 block header + 3.5 block message */
int test2()
{
  struct poet_ctx ctx;
  uint8_t k[BLOCKLEN] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
			  0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};

  uint8_t h[BLOCKLEN] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};


  uint8_t m[3*BLOCKLEN+8] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
			      0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
			      0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
			      0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f,
			      0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
			      0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
			      0xde, 0xad, 0xbe, 0xef, 0xde, 0xaf, 0xba, 0xbe};

  uint8_t c[3*BLOCKLEN+8];
  uint8_t t[BLOCKLEN];

  keysetup(&ctx,k);
  process_header(&ctx, h ,BLOCKLEN);
  encrypt_final(&ctx,m,3*BLOCKLEN+8, c, t);

  test_output(&ctx, k, BLOCKLEN, h, BLOCKLEN, m, 3*BLOCKLEN+8, c,
	      3*BLOCKLEN+8, t, BLOCKLEN);

  keysetup(&ctx,k);
  process_header(&ctx, h, BLOCKLEN);
  return decrypt_final(&ctx, c, 3*BLOCKLEN+8, t, m);
}

/*******************************************************************/

/* 1.5 header + no message */
int test3()
{
  struct poet_ctx ctx;
  uint8_t k[BLOCKLEN] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  uint8_t h[BLOCKLEN+8] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
			    0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
			    0xde, 0xad, 0xbe, 0xef, 0xde, 0xaf, 0xba, 0xbe};

  uint8_t t[BLOCKLEN];

  keysetup(&ctx,k);
  process_header(&ctx, h ,BLOCKLEN+8);
  encrypt_final(&ctx, NULL, 0, NULL, t);

  test_output(&ctx, k, BLOCKLEN, h, BLOCKLEN+8, NULL, 0, NULL, 0, t, BLOCKLEN);

  keysetup(&ctx,k);
  process_header(&ctx, h, BLOCKLEN+8);
  return decrypt_final(&ctx, NULL, 0, t, NULL);
}

/*******************************************************************/

/* 1.5 header + 3.25 message */
int test4()
{
  struct poet_ctx ctx;
  uint8_t k[BLOCKLEN] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
			  0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};

  uint8_t h[BLOCKLEN+8] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
			    0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
			    0xde, 0xad, 0xbe, 0xef, 0xde, 0xaf, 0xba, 0xbe};

  uint8_t m[3*BLOCKLEN+4] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
			      0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
			      0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
			      0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f,
			      0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
			      0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
			      0xfe, 0xfe, 0xba, 0xbe};

  uint8_t c[3*BLOCKLEN+4];
  uint8_t t[BLOCKLEN];

  keysetup(&ctx,k);
  process_header(&ctx, h ,BLOCKLEN+8);
  encrypt_final(&ctx, m, 3*BLOCKLEN+4, c, t);

  test_output(&ctx, k, BLOCKLEN, h, BLOCKLEN+8, m, 3*BLOCKLEN+4,
	      c, 3*BLOCKLEN+4, t, BLOCKLEN);

  keysetup(&ctx,k);
  process_header(&ctx, h, BLOCKLEN+8);
  return decrypt_final(&ctx, c,  3*BLOCKLEN+4, t, m);
}


/*******************************************************************/

/*  POEM test */
int test5()
{
  struct poet_ctx ctx;
  char* k = "Edgar Allan Poe.";

  char* h ="\"Seldom we find,\" says Solomon Don Dunce,\n\"Half an idea in the profoundest sonnet.\nThrough all the flimsy things we see at once\nAs easily as through a Naples bonnet-\nTrash of all trash!- how can a lady don it?\nYet heavier far than your Petrarchan stuff-\nOwl-downy nonsense that the faintest puff\nTwirls into trunk-paper the while you con it.\"\nAnd, veritably, Sol is right enough.\nThe general tuckermanities are arrant\nBubbles- ephemeral and so transparent-\nBut this is, now- you may depend upon it-\nStable, opaque, immortal- all by dint\nOf the dear names that he concealed within 't.";

 char* m = "The noblest name in Allegory's page,\nThe hand that traced inexorable rage;\nA pleasing moralist whose page refined,\nDisplays the deepest knowledge of the mind;\nA tender poet of a foreign tongue,\n(Indited in the language that he sung.)\nA bard of brilliant but unlicensed page\nAt once the shame and glory of our age,\nThe prince of harmony and stirling sense,\nThe ancient dramatist of eminence,\nThe bard that paints imagination's powers,\nAnd him whose song revives departed hours,\nOnce more an ancient tragic bard recall,\nIn boldness of design surpassing all.\nThese names when rightly read, a name [make] known\nWhich gathers all their glories in its own.";

 size_t hlen = strlen(h);
 size_t mlen = strlen(m);

 uint8_t c[mlen];
 uint8_t p[mlen];
 uint8_t t[BLOCKLEN];

 keysetup(&ctx, (uint8_t *) k);
 process_header(&ctx, (uint8_t *) h , hlen);
 encrypt_final(&ctx, (uint8_t *) m, mlen, c, t);

 printf("SK:\n%s\n\n",k);
 print_context(&ctx);
 printf("Header/Nonce\n%s\n(%lu octets)\n\n",h,hlen);
 printf("Plaintext\n%s\n(%lu octets)\n\n",m,mlen);

 print_hex("Ciphertext:", c, mlen);
 print_hex("Tag:", t, BLOCKLEN);
 puts("\n");


 keysetup(&ctx, (uint8_t *) k);
 process_header(&ctx, (uint8_t *) h , hlen);
 return decrypt_final(&ctx, c,  mlen, t, p);
}

/*******************************************************************/

int main() {
  int result=0;

  result |= test1();
  result |= test3();
  result |= test2();
  result |= test4();
  result |= test5();

  if (result) puts("Test result:  FAILED");
  else        puts("Tests result: SUCCESS");
  return 0;
}
