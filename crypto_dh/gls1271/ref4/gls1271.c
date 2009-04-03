/*

Example ECC point multiply program for 64-bit environments. 
Stack-only memory allocation

Use with this mirdef.h header for testing
***** Delete #define HAVE_MAIN from mirdef.h for eBat ********

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
#define MR_EDWARDS
#define MR_DOUBLE_BIG
#define P64_1271
#define HAVE_MAIN
#ifndef HAVE_MAIN
#define MR_NO_RAND
#define MR_SIMPLE_BASE
#define MR_SIMPLE_IO
#define MR_NO_STANDARD_IO
#define MR_NO_FILE_IO
#endif

Build the application from these modules

gcc -c -O2 mrcore.c
gcc -c -O2 mrarth0.c
gcc -c -O2 mrarth1.c
gcc -c -O2 mrio1.c
gcc -c -O2 mrbits.c
gcc -c -O2 mrarth2.c
gcc -c -O2 mrmonty.c
gcc -c -O2 mrxgcd.c
gcc -c -O2 mrzzn2.c
gcc -c -O2 mrecn2.c
as mrmuldv.s -o mrmuldv.o
as fp1271.s -o fp1271.o

ar rc miracl.a mrcore.o mrarth0.o mrarth1.o mrarth2.o 
ar r miracl.a mrio1.o mrxgcd.o mrbits.o fp1271.o
ar r miracl.a mrmonty.o mrzzn2.o
ar r miracl.a mrmuldv.o mrecn2.o
rm mr*.o
gcc -O2 gls1271.c miracl.a -o gls1271

*/

#include <stdio.h>
#include <string.h>
#include "miracl.h"
#define COMPRESSED  /* If public key compression required */
#include "sizes.h"

#define CURVE_BITS 127

/* (Twisted Inverted) Edwards Curve details */

static const mr_small rom[]=
{
0xFFFFFFFFFFFFFFFF,0x7FFFFFFFFFFFFFFF,
0x2A,0x0,
0x695AB4D883DE0B89,0x59F30C694ED33218,
0x2D4A964EF843E8EC,0x4C19E72D62599BCF,
0x201C3DFA8C160636,0x45A40EE5ACC83E27,
0xD5F23AEC39F67FAA,0x6C9A27FFAE92F7D6,
0x4C4CD25FDAE141C2,0x260A0F6D490693D,
0x2426035B2B5AA08,0x48D2A9665758B37D,
};

