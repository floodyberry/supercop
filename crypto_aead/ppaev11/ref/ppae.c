/* ++AE v1.1 reference source code for CAESAR (Recommended Parameter Set )  */
/* Not an efficient implementation: portability & legibility priorized      */

#include <string.h>
#include "crypto_aead.h"
#include "crypto_core_aes128encrypt.h"
#include "crypto_core_aes128decrypt.h"

#define encAES(out,in,k) crypto_core_aes128encrypt(out,in,k,0)
#define decAES(out,in,k) crypto_core_aes128decrypt(out,in,k,0)

static inline void ull_to_block( unsigned char *, unsigned long long );
static inline void xor_blocks(   unsigned char *, const unsigned char *, const unsigned char * );
static inline void add_blocks(   unsigned char *, const unsigned char *, const unsigned char * );
static inline void subs_blocks(  unsigned char *, const unsigned char *, const unsigned char * );

static void gen_ivs( unsigned char *, unsigned char *, const unsigned char *, const unsigned char * );
static void gen_icv( unsigned char *, const unsigned char *, unsigned long long, unsigned long long, unsigned char *, unsigned char * );
static void gtag_ad( unsigned char *, const unsigned char *, unsigned long long, unsigned char *,    unsigned char * );
static void enc_ppae( unsigned char *, unsigned char *, unsigned char *, const unsigned char *, const unsigned char * );
static void dec_ppae( unsigned char *, unsigned char *, unsigned char *, const unsigned char *, const unsigned char * );

/* --------- ++AE CAESAR encrypt and decrypt AEAD procedures  */
int crypto_aead_encrypt(
   unsigned char *c,        unsigned long long *clen,
   const unsigned char *m,  unsigned long long mlen,
   const unsigned char *ad, unsigned long long adlen,
   const unsigned char *nsec,                         // Unused by ++AE, but kept in the prototype.
   const unsigned char *npub,                         // S nonce counter; Should not repeat but ++AE in stateful operation is secure even with repetitions
   const unsigned char *k,                            // k!=NULL only for the first session call: (fresh) IVs are generated and the key would be preset in real AES implementation
         unsigned char sstart                         // sstart != 0 only for the first session call: it's redundant with convention on k argument but I wanted to remark and to insist on it
)                                                     // WARNING: arguments validity are not checked
{
   static unsigned char _k[16], _IVa[16], _IVb[16];   // space to keep preset key between calls (used AES library needs rekeying for each call)
   unsigned char icv[16], lb[16], b[16];
   int i, w=0;

   if ( sstart && (k!=0) ) {                          // If first session call then generate fresh IVs and save key. On the contrary we just chain IVs
	  memcpy( _k, k, 16 );                            // It would be the right place to preset AES key to avoid rekeying for every block
	  gen_ivs( _IVa, _IVb, npub, k );                 // Fresh IVs generated
      }

   gen_icv( icv, npub, mlen, adlen, _IVa, _IVb );     // Let's compute the ICV for this message
   gtag_ad( _IVa, ad, adlen, _k, icv );                // AD tag calculated on IVa (and using initial value as input)

   for ( *clen=mlen+16; mlen; mlen-= 16, m += 16, c +=16 ) {      // ++AE plaintext encryption
      if ( mlen<=16 ) {                                           // it's time to padd P last block         
    	 for ( i=0, w=mlen%16; i<16; i++ ) b[(w+i)%16]=icv[i];
         memcpy( icv, b, 16 );                                    // ICV = ICV>>w (w=mlen)
         memcpy( lb,  m,  w ); memset( lb+w, 0, 16-w );
         for ( i=0; i<16; i++ ) lb[i] ^= icv[i];      // xor and padding with rotated ICV
         mlen = 16; m = lb;
      }
      enc_ppae( c, _IVa, _IVb, m, _k );                // One block ++AE encryption with IVa and IVb chainning ...
   }

   enc_ppae( lb, _IVa, _IVb, icv, _k );                 // Let's generate the tag block ... but reduced
   memcpy( c, lb+(16-w), w );                          // by the (16-w) tag/padding bytes added in previous cryptogram block
   return 0;
}

int crypto_aead_decrypt(
   unsigned char *m,        unsigned long long *mlen,
   unsigned char *nsec,
   const unsigned char *c,  unsigned long long clen,
   const unsigned char *ad, unsigned long long adlen,
   const unsigned char *npub,
   const unsigned char *k,
   unsigned char sstart                               // sstart != 0 only for the first session call: it's redundant with convention on k argument but I wanted to remark and to insist on it
)                                                     // WARNING: arguments validity are not checked
{
   static unsigned char _k[16], _IVa[16], _IVb[16];
   unsigned char         icv[16], iva[16], ivb[16], b1[16], b2[16];
   int i;

   if (clen<16) return -1;

   memcpy( iva, _IVa, 16 );
   memcpy( ivb, _IVb, 16 );
   if ( sstart && (k!=0) ) {
      memcpy( _k, k, 16 );
      gen_ivs( iva, ivb, npub, _k );
      }

   gen_icv( icv, npub, *mlen=clen-16, adlen, iva, ivb );
   gtag_ad( iva, ad, adlen, _k, icv );

   for ( ; clen>16; m+=16, c+=16 ) {
      dec_ppae( b1, iva, ivb, c, _k );
      if ( (clen-=16) <= 16 ) {                      // ICV Padding shall be removed in this last block
         for ( i=0; i<16; i++ ) b1[i] ^= (b2[i] = icv[(16-clen+i)%16]);
         for ( i=clen; i<16; i++ ) if ( b1[i] ) return -1;
         for ( i=0; i<16; i++ ) icv[i] = b2[i];
      }
      memcpy( m, b1, (clen<=16)? clen : 16 );
   }

   enc_ppae( b1, iva, ivb, icv, _k );                 // Let's generate the last tag block MDC"
   if ( memcmp( b1+(16-clen), c, clen ) ) return -1; // it's w lsB shall match the tail cryptogram bytes

   memcpy( _IVa, iva, 16 ); memcpy( _IVb, ivb, 16 ); // All right, let's save the IVs and return OK
   return 0;
}

