#define MR_LITTLE_ENDIAN
#define MIRACL 64
#define mr_utype long
#define MR_IBITS 32
#define MR_LBITS 64
#define mr_unsign32 unsigned int
#define MR_STATIC 2
#define MR_ALWAYS_BINARY
#define MR_STRIPPED_DOWN
#define MR_GENERIC_MT
#define MAXBASE ((mr_small)1<<(MIRACL-1))
#define MR_BITSINCHAR 8
#define MR_COMBA 2
#define MR_GENERALIZED_MERSENNE 
#define MR_SPECIAL
#define MR_NO_LAZY_REDUCTION
#define MR_DOUBLE_BIG
#define MR_EDWARDS
#define P64_1271
/*#define HAVE_MAIN*/
#ifndef HAVE_MAIN
#define MR_NO_RAND
#define MR_SIMPLE_BASE
#define MR_SIMPLE_IO
#define MR_NO_STANDARD_IO
#define MR_NO_FILE_IO
#endif