static const mr_small prom[]=
{
0x0 ,0x0 ,
0x0 ,0x0 ,
0x0 ,0x0 ,
0x0 ,0x0 ,
0x201c3dfa8c160636 ,0x45a40ee5acc83e27 ,
0xd5f23aec39f67faa ,0x6c9a27ffae92f7d6 ,
0x4c4cd25fdae141c2 ,0x260a0f6d490693d ,
0x2426035b2b5aa08 ,0x48d2a9665758b37d ,
0xba433636759cb7a0 ,0x6838f53d9be7345d ,
0x5ff676f5ada920dd ,0x73f914a9e3ea786b ,
0x6d0f2fcf043578ce ,0x740b51d3a8eff5e1 ,
0x47b7354c67528a06 ,0x15d975f17ac3a4f0 ,
0xf8db6965b6e89fc7 ,0x6a1c9ecb2daab1fe ,
0xc3aecadc9553d9e ,0x612318c27c0c98a7 ,
0x4dcbd6200b83d8ce ,0x1a49a27859edb503 ,
0xf5287ac0ce52b7d8 ,0x7dbd43097cd8ff52 ,
0x78a378d631ac740f ,0xbabf45aae484e0 ,
0xa695d0334151089c ,0x2e189934eeb2e0d4 ,
0x25423c5c9d80139 ,0x2616b94158b4b06e ,
0xd191dcf945a2cb99 ,0x6874d9f93b0ea3f7 ,
0xc171f875b6992b33 ,0x4951985c06fc654e ,
0x8ca657e871caebc4 ,0x51aa76ea0778c0f6 ,
0xd270825a95a79ac4 ,0x12f590762d84bec3 ,
0x3b338f4c285d4cc4 ,0x3a83fa03ef1d45e7 ,
0x91a1f839138af884 ,0x1f198b4271c7331f ,
0xb045b3861e5004e ,0x667c1d347ac44b06 ,
0x841539e1db1f05a3 ,0x1a8037987d4c6678 ,
0x64783d397555cc7 ,0x399459523f2b2fa2 ,
0x25fd8fb2ee65c3fa ,0x1d3eb2a882fb616f ,
0x67895f60a9ec3376 ,0x3ff929703eee595 ,
0x637620e8f5af768f ,0x44210d4fe81694af ,
0x646a6144263044d8 ,0xa580753ffed09a1 ,
0x1435ee00f140cd1b ,0x3dd239252c3497b9 ,
0xf2e5c95556f9618a ,0xf8703d81c6a7dac ,
0xc0ebd6f5818f1a82 ,0x570e4894a4d5136b ,
0x3b55c0ec9196383d ,0x65ff53dd8a0b4711 ,
0xfe47084c99a8215 ,0x55b054ffc74199e ,
0xaf56c5c0e7b574ec ,0x1d892b692dca09f9 ,
0xb693fdc8ea07ca57 ,0x3977320767a81291 ,
0xb15e7a8b26ffb2ef ,0x50bb1c506a50766c ,
0x7ee780a13f7a3390 ,0x489b931d4dc29742 ,
0x56993b38d912cb2a ,0x439a84eb0145a285 ,
0xfaa2617b7b8ff35b ,0x23620cba08094372 ,
0x50cc88233dc75383 ,0x56a4d1d231309f65 ,
0x47976c77c1cbf674 ,0x43023504ff7c9599 ,
0x4d143b47487d11e9 ,0x55f5f95cd5bb1710 ,
0x718c52150135fa5d ,0x1831c07c0de7d67d ,
0xbbe03f6e7ebe4c9e ,0x15691753ea4d48c7 ,
0x93ea55940add3229 ,0x478587c26d9b5e0e ,
0x9ca5eefc57faf3ae ,0x1a7e95db6640242d ,
0x62d709056a04b1d4 ,0x2a511093721f389b ,
0xbe99bfb037c4f176 ,0x2158a0f6a08acddb ,
0xa9c6909572c6a12 ,0x2792ecc326e42b2b ,
0xbe7145a44556d232 ,0x461bf3c2532213e5 ,
0xc37fe587eff4aad8 ,0x4930f0316d4701bc ,
0xa9eb393c0f851919 ,0x5b03adf62873a667 ,
0xe6fbfa610705e968 ,0x42c9ad21e2318d76 ,
0xc2ec0e0733a9a861 ,0x3ccd82486f0a2d03 ,
0xb31bc5e5afff9a45 ,0x219aad5fbc4f0d74 ,
0x1c26a67176aeb6fd ,0x56c78d7282e7b5a4 ,
0x92966f12039ff08d ,0x686057a3b8e1b5c9 ,
0x5c339288fd4d68db ,0x58db3623417d70b2 ,
0xd42ff9f5c0473738 ,0x16fddcb5547d5d58 ,
0xb6715ca1188b7aac ,0x4c98d88aefca79a9 ,
0x819c2a017ddff019 ,0x3dde2a0f44d7f8f9 ,
0x884733f61abf8d0e ,0x62a0db8a525d9b81 ,
0x5078109ed542cdea ,0x5c70f33319c0177b ,
0xa262a3e6ee306cd6 ,0xf746cb8eb2241c2 ,
0xadfcd222b80a525a ,0x29e9e60efee02309 ,
0xa8e671fbdf4a8c14 ,0x64d9244a9e6f67cc ,
0xd369459f6cb27aed ,0x4285a32eec2ba6c8 ,
0x58b8b457751adc6d ,0x7af588433c77f095 ,
0xe31b6fd800e6cdf2 ,0x7f47f2d001a35b55 ,
0xdb73f415a17d79fb ,0x37cc50800a8160d5 ,
0x4750eff62097d7e ,0x4ba8ce78714c7691 ,
0xb29dcbdd29b4822d ,0x3300db0d31c326a9 ,
0x6c5cdf22f6f12152 ,0x554b16d3c7384ce4 ,
0x30390527142a3515 ,0xd5a8cdc7e8867df ,
0xff793b47f5b5d008 ,0x2a1887a7ce55601f ,
0xbcf705a8edcdc2b2 ,0x47ac02b17923d722 ,
0x4f8f75fa8856d48a ,0x3f7111990cd705c8 ,
0x91a7c98fa7fbdcfd ,0x3b865e55f75b1d37 ,
0x1b5b2705781801e8 ,0x5e73d98b2fa3cf4d ,
0x1a2827a1d019d007 ,0x3f29582f316eaf9a ,
0xd387646a6f703729 ,0x245bf3c937dd6c8a ,
0x4de68d8b77be2586 ,0x73b6951dfb2d1554 ,
0x6034609987e4a7bb ,0x46bc686b21ec1919 ,
0x72b3d235ead9f11b ,0x55e9fb96a3dc6545 ,
0xe0dcb21744a1e014 ,0xc70580c1fe9edae ,
0x1555f88a4b39124a ,0x677c0180a8b81e5e ,
0x1d36348ecc8dddb6 ,0x7467aa75b5901607 ,
0xf81c4e81653550bc ,0x36b69ab09a75564e ,
0x936ebdb43034b127 ,0x4a7ad4cbf9dc464d ,
0x60a7cc5ddf148f3b ,0x5e69171271e27180 ,
0xc751af5d7c9829be ,0x27e5ba61a5629e9b ,
0x76d154b83ffc6cd ,0x31e65e9ff373561a ,
0x93301e323404d9e7 ,0x5a19324d29361f22 ,
0x32e8edfa5c98e3b2 ,0x1512a0bf53918032 ,
0x46f817124959cbbb ,0x3f1113ec555c68e0 ,
0x9774a50edfe669b5 ,0x57e76783f9304b51 ,
0xed5ebe93c70653e ,0x68e4f4a5c0709381 ,
0x123a5032cbdba4b3 ,0x75ad7bac261bfa6b ,
0x8762379d21f7f9f3 ,0x49467e74a2f24ee4 ,
0x3432685190dfb329 ,0x67db234e7536058 ,
0x4b2aef45b7a4615e ,0x1c9633863c5cff13 ,
0x6df3f24f9b0d51a1 ,0x7bb868b7f8fa15b7 ,
0x43d47891f2e7b134 ,0x7ff5b1cdf579535c ,
0x98a2318860c1826c ,0x5a5fd09e09612b53 ,
0x76c82729918f1cb0 ,0x26412c9cccb7c6a2 ,
0x11500c547136308b ,0xb3694f4ffb1077a ,
0xaa1743d4f56f1009 ,0x55511e4180f06357 ,
0xbb661619b280ebda ,0x270a1fa99f73b11c ,
0xbe3ec0b7883a9c1b ,0x3623212bc5534c7a ,
0x28cd9483640ce99e ,0x5c3b654498aa126 ,
0x59f4418df017656e ,0x25c30714c090e43d ,
0x2dfbb47a03d92582 ,0x1cfb72e9578dbf78 ,
0x6644492ed0d7f60d ,0x16dad7f542af7e4e ,
0x76d605868a1a275f ,0x7a5103364d656944 ,
0xde3e823b3947b346 ,0x28cba01e032ec4a1 ,
0xef2db7c716859ae ,0xc4b707103d14faa ,
0xbc5a9d3c57f1d905 ,0x127adf3c4c3f314f ,
0x863449f59cc24424 ,0x6056996490cbf5cd ,
0x4663f39c0c14ced9 ,0x62fb070b542dd9d4 ,
0x2cc3e3b052d9271f ,0x7d2f925d1333c90a ,
0x9ad55f9693ae63d6 ,0x7cd8b0ea5dedcf6d ,
0xd63074a02e8f3377 ,0x460137b4fbb436d ,
0x34196ee5f27acd18 ,0x5697b27cc532c059 ,
0xd470de99fd6f8c5d ,0x79b4337638fa7b76 ,
0x279fb5e019b3d8cd ,0x119a9f1c5ccf08b8 ,
0x790049ddf0f63f69 ,0x531c8a844778b450 ,
0xd866ec3947030127 ,0x426a16af30eb8373 ,
0x89eb07367b597bba ,0x29717738f5743056 ,
0x1ebc8ebface8c0ff ,0x4f60e2b5dba3af3c ,
0x2f8ae7eb54b3c661 ,0x31f0de9a41e9a1d1 ,
0x76893d3b0eab6996 ,0x48024f435aa78372 ,
0xbd218f0d90db7feb ,0x4ea384332eaf40dd ,
0xaf2ee28f8ee7bb05 ,0x6ef92463eb81b06a ,
0xea37c78d6e7fe885 ,0x13120afa918392f8 ,
0x46fac6954ba97e4c ,0x24d1051c3f648712 ,
0x3b0039a614014276 ,0x2960d7facfdec87c ,
0x7dde34e344fe1242 ,0x4b22b4f8e207b432 ,
0xabc2e297a6989b1c ,0x6e871335a3330c05 ,
0xaf3e66d65d00a84a ,0x4413ab3040d15f60 ,
0x480a893f99baaa6a ,0x6a08c59b8ad25742 ,
0xc67e55d65d6d28ca ,0x246e44a2e7655c05 ,
0xe264027f1e696448 ,0x619d9a5d3aae2254 ,
0x505ebbb00faba65e ,0x14a3363bbcc5bca2 ,
0x29c9c38f693d6e75 ,0x16d866846eef813 ,
0xccc1402ff68106d3 ,0x4721554c3a023883 ,
0xff5a1809e27cdcd3 ,0x4c39e1bc8f89329f ,
0x3de415cb58fcae47 ,0x4cabcc094379762c ,
0xab7f7377c7d60311 ,0x21b645bc05ea9cf3 ,
0xc4c4aa9525440ebc ,0xf2e45068dd81df4 ,
0x1e1119e6884c5c0a ,0x3ba913b94a850227 ,
0xfaf8e0605d9ca83 ,0x4876d6ecc1640dda ,
0x792e88645440ba84 ,0x14dc77011e12c21b ,
0xb6e6a04b358bdfc3 ,0x3e915e5a0747a059 ,
0xaca767503043a335 ,0x1259df164bc2199c ,
0xdec9d9427425d1b8 ,0x1fcec5f77e628cbb ,
0x54ff648b2cc29d8b ,0x42015289336a22c4 ,
0xe1cdb32d015d5c5e ,0x7d21353fc09a2963 ,
0xad64452c8881086 ,0x2500d9f52d53f1c8 ,
0x5887be1e309f7d9c ,0x7e64f4d9315db627 ,
0x55a535474ce11b66 ,0x2d9ba3b73f12442c ,
0x7aa1f93439c8fe ,0x11c9d6455356041e ,
0x6c4f26a401e67321 ,0x15540421e29808ac ,
0xc5cf69cf08725c06 ,0x495567ad0ccc5eea ,
0x9b9a95e816266b7d ,0x25e2040ef57dffdb ,
0x16b3b630bf73a7b6 ,0x233d08826a23e959 ,
0xee4da14c346f12c6 ,0x48e68f3d1a005168 ,
0x5147ec84ec1c7b90 ,0x476d8ce914bc903e ,
0xfbff1436a84dcb13 ,0x46701644fd338267 ,
0x8675c36e9cfc385c ,0x1ab449bb1f060022 ,
0x6f4fd3283fe0acac ,0x14b40777be91f2e7 ,
0x8b9e2f790dd984a8 ,0x9762cc6adb8c57b ,
0x72406f73127009b8 ,0x7eb6db91968dace8 ,
0x69ccc807a34b8e2b ,0x456ddb30a5bfdf3d ,
0x5d4931060259a07a ,0x25e686c59ae41bf1 ,
0x36e2b84781be5995 ,0x1dc999ddda3a66fb ,
0x41373198eac9e447 ,0x189486b134a8e88a ,
0x2b32920a57a8214d ,0x6071b98dcc05904b ,
0xcd8092dfd6a0d399 ,0x737258032a55da49 ,
0x99b8a5e57648b559 ,0x661464924f8439c5 ,
0x5a0af8489a13819 ,0x24349972ff2eecc7 ,
0xf66eaf104c640b08 ,0x4e4d657276e4c63 ,
0xb12c1b6178742a79 ,0x2766fed705b3847 ,
0x75b5eb956de312d5 ,0x3597ffb9f835ca9f ,
0x8d8e758c7c2250a8 ,0xc94fdd60dc743e2 ,
0xfc8f9860723900a7 ,0x10e5c773b9def3e9 ,
0xba106feaab7afa25 ,0x4206754ad9a5dd02 ,
0xbecc6f68d949d830 ,0x5be7905c999fd7f ,
0xad97591de0e48a56 ,0xb62435d5bf62e16 ,
0x702b73215295a867 ,0x6d9b8205c48bd766 ,
0x158ba9e4ade87198 ,0x1d829d197c96dbd5 ,
0x54483a6737b62d97 ,0x3b978d530f5e8cc3 ,
0xf1b966f0cb075148 ,0x544c1ca28800ddff ,
0xb82434bd9036d1a3 ,0x6d430c7d32434385 ,
0x5cd2494568b5b138 ,0x4b24049d2da44ac ,
0xe022003fa97a6562 ,0x718f23cd4d17c0ca ,
0x1ae76fccaac52a89 ,0x5d554cabcbd08569 ,
0xc5b2c7456cb190ab ,0x5baed7f2f33f63e0 ,
0x28f4c62b248f4a51 ,0x1418ef54c29a51fd ,
0x41ef8d9c47a58eb2 ,0x673e43d1aa57fb6a ,
0x33702e6e000700e7 ,0x1c34b6af70fd1519 ,
0x756271cf4c4acc27 ,0x2c1221e943a242c8 ,
0x711dfdb27c9a5dc5 ,0x46b049249e067d5e ,
0xbe5176bfe727ee6b ,0x2de93c693a891cc4 ,
0x6cb04ff0211b885 ,0x41c182ee59c40940 ,
0x2a60d0b5ed39438a ,0x5037bf0d104ca1ef ,
0x42f52fe8c2bdf85b ,0x400d9c25652c3d53 ,
0xca2652cd83c18a6 ,0x5515866ba1cc9778 ,
0x81a52f474b94a95b ,0x13c4c1d6734c75d2 ,
0xc77ef6dd7d7db3e4 ,0x258eb894b33725c7 ,
0x6ee2e9895ee33bb5 ,0x66083e153cf618c ,
0xc531a8ebf59322b6 ,0x19612f6c3ac958b7 ,
0x1be6d4f5af0def9 ,0x28676f5cfd39e5ca ,
0x2865f9a8ee4025f9 ,0x7cdfb3e2d88bcd61 ,
0xcb412c4d40b3f0c1 ,0x78d3cd9e7f1653e7 ,
0x12cee98aee0ca268 ,0x787310bf21331ab3 ,
0xb879d652d2b3a11b ,0x5181b7bcabb0cc5f ,
0x129aa2f4cf623481 ,0x526927ab37456db7 ,
0xb31280b3947c8e8a ,0x1cba09b0fbd7f74f ,
0xabc9436c05df5d05 ,0x6179a482fcce722 ,
0xc52e41aa42115171 ,0x37fe75e1d4335e47 ,
0x1a4fce42b427d3dc ,0x5d44d5e7424448ad ,
0xef15ee8742b8b7ec ,0x183d0c7f0863076c ,
0xe296d2706ad7693a ,0x572766ad4c0a0020 ,
0xbf2d2cb1d2be3f1b ,0x5b0b1668c3c532d4 ,
0x7b29bf03bdc0fcc8 ,0x4ce963758bd2df9f ,
0x82fe0101b77e843f ,0x3a86ea1f6a320ff3 ,
0xb6ce1f8bcbe488bf ,0x45f6ecabfab02fd0 ,
0x68c068ce171dd64b ,0x15e1781df5e915fd ,
0xeec4d11c00bf8d46 ,0x1a125a5e03cceb8 ,
0x41db53fc82e82427 ,0x768618b58507670f ,
0xc335f3a2367f21de ,0x7488c930b36909b0 ,
0x51f4f76dd0ba4f68 ,0xb25e36a3e37656b ,
0x155b16b18a9b9d45 ,0x5e81689a54933656 ,
0x8b533f42c0ce5fb1 ,0x5a3c9770e4d5a58 ,
0x74ccfc6df463073e ,0x674624c1ef19f948 ,
0x1a95739c5096ebb7 ,0x2fbd679f891c6ba9 ,
0x1fa7404ebf854775 ,0x59f5c7aa6c8cb0cf ,
0x72d6f13d6eaca81b ,0x1c2469980d51bb3d ,
0x17cc73a05002e6c5 ,0x26457c321282b04f ,
0x4541b76cf782e9ec ,0x45f08f8f8f1edb42 ,
0x25d9eb68709196c2 ,0x46d88a57a176ef ,
0x3a7fa340963f8ed0 ,0x679fd5e406e55ec4 ,
0x6bcb961d6c8a3e59 ,0x76fa9ac4441f3d9d ,
0xf67177399fd1354e ,0xa911aeef9d89d20 ,
0x337de0724d9c1156 ,0x3d2b845ecbb43f1d ,
0x8491033fd5cf450a ,0x37d8f21e48e25eab ,
0x543b6430de410934 ,0x32ec2dac3db8de30 ,
0x3055bab44de935b6 ,0x3b0efac30dabbacd ,
0xfb8e6d974bf90104 ,0x586f2d6706be156a ,
0xa6489ba265efb1ba ,0x1a9b18d5c3231fd0 ,
0x90a5536f662fd48a ,0x5c3a0e099135485b ,
0x90e689f599eafce5 ,0x162817d0c5c76d35 
};

