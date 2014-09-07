// ++AE crypto header API (Recommended Parameter Set ) 3rd revision 20140702

#define CRYPTO_KEYBYTES  16       // 128 bit key
#define CRYPTO_NPUBBYTES 8        // Public message counter of 64 bits (i.e. S<2^b)
#define CRYPTO_ABYTES 	 16       // Authentication tag of 128 bits (partially implicit in last block padding)
#define CRYPTO_NSECBYTES 0        // Not used by ++AE but included for compliance with CAESAR specs

#define CRYPTO_STATEFUL  1        // Just to highlight that Rec_Par_Set #1 has stateful operation

// Moreover, ++AE recommended parameter set reference API for CAESAR is defined by:
// - AES algorithm (16 byte / 128 bit blocks) with 16 byte (128 bit) key
// - Padding by means ICV bit stealing (the padded bits are used as "implicit" tag bits (and the tag is truncated)

#define CRYPTO_NOOVERLAP 1
