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
#include "sizes.h"

#define CURVE_BITS 127

/* Curve details */

static const mr_small rom[]=
{
0xFFFFFFFFFFFFFFFF,0x7FFFFFFFFFFFFFFF,
0x2C,0x0,
0x999999999999999A,0x1999999999999999,  	
0xCCCCCCCCCCCCCCCD,0x4CCCCCCCCCCCCCCC,
0x1AFAC10F88821962,0x12B04E814703D49C, 
0x6F755142FE73FB62,0x426B94A2AD451F29,
0x2F55509EF630FF5A,0x422DD1650E025949,
0xD4CB6C64E26DB09F,0x6ED444D53BF7F6E7,
0x2E89D9B064BE2B44,0x4813CC47356300D3,
0x6F93B4024817C634,0x430F590203CB7DF8 
};

static const mr_small prom[]=
{
0x0,0x0,
0x0,0x0,
0x0,0x0,
0x0,0x0,
0x2f55509ef630ff5a,0x422dd1650e025949,
0xd4cb6c64e26db09f,0x6ed444d53bf7f6e7,
0x2e89d9b064be2b44,0x4813cc47356300d3,
0x6f93b4024817c634,0x430f590203cb7df8,
0xb01ef544d4d4fcea,0x4a132437230d42af,
0x8420cd10ba72ef17,0x411b85a68ca64a19,
0x16c508b326de0872,0x2251a702ee1f9856,
0x65873e9b49290efc,0x49528bf16303386f,
0x221abcc501096ade,0x66343cbd7427443d,
0x6080afbb57ed5811,0x3617fda44e086a06,
0xdbdb4ff17af3c64c,0x6ee92ff8f5ca18dc,
0x5a11607122ddeacb,0x2a8a44b74b25de2a,
0x5fbaebe3c05bfc4c,0x17e49ffd677593b0,
0x7b59150c578547f1,0x531d16a12a780349,
0xde2a1d9107d0b960,0x5d2558d69f9fa17d,
0x6a221f61cb7f4ae5,0x3fa2a04f7232742,
0x8968890df2a221f9,0x24b126483e722a93,
0xb19a09d1618c92a7,0x3296b01c4e3224ba,
0xc7c74172ea71559e,0x2bfb594e6be971fc,
0x7fe9103f18beb24a,0x8bd8c9e99d967c2,
0x32b0a241b5a90034,0xc563108710c0f6e,
0x973516738b7de30,0x5802caf630b4b400,
0xf1c350766e560a17,0x77b9e409fd251974,
0x84fb28e2bd6af19d,0x245fb4837468c1ec,
0x2b32c64265051857,0x65db36e3f0368462,
0x7bf90ea22dd4723a,0x353fabf30c73e242,
0xec3a4c353349d035,0x24232d705bd57b0e,
0xc48d1bc0a7bdd01c,0x6cf647795079a0d6,
0x2bec048d1c8478c9,0x31866ebd2047f4d5,
0xadd5500a10faab49,0x70a13813cf868e1d,
0xf949aa0dde5a6dc5,0x2240b10bcd3bd95c,
0xca71d3df3a6f009e,0xbbfd55b47ce0e36,
0x7e5ec87438432137,0x56fd1911e8a2fd08,
0x1afe043300dd939d,0x29b08017fe3e7b90,
0x822b11347efe7de3,0x58606ca0092413be,
0x8dcd6cd08169ff00,0x4a2d62ededc1fa8f,
0x5504902443c0b285,0x7a17d783dad97945,
0x819619ad34e750ce,0x13b87720ec3c556d,
0xa3a8c031b492278,0x756b4fae76fc3f96,
0xc0522f1ba0b963c5,0x579e3074eaa9e1db,
0x125f80f987d0d51c,0x528197c43f7da628,
0x96894fac59b26d8c,0x694aea13084bc96f,
0x53351d5113993a00,0x7bb2929293bcf95b,
0x527d6542c3dbc8e7,0x8b076359045f3bb,
0x5013fe0fba8f5ed0,0x4d056bb06cc4d84e,
0xe9a65dbdcfe6965d,0x504199b50bc42cef,
0xe0c5c5f2f65124f2,0x56a4fdbc4347b1e7,
0xfded6019d87b68d8,0x72bbe7dd8ac5affb,
0x8431274cec501f18,0x6a29eb3a37c22f28,
0x33c0398c03e41e7d,0x75e5b4b3655f1fca,
0x51222775d9a4093b,0x504d152b66f6612a,
0xa11057e2812ea9f3,0x1c16784af9388e89,
0x85b5df6dee53eb58,0xb4925fadbeb6ea4,
0x7c77c201a959f09d,0x6c49f4cb70cf86d9,
0x7929da43b7920d35,0x6b8789309af46780,
0x247d6f00a9d20d9,0x6c05c12a03af14d0,
0x35176e3c8dbf0b5c,0x2c8cb7495f2f5459,
0x9e06506bc8395f39,0x6a5b936baa118b36,
0x726e137d4ca08d5d,0x7adb0688f470a817,
0x732b8925287988a5,0x40e24de6fcbed592,
0xd02cef2b0da759ac,0x449f9fd170a094a7,
0x22633aa3a8c2107e,0x6268bfd0e2731ff7,
0x67947ddd57e3b7b1,0x2a7bcceac17b9448,
0x697236981692038d,0x122af3ecdeb8392e,
0xf62af57cb1c45650,0x431f1b2ad28cb19f,
0x1e8fbcb21afb6fef,0x2ad5ed69c4f11cd8,
0x7fa3f449756a270e,0x4ccf94063c14d58a,
0x2b49afada5bea0be,0x6983d2868a633ce1,
0xd713386d6254110c,0x531415a66f8993df,
0x5c3292216a00fd6,0x4475a07be7b170ea,
0x870af480a439282,0x276b9a563e816a8,
0xf19dd3463222aa5c,0x73c9752d5795b29f,
0xd339b9b1d5df1918,0x5883bc8181d80840,
0xee56f4cfb1f90252,0x123780171a64d98a,
0xb97358713be98b7,0x55f79089a3381702,
0x90e818d5e75a0a7f,0x74fefd670a027e4d,
0x7116094ae1a9322,0x4d74095569f7ddda,
0xa1754c022443f88,0x5205f3308afdca24,
0x2f15bda39b6d436f,0x547f5fffab15330f,
0xcf2d89b6891739b9,0x5995aaf09bb466aa,
0xd5d20d59db513eb7,0x70abeac5b47a8fe3,
0x8d361e6dd1d384e7,0x31db87a176fbc11c,
0xd3a82b8065956f04,0x7ab164e948a2b5d8,
0x985ae1422d376cc,0x282349a68e5eb148,
0x80fd9cb23cdcad3c,0x2e2379570a62389b,
0x5812ccc31569aae8,0x39febbb411bb4b3b,
0x34873a48e76cd48e,0x5f66e7d825125759,
0x30288339f2f323fc,0x16f7e8a1972ac90,
0x772f3cda3cd78415,0x381a9cc587d615ed,
0x63293774bb073f2c,0x5286cf14e9c67727,
0xb9040fea0dbf8aa0,0x2f0c1a83f143be7c,
0xedecc3e87194d374,0x71c3bc275b291627,
0xf831af885f71729f,0x16ecbbc0343ffda0,
0xed4e14d6cd9e0add,0x68cdfde6f9587160,
0x817c8c64744f11ef,0x5c8f437f38961079,
0x92337a4266ccd668,0x799e526a9c267118,
0x6a793ea667d66a96,0x68202bc9a49da15e,
0xc6b62259b2b9d8fa,0x1fc0ffe049b5ed1c,
0x41bae80c7ace8809,0x64ba5c8544e951ef,
0x74cb58b68529f5ce,0x578fab7e913999a7,
0xcff02d66f9efb291,0x33fb9cb319cbee94,
0xd6c3842061fa10c0,0x3440a63ee06b54e9,
0x493e92e2feca1704,0x135ea720cb818722,
0xaa7b7c4bd0f0a9bb,0x7c7b150f26d6f394,
0x78a3644a6e03995c,0x79afea4024a7186c,
0xcf6b814c50e104c5,0x5fdceade6f43f311,
0xbb30f2a0063a8b8c,0x17d0c7be328e7b8e,
0xcff4e625a1ce3d07,0x4092e0d16acfcba4,
0x5f7646c84a51e213,0x403056768e2f6f84,
0x2b470543ab2ab141,0x4f1a04d3a2beaa39,
0xc179833f57f0898c,0x12dd479542a5870d,
0x48adc43b544ff0a7,0x5221c5fac7edc6f8,
0x8bdac85cedb5c355,0x3cc2e9292c58ee11,
0x68fe9f21c8e472a4,0x6f61e9ac3dc8173f,
0xa958a5cb04b5bb0,0x7bb816a159c2cefe,
0x7b14993f66650822,0x267429c9b810c03a,
0x1810c6fdf25d119b,0x78798086a2393977,
0xbabf54ecbf8c7006,0x11c476f44ecd9250,
0x34c438b359ccf30e,0x515ae7df6c85a793,
0xc9923248892fffd9,0x134830bd735b6dce,
0x86637f2a2f4ab0de,0x67b964e561643b1f,
0x1ed9d9a81058d9b,0x476c8a43fd9d72f6,
0xa17eb704d5307c03,0x4d986d8461999df9,
0x9d26833f79c22755,0x22f6a16e04d64054,
0xf635113e5f17d716,0x2f8b58d957138bc8,
0xff24d6800456643e,0x3babe4289eaedcf5,
0x6ecfca2a15ed7d7e,0x116ef12a86fad7e9,
0x22fc2aa2c951a585,0x45f732728f43069a,
0x77385439555eb1d6,0x768663e7eb99d92b,
0xc056d7aa53d13abf,0x57649889288b82d4,
0x790d0444ec46470b,0x1348dd1e14a5d258,
0x5fee45dd914c9f51,0x3c75292e333646a5,
0x82ac829af7afeb16,0x3ae4df24256f845a,
0x8f71bbafaf9892cc,0x35429477161f336c,
0xf1d35ca049d67411,0x6cb846a534ca9c9a,
0x1e9948fd98111955,0xbb9e9c2b886c476,
0x410195b7095a74fb,0x71c31397d85f413d,
0xf51db2a4d510bc4,0x4a1cea7402107244,
0x4c97df7f62214c14,0x23888eb490da2bde,
0xc984aca9ffb1b3b7,0x4291bc72a77a79f0,
0x868bb2956ec6a3ec,0x6fbac4e78254a937,
0x4528a2ed794b033a,0x7c669c361af53a94,
0x20464fa35f10a763,0x65ba058334cc286,
0x17dc311d065a1f5e,0x59378fef5840d356,
0xf0339762e1acde76,0x348a8730a248378e,
0x30f07d9d9c75fd80,0x1c274c20bcebb468,
0x464a06bc4105a51,0x680abc88c6dd596e,
0x659b20e1c78a2ae5,0x59be6b906190c0f8,
0x34e02ec95c73b62d,0x26c04cd5498ca560,
0x51005cd3dce6a23f,0x37d50af54491a7d9,
0x3cb4b8564ae70ff3,0x16ebcbc158586e16,
0xf5ea16f90cc07451,0x9b6feef693cbc00,
0x3e5c66c1964ab379,0xf31ed0c1efdcb8d,
0xb42419cb4d086231,0x51377cecc23bfd8f,
0x1fd3b875a68a8467,0x290287a643e7e71c,
0xee6e4af16e3b632f,0xca538b754d60d78,
0x1f87f995c6b96e79,0x33b04b1b7a0860ba,
0xaec0a39d27f3078b,0x4236dc0afaee9116,
0xc2defe6fa7731fef,0x20e6ff2144ce798c,
0x8c8ab3dfb12b6643,0x20f43cf68782afe5,
0xa7cc22f64a35e585,0x10305f620563a1f8,
0x2da161f40eb0ac27,0x58acb3fcb0e8d118,
0x94f0d8d9700ea2b7,0x19a68334689ba16a,
0xc9660aa560e38714,0x778b86c5c6523239,
0x53fd4c7566854fe1,0x138bb219ce7bcf1e,
0x14457fd0c8f9f638,0xf6d637df0b94ccb,
0x1c30a92559ac2318,0x5f4a1f46f1849774,
0x6cafa11ad3489545,0x4e22ddb60a0de709,
0x9bfb719cb4bfd284,0x78932ee2ef2f362e,
0xb648ee085b5d26c7,0x7a6480c8080fa832,
0x9f3b754225be8ba6,0x773a9667fd4b04f5,
0x7530b83d84ae6a9f,0x1494dd50c0df6023,
0x8fa0dd061378fb93,0xbbc3318cd960043,
0x3a7f951b8aec78db,0x17ccd421f87f013c,
0x18048c3ec6422379,0x7c9b316fda7b9e52,
0x650985c5be4fbe47,0x63fb72541aebb9c1,
0x356784e16a73324,0x6bc9d7bd6b13c025,
0x9d0763858d3718ad,0x132e1f5d1929b28c,
0x41eb350fa8a94701,0x3221951f6dadb0a5,
0x25d9d8aaa1641758,0x560fa9e98e4a7536,
0xf472bee00b77e2d6,0x7c83abd609134060,
0x28275607a6c8ba41,0x60a585182a25504e,
0x1f3270b9c4e43e82,0xf817c86be5f5f17,
0xb09929e976a86ef0,0x46c43b0355f4a7f4,
0xaf9e1f98bbd075f,0x3c41d0c199d13f3f,
0x275adb07ff566dfe,0x6fdfbe61358d7cb4,
0xe611efacdc55ae58,0x90dcdd693ebe5f5,
0x11ce3d9ec9c9375a,0x5ee45b9273af726c,
0x7f29bc5bb230a235,0x22b4c2a8e1d57ba5,
0x7ebd6bb21aa95952,0xe4deec09557d234,
0xbdce436edd4941fb,0x78107e42d0bd74c6,
0xb560ee4c93e8cf3b,0x528eb10765b32fad,
0xfa748dd0a0827c64,0x5fc8a7ca697968e8,
0x7d3b7d2af2b164ed,0x158eb3bbfdbea099,
0x16910f20ddaa9b18,0x732a1a150d0d23ef,
0x82b7be2a7874c1f4,0xb07c9c914cd09a6,
0x3157c86291f3a22f,0x5484b88c50cf7f12,
0x86fedc2dcb277ec1,0x7403e779072578d3,
0xf8010987224809a2,0x4f6690d053e5c207,
0x62dd7f13e1c0b093,0x5e61202f680af7b4,
0x2193c044e95b52d2,0x125f47b8d2ead6cf,
0x3c0a84f0267266f4,0x4f75643b1ba597ff,
0x239f50f05a08f81f,0x1489f4f2f072a9f0,
0xf3bab6f94b61a1a0,0x7fa730cbfeccaa47,
0xb6ff9bb274f7ef58,0x6e18b441df62556d,
0xa20b72f68b606a94,0x3caefcda7a852dc6,
0xa4fb365ab3ce20bc,0x8b2615f57633d22,
0x1df6ef43391c340,0x428f7848871e88a6,
0x48cd43d6c78ac538,0x989e88f52eb325,
0x30b2c5551f17bf1,0x2e3774f4d9d9b303,
0x1c5c7491fd9ed438,0x938fbc88117e67d,
0x8b4330b86205bb78,0x1de4e53207ffa4b,
0xe375dea7be1c5513,0x3392d2def7c6fbd5,
0xe0e59fd1f0ce6c2b,0x67246955625ce4d,
0x3c5b830876248c38,0x694a1ebf4a8d50fd,
0xf1fc99a44a0803a0,0x33c24d0db8468b3c,
0x76346a5bb18ee07e,0x6986c058599fbea9,
0x32a9095c6c05eeba,0x332de6a23e552fc0,
0x4b86690b593dcb36,0x746d1f1e18d349bf,
0xeeec2f38fc5d510b,0x2e7b8e6b383a1f6c,
0xc75e760c8ff5c58d,0x1cd952e571cd967e,
0xb0eaf8e96c2ca07d,0x58616f34ea05854e,
0x17eb0e0753188cae,0x2a4fbb41303352f,
0x852b671d0a1b5b19,0x315db0178f92e3be,
0x9cce9d2b69814f1a,0x1289be38952cb76f,
0xdd40756182f46673,0x70156bdace6a8ade,
0x8ac2536edf188ee2,0x4e085b9da81da6f8,
0x9e0372b99514addb,0x6e19b76588a22814,
0xc7f6c181a6bca109,0x41db5d3420ff9d05,
0x9bbbc28b80ee13d7,0x148d3eb2636116db,
0x9c72de219a96fe14,0x6b13d4a1e78bb365,
0xa58bfc2a190ce30b,0x576c5b9183d24699,
0x14b1289f297d4a4f,0x135904341882a2d0,
0x2cc02e6d982459ca,0x726d5cd2be81b17d,
0x5336bd5f82bcc77c,0x53ac47d58b40740a,
0x6d57e94e2075b282,0x7057e95b0fea96d2,
0x1e558e1ca8a5241d,0x5ca2d65ae9d00954,
0xfee124513c205c99,0x1e7c33bcec7e42a5,
0x6760fe069a612a17,0x5a898abad0a85be,
0xf737521751738683,0x2595afbd3832efff,
0xe03fdf61a5cdf6ef,0x55c4952a2a695f4b,
0x47e8a699b061ff1f,0x60768b34df279d4d,
0x27931fdf2232076c,0x7187526cb73de998,
0x55eb02bbb90a494,0x2410963130f9263f,
0x45d3fd790744068d,0x66cbb362d821c0a6,
0xe364d4a27b497252,0x66b5a60a5ca3ece9,
0x1143adc1b9f19cb3,0x49db096216e4fd57,
0xf8b1befa83426722,0x29cfefad405b3ee7,
0x26dc76d322c70f56,0x62e5f5d17b1420ec,
0x3ea966295157acde,0x4c0c5121979d5def,
0xf5945693d5565765,0x1a4f2aae114bc24f,
0x366c7c1287df8b45,0x207b0052e5d5a1d
};