#define WORDS 2  /* Number of words per big variable 2*64 = 128 */

/* Elliptic Curve Diffie-Hellman, using point compression to minimize bandwidth, 
   and precomputation to speed up off-line calculation */


int crypto_dh_keypair(unsigned char* pk,unsigned char *sk)
{
    int i,promptr;
    big A,B,p,a[2];
    zzn2 x,y,psi[2];
    miracl instance;      /* create miracl workspace on the stack */
	ebrick binst;

/* Specify base 16 here so that HEX can be read in directly without a base-change */

    miracl *mip=mirsys(&instance,WORDS*16,16); /* size of bigs is fixed */
    char mem_big[MR_BIG_RESERVE(11)];          /* we need 10 bigs... */
 	memset(mem_big, 0, MR_BIG_RESERVE(11));    /* clear the memory */

    A=mirvar_mem(mip, mem_big, 0);       /* Initialise big numbers */
    B=mirvar_mem(mip, mem_big, 1);
    x.a=mirvar_mem(mip, mem_big, 2);
    x.b=mirvar_mem(mip, mem_big, 3);
    y.a=mirvar_mem(mip, mem_big, 4);
    y.b=mirvar_mem(mip, mem_big, 5);
    a[0]=mirvar_mem(mip, mem_big, 6);
    a[1]=mirvar_mem(mip, mem_big, 7);
    p=mirvar_mem(mip, mem_big, 8);

	psi[0].a=mirvar_mem(mip, mem_big, 9);
	psi[0].b=mirvar_mem(mip, mem_big, 10);


    promptr=0;
    init_big_from_rom(p,WORDS,rom,16,&promptr);  /* Read in prime modulus p from ROM   */
    init_big_from_rom(B,WORDS,rom,16,&promptr);  /* Read in curve parameter B from ROM */
	init_big_from_rom(psi[0].a,WORDS,rom,16,&promptr);
	init_big_from_rom(psi[0].b,WORDS,rom,16,&promptr);
                                                 
    convert(mip,1,A);                           /* Fix A=1 */

	ecn2_brick_init(&binst,prom,A,B,p,6,128);

/* Alices key gen calculation */
#ifdef HAVE_MAIN
	for (i=0;i<32;i++) sk[i]=rand();
#else
    randombytes(sk,32);
#endif
	sk[15]&=0x3f; sk[31]&=0x3f;

	bytes_to_big(mip,16,sk,a[0]);
	bytes_to_big(mip,16,&sk[16],a[1]);

	ecn2_mul_brick_gls(mip,&binst,a,psi,&x,&y);

    big_to_bytes(mip,16,x.a,pk,TRUE);
    big_to_bytes(mip,16,x.b,&pk[16],TRUE);
#ifndef COMPRESSED
    big_to_bytes(mip,16,y.a,&pk[32],TRUE);
    big_to_bytes(mip,16,y.b,&pk[48],TRUE);
#endif

    memset(mem_big, 0, MR_BIG_RESERVE(11));
	mirexit(mip);

	return 0;
}