// --------- ++AE auxiliary encapsulated procedures
static void gen_ivs( unsigned char *iva, unsigned char *ivb, const unsigned char *s, const unsigned char *k )
{
   unsigned char b[16];

   memset( b, 0, 8 ); memcpy( b+8, s, 8 );
   encAES( iva, b, k ); encAES( ivb, iva, k );
}

static void gen_icv( unsigned char *icv, const unsigned char *npub, unsigned long long n, unsigned long long m, 
   unsigned char *iva,  unsigned char *ivb )
{
   unsigned char s[16], b1[16], b2[16];

   memset( s, 0, 8 ); memcpy( s+8, npub, 8 );
   ull_to_block( b1, n+m );
   xor_blocks( b2, b1, ivb );
   xor_blocks( b1,  s, iva );
   add_blocks( icv, b1, b2 );                      // ICV = (IVa xor S) + (IVb xor (N+M))
}

static void gtag_ad( unsigned char *iva, const unsigned char *ad, unsigned long long adlen,
   unsigned char *k,   unsigned char *icv )
{
   unsigned char x[16], lb[16], b[16];
   int           i;

   while (adlen) {
      if ( adlen<=16 ) {                                        // its time to padd AD last block
         memcpy( lb, ad, adlen );
         ad = lb;
         for ( i=0; i<adlen   ; i++ ) lb[i] ^= icv[16-adlen+i]; // xor q msB from AD with q lsB from ICV (eq. to ICV>>q and xor)
         for ( i=0; i<16-adlen; i++ ) lb[adlen+i]=icv[i];       // pad (p-q) lsB of AD with msB from ICV (q = adlen)
         adlen = 16;
      }
      encAES( x, ad, k );
      add_blocks( b,   x, iva );
      xor_blocks( iva, x, b   );
      adlen -= 16;  ad += 16;
   }
}

static void enc_ppae( unsigned char *c, unsigned char *iva, unsigned char *ivb,
   const unsigned char *m, const unsigned char *k )
{
   unsigned char b[16], I[16];

   xor_blocks( I, iva, m );
   add_blocks( b, iva, ivb );
   add_blocks( iva, I,   b );
   xor_blocks( b, iva, ivb );
   encAES( c, b, k );
   memcpy( ivb, I, 16 );
}

static void dec_ppae( unsigned char *m, unsigned char *iva, unsigned char *ivb,
   const unsigned char *c, const unsigned char *k )
{
   unsigned char b[16], Q[16];

   decAES( b, c, k );
   xor_blocks ( Q, ivb,   b );
   add_blocks ( b, iva, ivb );
   subs_blocks( ivb, Q,   b );
   xor_blocks ( m, iva, ivb );
   memcpy( iva, Q, 16 );
}

// Aux block manipulation primitives (aka u128 type primitives)
static inline void ull_to_block( unsigned char *b, unsigned long long u )
{
   int i;
   for ( i=15; i>=0; i-- ) { b[i] = u; u >>= 8; };
}

static inline void xor_blocks( unsigned char *r, const unsigned char *a, const unsigned char *b )
{                                                             // r = a^b
   int i;
   for ( i=0; i<16; i++ ) r[i] = a[i] ^ b[i];
}

static inline void add_blocks( unsigned char *r, const unsigned char *a, const unsigned char *b )
{                                                             // r = a+b
   unsigned char c[16];
   int           i;

   for ( i=15, c[15]=0; i>=0; i-- ) {
      r[i] = a[i] + b[i] + c[i];
      if ( i )  c[i-1] = ( c[i] )?  ((r[i]<=a[i] )? 1 : 0)  :  ((r[i]<a[i] )? 1 : 0);
   }
}

static inline void subs_blocks( unsigned char *r, const unsigned char *a, const unsigned char *b )
{                                                             // r = a-b
   unsigned char c[16];
   int i;

   for ( i=15, c[15]=0; i>=0; i-- ) {
      r[i] = a[i] - (b[i] + c[i]);
      if ( i )  c[i-1] = ( c[i] )?  ((r[i]>=a[i] )? 1 : 0)  :  ((r[i]>a[i] )? 1 : 0);
   }
}

