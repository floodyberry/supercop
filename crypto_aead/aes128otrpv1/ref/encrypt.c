/* Copyright (c) 2014, NEC Corporation. All rights reserved.
*
* LICENSE
*
* 1. NEC Corporation ("NEC") hereby grants users to use and reproduce 
*AES-OTR program ("Software") for testing and evaluation purpose for 
*CAESAR (Competition for Authenticated Encryption: Security, Applicability, 
*and Robustness). The users must not use the Software for any other purpose 
*or distribute it to any third party.
*
* 2. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
*OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
*FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL NEC 
*BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL 
*DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
*ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OF THE 
*SOFTWARE.
*
* 3. In the event of an user's failure to comply with any term of this License 
*or wrongful act, NEC may terminate such user's use of the Software. Upon such 
*termination the user must cease all use of the Software and destroy all copies 
*of the Software.
*
* 4. The users shall comply with all applicable laws and regulations, including 
*export and import control laws, which govern the usage of the Software.
*/
#include "crypto_aead.h"
#include "api.h"
#include "OTR.h"

/*
       ... the code for the cipher implementation goes here,
       ... generating a ciphertext c[0],c[1],...,c[*clen-1]
       ... from a plaintext m[0],m[1],...,m[mlen-1]
       ... and associated data ad[0],ad[1],...,ad[adlen-1]
       ... and secret message number nsec[0],nsec[1],...
       ... and public message number npub[0],npub[1],...
       ... and secret key k[0],k[1],...
*/
int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	Setup(k);
	AE_Encrypt(npub, CRYPTO_NPUBBYTES, m, (uint32)mlen, ad, (uint32)adlen, CRYPTO_ABYTES, c, c+mlen);

	*clen = mlen + CRYPTO_ABYTES;

	return 0;
}

/*
       ... the code for the cipher implementation goes here,
       ... generating a plaintext m[0],m[1],...,m[*mlen-1]
       ... and secret message number nsec[0],nsec[1],...
       ... from a ciphertext c[0],c[1],...,c[clen-1]
       ... and associated data ad[0],ad[1],...,ad[adlen-1]
       ... and public message number npub[0],npub[1],...
       ... and secret key k[0],k[1],...
*/
int crypto_aead_decrypt(
	unsigned char *m,unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c,unsigned long long clen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	int		rc;

	*mlen = clen - CRYPTO_ABYTES;

	Setup(k);
	rc = AE_Decrypt(npub, CRYPTO_NPUBBYTES, c, (uint32)*mlen, ad, (uint32)adlen, CRYPTO_ABYTES, c+*mlen, m);

	if(rc == TAG_UNMATCH)
		return -1;
	else
		return 0;
}