int crypto_dh(unsigned char *s,const unsigned char* pk,const unsigned char *sk)
{
    int i,promptr;
    ecn2 P;
    big A,B,p,a[2];
    zzn2 x,y,psi[2];
    miracl instance;      /* create miracl workspace on the stack */

/* Specify base 16 here so that HEX can be read in directly without a base-change */

    miracl *mip=mirsys(&instance,WORDS*16,16); /* size of bigs is fixed */
    char mem_big[MR_BIG_RESERVE(17)];          /* we need 17 bigs... */
 	memset(mem_big, 0, MR_BIG_RESERVE(17));    /* clear the memory */

    A=mirvar_mem(mip, mem_big, 0);       /* Initialise big numbers */
    B=mirvar_mem(mip, mem_big, 1);
    x.a=mirvar_mem(mip, mem_big, 2);
    x.b=mirvar_mem(mip, mem_big, 3);
#ifndef COMPRESSED
    y.a=mirvar_mem(mip, mem_big, 4);
    y.b=mirvar_mem(mip, mem_big, 5); 
#endif
    a[0]=mirvar_mem(mip, mem_big, 6);
    a[1]=mirvar_mem(mip, mem_big, 7);
    p=mirvar_mem(mip, mem_big, 8);
    P.x.a=mirvar_mem(mip, mem_big, 9);
    P.x.b=mirvar_mem(mip, mem_big, 10);
    P.y.a=mirvar_mem(mip, mem_big, 11);
    P.y.b=mirvar_mem(mip, mem_big, 12);
    P.z.a=mirvar_mem(mip, mem_big, 13);
    P.z.b=mirvar_mem(mip, mem_big, 14);
	P.marker=MR_EPOINT_INFINITY;

	psi[0].a=mirvar_mem(mip, mem_big, 15);
	psi[0].b=mirvar_mem(mip, mem_big, 16);
 
    promptr=0;
    init_big_from_rom(p,WORDS,rom,16,&promptr);  /* Read in prime modulus p from ROM   */
    init_big_from_rom(B,WORDS,rom,16,&promptr);  /* Read in curve parameter B from ROM */
	init_big_from_rom(psi[0].a,WORDS,rom,16,&promptr);
	init_big_from_rom(psi[0].b,WORDS,rom,16,&promptr);
	init_big_from_rom(x.a,WORDS,rom,16,&promptr);
	init_big_from_rom(x.b,WORDS,rom,16,&promptr);
#ifndef COMPRESSED
	init_big_from_rom(y.a,WORDS,rom,16,&promptr);
	init_big_from_rom(y.b,WORDS,rom,16,&promptr); 
#endif                                                 
    convert(mip,1,A);                           /* Fix A=1 */

/* offline calculations */

    ecurve_init(mip,A,B,p,MR_PROJECTIVE);
    mip->TWIST=TRUE;

/* Alice calculates secret key */

	bytes_to_big(mip,16,pk,x.a);
	bytes_to_big(mip,16,&pk[16],x.b);

	bytes_to_big(mip,16,sk,a[0]);
	bytes_to_big(mip,16,&sk[16],a[1]);

#ifndef COMPRESSED	
	bytes_to_big(mip,16,&pk[32],y.a);
	bytes_to_big(mip,16,&pk[48],y.b);
	if (!ecn2_set(mip,&x,&y,&P)) 
	{
		memset(mem_big, 0, MR_BIG_RESERVE(17));
		mirexit(mip);
		return -1;
	}
#else
	if (!ecn2_setx(mip,&x,&P))
	{
		memset(mem_big, 0, MR_BIG_RESERVE(17));
		mirexit(mip);
		return -1;
	}
#endif
	ecn2_mul2_gls(mip,a,&P,psi,&P);

	ecn2_getx(&P,&x);
#ifdef COMPRESSED
	zzn2_sqr(mip,&x,&x);  /* I tossed y, so I might have wrong sign.. */
#endif

    big_to_bytes(mip,16,x.a,s,TRUE);
    big_to_bytes(mip,16,x.b,&s[16],TRUE);

    memset(mem_big, 0, MR_BIG_RESERVE(17));
	mirexit(mip);

	return 0;
}

