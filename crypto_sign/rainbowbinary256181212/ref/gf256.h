#ifndef _GF256_H
#define _GF256_H

//#include "gf.h"
#include "gf16.h"

typedef unsigned char byte;
	
const byte gf256_log_tab[] = {
          0,255,238,187,221,119,170, 85,204, 17,102,136,153, 34, 68, 51,
          1, 16,108,198,  4, 64, 27,177, 32,  2,  8,128,141,216, 54, 99,
        239,240,254, 15, 91,111,181,246,242,199, 47,124, 10, 82,160, 37,
        188,241, 31,203,148,130, 40, 73,189,109,214,219,191,195, 60,251,
        222,182,223,225,237,107,253, 30, 74, 65, 94,248,164, 20,229,143,
        120,247,183,173,127,135,218,123, 41,  5,227,121, 80,146,151, 62,
        171, 92,224,172, 14,202,186,197,131,178,113,174, 23,234, 56, 43,
         86,112,226, 93,213, 46,  7,101,149, 28, 87,184,139,117,193, 89,
        205, 48,165, 57,206,231,208, 77,220,  3, 90,147,236,126, 13,212,
         18,125, 21, 44, 49, 25,158, 71,215, 33,194, 81,145, 19,116,233,
        103,243,230, 24,166,104,156,210,110,129,118, 63,201, 45,106,134,
        137,200,144,235, 58,244, 97,168,190,  9,140,152,138, 22, 79,163,
        154,161, 75,114,207,157,155, 96,252,217,185,  6,169, 26,180, 39,
         35, 38, 66,175,232,211,162,133, 61,142, 88, 42, 98, 50,250, 36,
         69, 11, 95,132,209,167, 76, 70,196,100, 29,122,245, 72, 84,176,
         52, 83,249,179, 78,105,115, 12,192, 55,150,228, 59,159, 53, 67
};

const byte gf256_alog_tab[] = {
          1, 16, 25,137, 20, 89,203,118, 26,185, 44,225,247,142,100, 35,
         17,  9,144,157, 77,146,189,108,163,149,205, 22,121,234, 71, 50,
         24,153, 13,208,223, 47,209,207, 54, 88,219,111,147,173,117, 42,
        129,148,221, 15,240,254, 30,249,110,131,180,252, 62,216, 95,171,
         21, 73,210,255, 14,224,231,151,237, 55, 72,194,230,135,244,190,
         92,155, 45,241,238,  7,112,122,218,127,138, 36, 97,115, 74,226,
        199,182,220, 31,233,119, 10,160,165,245,174, 69, 18, 57,168, 37,
        113,106,195,246,158,125,170,  5, 80, 91,235, 87, 43,145,141, 84,
         27,169, 53,104,227,215,175, 85, 11,176,188,124,186, 28,217, 79,
        178,156, 93,139, 52,120,250, 94,187, 12,192,198,166,197,150,253,
         46,193,214,191, 76,130,164,229,183,204,  6, 96, 99, 83,107,211,
        239, 23,105,243,206, 38, 65, 82,123,202,102,  3, 48, 56,184, 60,
        248,126,154, 61,232,103, 19, 41,177,172,101, 51,  8,128,132,196,
        134,228,167,213,143,116, 58,152, 29,201, 86, 59,136,  4, 64, 66,
         98, 67,114, 90,251, 78,162,133,212,159,109,179,140, 68,  2, 32,
         33, 49, 40,161,181,236, 39, 81, 75,242,222, 63,200, 70, 34, 
          1, 16, 25,137, 20, 89,203,118, 26,185, 44,225,247,142,100, 35,
         17,  9,144,157, 77,146,189,108,163,149,205, 22,121,234, 71, 50,
         24,153, 13,208,223, 47,209,207, 54, 88,219,111,147,173,117, 42,
        129,148,221, 15,240,254, 30,249,110,131,180,252, 62,216, 95,171,
         21, 73,210,255, 14,224,231,151,237, 55, 72,194,230,135,244,190,
         92,155, 45,241,238,  7,112,122,218,127,138, 36, 97,115, 74,226,
        199,182,220, 31,233,119, 10,160,165,245,174, 69, 18, 57,168, 37,
        113,106,195,246,158,125,170,  5, 80, 91,235, 87, 43,145,141, 84,
         27,169, 53,104,227,215,175, 85, 11,176,188,124,186, 28,217, 79,
        178,156, 93,139, 52,120,250, 94,187, 12,192,198,166,197,150,253,
         46,193,214,191, 76,130,164,229,183,204,  6, 96, 99, 83,107,211,
        239, 23,105,243,206, 38, 65, 82,123,202,102,  3, 48, 56,184, 60,
        248,126,154, 61,232,103, 19, 41,177,172,101, 51,  8,128,132,196,
        134,228,167,213,143,116, 58,152, 29,201, 86, 59,136,  4, 64, 66,
         98, 67,114, 90,251, 78,162,133,212,159,109,179,140, 68,  2, 32,
         33, 49, 40,161,181,236, 39, 81, 75,242,222, 63,200, 70, 34,
          1, 16, 25,137, 20, 89,203,118, 26,185, 44,225,247,142,100, 35,
         17,  9,144,157, 77,146,189,108,163,149,205, 22,121,234, 71, 50,
         24,153, 13,208,223, 47,209,207, 54, 88,219,111,147,173,117, 42,
        129,148,221, 15,240,254, 30,249,110,131,180,252, 62,216, 95,171,
         21, 73,210,255, 14,224,231,151,237, 55, 72,194,230,135,244,190,
         92,155, 45,241,238,  7,112,122,218,127,138, 36, 97,115, 74,226,
        199,182,220, 31,233,119, 10,160,165,245,174, 69, 18, 57,168, 37,
        113,106,195,246,158,125,170,  5, 80, 91,235, 87, 43,145,141, 84,
         27,169, 53,104,227,215,175, 85, 11,176,188,124,186, 28,217, 79,
        178,156, 93,139, 52,120,250, 94,187, 12,192,198,166,197,150,253,
         46,193,214,191, 76,130,164,229,183,204,  6, 96, 99, 83,107,211,
        239, 23,105,243,206, 38, 65, 82,123,202,102,  3, 48, 56,184, 60,
        248,126,154, 61,232,103, 19, 41,177,172,101, 51,  8,128,132,196,
        134,228,167,213,143,116, 58,152, 29,201, 86, 59,136,  4, 64, 66,
         98, 67,114, 90,251, 78,162,133,212,159,109,179,140, 68,  2, 32,
         33, 49, 40,161,181,236, 39, 81, 75,242,222, 63,200, 70, 34,
          1, 16, 25,137, 20, 89,203,118, 26,185, 44,225,247,142,100, 35,
         17,  9,144,157, 77,146,189,108,163,149,205, 22,121,234, 71, 50,
         24,153
};


