/* Copyright (c) 2014, NEC Corporation. All rights reserved.
*
* LICENSE
*
* 1. NEC Corporation ("NEC") hereby grants users to use and reproduce 
*twine program ("Software") for testing and evaluation purpose for 
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

//#define KEY_LENGTH	128 /* 80 or 128 */
#define ROUND	36
#define BLOCK	8
#define PP			0x43	//Polynomial defining key schedule constants 

typedef unsigned char uint8;
typedef unsigned int uint32;
typedef signed char int8;


/* Single-block enc/dec */
extern void Encode(uint8 text[8], uint8 cipher[8]);
extern void Decode(uint8 cipher[8], uint8 text[8]);

/* Double-block enc/dec */
extern void Encode2(uint8 text1[8], uint8 text2[8], uint8 cipher1[8], uint8 cipher2[8]);
extern void Decode2(uint8 cipher1[8], uint8 cipher2[8], uint8 text1[8], uint8 text2[8]);

/* Key schedule */
extern int Keyschedule(const uint32 key_len, const uint8 sk[128/8]);
extern int Keyschedule2(const uint32 key_len, const uint8 sk[128/8]);