int copyrightclaims()
{
	return 30;
}

int timingattacks()
{
	return 100;
}

int patentclaims()
{
	return 0;
}

#ifdef HAVE_MAIN

int main()
{
	int i,j;
	unsigned char ska[32],pka[64],ssa[32];
	unsigned char skb[32],pkb[64],ssb[32];
	unsigned long long skl,pkl;

	for (j=0;j<10;j++)
	{
		crypto_dh_keypair(pka,ska);

		printf("Alice  private= ");
		for (i=0;i<32;i++) printf("%02x",ska[i]);
		printf("\n");
		printf("Alice's public= ");
		for (i=0;i<32;i++) printf("%02x",pka[i]);
		printf("\n");

		if (crypto_dh_keypair(pkb,skb)<0)
		{
			printf("problem\n");
			break;
		}
		printf("Bob  private=   ");
		for (i=0;i<32;i++) printf("%02x",skb[i]);
		printf("\n");
		printf("Bob's public=   ");
		for (i=0;i<32;i++) printf("%02x",pkb[i]);
		printf("\n");

		if (crypto_dh(ssa,pka,skb)<0)
		{
			printf("problem\n");
			break;
		}	

		printf("Alice's secret= ");
		for (i=0;i<32;i++) printf("%02x",ssa[i]);
		printf("\n");

		crypto_dh(ssb,pkb,ska);

		printf("Bob's secret=   ");
		for (i=0;i<32;i++) printf("%02x",ssb[i]);
		printf("\n\n");

	}
	return 0;
}	

#endif