#ifdef MR_COUNT_OPS
int fpm2,fpi2,fpc,fpa,fpx;
#endif

#define WORDS 2  /* Number of words per big variable 2*64 = 128 */

/* Note that in a real application a source of real random numbers would be required, to
   replace those generated by MIRACL's internal pseudo-random generator "bigbits"  
   Alternatively from a truly random and unguessable seed, use MIRACL's strong random 
   number generator */

/* Elliptic Curve Diffie-Hellman, using point compression to minimize bandwidth, 
   and precomputation to speed up off-line calculation */


int crypto_dh_keypair(unsigned char* pk,unsigned char *sk)
{
    int i,promptr;
    ecn2 P;
    big A,B,p,a[2];
    zzn2 x,y,psi[2];
    miracl instance;      /* create miracl workspace on the stack */
	ebrick binst;

/* Specify base 16 here so that HEX can be read in directly without a base-change */

    miracl *mip=mirsys(&instance,WORDS*16,16); /* size of bigs is fixed */
    char mem_big[MR_BIG_RESERVE(19)];          /* we need 10 bigs... */
 	memset(mem_big, 0, MR_BIG_RESERVE(19));    /* clear the memory */

    A=mirvar_mem(mip, mem_big, 0);       /* Initialise big numbers */
    B=mirvar_mem(mip, mem_big, 1);
    x.a=mirvar_mem(mip, mem_big, 2);
    x.b=mirvar_mem(mip, mem_big, 3);
    y.a=mirvar_mem(mip, mem_big, 4);
    y.b=mirvar_mem(mip, mem_big, 5);
    a[0]=mirvar_mem(mip, mem_big, 6);
    a[1]=mirvar_mem(mip, mem_big, 7);
    p=mirvar_mem(mip, mem_big, 8);
    P.x.a=mirvar_mem(mip, mem_big, 9);
    P.x.b=mirvar_mem(mip, mem_big, 10);
    P.y.a=mirvar_mem(mip, mem_big, 11);
    P.y.b=mirvar_mem(mip, mem_big, 12);
    P.z.a=mirvar_mem(mip, mem_big, 13);
    P.z.b=mirvar_mem(mip, mem_big, 14);

	psi[0].a=mirvar_mem(mip, mem_big, 15);
	psi[0].b=mirvar_mem(mip, mem_big, 16);
	psi[1].a=mirvar_mem(mip, mem_big, 17);
	psi[1].b=mirvar_mem(mip, mem_big, 18);

    promptr=0;
    init_big_from_rom(p,WORDS,rom,20,&promptr);  /* Read in prime modulus p from ROM   */
    init_big_from_rom(B,WORDS,rom,20,&promptr);  /* Read in curve parameter B from ROM */
	init_big_from_rom(psi[0].a,WORDS,rom,20,&promptr);
	init_big_from_rom(psi[0].b,WORDS,rom,20,&promptr);
	init_big_from_rom(psi[1].a,WORDS,rom,20,&promptr);
	init_big_from_rom(psi[1].b,WORDS,rom,20,&promptr);
	init_big_from_rom(x.a,WORDS,rom,20,&promptr);
	init_big_from_rom(x.b,WORDS,rom,20,&promptr);
	init_big_from_rom(y.a,WORDS,rom,20,&promptr);
	init_big_from_rom(y.b,WORDS,rom,20,&promptr);
                                                 
    convert(mip,-3,A);                           /* set A=1 */

	ecn2_brick_init(&binst,prom,A,B,p,6,128);

/* Alices key gen calculation */
        randombytes(sk,32);
	sk[15]&=0x7f; sk[31]&=0x7f;

	bytes_to_big(mip,16,sk,a[0]);
	bytes_to_big(mip,16,&sk[16],a[1]);

	ecn2_mul_brick_gls(mip,&binst,a,psi,&x,&y);

    big_to_bytes(mip,16,x.a,pk,TRUE);
    big_to_bytes(mip,16,x.b,&pk[16],TRUE);
 
    memset(mem_big, 0, MR_BIG_RESERVE(19));
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
    char mem_big[MR_BIG_RESERVE(19)];          /* we need 10 bigs... */
 	memset(mem_big, 0, MR_BIG_RESERVE(19));    /* clear the memory */

    A=mirvar_mem(mip, mem_big, 0);       /* Initialise big numbers */
    B=mirvar_mem(mip, mem_big, 1);
    x.a=mirvar_mem(mip, mem_big, 2);
    x.b=mirvar_mem(mip, mem_big, 3);
/*    y.a=mirvar_mem(mip, mem_big, 4);
    y.b=mirvar_mem(mip, mem_big, 5); */
    a[0]=mirvar_mem(mip, mem_big, 6);
    a[1]=mirvar_mem(mip, mem_big, 7);
    p=mirvar_mem(mip, mem_big, 8);
    P.x.a=mirvar_mem(mip, mem_big, 9);
    P.x.b=mirvar_mem(mip, mem_big, 10);
    P.y.a=mirvar_mem(mip, mem_big, 11);
    P.y.b=mirvar_mem(mip, mem_big, 12);
    P.z.a=mirvar_mem(mip, mem_big, 13);
    P.z.b=mirvar_mem(mip, mem_big, 14);

	psi[0].a=mirvar_mem(mip, mem_big, 15);
	psi[0].b=mirvar_mem(mip, mem_big, 16);
	psi[1].a=mirvar_mem(mip, mem_big, 17);
	psi[1].b=mirvar_mem(mip, mem_big, 18);
 
    promptr=0;
    init_big_from_rom(p,WORDS,rom,20,&promptr);  /* Read in prime modulus p from ROM   */
    init_big_from_rom(B,WORDS,rom,20,&promptr);  /* Read in curve parameter B from ROM */
	init_big_from_rom(psi[0].a,WORDS,rom,20,&promptr);
	init_big_from_rom(psi[0].b,WORDS,rom,20,&promptr);
	init_big_from_rom(psi[1].a,WORDS,rom,20,&promptr);
	init_big_from_rom(psi[1].b,WORDS,rom,20,&promptr);
	init_big_from_rom(x.a,WORDS,rom,20,&promptr);
	init_big_from_rom(x.b,WORDS,rom,20,&promptr);
/*	init_big_from_rom(y.a,WORDS,rom,20,&promptr);
	init_big_from_rom(y.b,WORDS,rom,20,&promptr); */
                                                 
    convert(mip,-3,A);                           /* set A=1 */

/* offline calculations */

    ecurve_init(mip,A,B,p,MR_PROJECTIVE);
    mip->TWIST=TRUE;

/*	if (!ecn2_set(mip,&x,&y,&P)) 
	{
		memset(mem_big, 0, MR_BIG_RESERVE(25));
		mirexit(mip);
		return -1;
	} */

/* Alice calculates secret key */

	bytes_to_big(mip,16,pk,x.a);
	bytes_to_big(mip,16,&pk[16],x.b);
	/*bytes_to_big(mip,16,&pk[32],y.a);
	bytes_to_big(mip,16,&pk[48],y.b);*/
	bytes_to_big(mip,16,sk,a[0]);
	bytes_to_big(mip,16,&sk[16],a[1]);
	
	if (!ecn2_setx(mip,&x,&P))
	{
		memset(mem_big, 0, MR_BIG_RESERVE(19));
		mirexit(mip);
		return -1;
	}

	ecn2_mul2_gls(mip,a,&P,psi,&P);

    big_to_bytes(mip,16,P.x.a,s,TRUE);
    big_to_bytes(mip,16,P.x.b,&s[16],TRUE);

    memset(mem_big, 0, MR_BIG_RESERVE(19));
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
	unsigned char ska[32],pka[32],ssa[32];
	unsigned char skb[32],pkb[32],ssb[32];
	unsigned long long skl,pkl;

	for (j=0;j<10;j++)
	{
		keypair(ska,&skl,pka,&pkl);

		printf("Alice's public= ");
		for (i=0;i<32;i++) printf("%02x",pka[i]);
		printf("\n");

		keypair(skb,&skl,pkb,&pkl);

		printf("Bob's public=   ");
		for (i=0;i<32;i++) printf("%02x",pkb[i]);
		printf("\n");

		sharedsecret(ssa,&skl,ska,32,pkb,32);

		printf("Alice's secret= ");
		for (i=0;i<32;i++) printf("%02x",ssa[i]);
		printf("\n");

		sharedsecret(ssb,&skl,skb,32,pka,32);

		printf("Bob's secret=   ");
		for (i=0;i<32;i++) printf("%02x",ssa[i]);
		printf("\n\n");

	}
	return 0;
}	

#endif
