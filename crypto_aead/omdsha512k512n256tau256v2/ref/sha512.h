/** Implementation of sha512 compression function, originally from openssl  */

/**The original file was modified so that it implements
 * only the compression functions. Below follows the original copyright
 * notice.
 *=============================================================================*/
/** Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
 * All rights reserved.
 *
 * This source file contains implementation
 * of sha-256  and sha-512 compression functions
 * from SSL-package implemented by Eric Young (eay@cryptsoft.com).
 * The implementation was written so as to conform with Netscapes SSL.
 *
 * This library is free for commercial and non-commercial use as long as
 * the following conditions are aheared to.  The following conditions
 * apply to all code found in this distribution, be it the RC4, RSA,
 * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
 * included with this distribution is covered by the same copyright terms
 * except that the holder is Tim Hudson (tjh@cryptsoft.com).
 *
 * Copyright remains Eric Young's, and as such any Copyright notices in
 * the code are not to be removed.
 * If this package is used in a product, Eric Young should be given attribution
 * as the author of the parts of the library used.
 * This can be in the form of a textual message at program startup or
 * in documentation (online or textual) provided with the package.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *    "This product includes cryptographic software written by
 *     Eric Young (eay@cryptsoft.com)"
 *    The word 'cryptographic' can be left out if the rouines from the library
 *    being used are not cryptographic related :-).
 * 4. If you include any Windows specific code (or a derivative thereof) from
 *    the apps directory (application code) you must include an acknowledgement:
 *    "This product includes software written by Tim Hudson (tjh@cryptsoft.com)"
 *
 * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * The licence and distribution terms for any publically available version or
 * derivative of this code cannot be changed.  i.e. this code cannot simply be
 * copied and put under another distribution licence
 * [including the GNU Public Licence.]
 */

#ifndef __SHA512_COMP_H__
#define __SHA512_COMP_H__

#include <stddef.h>
#if ( defined (_WIN64) || defined (_WIN32) || defined (_WIN16) \
      || defined (__WIN32__) || defined (__TOS_WIN__) \
      || defined (__WINDOWS__) || defined (_WIN32_WCE) )
 #ifdef _MSC_VER
   #include <inttypes_win.h>
 #else   /* _MSC_VER */
	#include <inttypes_mingw.h>
 #endif  /* _MSC_VER */
#else  /* defined windows */
   #include <inttypes.h>
#endif /* defined windows */

#define SHA512_DIGEST_LENGTH 64


#if (defined(_WIN32) || defined(_WIN64)) && !defined(__MINGW32__)
#define U64(C)     C##UI64
#elif defined(__arch64__)
#define U64(C)     C##UL
#else
#define U64(C)     C##ULL
#endif

typedef unsigned char hashblock[SHA512_DIGEST_LENGTH];
typedef unsigned char messageblock[2*SHA512_DIGEST_LENGTH];

/**
 * @brief computes sha512 compression function
 * @param H A pointer to hash chaining value
 *             (rewritten)
 * @param in A pointer to input message block
 */
void sha512_comp (hashblock res, const hashblock hash, const messageblock in);

#endif

