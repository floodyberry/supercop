void AESKeySteup(const unsigned char*rk, unsigned int*rkexp);
void AESRound(unsigned char *out, unsigned char *in, unsigned int* rk);
void AESRoundFinal(unsigned char *out, unsigned char *in, unsigned int* rk);
void AESEncrypt(const unsigned int*rk, unsigned int *state);
