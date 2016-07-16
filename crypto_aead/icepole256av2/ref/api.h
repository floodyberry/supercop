#define CRYPTO_KEYBYTES 32
#define CRYPTO_NSECBYTES 0
#define CRYPTO_NPUBBYTES 12
#define CRYPTO_ABYTES 16

/* for the clarity of the reference implementation, 
   we choose to avoid overlapping plaintext and ciphertext buffers */
#define CRYPTO_NOOVERLAP 1