template <>
inline const gf<256> _mul( const gf<256> &a , const gf<256> &b)
{
	return ((a.v==0)|(b.v==0))? 0: gf256_alog_tab[(int)gf256_log_tab[a.v] + (int)gf256_log_tab[b.v]];
}


template <>
inline const gf <256> _inv( const gf <256> &a )
{
	if( 0 == a.v) { puts("inv of 0"); exit(-1); }
	return gf256_alog_tab[255-(int)gf256_log_tab[a.v]];
}



static const __m128i GFV16Mul_H[256] = {
	_mm_set_epi32(0x00000000,0x00000000,0x00000000,0x00000000),
	_mm_set_epi32(0xf0e0d0c0,0xb0a09080,0x70605040,0x30201000),
	_mm_set_epi32(0xd0f090b0,0x50701030,0xe0c0a080,0x60402000),
	_mm_set_epi32(0x20104070,0xe0d080b0,0x90a0f0c0,0x50603000),
	_mm_set_epi32(0x90d01050,0xa0e02060,0xf0b07030,0xc0804000),
	_mm_set_epi32(0x6030c090,0x1040b0e0,0x80d02070,0xf0a05000),
	_mm_set_epi32(0x402080e0,0xf0903050,0x1070d0b0,0xa0c06000),
	_mm_set_epi32(0xb0c05020,0x4030a0d0,0x601080f0,0x90e07000),
	_mm_set_epi32(0x109020a0,0x70f040c0,0xd050e060,0xb0308000),
	_mm_set_epi32(0xe070f060,0xc050d040,0xa030b020,0x80109000),
	_mm_set_epi32(0xc060b010,0x208050f0,0x309040e0,0xd070a000),
	_mm_set_epi32(0x308060d0,0x9020c070,0x40f010a0,0xe050b000),
	_mm_set_epi32(0x804030f0,0xd01060a0,0x20e09050,0x70b0c000),
	_mm_set_epi32(0x70a0e030,0x60b0f020,0x5080c010,0x4090d000),
	_mm_set_epi32(0x50b0a040,0x80607090,0xc02030d0,0x10f0e000),
	_mm_set_epi32(0xa0507080,0x30c0e010,0xb0406090,0x20d0f000),
	_mm_set_epi32(0xfee7dfc6,0xbca59d84,0x7a635b42,0x38211900),
	_mm_set_epi32(0x0e070f06,0x0c050d04,0x0a030b02,0x08010900),
	_mm_set_epi32(0x2e174f76,0xecd58db4,0x9aa3fbc2,0x58613900),
	_mm_set_epi32(0xdef79fb6,0x5c751d34,0xeac3ab82,0x68412900),
	_mm_set_epi32(0x6e37cf96,0x1c45bde4,0x8ad32b72,0xf8a15900),
	_mm_set_epi32(0x9ed71f56,0xace52d64,0xfab37b32,0xc8814900),
	_mm_set_epi32(0xbec75f26,0x4c35add4,0x6a138bf2,0x98e17900),
	_mm_set_epi32(0x4e278fe6,0xfc953d54,0x1a73dbb2,0xa8c16900),
	_mm_set_epi32(0xee77ff66,0xcc55dd44,0xaa33bb22,0x88119900),
	_mm_set_epi32(0x1e972fa6,0x7cf54dc4,0xda53eb62,0xb8318900),
	_mm_set_epi32(0x3e876fd6,0x9c25cd74,0x4af31ba2,0xe851b900),
	_mm_set_epi32(0xce67bf16,0x2c855df4,0x3a934be2,0xd871a900),
	_mm_set_epi32(0x7ea7ef36,0x6cb5fd24,0x5a83cb12,0x4891d900),
	_mm_set_epi32(0x8e473ff6,0xdc156da4,0x2ae39b52,0x78b1c900),
	_mm_set_epi32(0xae577f86,0x3cc5ed14,0xba436b92,0x28d1f900),
	_mm_set_epi32(0x5eb7af46,0x8c657d94,0xca233bd2,0x18f1e900),
	_mm_set_epi32(0xdffe9dbc,0x5b7a1938,0xe7c6a584,0x63422100),
	_mm_set_epi32(0x2f1e4d7c,0xebda89b8,0x97a6f5c4,0x53623100),
	_mm_set_epi32(0x0f0e0d0c,0x0b0a0908,0x07060504,0x03020100),
	_mm_set_epi32(0xffeeddcc,0xbbaa9988,0x77665544,0x33221100),
	_mm_set_epi32(0x4f2e8dec,0xfb9a3958,0x1776d5b4,0xa3c26100),
	_mm_set_epi32(0xbfce5d2c,0x4b3aa9d8,0x671685f4,0x93e27100),
	_mm_set_epi32(0x9fde1d5c,0xabea2968,0xf7b67534,0xc3824100),
	_mm_set_epi32(0x6f3ecd9c,0x1b4ab9e8,0x87d62574,0xf3a25100),
	_mm_set_epi32(0xcf6ebd1c,0x2b8a59f8,0x379645e4,0xd372a100),
	_mm_set_epi32(0x3f8e6ddc,0x9b2ac978,0x47f615a4,0xe352b100),
	_mm_set_epi32(0x1f9e2dac,0x7bfa49c8,0xd756e564,0xb3328100),
	_mm_set_epi32(0xef7efd6c,0xcb5ad948,0xa736b524,0x83129100),
	_mm_set_epi32(0x5fbead4c,0x8b6a7998,0xc72635d4,0x13f2e100),
	_mm_set_epi32(0xaf5e7d8c,0x3bcae918,0xb7466594,0x23d2f100),
	_mm_set_epi32(0x8f4e3dfc,0xdb1a69a8,0x27e69554,0x73b2c100),
	_mm_set_epi32(0x7faeed3c,0x6bbaf928,0x5786c514,0x4392d100),
	_mm_set_epi32(0x2119427a,0xe7df84bc,0x9da5fec6,0x5b633800),
	_mm_set_epi32(0xd1f992ba,0x577f143c,0xedc5ae86,0x6b432800),
	_mm_set_epi32(0xf1e9d2ca,0xb7af948c,0x7d655e46,0x3b231800),
	_mm_set_epi32(0x0109020a,0x070f040c,0x0d050e06,0x0b030800),
	_mm_set_epi32(0xb1c9522a,0x473fa4dc,0x6d158ef6,0x9be37800),
	_mm_set_epi32(0x412982ea,0xf79f345c,0x1d75deb6,0xabc36800),
	_mm_set_epi32(0x6139c29a,0x174fb4ec,0x8dd52e76,0xfba35800),
	_mm_set_epi32(0x91d9125a,0xa7ef246c,0xfdb57e36,0xcb834800),
	_mm_set_epi32(0x318962da,0x972fc47c,0x4df51ea6,0xeb53b800),
	_mm_set_epi32(0xc169b21a,0x278f54fc,0x3d954ee6,0xdb73a800),
	_mm_set_epi32(0xe179f26a,0xc75fd44c,0xad35be26,0x8b139800),
	_mm_set_epi32(0x119922aa,0x77ff44cc,0xdd55ee66,0xbb338800),
	_mm_set_epi32(0xa159728a,0x37cfe41c,0xbd456e96,0x2bd3f800),
	_mm_set_epi32(0x51b9a24a,0x876f749c,0xcd253ed6,0x1bf3e800),
	_mm_set_epi32(0x71a9e23a,0x67bff42c,0x5d85ce16,0x4b93d800),
	_mm_set_epi32(0x814932fa,0xd71f64ac,0x2de59e56,0x7bb3c800),
	_mm_set_epi32(0x9ddf195b,0xa5e72163,0xfebc7a38,0xc6844200),
	_mm_set_epi32(0x6d3fc99b,0x1547b1e3,0x8edc2a78,0xf6a45200),
	_mm_set_epi32(0x4d2f89eb,0xf5973153,0x1e7cdab8,0xa6c46200),
	_mm_set_epi32(0xbdcf592b,0x4537a1d3,0x6e1c8af8,0x96e47200),
	_mm_set_epi32(0x0d0f090b,0x05070103,0x0e0c0a08,0x06040200),
	_mm_set_epi32(0xfdefd9cb,0xb5a79183,0x7e6c5a48,0x36241200),
	_mm_set_epi32(0xddff99bb,0x55771133,0xeeccaa88,0x66442200),
	_mm_set_epi32(0x2d1f497b,0xe5d781b3,0x9eacfac8,0x56643200),
	_mm_set_epi32(0x8d4f39fb,0xd51761a3,0x2eec9a58,0x76b4c200),
	_mm_set_epi32(0x7dafe93b,0x65b7f123,0x5e8cca18,0x4694d200),
	_mm_set_epi32(0x5dbfa94b,0x85677193,0xce2c3ad8,0x16f4e200),
	_mm_set_epi32(0xad5f798b,0x35c7e113,0xbe4c6a98,0x26d4f200),
	_mm_set_epi32(0x1d9f29ab,0x75f741c3,0xde5cea68,0xb6348200),
	_mm_set_epi32(0xed7ff96b,0xc557d143,0xae3cba28,0x86149200),
	_mm_set_epi32(0xcd6fb91b,0x258751f3,0x3e9c4ae8,0xd674a200),
	_mm_set_epi32(0x3d8f69db,0x9527c173,0x4efc1aa8,0xe654b200),
	_mm_set_epi32(0x6338c69d,0x1942bce7,0x84df217a,0xfea55b00),
	_mm_set_epi32(0x93d8165d,0xa9e22c67,0xf4bf713a,0xce854b00),
	_mm_set_epi32(0xb3c8562d,0x4932acd7,0x641f81fa,0x9ee57b00),
	_mm_set_epi32(0x432886ed,0xf9923c57,0x147fd1ba,0xaec56b00),
	_mm_set_epi32(0xf3e8d6cd,0xb9a29c87,0x746f514a,0x3e251b00),
	_mm_set_epi32(0x0308060d,0x09020c07,0x040f010a,0x0e050b00),
	_mm_set_epi32(0x2318467d,0xe9d28cb7,0x94aff1ca,0x5e653b00),
	_mm_set_epi32(0xd3f896bd,0x59721c37,0xe4cfa18a,0x6e452b00),
	_mm_set_epi32(0x73a8e63d,0x69b2fc27,0x548fc11a,0x4e95db00),
	_mm_set_epi32(0x834836fd,0xd9126ca7,0x24ef915a,0x7eb5cb00),
	_mm_set_epi32(0xa358768d,0x39c2ec17,0xb44f619a,0x2ed5fb00),
	_mm_set_epi32(0x53b8a64d,0x89627c97,0xc42f31da,0x1ef5eb00),
	_mm_set_epi32(0xe378f66d,0xc952dc47,0xa43fb12a,0x8e159b00),
	_mm_set_epi32(0x139826ad,0x79f24cc7,0xd45fe16a,0xbe358b00),
	_mm_set_epi32(0x338866dd,0x9922cc77,0x44ff11aa,0xee55bb00),
	_mm_set_epi32(0xc368b61d,0x29825cf7,0x349f41ea,0xde75ab00),
	_mm_set_epi32(0x422184e7,0xfe9d385b,0x197adfbc,0xa5c66300),
	_mm_set_epi32(0xb2c15427,0x4e3da8db,0x691a8ffc,0x95e67300),
	_mm_set_epi32(0x92d11457,0xaeed286b,0xf9ba7f3c,0xc5864300),
	_mm_set_epi32(0x6231c497,0x1e4db8eb,0x89da2f7c,0xf5a65300),
	_mm_set_epi32(0xd2f194b7,0x5e7d183b,0xe9caaf8c,0x65462300),
	_mm_set_epi32(0x22114477,0xeedd88bb,0x99aaffcc,0x55663300),
	_mm_set_epi32(0x02010407,0x0e0d080b,0x090a0f0c,0x05060300),
	_mm_set_epi32(0xf2e1d4c7,0xbead988b,0x796a5f4c,0x35261300),
	_mm_set_epi32(0x52b1a447,0x8e6d789b,0xc92a3fdc,0x15f6e300),
	_mm_set_epi32(0xa2517487,0x3ecde81b,0xb94a6f9c,0x25d6f300),
	_mm_set_epi32(0x824134f7,0xde1d68ab,0x29ea9f5c,0x75b6c300),
	_mm_set_epi32(0x72a1e437,0x6ebdf82b,0x598acf1c,0x4596d300),
	_mm_set_epi32(0xc261b417,0x2e8d58fb,0x399a4fec,0xd576a300),
	_mm_set_epi32(0x328164d7,0x9e2dc87b,0x49fa1fac,0xe556b300),
	_mm_set_epi32(0x129124a7,0x7efd48cb,0xd95aef6c,0xb5368300),
	_mm_set_epi32(0xe271f467,0xce5dd84b,0xa93abf2c,0x85169300),
	_mm_set_epi32(0xbcc65b21,0x4238a5df,0x631984fe,0x9de77a00),
	_mm_set_epi32(0x4c268be1,0xf298355f,0x1379d4be,0xadc76a00),
	_mm_set_epi32(0x6c36cb91,0x1248b5ef,0x83d9247e,0xfda75a00),
	_mm_set_epi32(0x9cd61b51,0xa2e8256f,0xf3b9743e,0xcd874a00),
	_mm_set_epi32(0x2c164b71,0xe2d885bf,0x93a9f4ce,0x5d673a00),
	_mm_set_epi32(0xdcf69bb1,0x5278153f,0xe3c9a48e,0x6d472a00),
	_mm_set_epi32(0xfce6dbc1,0xb2a8958f,0x7369544e,0x3d271a00),
	_mm_set_epi32(0x0c060b01,0x0208050f,0x0309040e,0x0d070a00),
	_mm_set_epi32(0xac567b81,0x32c8e51f,0xb349649e,0x2dd7fa00),
	_mm_set_epi32(0x5cb6ab41,0x8268759f,0xc32934de,0x1df7ea00),
	_mm_set_epi32(0x7ca6eb31,0x62b8f52f,0x5389c41e,0x4d97da00),
	_mm_set_epi32(0x8c463bf1,0xd21865af,0x23e9945e,0x7db7ca00),
	_mm_set_epi32(0x3c866bd1,0x9228c57f,0x43f914ae,0xed57ba00),
	_mm_set_epi32(0xcc66bb11,0x228855ff,0x339944ee,0xdd77aa00),
	_mm_set_epi32(0xec76fb61,0xc258d54f,0xa339b42e,0x8d179a00),
	_mm_set_epi32(0x1c962ba1,0x72f845cf,0xd359e46e,0xbd378a00),
	_mm_set_epi32(0x199d21a5,0x7afe42c6,0xdf5be763,0xbc388400),
	_mm_set_epi32(0xe97df165,0xca5ed246,0xaf3bb723,0x8c189400),
	_mm_set_epi32(0xc96db115,0x2a8e52f6,0x3f9b47e3,0xdc78a400),
	_mm_set_epi32(0x398d61d5,0x9a2ec276,0x4ffb17a3,0xec58b400),
	_mm_set_epi32(0x894d31f5,0xda1e62a6,0x2feb9753,0x7cb8c400),
	_mm_set_epi32(0x79ade135,0x6abef226,0x5f8bc713,0x4c98d400),
	_mm_set_epi32(0x59bda145,0x8a6e7296,0xcf2b37d3,0x1cf8e400),
	_mm_set_epi32(0xa95d7185,0x3acee216,0xbf4b6793,0x2cd8f400),
	_mm_set_epi32(0x090d0105,0x0a0e0206,0x0f0b0703,0x0c080400),
	_mm_set_epi32(0xf9edd1c5,0xbaae9286,0x7f6b5743,0x3c281400),
	_mm_set_epi32(0xd9fd91b5,0x5a7e1236,0xefcba783,0x6c482400),
	_mm_set_epi32(0x291d4175,0xeade82b6,0x9fabf7c3,0x5c683400),
	_mm_set_epi32(0x99dd1155,0xaaee2266,0xffbb7733,0xcc884400),
	_mm_set_epi32(0x693dc195,0x1a4eb2e6,0x8fdb2773,0xfca85400),
	_mm_set_epi32(0x492d81e5,0xfa9e3256,0x1f7bd7b3,0xacc86400),
	_mm_set_epi32(0xb9cd5125,0x4a3ea2d6,0x6f1b87f3,0x9ce87400),
	_mm_set_epi32(0xe77afe63,0xc65bdf42,0xa538bc21,0x84199d00),
	_mm_set_epi32(0x179a2ea3,0x76fb4fc2,0xd558ec61,0xb4398d00),
	_mm_set_epi32(0x378a6ed3,0x962bcf72,0x45f81ca1,0xe459bd00),
	_mm_set_epi32(0xc76abe13,0x268b5ff2,0x35984ce1,0xd479ad00),
	_mm_set_epi32(0x77aaee33,0x66bbff22,0x5588cc11,0x4499dd00),
	_mm_set_epi32(0x874a3ef3,0xd61b6fa2,0x25e89c51,0x74b9cd00),
	_mm_set_epi32(0xa75a7e83,0x36cbef12,0xb5486c91,0x24d9fd00),
	_mm_set_epi32(0x57baae43,0x866b7f92,0xc5283cd1,0x14f9ed00),
	_mm_set_epi32(0xf7eadec3,0xb6ab9f82,0x75685c41,0x34291d00),
	_mm_set_epi32(0x070a0e03,0x060b0f02,0x05080c01,0x04090d00),
	_mm_set_epi32(0x271a4e73,0xe6db8fb2,0x95a8fcc1,0x54693d00),
	_mm_set_epi32(0xd7fa9eb3,0x567b1f32,0xe5c8ac81,0x64492d00),
	_mm_set_epi32(0x673ace93,0x164bbfe2,0x85d82c71,0xf4a95d00),
	_mm_set_epi32(0x97da1e53,0xa6eb2f62,0xf5b87c31,0xc4894d00),
	_mm_set_epi32(0xb7ca5e23,0x463bafd2,0x65188cf1,0x94e97d00),
	_mm_set_epi32(0x472a8ee3,0xf69b3f52,0x1578dcb1,0xa4c96d00),
	_mm_set_epi32(0xc663bc19,0x21845bfe,0x389d42e7,0xdf7aa500),
	_mm_set_epi32(0x36836cd9,0x9124cb7e,0x48fd12a7,0xef5ab500),
	_mm_set_epi32(0x16932ca9,0x71f44bce,0xd85de267,0xbf3a8500),
	_mm_set_epi32(0xe673fc69,0xc154db4e,0xa83db227,0x8f1a9500),
	_mm_set_epi32(0x56b3ac49,0x81647b9e,0xc82d32d7,0x1ffae500),
	_mm_set_epi32(0xa6537c89,0x31c4eb1e,0xb84d6297,0x2fdaf500),
	_mm_set_epi32(0x86433cf9,0xd1146bae,0x28ed9257,0x7fbac500),
	_mm_set_epi32(0x76a3ec39,0x61b4fb2e,0x588dc217,0x4f9ad500),
	_mm_set_epi32(0xd6f39cb9,0x51741b3e,0xe8cda287,0x6f4a2500),
	_mm_set_epi32(0x26134c79,0xe1d48bbe,0x98adf2c7,0x5f6a3500),
	_mm_set_epi32(0x06030c09,0x01040b0e,0x080d0207,0x0f0a0500),
	_mm_set_epi32(0xf6e3dcc9,0xb1a49b8e,0x786d5247,0x3f2a1500),
	_mm_set_epi32(0x46238ce9,0xf1943b5e,0x187dd2b7,0xafca6500),
	_mm_set_epi32(0xb6c35c29,0x4134abde,0x681d82f7,0x9fea7500),
	_mm_set_epi32(0x96d31c59,0xa1e42b6e,0xf8bd7237,0xcf8a4500),
	_mm_set_epi32(0x6633cc99,0x1144bbee,0x88dd2277,0xffaa5500),
	_mm_set_epi32(0x388463df,0x9d21c67a,0x42fe19a5,0xe75bbc00),
	_mm_set_epi32(0xc864b31f,0x2d8156fa,0x329e49e5,0xd77bac00),
	_mm_set_epi32(0xe874f36f,0xcd51d64a,0xa23eb925,0x871b9c00),
	_mm_set_epi32(0x189423af,0x7df146ca,0xd25ee965,0xb73b8c00),
	_mm_set_epi32(0xa854738f,0x3dc1e61a,0xb24e6995,0x27dbfc00),
	_mm_set_epi32(0x58b4a34f,0x8d61769a,0xc22e39d5,0x17fbec00),
	_mm_set_epi32(0x78a4e33f,0x6db1f62a,0x528ec915,0x479bdc00),
	_mm_set_epi32(0x884433ff,0xdd1166aa,0x22ee9955,0x77bbcc00),
	_mm_set_epi32(0x2814437f,0xedd186ba,0x92aef9c5,0x576b3c00),
	_mm_set_epi32(0xd8f493bf,0x5d71163a,0xe2cea985,0x674b2c00),
	_mm_set_epi32(0xf8e4d3cf,0xbda1968a,0x726e5945,0x372b1c00),
	_mm_set_epi32(0x0804030f,0x0d01060a,0x020e0905,0x070b0c00),
	_mm_set_epi32(0xb8c4532f,0x4d31a6da,0x621e89f5,0x97eb7c00),
	_mm_set_epi32(0x482483ef,0xfd91365a,0x127ed9b5,0xa7cb6c00),
	_mm_set_epi32(0x6834c39f,0x1d41b6ea,0x82de2975,0xf7ab5c00),
	_mm_set_epi32(0x98d4135f,0xade1266a,0xf2be7935,0xc78b4c00),
	_mm_set_epi32(0x844238fe,0xdf1963a5,0x21e79d5b,0x7abcc600),
	_mm_set_epi32(0x74a2e83e,0x6fb9f325,0x5187cd1b,0x4a9cd600),
	_mm_set_epi32(0x54b2a84e,0x8f697395,0xc1273ddb,0x1afce600),
	_mm_set_epi32(0xa452788e,0x3fc9e315,0xb1476d9b,0x2adcf600),
	_mm_set_epi32(0x149228ae,0x7ff943c5,0xd157ed6b,0xba3c8600),
	_mm_set_epi32(0xe472f86e,0xcf59d345,0xa137bd2b,0x8a1c9600),
	_mm_set_epi32(0xc462b81e,0x2f8953f5,0x31974deb,0xda7ca600),
	_mm_set_epi32(0x348268de,0x9f29c375,0x41f71dab,0xea5cb600),
	_mm_set_epi32(0x94d2185e,0xafe92365,0xf1b77d3b,0xca8c4600),
	_mm_set_epi32(0x6432c89e,0x1f49b3e5,0x81d72d7b,0xfaac5600),
	_mm_set_epi32(0x442288ee,0xff993355,0x1177ddbb,0xaacc6600),
	_mm_set_epi32(0xb4c2582e,0x4f39a3d5,0x61178dfb,0x9aec7600),
	_mm_set_epi32(0x0402080e,0x0f090305,0x01070d0b,0x0a0c0600),
	_mm_set_epi32(0xf4e2d8ce,0xbfa99385,0x71675d4b,0x3a2c1600),
	_mm_set_epi32(0xd4f298be,0x5f791335,0xe1c7ad8b,0x6a4c2600),
	_mm_set_epi32(0x2412487e,0xefd983b5,0x91a7fdcb,0x5a6c3600),
	_mm_set_epi32(0x7aa5e738,0x63bcfe21,0x5b84c619,0x429ddf00),
	_mm_set_epi32(0x8a4537f8,0xd31c6ea1,0x2be49659,0x72bdcf00),
	_mm_set_epi32(0xaa557788,0x33ccee11,0xbb446699,0x22ddff00),
	_mm_set_epi32(0x5ab5a748,0x836c7e91,0xcb2436d9,0x12fdef00),
	_mm_set_epi32(0xea75f768,0xc35cde41,0xab34b629,0x821d9f00),
	_mm_set_epi32(0x1a9527a8,0x73fc4ec1,0xdb54e669,0xb23d8f00),
	_mm_set_epi32(0x3a8567d8,0x932cce71,0x4bf416a9,0xe25dbf00),
	_mm_set_epi32(0xca65b718,0x238c5ef1,0x3b9446e9,0xd27daf00),
	_mm_set_epi32(0x6a35c798,0x134cbee1,0x8bd42679,0xf2ad5f00),
	_mm_set_epi32(0x9ad51758,0xa3ec2e61,0xfbb47639,0xc28d4f00),
	_mm_set_epi32(0xbac55728,0x433caed1,0x6b1486f9,0x92ed7f00),
	_mm_set_epi32(0x4a2587e8,0xf39c3e51,0x1b74d6b9,0xa2cd6f00),
	_mm_set_epi32(0xfae5d7c8,0xb3ac9e81,0x7b645649,0x322d1f00),
	_mm_set_epi32(0x0a050708,0x030c0e01,0x0b040609,0x020d0f00),
	_mm_set_epi32(0x2a154778,0xe3dc8eb1,0x9ba4f6c9,0x526d3f00),
	_mm_set_epi32(0xdaf597b8,0x537c1e31,0xebc4a689,0x624d2f00),
	_mm_set_epi32(0x5bbca542,0x84637a9d,0xc62138df,0x19fee700),
	_mm_set_epi32(0xab5c7582,0x34c3ea1d,0xb641689f,0x29def700),
	_mm_set_epi32(0x8b4c35f2,0xd4136aad,0x26e1985f,0x79bec700),
	_mm_set_epi32(0x7bace532,0x64b3fa2d,0x5681c81f,0x499ed700),
	_mm_set_epi32(0xcb6cb512,0x24835afd,0x369148ef,0xd97ea700),
	_mm_set_epi32(0x3b8c65d2,0x9423ca7d,0x46f118af,0xe95eb700),
	_mm_set_epi32(0x1b9c25a2,0x74f34acd,0xd651e86f,0xb93e8700),
	_mm_set_epi32(0xeb7cf562,0xc453da4d,0xa631b82f,0x891e9700),
	_mm_set_epi32(0x4b2c85e2,0xf4933a5d,0x1671d8bf,0xa9ce6700),
	_mm_set_epi32(0xbbcc5522,0x4433aadd,0x661188ff,0x99ee7700),
	_mm_set_epi32(0x9bdc1552,0xa4e32a6d,0xf6b1783f,0xc98e4700),
	_mm_set_epi32(0x6b3cc592,0x1443baed,0x86d1287f,0xf9ae5700),
	_mm_set_epi32(0xdbfc95b2,0x54731a3d,0xe6c1a88f,0x694e2700),
	_mm_set_epi32(0x2b1c4572,0xe4d38abd,0x96a1f8cf,0x596e3700),
	_mm_set_epi32(0x0b0c0502,0x04030a0d,0x0601080f,0x090e0700),
	_mm_set_epi32(0xfbecd5c2,0xb4a39a8d,0x7661584f,0x392e1700),
	_mm_set_epi32(0xa55b7a84,0x38c6e719,0xbc42639d,0x21dffe00),
	_mm_set_epi32(0x55bbaa44,0x88667799,0xcc2233dd,0x11ffee00),
	_mm_set_epi32(0x75abea34,0x68b6f729,0x5c82c31d,0x419fde00),
	_mm_set_epi32(0x854b3af4,0xd81667a9,0x2ce2935d,0x71bfce00),
	_mm_set_epi32(0x358b6ad4,0x9826c779,0x4cf213ad,0xe15fbe00),
	_mm_set_epi32(0xc56bba14,0x288657f9,0x3c9243ed,0xd17fae00),
	_mm_set_epi32(0xe57bfa64,0xc856d749,0xac32b32d,0x811f9e00),
	_mm_set_epi32(0x159b2aa4,0x78f647c9,0xdc52e36d,0xb13f8e00),
	_mm_set_epi32(0xb5cb5a24,0x4836a7d9,0x6c1283fd,0x91ef7e00),
	_mm_set_epi32(0x452b8ae4,0xf8963759,0x1c72d3bd,0xa1cf6e00),
	_mm_set_epi32(0x653bca94,0x1846b7e9,0x8cd2237d,0xf1af5e00),
	_mm_set_epi32(0x95db1a54,0xa8e62769,0xfcb2733d,0xc18f4e00),
	_mm_set_epi32(0x251b4a74,0xe8d687b9,0x9ca2f3cd,0x516f3e00),
	_mm_set_epi32(0xd5fb9ab4,0x58761739,0xecc2a38d,0x614f2e00),
	_mm_set_epi32(0xf5ebdac4,0xb8a69789,0x7c62534d,0x312f1e00),
	_mm_set_epi32(0x050b0a04,0x08060709,0x0c02030d,0x010f0e00)};

