#define CRYPTO_KEYBYTES 16
#define CRYPTO_NSECBYTES 16
#define CRYPTO_NPUBBYTES 16
#define CRYPTO_ABYTES 32

/* for the clarity of the reference implementation, 
   we choose to avoid overlapping plaintext and ciphertext buffers */
#define CRYPTO_NOOVERLAP 1
