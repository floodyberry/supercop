
typedef struct Flash_Complete_Key
{
    unsigned char Q[37][37][37];
	unsigned char L[37][37];
	unsigned char C[37];

	unsigned char S1[37][37];
	unsigned char IS1[37][37];
	unsigned char S2[37];
	
	unsigned char T1[37][37];
	unsigned char IT1[37][37];
	unsigned char T2[37];

	unsigned char M1[37][37];
//	unsigned char M2[37][37];
//	unsigned char M3[37][37];

	unsigned char delta[11];

	unsigned char M[128*128];
//	unsigned char I[256];
}* Flash_Complete_Key;


void add37(unsigned char z[37], unsigned char x[37], unsigned char y[37]);
void sqsq37(unsigned char z[37], unsigned char x[37], unsigned char M[128*128]);
void mul37(unsigned char z[37], unsigned char x[37], unsigned char y[37], unsigned char M[128*128]);

void lineaire(unsigned char z[37], unsigned char x[37], unsigned char s1[37][37]);
void inv_affine(unsigned char z[37], unsigned char x[37], unsigned char s1[37][37], unsigned char s2[37], unsigned char M[128*128]);
void quadratic(unsigned char z[26], unsigned char x[37], unsigned char A[26][37][37], unsigned char B[26][37], unsigned char C[26],unsigned char M[128*128]);

void Bij_Aff(unsigned char T[37][37], unsigned char I[37][37], unsigned char VV[37], unsigned char M[128*128]);

void exponent(unsigned char Z[37], unsigned char X[37], unsigned char *e, int n, unsigned char M[128*128]);
void priv_pub(unsigned char QUAD[26][37][37], unsigned char LIN[26][37], unsigned char CONS[26], 
			  unsigned char S1[37][37],unsigned char S2[37], unsigned char T1[37][37],unsigned char T2[37], unsigned char M[128*128]);

void Flash_build_complete_key(Flash_Complete_Key CK);
void Flash_complete2private(Flash_Complete_Key CK, Flash_Complete_Key PK);
void Flash_complete2public(Flash_Complete_Key CK, Flash_Complete_Key PK);

void Flash_encrypt(unsigned char out[26], unsigned char in[37], Flash_Complete_Key PK);
void Flash_decrypt(unsigned char out[37], unsigned char in[37], Flash_Complete_Key PK);

void Flash_sign (unsigned char out[37], unsigned char *data, int length, Flash_Complete_Key PK);
void Flash_sign2(unsigned char out[37],const unsigned char *data, int length, Flash_Complete_Key PK);
int Flash_verify(unsigned char *data, int length, unsigned char signature[37], Flash_Complete_Key PK);
int Flash_verify2(unsigned char *data, int length, unsigned char signature[37], Flash_Complete_Key PK);

void Flash_store_public_key(char *fichier, Flash_Complete_Key PK);
void Flash_load_public_key(char *fichier, Flash_Complete_Key PK);
void Flash_load2_public_key(const unsigned char *pk, Flash_Complete_Key PK);
void Flash_store2_public_key(unsigned char *pk, Flash_Complete_Key PK);

void Flash_load_private_key(char *fichier, Flash_Complete_Key PK);
void Flash_load2_private_key(const unsigned char *sk, Flash_Complete_Key PK);
void Flash_store_private_key(char *fichier, Flash_Complete_Key PK);
void Flash_store2_private_key(unsigned char *pk, Flash_Complete_Key PK);