__m128i multable_h(unsigned char v) __attribute__((const));
__m128i multable_h(unsigned char v){return GFV16Mul_H[v];}


template <>
inline const gfv_unit<256> _mul( const gfv_unit<256> &a , const gf<256> & b )
{
	return _mm_xor_si128( _mm_shuffle_epi8(multable(b.v), _mm_and_si128(a.v,_mask_low))
				, _mm_shuffle_epi8(multable_h(b.v), _mm_and_si128( _mm_srli_epi16(a.v,4) ,_mask_low) ) );
}

#define AND(a,b) (_mm_and_si128((a),(b)))
#define XOR(a,b) (_mm_xor_si128((a),(b)))
#define OR(a,b) (_mm_or_si128((a),(b)))
#define SR(a,i) (_mm_srli_epi32((a),(i)))
#define SL(a,i) (_mm_slli_epi32((a),(i)))
//  gf16  (a3,a2,a1,a0)*(1001)=(a0,a3,a2,a0^a1)
inline __m128i _gf16v_mul_1001( __m128i a , __m128i b )
{
	__m128i & a0= a;
	__m128i & b0= b;
	__m128i a1=SR(a,1);
	__m128i b1=SR(b,1);
	__m128i a2=SR(a,2);
	__m128i b2=SR(b,2);
	__m128i a3=SR(a,3);
	__m128i b3=SR(b,3);
	__m128i r0 = AND(m_bit0,XOR(XOR(AND(b1,a3),AND(b2,a2)),XOR(AND(b3,a1),AND(b0,a0)))); //(b1&a3)^(b2&a2)^(b3&a1)^(b0&a0);
	__m128i r1 = AND(m_bit0,XOR(XOR(AND(XOR(b1,b2),a3),AND(XOR(b2,b3),a2)),XOR(AND(XOR(b0,b3),a1),AND(b1,a0)))); //((b1^b2)&a3)^((b2^b3)&a2)^((b0^b3)&a1)^(b1&a0);
	__m128i r2 = AND(m_bit0,XOR(XOR(AND(a3,XOR(b2,b3)),AND(a2,XOR(b0,b3))),XOR(AND(b1,a1),AND(b2,a0))));//((b2^b3)&a3)^((b0^b3)&a2)^(b1&a1)^(b2&a0);
	__m128i r3 = AND(m_bit0,XOR(XOR(AND(a3,XOR(b0,b3)),AND(b1,a2)),XOR(AND(b2,a1),AND(b3,a0)))); //((b0^b3)&a3)^(b1&a2)^(b2&a1)^(b3&a0);
	return OR(OR(XOR(r0,r1),SL(r2,1)),OR(SL(r3,2),SL(r0,3)));
}
#undef AND
#undef OR
#undef XOR
#undef SR
#undef SL

/*
 gf256 multiplication as two gf16 polynomial multiplication
 
 (ah,al)*(bh,bl) = ah*bh , (ah+al)*(bh+bl)-ah*bh-al*bl , al*bl
      ah*bh , ,  =       ,                 ah*bh       , 1001 * ah*bh
 (ah,al)*(bh,bl) =       , (ah+al)*(bh+bl)-al*bl , al*bl + 1001*ah*bh
*/
template <>
inline const gfv_unit<256> _mul( const gfv_unit<256> & a, const gfv_unit<256> &b )
{
	// (ah+al,al) mul (bh+bl,bl)
	__m128i m1 = _gf16v_mul( _mm_xor_si128(a.v,_mm_slli_epi32(_mm_and_si128(a.v,_mask_low),4)) 
						, _mm_xor_si128(b.v,_mm_slli_epi32(_mm_and_si128(b.v,_mask_low),4)) );
	__m128i m2 = _gf16v_mul_1001(a.v,b.v);
	return _mm_xor_si128(_mm_xor_si128(m1,_mm_slli_epi32(_mm_and_si128(m1,_mask_low),4)),_mm_and_si128(_mm_srli_epi32(m2,4),_mask_low));
}

#endif
