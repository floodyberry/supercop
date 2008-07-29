/*
 * hector/src/x86_32/precompute32_out.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

dummy[3] = 0x1fd8e;
dummy[2] = 0x56ecdf3d;
dummy[1] = 0xc6aa3ad6;
dummy[0] = 0xcb57b5b;
Kset_uipoly_wide((*(generator_multiples1 + 1))->m_U1, dummy, 4);

dummy[3] = 0xb2d0;
dummy[2] = 0x51a6499d;
dummy[1] = 0x125ebea;
dummy[0] = 0x6d544cf3;
Kset_uipoly_wide((*(generator_multiples1 + 1))->m_U0, dummy, 4);

dummy[3] = 0x0;
dummy[2] = 0x0;
dummy[1] = 0x0;
dummy[0] = 0x1;
Kset_uipoly_wide((*(generator_multiples1 + 1))->m_V1, dummy, 4);

dummy[3] = 0x0;
dummy[2] = 0x0;
dummy[1] = 0x0;
dummy[0] = 0x40;
Kset_uipoly_wide((*(generator_multiples1 + 1))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 1))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 1))->m_z, 1);

dummy[3] = 0x1fca3;
dummy[2] = 0x23c89eaf;
dummy[1] = 0xc2cd17bd;
dummy[0] = 0xfc7d7cc2;
Kset_uipoly_wide((*(generator_multiples2 + 1))->m_U1, dummy, 4);

dummy[3] = 0x34d7;
dummy[2] = 0xc25080a8;
dummy[1] = 0x7b66eb58;
dummy[0] = 0xbf2b73a6;
Kset_uipoly_wide((*(generator_multiples2 + 1))->m_U0, dummy, 4);

dummy[3] = 0xfb42;
dummy[2] = 0x5146082e;
dummy[1] = 0x18299fe8;
dummy[0] = 0xa236d189;
Kset_uipoly_wide((*(generator_multiples2 + 1))->m_V1, dummy, 4);

dummy[3] = 0x939d;
dummy[2] = 0x1dc8415c;
dummy[1] = 0x392c6c5a;
dummy[0] = 0xe07f302e;
Kset_uipoly_wide((*(generator_multiples2 + 1))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 1))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 1))->m_z, 1);

dummy[3] = 0xd789;
dummy[2] = 0xc03d3b1e;
dummy[1] = 0xa248f993;
dummy[0] = 0x99bf041d;
Kset_uipoly_wide((*(generator_multiples1 + 2))->m_U1, dummy, 4);

dummy[3] = 0x5e6d;
dummy[2] = 0xfb00368;
dummy[1] = 0x8986d562;
dummy[0] = 0xe1bb0a59;
Kset_uipoly_wide((*(generator_multiples1 + 2))->m_U0, dummy, 4);

dummy[3] = 0xcedc;
dummy[2] = 0x65d38ba5;
dummy[1] = 0x9daa6f7e;
dummy[0] = 0x21dcd8ec;
Kset_uipoly_wide((*(generator_multiples1 + 2))->m_V1, dummy, 4);

dummy[3] = 0x14e1e;
dummy[2] = 0x8b81680f;
dummy[1] = 0x3db2b8bb;
dummy[0] = 0xec9aeea2;
Kset_uipoly_wide((*(generator_multiples1 + 2))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 2))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 2))->m_z, 1);

dummy[3] = 0x16ea4;
dummy[2] = 0x9e8c1611;
dummy[1] = 0x9b67bfc4;
dummy[0] = 0xdc70d0e1;
Kset_uipoly_wide((*(generator_multiples2 + 2))->m_U1, dummy, 4);

dummy[3] = 0x6f84;
dummy[2] = 0xeec8e884;
dummy[1] = 0xbe3f1abb;
dummy[0] = 0xb290930c;
Kset_uipoly_wide((*(generator_multiples2 + 2))->m_U0, dummy, 4);

dummy[3] = 0x1c498;
dummy[2] = 0x89dbf5c7;
dummy[1] = 0x2813881f;
dummy[0] = 0xc4d38784;
Kset_uipoly_wide((*(generator_multiples2 + 2))->m_V1, dummy, 4);

dummy[3] = 0x1de7b;
dummy[2] = 0xb5f1b203;
dummy[1] = 0xbf541357;
dummy[0] = 0x618a1bb8;
Kset_uipoly_wide((*(generator_multiples2 + 2))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 2))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 2))->m_z, 1);

dummy[3] = 0xdf63;
dummy[2] = 0x26386d1b;
dummy[1] = 0xddb4a3de;
dummy[0] = 0x4da1edc;
Kset_uipoly_wide((*(generator_multiples1 + 3))->m_U1, dummy, 4);

dummy[3] = 0x8754;
dummy[2] = 0xb0d29c5c;
dummy[1] = 0xce5ca243;
dummy[0] = 0x71d097b8;
Kset_uipoly_wide((*(generator_multiples1 + 3))->m_U0, dummy, 4);

dummy[3] = 0x18684;
dummy[2] = 0x426f55eb;
dummy[1] = 0x7a4d7445;
dummy[0] = 0x526a5bac;
Kset_uipoly_wide((*(generator_multiples1 + 3))->m_V1, dummy, 4);

dummy[3] = 0xc32e;
dummy[2] = 0x791d0f2d;
dummy[1] = 0x16a8ae75;
dummy[0] = 0x95a9383d;
Kset_uipoly_wide((*(generator_multiples1 + 3))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 3))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 3))->m_z, 1);

dummy[3] = 0x12ddf;
dummy[2] = 0x470dec70;
dummy[1] = 0xdc28d4fe;
dummy[0] = 0xa6f3afb7;
Kset_uipoly_wide((*(generator_multiples2 + 3))->m_U1, dummy, 4);

dummy[3] = 0x10b43;
dummy[2] = 0x485d779c;
dummy[1] = 0x9f1dcdd9;
dummy[0] = 0x2f05f7e3;
Kset_uipoly_wide((*(generator_multiples2 + 3))->m_U0, dummy, 4);

dummy[3] = 0xec90;
dummy[2] = 0x83fb9395;
dummy[1] = 0x7347fafa;
dummy[0] = 0x53b39659;
Kset_uipoly_wide((*(generator_multiples2 + 3))->m_V1, dummy, 4);

dummy[3] = 0x13b73;
dummy[2] = 0x50c358d6;
dummy[1] = 0x3401f933;
dummy[0] = 0x4650b88f;
Kset_uipoly_wide((*(generator_multiples2 + 3))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 3))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 3))->m_z, 1);

dummy[3] = 0x1d5ee;
dummy[2] = 0x4b4aabde;
dummy[1] = 0xa871ad74;
dummy[0] = 0x7a5f90e8;
Kset_uipoly_wide((*(generator_multiples1 + 4))->m_U1, dummy, 4);

dummy[3] = 0xcd87;
dummy[2] = 0x4bd60330;
dummy[1] = 0x7daf6f02;
dummy[0] = 0x9d5535e9;
Kset_uipoly_wide((*(generator_multiples1 + 4))->m_U0, dummy, 4);

dummy[3] = 0xd477;
dummy[2] = 0xf7e5119;
dummy[1] = 0x26ca698a;
dummy[0] = 0xd3936dd8;
Kset_uipoly_wide((*(generator_multiples1 + 4))->m_V1, dummy, 4);

dummy[3] = 0x1e6da;
dummy[2] = 0x342ed4c8;
dummy[1] = 0x14f0d8ad;
dummy[0] = 0x22dd94fa;
Kset_uipoly_wide((*(generator_multiples1 + 4))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 4))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 4))->m_z, 1);

dummy[3] = 0x130d4;
dummy[2] = 0xbc75fc23;
dummy[1] = 0x8820f976;
dummy[0] = 0x89d07ccd;
Kset_uipoly_wide((*(generator_multiples2 + 4))->m_U1, dummy, 4);

dummy[3] = 0x3dcc;
dummy[2] = 0x48394f46;
dummy[1] = 0x348eaf73;
dummy[0] = 0xaf673568;
Kset_uipoly_wide((*(generator_multiples2 + 4))->m_U0, dummy, 4);

dummy[3] = 0x185a2;
dummy[2] = 0xafe10fe3;
dummy[1] = 0x723a8015;
dummy[0] = 0x24d37643;
Kset_uipoly_wide((*(generator_multiples2 + 4))->m_V1, dummy, 4);

dummy[3] = 0x13552;
dummy[2] = 0x24713a9d;
dummy[1] = 0x760ff9b8;
dummy[0] = 0x3ad1b1b9;
Kset_uipoly_wide((*(generator_multiples2 + 4))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 4))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 4))->m_z, 1);

dummy[3] = 0x2b77;
dummy[2] = 0x14bc1db7;
dummy[1] = 0x8939ab8c;
dummy[0] = 0xb459cf9e;
Kset_uipoly_wide((*(generator_multiples1 + 5))->m_U1, dummy, 4);

dummy[3] = 0x72c;
dummy[2] = 0x1f350568;
dummy[1] = 0x58d1f333;
dummy[0] = 0xc352b737;
Kset_uipoly_wide((*(generator_multiples1 + 5))->m_U0, dummy, 4);

dummy[3] = 0x1c256;
dummy[2] = 0xdbd752b5;
dummy[1] = 0x5f92ff69;
dummy[0] = 0x8c3a0cae;
Kset_uipoly_wide((*(generator_multiples1 + 5))->m_V1, dummy, 4);

dummy[3] = 0x18f74;
dummy[2] = 0x8bede45;
dummy[1] = 0x6ca45ebd;
dummy[0] = 0xc117c2d0;
Kset_uipoly_wide((*(generator_multiples1 + 5))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 5))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 5))->m_z, 1);

dummy[3] = 0x1adfc;
dummy[2] = 0xac247405;
dummy[1] = 0xb9c9340c;
dummy[0] = 0x2118490e;
Kset_uipoly_wide((*(generator_multiples2 + 5))->m_U1, dummy, 4);

dummy[3] = 0xe5d4;
dummy[2] = 0xedf07367;
dummy[1] = 0x38f9ccd5;
dummy[0] = 0xb9d1986f;
Kset_uipoly_wide((*(generator_multiples2 + 5))->m_U0, dummy, 4);

dummy[3] = 0x8d1b;
dummy[2] = 0x12c50639;
dummy[1] = 0x4d12119d;
dummy[0] = 0xfc9d428d;
Kset_uipoly_wide((*(generator_multiples2 + 5))->m_V1, dummy, 4);

dummy[3] = 0x1b934;
dummy[2] = 0x4a7ff535;
dummy[1] = 0xf1e26c5d;
dummy[0] = 0xe5d69831;
Kset_uipoly_wide((*(generator_multiples2 + 5))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 5))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 5))->m_z, 1);

dummy[3] = 0x11fa4;
dummy[2] = 0xcd3382f;
dummy[1] = 0x55e58ae4;
dummy[0] = 0xbdda9a1f;
Kset_uipoly_wide((*(generator_multiples1 + 6))->m_U1, dummy, 4);

dummy[3] = 0x3815;
dummy[2] = 0xf898e742;
dummy[1] = 0xf88fb6ef;
dummy[0] = 0xc707065b;
Kset_uipoly_wide((*(generator_multiples1 + 6))->m_U0, dummy, 4);

dummy[3] = 0x16bf2;
dummy[2] = 0x2886d7f5;
dummy[1] = 0x431f7c3b;
dummy[0] = 0x24193e51;
Kset_uipoly_wide((*(generator_multiples1 + 6))->m_V1, dummy, 4);

dummy[3] = 0x10c43;
dummy[2] = 0x1c2d4eeb;
dummy[1] = 0x96ba0c81;
dummy[0] = 0x8b8e080d;
Kset_uipoly_wide((*(generator_multiples1 + 6))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 6))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 6))->m_z, 1);

dummy[3] = 0x8a39;
dummy[2] = 0x421a20d0;
dummy[1] = 0x7cdf0db0;
dummy[0] = 0x471bbf15;
Kset_uipoly_wide((*(generator_multiples2 + 6))->m_U1, dummy, 4);

dummy[3] = 0x1881c;
dummy[2] = 0x1313d459;
dummy[1] = 0xb8499464;
dummy[0] = 0xdcc66432;
Kset_uipoly_wide((*(generator_multiples2 + 6))->m_U0, dummy, 4);

dummy[3] = 0x1e70a;
dummy[2] = 0x52ec76aa;
dummy[1] = 0xb040932d;
dummy[0] = 0xb6a71e24;
Kset_uipoly_wide((*(generator_multiples2 + 6))->m_V1, dummy, 4);

dummy[3] = 0x68b3;
dummy[2] = 0x416ca37;
dummy[1] = 0x580c8c1f;
dummy[0] = 0x33df2923;
Kset_uipoly_wide((*(generator_multiples2 + 6))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 6))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 6))->m_z, 1);

dummy[3] = 0x1c037;
dummy[2] = 0x12ac8cb1;
dummy[1] = 0x6a05d993;
dummy[0] = 0x439ab89a;
Kset_uipoly_wide((*(generator_multiples1 + 7))->m_U1, dummy, 4);

dummy[3] = 0x1840e;
dummy[2] = 0xada6b936;
dummy[1] = 0x9a39be58;
dummy[0] = 0xbad43d8e;
Kset_uipoly_wide((*(generator_multiples1 + 7))->m_U0, dummy, 4);

dummy[3] = 0x8981;
dummy[2] = 0x13f5d5e;
dummy[1] = 0x5408be1d;
dummy[0] = 0xfcb26c84;
Kset_uipoly_wide((*(generator_multiples1 + 7))->m_V1, dummy, 4);

dummy[3] = 0x13d70;
dummy[2] = 0xefe81c2c;
dummy[1] = 0x794ecdc3;
dummy[0] = 0x518c4fa3;
Kset_uipoly_wide((*(generator_multiples1 + 7))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 7))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 7))->m_z, 1);

dummy[3] = 0xb5f8;
dummy[2] = 0x7fea000f;
dummy[1] = 0x12a5cacc;
dummy[0] = 0x97c7a3b9;
Kset_uipoly_wide((*(generator_multiples2 + 7))->m_U1, dummy, 4);

dummy[3] = 0xe2bd;
dummy[2] = 0x630bfd0c;
dummy[1] = 0xda6991d6;
dummy[0] = 0x7bd237d3;
Kset_uipoly_wide((*(generator_multiples2 + 7))->m_U0, dummy, 4);

dummy[3] = 0x6a12;
dummy[2] = 0xf55bee53;
dummy[1] = 0x962fcb54;
dummy[0] = 0x54aa6380;
Kset_uipoly_wide((*(generator_multiples2 + 7))->m_V1, dummy, 4);

dummy[3] = 0xe3b;
dummy[2] = 0x670de0c7;
dummy[1] = 0xe9ec6fe5;
dummy[0] = 0xfad5947c;
Kset_uipoly_wide((*(generator_multiples2 + 7))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 7))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 7))->m_z, 1);

dummy[3] = 0x10b97;
dummy[2] = 0xac3a3a8b;
dummy[1] = 0x794a3f0b;
dummy[0] = 0xa13e0014;
Kset_uipoly_wide((*(generator_multiples1 + 8))->m_U1, dummy, 4);

dummy[3] = 0x106ec;
dummy[2] = 0x1a8a40c7;
dummy[1] = 0x1a871abf;
dummy[0] = 0x530f8a05;
Kset_uipoly_wide((*(generator_multiples1 + 8))->m_U0, dummy, 4);

dummy[3] = 0x138cd;
dummy[2] = 0xacb98d21;
dummy[1] = 0x765f7fb5;
dummy[0] = 0x5819c782;
Kset_uipoly_wide((*(generator_multiples1 + 8))->m_V1, dummy, 4);

dummy[3] = 0xf4d8;
dummy[2] = 0x9b81ddcd;
dummy[1] = 0xe57a91eb;
dummy[0] = 0x42dce3e2;
Kset_uipoly_wide((*(generator_multiples1 + 8))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 8))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 8))->m_z, 1);

dummy[3] = 0x130f8;
dummy[2] = 0x5e1af414;
dummy[1] = 0x9cc9f406;
dummy[0] = 0xa68fac54;
Kset_uipoly_wide((*(generator_multiples2 + 8))->m_U1, dummy, 4);

dummy[3] = 0x1dad1;
dummy[2] = 0x6592a38e;
dummy[1] = 0xc6b29a5e;
dummy[0] = 0xd104d933;
Kset_uipoly_wide((*(generator_multiples2 + 8))->m_U0, dummy, 4);

dummy[3] = 0x1624d;
dummy[2] = 0x53fb8e49;
dummy[1] = 0x42250f9d;
dummy[0] = 0x6fd8b9cf;
Kset_uipoly_wide((*(generator_multiples2 + 8))->m_V1, dummy, 4);

dummy[3] = 0x84f7;
dummy[2] = 0x528412dd;
dummy[1] = 0x8243738d;
dummy[0] = 0x2f3b20ff;
Kset_uipoly_wide((*(generator_multiples2 + 8))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 8))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 8))->m_z, 1);

dummy[3] = 0x15fd5;
dummy[2] = 0x14565b62;
dummy[1] = 0xd8fa1b8b;
dummy[0] = 0x78ae3a0f;
Kset_uipoly_wide((*(generator_multiples1 + 9))->m_U1, dummy, 4);

dummy[3] = 0xcc09;
dummy[2] = 0xb242d92b;
dummy[1] = 0x330e772f;
dummy[0] = 0x3eba39af;
Kset_uipoly_wide((*(generator_multiples1 + 9))->m_U0, dummy, 4);

dummy[3] = 0x12f85;
dummy[2] = 0x67e81552;
dummy[1] = 0x297b344b;
dummy[0] = 0x1578287b;
Kset_uipoly_wide((*(generator_multiples1 + 9))->m_V1, dummy, 4);

dummy[3] = 0x14e95;
dummy[2] = 0xe195574f;
dummy[1] = 0xfd163ad0;
dummy[0] = 0xd7465516;
Kset_uipoly_wide((*(generator_multiples1 + 9))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 9))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 9))->m_z, 1);

dummy[3] = 0x1be1;
dummy[2] = 0x4d72433d;
dummy[1] = 0x27e7ea75;
dummy[0] = 0xa1f1da1a;
Kset_uipoly_wide((*(generator_multiples2 + 9))->m_U1, dummy, 4);

dummy[3] = 0xa566;
dummy[2] = 0xd4313ee9;
dummy[1] = 0xec557741;
dummy[0] = 0xe08ae3a6;
Kset_uipoly_wide((*(generator_multiples2 + 9))->m_U0, dummy, 4);

dummy[3] = 0x168ef;
dummy[2] = 0x9bf71bd0;
dummy[1] = 0x430fb0cf;
dummy[0] = 0x8fffaa54;
Kset_uipoly_wide((*(generator_multiples2 + 9))->m_V1, dummy, 4);

dummy[3] = 0x9b46;
dummy[2] = 0xccf44c6c;
dummy[1] = 0x3913da8c;
dummy[0] = 0xc564e231;
Kset_uipoly_wide((*(generator_multiples2 + 9))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 9))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 9))->m_z, 1);

dummy[3] = 0x1f0f;
dummy[2] = 0xdbcf2ed7;
dummy[1] = 0xf1712791;
dummy[0] = 0x9d581944;
Kset_uipoly_wide((*(generator_multiples1 + 10))->m_U1, dummy, 4);

dummy[3] = 0x7351;
dummy[2] = 0xcef90e7b;
dummy[1] = 0x835340d9;
dummy[0] = 0x20bff862;
Kset_uipoly_wide((*(generator_multiples1 + 10))->m_U0, dummy, 4);

dummy[3] = 0x118b8;
dummy[2] = 0x8cfbb458;
dummy[1] = 0x781174cc;
dummy[0] = 0xcae4bc89;
Kset_uipoly_wide((*(generator_multiples1 + 10))->m_V1, dummy, 4);

dummy[3] = 0xc886;
dummy[2] = 0x40b9c21c;
dummy[1] = 0x6655c0f3;
dummy[0] = 0x822e8a2f;
Kset_uipoly_wide((*(generator_multiples1 + 10))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 10))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 10))->m_z, 1);

dummy[3] = 0xd58;
dummy[2] = 0x823572d1;
dummy[1] = 0xad4730d0;
dummy[0] = 0xd2575019;
Kset_uipoly_wide((*(generator_multiples2 + 10))->m_U1, dummy, 4);

dummy[3] = 0xee3b;
dummy[2] = 0x961c680e;
dummy[1] = 0xceffebf5;
dummy[0] = 0xb13f54f1;
Kset_uipoly_wide((*(generator_multiples2 + 10))->m_U0, dummy, 4);

dummy[3] = 0x19ec3;
dummy[2] = 0xeab0e4a3;
dummy[1] = 0x917a8220;
dummy[0] = 0xd42e6b5c;
Kset_uipoly_wide((*(generator_multiples2 + 10))->m_V1, dummy, 4);

dummy[3] = 0xb46d;
dummy[2] = 0x7013e4d7;
dummy[1] = 0x8a7e3be1;
dummy[0] = 0x662c1620;
Kset_uipoly_wide((*(generator_multiples2 + 10))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 10))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 10))->m_z, 1);

dummy[3] = 0x11354;
dummy[2] = 0x2047b4c3;
dummy[1] = 0xd158c61e;
dummy[0] = 0xd6b21c4b;
Kset_uipoly_wide((*(generator_multiples1 + 11))->m_U1, dummy, 4);

dummy[3] = 0xce83;
dummy[2] = 0xcc61cfda;
dummy[1] = 0xdc07bc63;
dummy[0] = 0xe75718c2;
Kset_uipoly_wide((*(generator_multiples1 + 11))->m_U0, dummy, 4);

dummy[3] = 0x1044a;
dummy[2] = 0x9d3f8b2b;
dummy[1] = 0x3d5e52d9;
dummy[0] = 0x1297aaac;
Kset_uipoly_wide((*(generator_multiples1 + 11))->m_V1, dummy, 4);

dummy[3] = 0x1e938;
dummy[2] = 0xfeef7746;
dummy[1] = 0x296d4a9f;
dummy[0] = 0xe48b5f78;
Kset_uipoly_wide((*(generator_multiples1 + 11))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 11))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 11))->m_z, 1);

dummy[3] = 0xaee0;
dummy[2] = 0xc03dc3bb;
dummy[1] = 0x79c49439;
dummy[0] = 0x5f8b5e23;
Kset_uipoly_wide((*(generator_multiples2 + 11))->m_U1, dummy, 4);

dummy[3] = 0xba9f;
dummy[2] = 0x5e708381;
dummy[1] = 0x7f1009bc;
dummy[0] = 0x2158999;
Kset_uipoly_wide((*(generator_multiples2 + 11))->m_U0, dummy, 4);

dummy[3] = 0x12b59;
dummy[2] = 0xfbfb1d36;
dummy[1] = 0xe8eae734;
dummy[0] = 0xaabd33c;
Kset_uipoly_wide((*(generator_multiples2 + 11))->m_V1, dummy, 4);

dummy[3] = 0x5323;
dummy[2] = 0x70bd269a;
dummy[1] = 0x39865086;
dummy[0] = 0xba2ed79c;
Kset_uipoly_wide((*(generator_multiples2 + 11))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 11))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 11))->m_z, 1);

dummy[3] = 0x6e7e;
dummy[2] = 0xcf9ab286;
dummy[1] = 0x3330f60;
dummy[0] = 0xbab20049;
Kset_uipoly_wide((*(generator_multiples1 + 12))->m_U1, dummy, 4);

dummy[3] = 0x1f0ce;
dummy[2] = 0x9ce86c88;
dummy[1] = 0xa7456998;
dummy[0] = 0xc750b9ce;
Kset_uipoly_wide((*(generator_multiples1 + 12))->m_U0, dummy, 4);

dummy[3] = 0x12eb0;
dummy[2] = 0xa4eda09e;
dummy[1] = 0xad68333;
dummy[0] = 0x2dc315ae;
Kset_uipoly_wide((*(generator_multiples1 + 12))->m_V1, dummy, 4);

dummy[3] = 0x322e;
dummy[2] = 0x78bdd6c6;
dummy[1] = 0x4e5eec3a;
dummy[0] = 0x582c644e;
Kset_uipoly_wide((*(generator_multiples1 + 12))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 12))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 12))->m_z, 1);

dummy[3] = 0x178be;
dummy[2] = 0xa9a189ae;
dummy[1] = 0xf673b947;
dummy[0] = 0xf9cc90fc;
Kset_uipoly_wide((*(generator_multiples2 + 12))->m_U1, dummy, 4);

dummy[3] = 0xe0bc;
dummy[2] = 0xb9bf987d;
dummy[1] = 0x7ce5a65f;
dummy[0] = 0x8cec2291;
Kset_uipoly_wide((*(generator_multiples2 + 12))->m_U0, dummy, 4);

dummy[3] = 0xa783;
dummy[2] = 0x9eda594e;
dummy[1] = 0x21b9fed;
dummy[0] = 0x7130ddc4;
Kset_uipoly_wide((*(generator_multiples2 + 12))->m_V1, dummy, 4);

dummy[3] = 0x8d13;
dummy[2] = 0x15000d1f;
dummy[1] = 0x1fa66641;
dummy[0] = 0x364a636;
Kset_uipoly_wide((*(generator_multiples2 + 12))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 12))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 12))->m_z, 1);

dummy[3] = 0x1fadd;
dummy[2] = 0x3edc4eb7;
dummy[1] = 0x5a89cfa;
dummy[0] = 0xa0ba91d1;
Kset_uipoly_wide((*(generator_multiples1 + 13))->m_U1, dummy, 4);

dummy[3] = 0x11458;
dummy[2] = 0xae7cc83;
dummy[1] = 0xe2176ab0;
dummy[0] = 0x36f2862a;
Kset_uipoly_wide((*(generator_multiples1 + 13))->m_U0, dummy, 4);

dummy[3] = 0x1866b;
dummy[2] = 0x849611d3;
dummy[1] = 0x403a7ce4;
dummy[0] = 0x255cc087;
Kset_uipoly_wide((*(generator_multiples1 + 13))->m_V1, dummy, 4);

dummy[3] = 0x10b3a;
dummy[2] = 0xf0993378;
dummy[1] = 0x84d4dd57;
dummy[0] = 0x55d24b76;
Kset_uipoly_wide((*(generator_multiples1 + 13))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 13))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 13))->m_z, 1);

dummy[3] = 0x23bd;
dummy[2] = 0x8bd590a2;
dummy[1] = 0x7e14a270;
dummy[0] = 0x982fd039;
Kset_uipoly_wide((*(generator_multiples2 + 13))->m_U1, dummy, 4);

dummy[3] = 0xdec5;
dummy[2] = 0x737663a;
dummy[1] = 0x2837012a;
dummy[0] = 0x97b45519;
Kset_uipoly_wide((*(generator_multiples2 + 13))->m_U0, dummy, 4);

dummy[3] = 0xe2ad;
dummy[2] = 0xa545e13c;
dummy[1] = 0x917d661;
dummy[0] = 0x826b84bc;
Kset_uipoly_wide((*(generator_multiples2 + 13))->m_V1, dummy, 4);

dummy[3] = 0xdf50;
dummy[2] = 0x3ab5abb2;
dummy[1] = 0xa7c1f30;
dummy[0] = 0xe5a9ed29;
Kset_uipoly_wide((*(generator_multiples2 + 13))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 13))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 13))->m_z, 1);

dummy[3] = 0x1701b;
dummy[2] = 0xd58e811c;
dummy[1] = 0xfe32e9b7;
dummy[0] = 0x6ed02ad5;
Kset_uipoly_wide((*(generator_multiples1 + 14))->m_U1, dummy, 4);

dummy[3] = 0x7467;
dummy[2] = 0xa2435cac;
dummy[1] = 0x10d0dc0f;
dummy[0] = 0x97f88be3;
Kset_uipoly_wide((*(generator_multiples1 + 14))->m_U0, dummy, 4);

dummy[3] = 0x13b7e;
dummy[2] = 0x4c56b763;
dummy[1] = 0xecc3b6af;
dummy[0] = 0x612fe55f;
Kset_uipoly_wide((*(generator_multiples1 + 14))->m_V1, dummy, 4);

dummy[3] = 0x6f46;
dummy[2] = 0x5c42aec2;
dummy[1] = 0xe2fb116d;
dummy[0] = 0x86ba5de3;
Kset_uipoly_wide((*(generator_multiples1 + 14))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 14))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 14))->m_z, 1);

dummy[3] = 0x1534d;
dummy[2] = 0x6d82f414;
dummy[1] = 0x6ce8e0c4;
dummy[0] = 0x99b87f25;
Kset_uipoly_wide((*(generator_multiples2 + 14))->m_U1, dummy, 4);

dummy[3] = 0x5ceb;
dummy[2] = 0x32f4d54;
dummy[1] = 0x34954806;
dummy[0] = 0xd837824a;
Kset_uipoly_wide((*(generator_multiples2 + 14))->m_U0, dummy, 4);

dummy[3] = 0x10ee3;
dummy[2] = 0x6be8dccf;
dummy[1] = 0xd08e44e1;
dummy[0] = 0xa580de93;
Kset_uipoly_wide((*(generator_multiples2 + 14))->m_V1, dummy, 4);

dummy[3] = 0x1e098;
dummy[2] = 0xa7af63de;
dummy[1] = 0xddd2449d;
dummy[0] = 0xe915d04b;
Kset_uipoly_wide((*(generator_multiples2 + 14))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 14))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 14))->m_z, 1);

dummy[3] = 0x1e1eb;
dummy[2] = 0xfbee0d38;
dummy[1] = 0xfabe056e;
dummy[0] = 0x9145b291;
Kset_uipoly_wide((*(generator_multiples1 + 15))->m_U1, dummy, 4);

dummy[3] = 0x15fa5;
dummy[2] = 0x8e6ae83d;
dummy[1] = 0xebbbcc1d;
dummy[0] = 0xae45d708;
Kset_uipoly_wide((*(generator_multiples1 + 15))->m_U0, dummy, 4);

dummy[3] = 0x125bd;
dummy[2] = 0x9335b514;
dummy[1] = 0x7604b9f2;
dummy[0] = 0x6a3918c2;
Kset_uipoly_wide((*(generator_multiples1 + 15))->m_V1, dummy, 4);

dummy[3] = 0xa51c;
dummy[2] = 0xf016aaf5;
dummy[1] = 0xfdcef65a;
dummy[0] = 0x9261b30;
Kset_uipoly_wide((*(generator_multiples1 + 15))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 15))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 15))->m_z, 1);

dummy[3] = 0x116af;
dummy[2] = 0x67638f9b;
dummy[1] = 0xf1c21b02;
dummy[0] = 0xa3f1ea87;
Kset_uipoly_wide((*(generator_multiples2 + 15))->m_U1, dummy, 4);

dummy[3] = 0x1a657;
dummy[2] = 0x16af4881;
dummy[1] = 0xb9f55794;
dummy[0] = 0x9137940;
Kset_uipoly_wide((*(generator_multiples2 + 15))->m_U0, dummy, 4);

dummy[3] = 0x1c560;
dummy[2] = 0x41232b1d;
dummy[1] = 0x4a0b3f4c;
dummy[0] = 0xf69a69e3;
Kset_uipoly_wide((*(generator_multiples2 + 15))->m_V1, dummy, 4);

dummy[3] = 0x13b7b;
dummy[2] = 0xa817089d;
dummy[1] = 0x8cc63e57;
dummy[0] = 0xef2cb178;
Kset_uipoly_wide((*(generator_multiples2 + 15))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 15))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 15))->m_z, 1);

dummy[3] = 0x1852d;
dummy[2] = 0xe44e0abf;
dummy[1] = 0xde91559a;
dummy[0] = 0x2f6dc455;
Kset_uipoly_wide((*(generator_multiples1 + 16))->m_U1, dummy, 4);

dummy[3] = 0x1fb53;
dummy[2] = 0x6152d9c4;
dummy[1] = 0x2f8f80a3;
dummy[0] = 0xbdc284df;
Kset_uipoly_wide((*(generator_multiples1 + 16))->m_U0, dummy, 4);

dummy[3] = 0x1fb26;
dummy[2] = 0xac3ad291;
dummy[1] = 0x801de2d9;
dummy[0] = 0x25028408;
Kset_uipoly_wide((*(generator_multiples1 + 16))->m_V1, dummy, 4);

dummy[3] = 0xc9b6;
dummy[2] = 0x80341d37;
dummy[1] = 0x52f2cba4;
dummy[0] = 0xa4548015;
Kset_uipoly_wide((*(generator_multiples1 + 16))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 16))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 16))->m_z, 1);

dummy[3] = 0x4d0e;
dummy[2] = 0x3a2a705b;
dummy[1] = 0xc0d9006f;
dummy[0] = 0x4634ca12;
Kset_uipoly_wide((*(generator_multiples2 + 16))->m_U1, dummy, 4);

dummy[3] = 0x1a111;
dummy[2] = 0xb9b89aa;
dummy[1] = 0xea7c4131;
dummy[0] = 0x79c96f45;
Kset_uipoly_wide((*(generator_multiples2 + 16))->m_U0, dummy, 4);

dummy[3] = 0x709c;
dummy[2] = 0x2f5daede;
dummy[1] = 0x3d0f808a;
dummy[0] = 0x4d5d6318;
Kset_uipoly_wide((*(generator_multiples2 + 16))->m_V1, dummy, 4);

dummy[3] = 0xda43;
dummy[2] = 0x89800fae;
dummy[1] = 0x7466d8e6;
dummy[0] = 0x90691b8d;
Kset_uipoly_wide((*(generator_multiples2 + 16))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 16))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 16))->m_z, 1);

dummy[3] = 0x6b9e;
dummy[2] = 0xa3e00888;
dummy[1] = 0x4aa34886;
dummy[0] = 0x24bd750d;
Kset_uipoly_wide((*(generator_multiples1 + 17))->m_U1, dummy, 4);

dummy[3] = 0x17b1e;
dummy[2] = 0xec6a484;
dummy[1] = 0x69e4ed0d;
dummy[0] = 0x8bd0ed5a;
Kset_uipoly_wide((*(generator_multiples1 + 17))->m_U0, dummy, 4);

dummy[3] = 0x101e2;
dummy[2] = 0xf082a69a;
dummy[1] = 0xaddb5fa7;
dummy[0] = 0x6727aca4;
Kset_uipoly_wide((*(generator_multiples1 + 17))->m_V1, dummy, 4);

dummy[3] = 0xb4d7;
dummy[2] = 0xb80c840;
dummy[1] = 0xf948752f;
dummy[0] = 0x5a73f351;
Kset_uipoly_wide((*(generator_multiples1 + 17))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 17))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 17))->m_z, 1);

dummy[3] = 0xc810;
dummy[2] = 0x8202348b;
dummy[1] = 0x67e4d1b7;
dummy[0] = 0xf2d5a7b0;
Kset_uipoly_wide((*(generator_multiples2 + 17))->m_U1, dummy, 4);

dummy[3] = 0x123c7;
dummy[2] = 0xfda56f8c;
dummy[1] = 0x50c2a449;
dummy[0] = 0xd90d1a80;
Kset_uipoly_wide((*(generator_multiples2 + 17))->m_U0, dummy, 4);

dummy[3] = 0x1477;
dummy[2] = 0xdf377abe;
dummy[1] = 0x49866f4b;
dummy[0] = 0xcefac22;
Kset_uipoly_wide((*(generator_multiples2 + 17))->m_V1, dummy, 4);

dummy[3] = 0x78dd;
dummy[2] = 0x974ab361;
dummy[1] = 0x29549e6b;
dummy[0] = 0x8d001567;
Kset_uipoly_wide((*(generator_multiples2 + 17))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 17))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 17))->m_z, 1);

dummy[3] = 0x11dfc;
dummy[2] = 0x819d6ee9;
dummy[1] = 0xd9f7fdc5;
dummy[0] = 0x19a5f2bc;
Kset_uipoly_wide((*(generator_multiples1 + 18))->m_U1, dummy, 4);

dummy[3] = 0xef3b;
dummy[2] = 0xa16c77da;
dummy[1] = 0x438f156;
dummy[0] = 0xacbc96e9;
Kset_uipoly_wide((*(generator_multiples1 + 18))->m_U0, dummy, 4);

dummy[3] = 0x1d51c;
dummy[2] = 0x5bda4769;
dummy[1] = 0xfe9e3452;
dummy[0] = 0x2d04e9;
Kset_uipoly_wide((*(generator_multiples1 + 18))->m_V1, dummy, 4);

dummy[3] = 0x4b2;
dummy[2] = 0xdc36a17a;
dummy[1] = 0xcc500764;
dummy[0] = 0x12011ad5;
Kset_uipoly_wide((*(generator_multiples1 + 18))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 18))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 18))->m_z, 1);

dummy[3] = 0x1b015;
dummy[2] = 0x58ae642e;
dummy[1] = 0xaf122373;
dummy[0] = 0x42debd4c;
Kset_uipoly_wide((*(generator_multiples2 + 18))->m_U1, dummy, 4);

dummy[3] = 0x4275;
dummy[2] = 0x941499d6;
dummy[1] = 0x9a73a006;
dummy[0] = 0xebe2620;
Kset_uipoly_wide((*(generator_multiples2 + 18))->m_U0, dummy, 4);

dummy[3] = 0x2c7e;
dummy[2] = 0x79dafd86;
dummy[1] = 0xdfbd93af;
dummy[0] = 0x5d49a6d1;
Kset_uipoly_wide((*(generator_multiples2 + 18))->m_V1, dummy, 4);

dummy[3] = 0x1a998;
dummy[2] = 0x4071e7c0;
dummy[1] = 0x6b848041;
dummy[0] = 0xdcf1ca91;
Kset_uipoly_wide((*(generator_multiples2 + 18))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 18))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 18))->m_z, 1);

dummy[3] = 0x4d1;
dummy[2] = 0x843a1110;
dummy[1] = 0xed0f3716;
dummy[0] = 0x29323aad;
Kset_uipoly_wide((*(generator_multiples1 + 19))->m_U1, dummy, 4);

dummy[3] = 0x1a9c1;
dummy[2] = 0x583e7307;
dummy[1] = 0xdb88fe6d;
dummy[0] = 0x33ff31a3;
Kset_uipoly_wide((*(generator_multiples1 + 19))->m_U0, dummy, 4);

dummy[3] = 0x1a65e;
dummy[2] = 0x830f77e9;
dummy[1] = 0x53b80e1d;
dummy[0] = 0x32b0cb0a;
Kset_uipoly_wide((*(generator_multiples1 + 19))->m_V1, dummy, 4);

dummy[3] = 0xa696;
dummy[2] = 0xaf28f5a3;
dummy[1] = 0x44a2d638;
dummy[0] = 0xe1e36235;
Kset_uipoly_wide((*(generator_multiples1 + 19))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 19))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 19))->m_z, 1);

dummy[3] = 0xfd60;
dummy[2] = 0x58833264;
dummy[1] = 0xad3a48cf;
dummy[0] = 0xf0f95dbd;
Kset_uipoly_wide((*(generator_multiples2 + 19))->m_U1, dummy, 4);

dummy[3] = 0x11f72;
dummy[2] = 0x457f645;
dummy[1] = 0x5fd78dc2;
dummy[0] = 0x1352bcaf;
Kset_uipoly_wide((*(generator_multiples2 + 19))->m_U0, dummy, 4);

dummy[3] = 0x112e1;
dummy[2] = 0xe3ed8f5b;
dummy[1] = 0x70711f91;
dummy[0] = 0x841a4d0d;
Kset_uipoly_wide((*(generator_multiples2 + 19))->m_V1, dummy, 4);

dummy[3] = 0x1aa7;
dummy[2] = 0x4c915cbe;
dummy[1] = 0x2bebec37;
dummy[0] = 0x6e3a56ff;
Kset_uipoly_wide((*(generator_multiples2 + 19))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 19))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 19))->m_z, 1);

dummy[3] = 0xab9f;
dummy[2] = 0x23be276;
dummy[1] = 0x2a1d6419;
dummy[0] = 0xe6fc7780;
Kset_uipoly_wide((*(generator_multiples1 + 20))->m_U1, dummy, 4);

dummy[3] = 0x109af;
dummy[2] = 0xf73455ee;
dummy[1] = 0x25268f85;
dummy[0] = 0x83defbfd;
Kset_uipoly_wide((*(generator_multiples1 + 20))->m_U0, dummy, 4);

dummy[3] = 0xea08;
dummy[2] = 0xffb771b8;
dummy[1] = 0x2af389a5;
dummy[0] = 0xd100b617;
Kset_uipoly_wide((*(generator_multiples1 + 20))->m_V1, dummy, 4);

dummy[3] = 0x17ba8;
dummy[2] = 0x8bf0a028;
dummy[1] = 0xb9b022eb;
dummy[0] = 0xf9a2c7ea;
Kset_uipoly_wide((*(generator_multiples1 + 20))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 20))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 20))->m_z, 1);

dummy[3] = 0x3e3d;
dummy[2] = 0x84e83c06;
dummy[1] = 0xb94b9780;
dummy[0] = 0x53d237ad;
Kset_uipoly_wide((*(generator_multiples2 + 20))->m_U1, dummy, 4);

dummy[3] = 0x49c0;
dummy[2] = 0x3eb449e3;
dummy[1] = 0x510a1b52;
dummy[0] = 0x7bf3440;
Kset_uipoly_wide((*(generator_multiples2 + 20))->m_U0, dummy, 4);

dummy[3] = 0xc3c7;
dummy[2] = 0xb23c35a4;
dummy[1] = 0x4e41b851;
dummy[0] = 0x71807039;
Kset_uipoly_wide((*(generator_multiples2 + 20))->m_V1, dummy, 4);

dummy[3] = 0x406d;
dummy[2] = 0x50fc833e;
dummy[1] = 0xd2a170c1;
dummy[0] = 0x6bc2990d;
Kset_uipoly_wide((*(generator_multiples2 + 20))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 20))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 20))->m_z, 1);

dummy[3] = 0xd439;
dummy[2] = 0x672929b9;
dummy[1] = 0x71e4fd15;
dummy[0] = 0xb68c97a8;
Kset_uipoly_wide((*(generator_multiples1 + 21))->m_U1, dummy, 4);

dummy[3] = 0xa047;
dummy[2] = 0x2b23b50e;
dummy[1] = 0xe811cca0;
dummy[0] = 0xc11406cc;
Kset_uipoly_wide((*(generator_multiples1 + 21))->m_U0, dummy, 4);

dummy[3] = 0x7c5f;
dummy[2] = 0x8ac355d2;
dummy[1] = 0x7b6f368b;
dummy[0] = 0xbf54fc0d;
Kset_uipoly_wide((*(generator_multiples1 + 21))->m_V1, dummy, 4);

dummy[3] = 0x1f37;
dummy[2] = 0xe35b9b2c;
dummy[1] = 0x43ad3063;
dummy[0] = 0xf16100ce;
Kset_uipoly_wide((*(generator_multiples1 + 21))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 21))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 21))->m_z, 1);

dummy[3] = 0x19214;
dummy[2] = 0x18088d22;
dummy[1] = 0xaf6963a5;
dummy[0] = 0x5187b448;
Kset_uipoly_wide((*(generator_multiples2 + 21))->m_U1, dummy, 4);

dummy[3] = 0x1c556;
dummy[2] = 0xd08cc5aa;
dummy[1] = 0x257d72c3;
dummy[0] = 0xd54d61a5;
Kset_uipoly_wide((*(generator_multiples2 + 21))->m_U0, dummy, 4);

dummy[3] = 0x125b9;
dummy[2] = 0x6302b3c8;
dummy[1] = 0x508f61d1;
dummy[0] = 0x67439788;
Kset_uipoly_wide((*(generator_multiples2 + 21))->m_V1, dummy, 4);

dummy[3] = 0x1f5ed;
dummy[2] = 0x6880eb35;
dummy[1] = 0xb1eb1475;
dummy[0] = 0x97e290af;
Kset_uipoly_wide((*(generator_multiples2 + 21))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 21))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 21))->m_z, 1);

dummy[3] = 0x5ec9;
dummy[2] = 0x6497515a;
dummy[1] = 0x516ddf0;
dummy[0] = 0xe2f31f43;
Kset_uipoly_wide((*(generator_multiples1 + 22))->m_U1, dummy, 4);

dummy[3] = 0x141e;
dummy[2] = 0x5ffdc8b4;
dummy[1] = 0xa4c2377e;
dummy[0] = 0x905ad54b;
Kset_uipoly_wide((*(generator_multiples1 + 22))->m_U0, dummy, 4);

dummy[3] = 0x6114;
dummy[2] = 0x38379afb;
dummy[1] = 0xe0f4d38d;
dummy[0] = 0xceef189;
Kset_uipoly_wide((*(generator_multiples1 + 22))->m_V1, dummy, 4);

dummy[3] = 0x68e0;
dummy[2] = 0x320c68f4;
dummy[1] = 0x31ecc62;
dummy[0] = 0x31d550e9;
Kset_uipoly_wide((*(generator_multiples1 + 22))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 22))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 22))->m_z, 1);

dummy[3] = 0x11085;
dummy[2] = 0xa8917660;
dummy[1] = 0xe0f94078;
dummy[0] = 0x1c5cb60a;
Kset_uipoly_wide((*(generator_multiples2 + 22))->m_U1, dummy, 4);

dummy[3] = 0x1440e;
dummy[2] = 0x42356ece;
dummy[1] = 0xe44df5ba;
dummy[0] = 0x75e50596;
Kset_uipoly_wide((*(generator_multiples2 + 22))->m_U0, dummy, 4);

dummy[3] = 0x1f94f;
dummy[2] = 0xb9a3ee7;
dummy[1] = 0x766cd278;
dummy[0] = 0xfa4bbb98;
Kset_uipoly_wide((*(generator_multiples2 + 22))->m_V1, dummy, 4);

dummy[3] = 0x105fa;
dummy[2] = 0x43a66a38;
dummy[1] = 0xff081909;
dummy[0] = 0xc73d2358;
Kset_uipoly_wide((*(generator_multiples2 + 22))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 22))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 22))->m_z, 1);

dummy[3] = 0x6552;
dummy[2] = 0xf2896010;
dummy[1] = 0x2ec2b788;
dummy[0] = 0xb3d62d63;
Kset_uipoly_wide((*(generator_multiples1 + 23))->m_U1, dummy, 4);

dummy[3] = 0xa876;
dummy[2] = 0xc21fb155;
dummy[1] = 0xca8a9a3a;
dummy[0] = 0x735a1e9f;
Kset_uipoly_wide((*(generator_multiples1 + 23))->m_U0, dummy, 4);

dummy[3] = 0x17cc7;
dummy[2] = 0xc2240a28;
dummy[1] = 0x4d5258b8;
dummy[0] = 0x7aef1379;
Kset_uipoly_wide((*(generator_multiples1 + 23))->m_V1, dummy, 4);

dummy[3] = 0xaa9b;
dummy[2] = 0xcb2dc49c;
dummy[1] = 0x5def0df9;
dummy[0] = 0xed0da53c;
Kset_uipoly_wide((*(generator_multiples1 + 23))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 23))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 23))->m_z, 1);

dummy[3] = 0x1fe64;
dummy[2] = 0xb7bccfe6;
dummy[1] = 0xf23ea3c5;
dummy[0] = 0x66d8d367;
Kset_uipoly_wide((*(generator_multiples2 + 23))->m_U1, dummy, 4);

dummy[3] = 0x7c0e;
dummy[2] = 0xec0de165;
dummy[1] = 0x2ea71fe9;
dummy[0] = 0x525a6b7f;
Kset_uipoly_wide((*(generator_multiples2 + 23))->m_U0, dummy, 4);

dummy[3] = 0x1eda5;
dummy[2] = 0xc7308071;
dummy[1] = 0x8cdb30ab;
dummy[0] = 0x27d94a0;
Kset_uipoly_wide((*(generator_multiples2 + 23))->m_V1, dummy, 4);

dummy[3] = 0x15c5f;
dummy[2] = 0x479f37b0;
dummy[1] = 0x646dca1b;
dummy[0] = 0xdc386256;
Kset_uipoly_wide((*(generator_multiples2 + 23))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 23))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 23))->m_z, 1);

dummy[3] = 0x5c4b;
dummy[2] = 0xa548252c;
dummy[1] = 0xfe135858;
dummy[0] = 0xf54cc2cc;
Kset_uipoly_wide((*(generator_multiples1 + 24))->m_U1, dummy, 4);

dummy[3] = 0x3f10;
dummy[2] = 0x4d917745;
dummy[1] = 0x253ac923;
dummy[0] = 0xdadcf654;
Kset_uipoly_wide((*(generator_multiples1 + 24))->m_U0, dummy, 4);

dummy[3] = 0x1d716;
dummy[2] = 0x6e6f1729;
dummy[1] = 0xe3e00ecf;
dummy[0] = 0x7d8175a8;
Kset_uipoly_wide((*(generator_multiples1 + 24))->m_V1, dummy, 4);

dummy[3] = 0x12783;
dummy[2] = 0x5ab5a50a;
dummy[1] = 0x90c9511a;
dummy[0] = 0x8d15a1ef;
Kset_uipoly_wide((*(generator_multiples1 + 24))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 24))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 24))->m_z, 1);

dummy[3] = 0x63d7;
dummy[2] = 0x262013c4;
dummy[1] = 0x837ca27d;
dummy[0] = 0x86fe09f;
Kset_uipoly_wide((*(generator_multiples2 + 24))->m_U1, dummy, 4);

dummy[3] = 0x15049;
dummy[2] = 0xf9be6d70;
dummy[1] = 0xab3d1695;
dummy[0] = 0x7ce5fa67;
Kset_uipoly_wide((*(generator_multiples2 + 24))->m_U0, dummy, 4);

dummy[3] = 0xb7d2;
dummy[2] = 0xaf387b4b;
dummy[1] = 0x9ad0a6fa;
dummy[0] = 0x42daa7f4;
Kset_uipoly_wide((*(generator_multiples2 + 24))->m_V1, dummy, 4);

dummy[3] = 0x3cfd;
dummy[2] = 0xf698bf5c;
dummy[1] = 0xda28a9bf;
dummy[0] = 0x393cd703;
Kset_uipoly_wide((*(generator_multiples2 + 24))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 24))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 24))->m_z, 1);

dummy[3] = 0x1990d;
dummy[2] = 0xb8d919ba;
dummy[1] = 0x7050a9b4;
dummy[0] = 0xb437ecb9;
Kset_uipoly_wide((*(generator_multiples1 + 25))->m_U1, dummy, 4);

dummy[3] = 0x1ff5;
dummy[2] = 0x2bdc6cb9;
dummy[1] = 0xc490dda4;
dummy[0] = 0x4e4e0cb4;
Kset_uipoly_wide((*(generator_multiples1 + 25))->m_U0, dummy, 4);

dummy[3] = 0x14a97;
dummy[2] = 0xd03c5788;
dummy[1] = 0x5947eb8b;
dummy[0] = 0xf43ae9f7;
Kset_uipoly_wide((*(generator_multiples1 + 25))->m_V1, dummy, 4);

dummy[3] = 0xb3f6;
dummy[2] = 0xa2d1be31;
dummy[1] = 0x4b81284d;
dummy[0] = 0xe1eee36e;
Kset_uipoly_wide((*(generator_multiples1 + 25))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 25))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 25))->m_z, 1);

dummy[3] = 0x106c;
dummy[2] = 0x1cc7dcf3;
dummy[1] = 0xc9d26d;
dummy[0] = 0x769cc5ee;
Kset_uipoly_wide((*(generator_multiples2 + 25))->m_U1, dummy, 4);

dummy[3] = 0x4a71;
dummy[2] = 0xff233637;
dummy[1] = 0xb403e92a;
dummy[0] = 0x8fd3c4fe;
Kset_uipoly_wide((*(generator_multiples2 + 25))->m_U0, dummy, 4);

dummy[3] = 0x1a947;
dummy[2] = 0x66dfb381;
dummy[1] = 0x9396935a;
dummy[0] = 0x21e7a8ae;
Kset_uipoly_wide((*(generator_multiples2 + 25))->m_V1, dummy, 4);

dummy[3] = 0x17e32;
dummy[2] = 0x2e7e32e5;
dummy[1] = 0xeba3fccd;
dummy[0] = 0x71b11f52;
Kset_uipoly_wide((*(generator_multiples2 + 25))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 25))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 25))->m_z, 1);

dummy[3] = 0xa426;
dummy[2] = 0x2fdcaca6;
dummy[1] = 0xfa05235f;
dummy[0] = 0xbba3459e;
Kset_uipoly_wide((*(generator_multiples1 + 26))->m_U1, dummy, 4);

dummy[3] = 0xa11d;
dummy[2] = 0x188d4576;
dummy[1] = 0x14118e53;
dummy[0] = 0xf55a8d33;
Kset_uipoly_wide((*(generator_multiples1 + 26))->m_U0, dummy, 4);

dummy[3] = 0x134bb;
dummy[2] = 0xd162498d;
dummy[1] = 0x57266f5;
dummy[0] = 0x6b86391b;
Kset_uipoly_wide((*(generator_multiples1 + 26))->m_V1, dummy, 4);

dummy[3] = 0xdb74;
dummy[2] = 0xe4faf0;
dummy[1] = 0x9db8184d;
dummy[0] = 0x2f6b51d4;
Kset_uipoly_wide((*(generator_multiples1 + 26))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 26))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 26))->m_z, 1);

dummy[3] = 0x183ba;
dummy[2] = 0xac89dc07;
dummy[1] = 0x789ee683;
dummy[0] = 0x4e3a0372;
Kset_uipoly_wide((*(generator_multiples2 + 26))->m_U1, dummy, 4);

dummy[3] = 0xa0ce;
dummy[2] = 0xbe5d3adf;
dummy[1] = 0x37e39a74;
dummy[0] = 0xa9987f78;
Kset_uipoly_wide((*(generator_multiples2 + 26))->m_U0, dummy, 4);

dummy[3] = 0x19150;
dummy[2] = 0x1689914;
dummy[1] = 0xf3a946a6;
dummy[0] = 0xfe6a1277;
Kset_uipoly_wide((*(generator_multiples2 + 26))->m_V1, dummy, 4);

dummy[3] = 0x1ecdc;
dummy[2] = 0xec7e280e;
dummy[1] = 0xb11ddd58;
dummy[0] = 0xfbb0e0d;
Kset_uipoly_wide((*(generator_multiples2 + 26))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 26))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 26))->m_z, 1);

dummy[3] = 0x1de1c;
dummy[2] = 0x829b79;
dummy[1] = 0x9a88afb2;
dummy[0] = 0xf2600ecf;
Kset_uipoly_wide((*(generator_multiples1 + 27))->m_U1, dummy, 4);

dummy[3] = 0xd1a6;
dummy[2] = 0x26a633e1;
dummy[1] = 0x5a280521;
dummy[0] = 0x77079968;
Kset_uipoly_wide((*(generator_multiples1 + 27))->m_U0, dummy, 4);

dummy[3] = 0x1589;
dummy[2] = 0x1308d7e2;
dummy[1] = 0xcace7578;
dummy[0] = 0x949ec1db;
Kset_uipoly_wide((*(generator_multiples1 + 27))->m_V1, dummy, 4);

dummy[3] = 0x170c7;
dummy[2] = 0x98b575aa;
dummy[1] = 0x33d12851;
dummy[0] = 0x1364a952;
Kset_uipoly_wide((*(generator_multiples1 + 27))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 27))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 27))->m_z, 1);

dummy[3] = 0x1339d;
dummy[2] = 0xb35c81cf;
dummy[1] = 0x14c481dc;
dummy[0] = 0x954bad0d;
Kset_uipoly_wide((*(generator_multiples2 + 27))->m_U1, dummy, 4);

dummy[3] = 0x5c55;
dummy[2] = 0xf4830e5c;
dummy[1] = 0x9337a318;
dummy[0] = 0x9c67f6a1;
Kset_uipoly_wide((*(generator_multiples2 + 27))->m_U0, dummy, 4);

dummy[3] = 0x1db1;
dummy[2] = 0x1b7553a2;
dummy[1] = 0x36e91024;
dummy[0] = 0xc61cb727;
Kset_uipoly_wide((*(generator_multiples2 + 27))->m_V1, dummy, 4);

dummy[3] = 0x1ca;
dummy[2] = 0x41d1f013;
dummy[1] = 0x46ecc012;
dummy[0] = 0x99e40861;
Kset_uipoly_wide((*(generator_multiples2 + 27))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 27))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 27))->m_z, 1);

dummy[3] = 0x76d0;
dummy[2] = 0x21521007;
dummy[1] = 0xb998bcd0;
dummy[0] = 0xf067ab85;
Kset_uipoly_wide((*(generator_multiples1 + 28))->m_U1, dummy, 4);

dummy[3] = 0x1b10d;
dummy[2] = 0x38cf4844;
dummy[1] = 0xf8a5510c;
dummy[0] = 0x8f2df8a5;
Kset_uipoly_wide((*(generator_multiples1 + 28))->m_U0, dummy, 4);

dummy[3] = 0xcef8;
dummy[2] = 0x1ccefca2;
dummy[1] = 0x2a452e19;
dummy[0] = 0xdaf7ad54;
Kset_uipoly_wide((*(generator_multiples1 + 28))->m_V1, dummy, 4);

dummy[3] = 0xa54b;
dummy[2] = 0xee2cf690;
dummy[1] = 0x1ffbb6e5;
dummy[0] = 0xa044543b;
Kset_uipoly_wide((*(generator_multiples1 + 28))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 28))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 28))->m_z, 1);

dummy[3] = 0xb29;
dummy[2] = 0xd6302a40;
dummy[1] = 0x5afba195;
dummy[0] = 0xb3871f9b;
Kset_uipoly_wide((*(generator_multiples2 + 28))->m_U1, dummy, 4);

dummy[3] = 0xb285;
dummy[2] = 0x93bbcec6;
dummy[1] = 0xf4046100;
dummy[0] = 0x179a4d11;
Kset_uipoly_wide((*(generator_multiples2 + 28))->m_U0, dummy, 4);

dummy[3] = 0x1e6b7;
dummy[2] = 0x758cce2f;
dummy[1] = 0x43443140;
dummy[0] = 0x7b2bd;
Kset_uipoly_wide((*(generator_multiples2 + 28))->m_V1, dummy, 4);

dummy[3] = 0x563b;
dummy[2] = 0x1acf69b5;
dummy[1] = 0x36dbb62;
dummy[0] = 0xa8daa34;
Kset_uipoly_wide((*(generator_multiples2 + 28))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 28))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 28))->m_z, 1);

dummy[3] = 0xc838;
dummy[2] = 0x8d30ab2d;
dummy[1] = 0x82e81475;
dummy[0] = 0xb95463c9;
Kset_uipoly_wide((*(generator_multiples1 + 29))->m_U1, dummy, 4);

dummy[3] = 0x131b8;
dummy[2] = 0xf373f843;
dummy[1] = 0xa3604e0b;
dummy[0] = 0xd6e90a38;
Kset_uipoly_wide((*(generator_multiples1 + 29))->m_U0, dummy, 4);

dummy[3] = 0x3eb1;
dummy[2] = 0xf4e1a0e4;
dummy[1] = 0x4ca2674c;
dummy[0] = 0x6e67ad0f;
Kset_uipoly_wide((*(generator_multiples1 + 29))->m_V1, dummy, 4);

dummy[3] = 0xad5c;
dummy[2] = 0xb1b9420c;
dummy[1] = 0x3d9b4eea;
dummy[0] = 0x53bc07b1;
Kset_uipoly_wide((*(generator_multiples1 + 29))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 29))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 29))->m_z, 1);

dummy[3] = 0x19780;
dummy[2] = 0xaa0e5531;
dummy[1] = 0x74fe37ab;
dummy[0] = 0x1d6ef831;
Kset_uipoly_wide((*(generator_multiples2 + 29))->m_U1, dummy, 4);

dummy[3] = 0x12c8e;
dummy[2] = 0xd9d3ebfc;
dummy[1] = 0xc5405311;
dummy[0] = 0x9ab44b13;
Kset_uipoly_wide((*(generator_multiples2 + 29))->m_U0, dummy, 4);

dummy[3] = 0x12b45;
dummy[2] = 0x1656e273;
dummy[1] = 0xa1e3bb6d;
dummy[0] = 0x6c8d536a;
Kset_uipoly_wide((*(generator_multiples2 + 29))->m_V1, dummy, 4);

dummy[3] = 0x17fb0;
dummy[2] = 0x64c51957;
dummy[1] = 0xa30f1755;
dummy[0] = 0x7c2bed42;
Kset_uipoly_wide((*(generator_multiples2 + 29))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 29))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 29))->m_z, 1);

dummy[3] = 0x196b2;
dummy[2] = 0x3f3ed801;
dummy[1] = 0xf920367d;
dummy[0] = 0xa563c93d;
Kset_uipoly_wide((*(generator_multiples1 + 30))->m_U1, dummy, 4);

dummy[3] = 0x20e4;
dummy[2] = 0xa1509b1a;
dummy[1] = 0xfaa14013;
dummy[0] = 0x39fd6d33;
Kset_uipoly_wide((*(generator_multiples1 + 30))->m_U0, dummy, 4);

dummy[3] = 0x16e44;
dummy[2] = 0x2b4c421d;
dummy[1] = 0xbec85259;
dummy[0] = 0xe87adeb9;
Kset_uipoly_wide((*(generator_multiples1 + 30))->m_V1, dummy, 4);

dummy[3] = 0x14145;
dummy[2] = 0x2311872c;
dummy[1] = 0x82a29e95;
dummy[0] = 0xdca8a56a;
Kset_uipoly_wide((*(generator_multiples1 + 30))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 30))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 30))->m_z, 1);

dummy[3] = 0x16800;
dummy[2] = 0xc3d739ed;
dummy[1] = 0x7b7398ce;
dummy[0] = 0x69b9dbdd;
Kset_uipoly_wide((*(generator_multiples2 + 30))->m_U1, dummy, 4);

dummy[3] = 0xd18f;
dummy[2] = 0xb893841a;
dummy[1] = 0x769e32b4;
dummy[0] = 0xcfa16a4d;
Kset_uipoly_wide((*(generator_multiples2 + 30))->m_U0, dummy, 4);

dummy[3] = 0x11ad0;
dummy[2] = 0x33ece1bb;
dummy[1] = 0x38a13064;
dummy[0] = 0x3c628247;
Kset_uipoly_wide((*(generator_multiples2 + 30))->m_V1, dummy, 4);

dummy[3] = 0x13a28;
dummy[2] = 0x463f93ff;
dummy[1] = 0x5a793cd;
dummy[0] = 0x66e4f283;
Kset_uipoly_wide((*(generator_multiples2 + 30))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 30))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 30))->m_z, 1);

dummy[3] = 0x12e5;
dummy[2] = 0xa2c12cc4;
dummy[1] = 0x9a36b3ef;
dummy[0] = 0x928cc298;
Kset_uipoly_wide((*(generator_multiples1 + 31))->m_U1, dummy, 4);

dummy[3] = 0xa0ef;
dummy[2] = 0x78c713f4;
dummy[1] = 0x63e74753;
dummy[0] = 0x3145b9e9;
Kset_uipoly_wide((*(generator_multiples1 + 31))->m_U0, dummy, 4);

dummy[3] = 0x3084;
dummy[2] = 0xa670f0b9;
dummy[1] = 0x838bbdf3;
dummy[0] = 0x2440ebb6;
Kset_uipoly_wide((*(generator_multiples1 + 31))->m_V1, dummy, 4);

dummy[3] = 0x13d28;
dummy[2] = 0xa3e3b515;
dummy[1] = 0x12693203;
dummy[0] = 0xe1e16496;
Kset_uipoly_wide((*(generator_multiples1 + 31))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 31))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 31))->m_z, 1);

dummy[3] = 0xcb9b;
dummy[2] = 0x40ce7ffe;
dummy[1] = 0x8a40daf5;
dummy[0] = 0x26c6fbb7;
Kset_uipoly_wide((*(generator_multiples2 + 31))->m_U1, dummy, 4);

dummy[3] = 0x13d29;
dummy[2] = 0x9671b5f5;
dummy[1] = 0xe5bd01eb;
dummy[0] = 0x25be71b;
Kset_uipoly_wide((*(generator_multiples2 + 31))->m_U0, dummy, 4);

dummy[3] = 0x180b3;
dummy[2] = 0xb95f5909;
dummy[1] = 0xb319ff85;
dummy[0] = 0xfc23239e;
Kset_uipoly_wide((*(generator_multiples2 + 31))->m_V1, dummy, 4);

dummy[3] = 0x1d5ed;
dummy[2] = 0x70b6d8c1;
dummy[1] = 0xfe5f12cd;
dummy[0] = 0x4f03c31;
Kset_uipoly_wide((*(generator_multiples2 + 31))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 31))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 31))->m_z, 1);

dummy[3] = 0x19c18;
dummy[2] = 0x483ce1f2;
dummy[1] = 0x7bc28a8d;
dummy[0] = 0x16ffe01d;
Kset_uipoly_wide((*(generator_multiples1 + 32))->m_U1, dummy, 4);

dummy[3] = 0x1d1c6;
dummy[2] = 0x6bcdd35a;
dummy[1] = 0x55e4a9eb;
dummy[0] = 0x3472e9f6;
Kset_uipoly_wide((*(generator_multiples1 + 32))->m_U0, dummy, 4);

dummy[3] = 0x6163;
dummy[2] = 0x794a162a;
dummy[1] = 0x43d56027;
dummy[0] = 0xc51a6b09;
Kset_uipoly_wide((*(generator_multiples1 + 32))->m_V1, dummy, 4);

dummy[3] = 0x9a63;
dummy[2] = 0x4d39ae91;
dummy[1] = 0xc81289e8;
dummy[0] = 0x4bed4d76;
Kset_uipoly_wide((*(generator_multiples1 + 32))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 32))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 32))->m_z, 1);

dummy[3] = 0x6bd2;
dummy[2] = 0x7d60c577;
dummy[1] = 0x3c1e5a1d;
dummy[0] = 0x2429d33f;
Kset_uipoly_wide((*(generator_multiples2 + 32))->m_U1, dummy, 4);

dummy[3] = 0xe6de;
dummy[2] = 0x9fd8504;
dummy[1] = 0x8e9c092d;
dummy[0] = 0x9f81bc53;
Kset_uipoly_wide((*(generator_multiples2 + 32))->m_U0, dummy, 4);

dummy[3] = 0x3a55;
dummy[2] = 0x170ad512;
dummy[1] = 0xe5c1f0e2;
dummy[0] = 0xaf895dcb;
Kset_uipoly_wide((*(generator_multiples2 + 32))->m_V1, dummy, 4);

dummy[3] = 0x8ae7;
dummy[2] = 0x80f02cab;
dummy[1] = 0x1283a1fb;
dummy[0] = 0xea2b5921;
Kset_uipoly_wide((*(generator_multiples2 + 32))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 32))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 32))->m_z, 1);

dummy[3] = 0x141c0;
dummy[2] = 0xf3aa3f30;
dummy[1] = 0xbf06f2d;
dummy[0] = 0x4cc20b91;
Kset_uipoly_wide((*(generator_multiples1 + 33))->m_U1, dummy, 4);

dummy[3] = 0xf1d7;
dummy[2] = 0xc953ba7f;
dummy[1] = 0xfd82a99c;
dummy[0] = 0x91cc81c5;
Kset_uipoly_wide((*(generator_multiples1 + 33))->m_U0, dummy, 4);

dummy[3] = 0x15d2a;
dummy[2] = 0x4cf0aa6c;
dummy[1] = 0x60b913f9;
dummy[0] = 0x19d407fb;
Kset_uipoly_wide((*(generator_multiples1 + 33))->m_V1, dummy, 4);

dummy[3] = 0x1b6ea;
dummy[2] = 0x57c101a9;
dummy[1] = 0x11b08824;
dummy[0] = 0x2582d25f;
Kset_uipoly_wide((*(generator_multiples1 + 33))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 33))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 33))->m_z, 1);

dummy[3] = 0xcb7a;
dummy[2] = 0x4481d073;
dummy[1] = 0x9272e24e;
dummy[0] = 0x5634fae3;
Kset_uipoly_wide((*(generator_multiples2 + 33))->m_U1, dummy, 4);

dummy[3] = 0xf39f;
dummy[2] = 0xd4b3c39d;
dummy[1] = 0x3c05f461;
dummy[0] = 0xb8174421;
Kset_uipoly_wide((*(generator_multiples2 + 33))->m_U0, dummy, 4);

dummy[3] = 0x1cb2;
dummy[2] = 0x2e78a661;
dummy[1] = 0xcb77d4fd;
dummy[0] = 0x58df382f;
Kset_uipoly_wide((*(generator_multiples2 + 33))->m_V1, dummy, 4);

dummy[3] = 0x1e7e9;
dummy[2] = 0x871081c7;
dummy[1] = 0xe71209ec;
dummy[0] = 0xedbfafc8;
Kset_uipoly_wide((*(generator_multiples2 + 33))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 33))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 33))->m_z, 1);

dummy[3] = 0xac66;
dummy[2] = 0x7c1de776;
dummy[1] = 0x12700b84;
dummy[0] = 0x9f5eda02;
Kset_uipoly_wide((*(generator_multiples1 + 34))->m_U1, dummy, 4);

dummy[3] = 0xf001;
dummy[2] = 0xc1fae2e9;
dummy[1] = 0xf7af887b;
dummy[0] = 0x90769528;
Kset_uipoly_wide((*(generator_multiples1 + 34))->m_U0, dummy, 4);

dummy[3] = 0xc890;
dummy[2] = 0xde0bf81e;
dummy[1] = 0xcbe3cec8;
dummy[0] = 0x58907461;
Kset_uipoly_wide((*(generator_multiples1 + 34))->m_V1, dummy, 4);

dummy[3] = 0x1666e;
dummy[2] = 0x79c5c52d;
dummy[1] = 0x47f80dba;
dummy[0] = 0xd2c0ef24;
Kset_uipoly_wide((*(generator_multiples1 + 34))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 34))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 34))->m_z, 1);

dummy[3] = 0xd6db;
dummy[2] = 0x7f053771;
dummy[1] = 0x90ee488a;
dummy[0] = 0x89373177;
Kset_uipoly_wide((*(generator_multiples2 + 34))->m_U1, dummy, 4);

dummy[3] = 0xd893;
dummy[2] = 0x6cf62744;
dummy[1] = 0xaaac183b;
dummy[0] = 0x261673d9;
Kset_uipoly_wide((*(generator_multiples2 + 34))->m_U0, dummy, 4);

dummy[3] = 0x18790;
dummy[2] = 0x62117abd;
dummy[1] = 0x6769824;
dummy[0] = 0x1fe8456b;
Kset_uipoly_wide((*(generator_multiples2 + 34))->m_V1, dummy, 4);

dummy[3] = 0xd14a;
dummy[2] = 0x3caea3af;
dummy[1] = 0xf1fcb131;
dummy[0] = 0x2b115988;
Kset_uipoly_wide((*(generator_multiples2 + 34))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 34))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 34))->m_z, 1);

dummy[3] = 0x123bf;
dummy[2] = 0xa9e68dc4;
dummy[1] = 0xa7c06343;
dummy[0] = 0xe23781b7;
Kset_uipoly_wide((*(generator_multiples1 + 35))->m_U1, dummy, 4);

dummy[3] = 0x171ea;
dummy[2] = 0x68091913;
dummy[1] = 0xfa4b321b;
dummy[0] = 0xb6876950;
Kset_uipoly_wide((*(generator_multiples1 + 35))->m_U0, dummy, 4);

dummy[3] = 0x4e58;
dummy[2] = 0x75a3ff68;
dummy[1] = 0x1cd56030;
dummy[0] = 0x56683530;
Kset_uipoly_wide((*(generator_multiples1 + 35))->m_V1, dummy, 4);

dummy[3] = 0x1cb1e;
dummy[2] = 0x346c06fb;
dummy[1] = 0x6a47fa3;
dummy[0] = 0xd0971743;
Kset_uipoly_wide((*(generator_multiples1 + 35))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 35))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 35))->m_z, 1);

dummy[3] = 0x677c;
dummy[2] = 0xccea02f0;
dummy[1] = 0x53bb5a75;
dummy[0] = 0x7c12033;
Kset_uipoly_wide((*(generator_multiples2 + 35))->m_U1, dummy, 4);

dummy[3] = 0x9cea;
dummy[2] = 0x7a01f258;
dummy[1] = 0x30ba6b4;
dummy[0] = 0x43e6cea2;
Kset_uipoly_wide((*(generator_multiples2 + 35))->m_U0, dummy, 4);

dummy[3] = 0x4bc8;
dummy[2] = 0xddb36624;
dummy[1] = 0x4b79d895;
dummy[0] = 0x6ed9bb07;
Kset_uipoly_wide((*(generator_multiples2 + 35))->m_V1, dummy, 4);

dummy[3] = 0x1c8a8;
dummy[2] = 0x4664b04e;
dummy[1] = 0xe9b3c072;
dummy[0] = 0xc391a1e7;
Kset_uipoly_wide((*(generator_multiples2 + 35))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 35))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 35))->m_z, 1);

dummy[3] = 0x1a479;
dummy[2] = 0xc9035dbc;
dummy[1] = 0xd67b781f;
dummy[0] = 0x76b9b212;
Kset_uipoly_wide((*(generator_multiples1 + 36))->m_U1, dummy, 4);

dummy[3] = 0x19600;
dummy[2] = 0xbb9408b1;
dummy[1] = 0xaa38f57a;
dummy[0] = 0xcc0a06ce;
Kset_uipoly_wide((*(generator_multiples1 + 36))->m_U0, dummy, 4);

dummy[3] = 0x4a54;
dummy[2] = 0xdad78c0b;
dummy[1] = 0xf9bcc6b6;
dummy[0] = 0xbf51f9b6;
Kset_uipoly_wide((*(generator_multiples1 + 36))->m_V1, dummy, 4);

dummy[3] = 0x19969;
dummy[2] = 0xa710701e;
dummy[1] = 0x36d22dfa;
dummy[0] = 0x95b4d78b;
Kset_uipoly_wide((*(generator_multiples1 + 36))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 36))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 36))->m_z, 1);

dummy[3] = 0x3bc2;
dummy[2] = 0x6f13a8ee;
dummy[1] = 0x4af45905;
dummy[0] = 0xb1d054f5;
Kset_uipoly_wide((*(generator_multiples2 + 36))->m_U1, dummy, 4);

dummy[3] = 0x49a9;
dummy[2] = 0x5bc359d9;
dummy[1] = 0x7747327d;
dummy[0] = 0x752ab534;
Kset_uipoly_wide((*(generator_multiples2 + 36))->m_U0, dummy, 4);

dummy[3] = 0x12275;
dummy[2] = 0x91239245;
dummy[1] = 0x976780d2;
dummy[0] = 0x9d1910bd;
Kset_uipoly_wide((*(generator_multiples2 + 36))->m_V1, dummy, 4);

dummy[3] = 0x8c8f;
dummy[2] = 0xffba85;
dummy[1] = 0xc4c922d1;
dummy[0] = 0xda2ff8f9;
Kset_uipoly_wide((*(generator_multiples2 + 36))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 36))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 36))->m_z, 1);

dummy[3] = 0x1d55c;
dummy[2] = 0x2cbff36d;
dummy[1] = 0x46f12906;
dummy[0] = 0x86fb848e;
Kset_uipoly_wide((*(generator_multiples1 + 37))->m_U1, dummy, 4);

dummy[3] = 0x103b5;
dummy[2] = 0xe982d1dd;
dummy[1] = 0xf36e4efe;
dummy[0] = 0xf059fab0;
Kset_uipoly_wide((*(generator_multiples1 + 37))->m_U0, dummy, 4);

dummy[3] = 0x1cc58;
dummy[2] = 0xa21b5cd2;
dummy[1] = 0xf568d709;
dummy[0] = 0x81c03b84;
Kset_uipoly_wide((*(generator_multiples1 + 37))->m_V1, dummy, 4);

dummy[3] = 0x17eb1;
dummy[2] = 0x48645ed7;
dummy[1] = 0xf8a514f7;
dummy[0] = 0x1e036e10;
Kset_uipoly_wide((*(generator_multiples1 + 37))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 37))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 37))->m_z, 1);

dummy[3] = 0x72e6;
dummy[2] = 0xac5fd61d;
dummy[1] = 0x103f5f03;
dummy[0] = 0x2d2bd1d5;
Kset_uipoly_wide((*(generator_multiples2 + 37))->m_U1, dummy, 4);

dummy[3] = 0x10d76;
dummy[2] = 0xbdd457cb;
dummy[1] = 0xb27ce095;
dummy[0] = 0x2bd3fb0f;
Kset_uipoly_wide((*(generator_multiples2 + 37))->m_U0, dummy, 4);

dummy[3] = 0x1f526;
dummy[2] = 0xceb95d27;
dummy[1] = 0x54d30be9;
dummy[0] = 0xcc75eeb1;
Kset_uipoly_wide((*(generator_multiples2 + 37))->m_V1, dummy, 4);

dummy[3] = 0x1a9d3;
dummy[2] = 0x293751be;
dummy[1] = 0xe1ad2ef5;
dummy[0] = 0xd89057a;
Kset_uipoly_wide((*(generator_multiples2 + 37))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 37))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 37))->m_z, 1);

dummy[3] = 0x9a97;
dummy[2] = 0x246122af;
dummy[1] = 0xe6382b88;
dummy[0] = 0xef8d43db;
Kset_uipoly_wide((*(generator_multiples1 + 38))->m_U1, dummy, 4);

dummy[3] = 0x37e1;
dummy[2] = 0xd1b9205a;
dummy[1] = 0x1ad80b8d;
dummy[0] = 0xd64cdae4;
Kset_uipoly_wide((*(generator_multiples1 + 38))->m_U0, dummy, 4);

dummy[3] = 0x1656b;
dummy[2] = 0x85fb0d66;
dummy[1] = 0xd2fb15bd;
dummy[0] = 0xca382a01;
Kset_uipoly_wide((*(generator_multiples1 + 38))->m_V1, dummy, 4);

dummy[3] = 0x602b;
dummy[2] = 0xaeb4c03e;
dummy[1] = 0xdda6016f;
dummy[0] = 0x5f4a3fa8;
Kset_uipoly_wide((*(generator_multiples1 + 38))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 38))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 38))->m_z, 1);

dummy[3] = 0xe252;
dummy[2] = 0x27b8c2f3;
dummy[1] = 0x8bfa860b;
dummy[0] = 0x915b433e;
Kset_uipoly_wide((*(generator_multiples2 + 38))->m_U1, dummy, 4);

dummy[3] = 0x17a92;
dummy[2] = 0x3eb81673;
dummy[1] = 0x43a02736;
dummy[0] = 0x6aa0e73b;
Kset_uipoly_wide((*(generator_multiples2 + 38))->m_U0, dummy, 4);

dummy[3] = 0xfbcf;
dummy[2] = 0x666af732;
dummy[1] = 0x2c5e0ea1;
dummy[0] = 0x7cdcf506;
Kset_uipoly_wide((*(generator_multiples2 + 38))->m_V1, dummy, 4);

dummy[3] = 0xde2a;
dummy[2] = 0xfeb03cf;
dummy[1] = 0x49056fe9;
dummy[0] = 0xed1c3301;
Kset_uipoly_wide((*(generator_multiples2 + 38))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 38))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 38))->m_z, 1);

dummy[3] = 0x10f2b;
dummy[2] = 0xdd7a8192;
dummy[1] = 0xccd551ab;
dummy[0] = 0x8ee26e09;
Kset_uipoly_wide((*(generator_multiples1 + 39))->m_U1, dummy, 4);

dummy[3] = 0xc2a1;
dummy[2] = 0xa011ec7c;
dummy[1] = 0x26ef1239;
dummy[0] = 0x310362e2;
Kset_uipoly_wide((*(generator_multiples1 + 39))->m_U0, dummy, 4);

dummy[3] = 0x4bad;
dummy[2] = 0x765e8e14;
dummy[1] = 0x9d0bc78c;
dummy[0] = 0x808d9039;
Kset_uipoly_wide((*(generator_multiples1 + 39))->m_V1, dummy, 4);

dummy[3] = 0xdf1b;
dummy[2] = 0xc310fd19;
dummy[1] = 0x4c77a137;
dummy[0] = 0xbae958b;
Kset_uipoly_wide((*(generator_multiples1 + 39))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 39))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 39))->m_z, 1);

dummy[3] = 0x1c62a;
dummy[2] = 0x15fac56e;
dummy[1] = 0xecba46fb;
dummy[0] = 0x84ddf20b;
Kset_uipoly_wide((*(generator_multiples2 + 39))->m_U1, dummy, 4);

dummy[3] = 0x706e;
dummy[2] = 0x6db17aa8;
dummy[1] = 0x1ac3dc94;
dummy[0] = 0x27448fd;
Kset_uipoly_wide((*(generator_multiples2 + 39))->m_U0, dummy, 4);

dummy[3] = 0xe355;
dummy[2] = 0x7328af99;
dummy[1] = 0x3798bf93;
dummy[0] = 0x1943d8c9;
Kset_uipoly_wide((*(generator_multiples2 + 39))->m_V1, dummy, 4);

dummy[3] = 0x1f588;
dummy[2] = 0x87390293;
dummy[1] = 0x67c1e4dc;
dummy[0] = 0x4ac75dda;
Kset_uipoly_wide((*(generator_multiples2 + 39))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 39))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 39))->m_z, 1);

dummy[3] = 0x48ea;
dummy[2] = 0xd95e7b66;
dummy[1] = 0xc78d8ce;
dummy[0] = 0x8e0d49de;
Kset_uipoly_wide((*(generator_multiples1 + 40))->m_U1, dummy, 4);

dummy[3] = 0x1bd4;
dummy[2] = 0x9d86ce7c;
dummy[1] = 0xae560811;
dummy[0] = 0x865a29e8;
Kset_uipoly_wide((*(generator_multiples1 + 40))->m_U0, dummy, 4);

dummy[3] = 0x19d43;
dummy[2] = 0x12d0acf4;
dummy[1] = 0x969302f6;
dummy[0] = 0xf33188b3;
Kset_uipoly_wide((*(generator_multiples1 + 40))->m_V1, dummy, 4);

dummy[3] = 0x1a6f8;
dummy[2] = 0x1af14bbe;
dummy[1] = 0x9d564cc2;
dummy[0] = 0x382696c9;
Kset_uipoly_wide((*(generator_multiples1 + 40))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 40))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 40))->m_z, 1);

dummy[3] = 0x1f527;
dummy[2] = 0x4b99ac39;
dummy[1] = 0xff84ab45;
dummy[0] = 0x2b1c92c7;
Kset_uipoly_wide((*(generator_multiples2 + 40))->m_U1, dummy, 4);

dummy[3] = 0x170b;
dummy[2] = 0xcc6cf54f;
dummy[1] = 0xf23c3007;
dummy[0] = 0xeea5bca3;
Kset_uipoly_wide((*(generator_multiples2 + 40))->m_U0, dummy, 4);

dummy[3] = 0x1ccb7;
dummy[2] = 0xfd486007;
dummy[1] = 0x733c232a;
dummy[0] = 0xd1fb0444;
Kset_uipoly_wide((*(generator_multiples2 + 40))->m_V1, dummy, 4);

dummy[3] = 0xb226;
dummy[2] = 0xef1b8eaa;
dummy[1] = 0xe0254af2;
dummy[0] = 0xd6ecfb54;
Kset_uipoly_wide((*(generator_multiples2 + 40))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 40))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 40))->m_z, 1);

dummy[3] = 0x33c5;
dummy[2] = 0x66ca8aed;
dummy[1] = 0xa516a986;
dummy[0] = 0xc22df974;
Kset_uipoly_wide((*(generator_multiples1 + 41))->m_U1, dummy, 4);

dummy[3] = 0xb8e;
dummy[2] = 0xc3171a63;
dummy[1] = 0x41257aa;
dummy[0] = 0xce6b49fa;
Kset_uipoly_wide((*(generator_multiples1 + 41))->m_U0, dummy, 4);

dummy[3] = 0x11707;
dummy[2] = 0x5f15b016;
dummy[1] = 0x87974e42;
dummy[0] = 0x787816ef;
Kset_uipoly_wide((*(generator_multiples1 + 41))->m_V1, dummy, 4);

dummy[3] = 0x1a7ec;
dummy[2] = 0xa3e5030b;
dummy[1] = 0xcdf55863;
dummy[0] = 0xe7ee92f;
Kset_uipoly_wide((*(generator_multiples1 + 41))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 41))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 41))->m_z, 1);

dummy[3] = 0x8922;
dummy[2] = 0x2d891abd;
dummy[1] = 0x1a6591f4;
dummy[0] = 0x20889430;
Kset_uipoly_wide((*(generator_multiples2 + 41))->m_U1, dummy, 4);

dummy[3] = 0x1b8d6;
dummy[2] = 0xf3a724bb;
dummy[1] = 0xb2f7796c;
dummy[0] = 0xf9cc4840;
Kset_uipoly_wide((*(generator_multiples2 + 41))->m_U0, dummy, 4);

dummy[3] = 0x3d72;
dummy[2] = 0x81444817;
dummy[1] = 0x1dff3b77;
dummy[0] = 0x349c8ffd;
Kset_uipoly_wide((*(generator_multiples2 + 41))->m_V1, dummy, 4);

dummy[3] = 0x1e0a9;
dummy[2] = 0x1ac78734;
dummy[1] = 0x4c7fff0c;
dummy[0] = 0xed2bed50;
Kset_uipoly_wide((*(generator_multiples2 + 41))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 41))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 41))->m_z, 1);

dummy[3] = 0x15cd8;
dummy[2] = 0xcc051fd9;
dummy[1] = 0x952616fd;
dummy[0] = 0x78c77aa1;
Kset_uipoly_wide((*(generator_multiples1 + 42))->m_U1, dummy, 4);

dummy[3] = 0x1e0a8;
dummy[2] = 0xd10a45eb;
dummy[1] = 0xb73358f5;
dummy[0] = 0x3503033f;
Kset_uipoly_wide((*(generator_multiples1 + 42))->m_U0, dummy, 4);

dummy[3] = 0x1534a;
dummy[2] = 0x7dd37dcc;
dummy[1] = 0xce59f91;
dummy[0] = 0x9d258b80;
Kset_uipoly_wide((*(generator_multiples1 + 42))->m_V1, dummy, 4);

dummy[3] = 0x192b7;
dummy[2] = 0xecbcef7;
dummy[1] = 0x19492bf5;
dummy[0] = 0x444d1395;
Kset_uipoly_wide((*(generator_multiples1 + 42))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 42))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 42))->m_z, 1);

dummy[3] = 0x12a3b;
dummy[2] = 0x55ead720;
dummy[1] = 0xc3853c82;
dummy[0] = 0x888f3825;
Kset_uipoly_wide((*(generator_multiples2 + 42))->m_U1, dummy, 4);

dummy[3] = 0x14933;
dummy[2] = 0x243a58df;
dummy[1] = 0xfdf3c89c;
dummy[0] = 0x4e26eba3;
Kset_uipoly_wide((*(generator_multiples2 + 42))->m_U0, dummy, 4);

dummy[3] = 0xee88;
dummy[2] = 0x58173869;
dummy[1] = 0x9e2e3aa3;
dummy[0] = 0x38309416;
Kset_uipoly_wide((*(generator_multiples2 + 42))->m_V1, dummy, 4);

dummy[3] = 0x1a522;
dummy[2] = 0x532b0cbc;
dummy[1] = 0xd03aac40;
dummy[0] = 0x34b61475;
Kset_uipoly_wide((*(generator_multiples2 + 42))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 42))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 42))->m_z, 1);

dummy[3] = 0x1cb70;
dummy[2] = 0x9834f934;
dummy[1] = 0xc0003f2b;
dummy[0] = 0x813198c5;
Kset_uipoly_wide((*(generator_multiples1 + 43))->m_U1, dummy, 4);

dummy[3] = 0x1d145;
dummy[2] = 0x7cdf5f5e;
dummy[1] = 0x3efc50a3;
dummy[0] = 0x6c691a9b;
Kset_uipoly_wide((*(generator_multiples1 + 43))->m_U0, dummy, 4);

dummy[3] = 0x94b3;
dummy[2] = 0x3df61322;
dummy[1] = 0xef64679;
dummy[0] = 0xdacd8ee1;
Kset_uipoly_wide((*(generator_multiples1 + 43))->m_V1, dummy, 4);

dummy[3] = 0xaa3b;
dummy[2] = 0xcc3905d8;
dummy[1] = 0xbc3c0e19;
dummy[0] = 0x39f7d2a;
Kset_uipoly_wide((*(generator_multiples1 + 43))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 43))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 43))->m_z, 1);

dummy[3] = 0x9e8;
dummy[2] = 0xb06e4c50;
dummy[1] = 0x9c0158b8;
dummy[0] = 0xf2faf792;
Kset_uipoly_wide((*(generator_multiples2 + 43))->m_U1, dummy, 4);

dummy[3] = 0xe5ca;
dummy[2] = 0xfc58937f;
dummy[1] = 0xebda00e2;
dummy[0] = 0xedb2a671;
Kset_uipoly_wide((*(generator_multiples2 + 43))->m_U0, dummy, 4);

dummy[3] = 0x9299;
dummy[2] = 0xce03b608;
dummy[1] = 0xc2b76a42;
dummy[0] = 0xb651195c;
Kset_uipoly_wide((*(generator_multiples2 + 43))->m_V1, dummy, 4);

dummy[3] = 0x179a7;
dummy[2] = 0xd180608d;
dummy[1] = 0xe4f70a91;
dummy[0] = 0xa0f1ea4b;
Kset_uipoly_wide((*(generator_multiples2 + 43))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 43))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 43))->m_z, 1);

dummy[3] = 0x9155;
dummy[2] = 0xe51dff63;
dummy[1] = 0xb921acdc;
dummy[0] = 0x1645da72;
Kset_uipoly_wide((*(generator_multiples1 + 44))->m_U1, dummy, 4);

dummy[3] = 0x100ed;
dummy[2] = 0xc51eab47;
dummy[1] = 0x4aed6615;
dummy[0] = 0x127e36d2;
Kset_uipoly_wide((*(generator_multiples1 + 44))->m_U0, dummy, 4);

dummy[3] = 0xb292;
dummy[2] = 0xa820ce0e;
dummy[1] = 0x74780ff;
dummy[0] = 0x4022c75a;
Kset_uipoly_wide((*(generator_multiples1 + 44))->m_V1, dummy, 4);

dummy[3] = 0x17834;
dummy[2] = 0xeae566d7;
dummy[1] = 0x6d91e609;
dummy[0] = 0xfadc1884;
Kset_uipoly_wide((*(generator_multiples1 + 44))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 44))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 44))->m_z, 1);

dummy[3] = 0x84a8;
dummy[2] = 0x5e5a4187;
dummy[1] = 0x6404aa25;
dummy[0] = 0xf329ba27;
Kset_uipoly_wide((*(generator_multiples2 + 44))->m_U1, dummy, 4);

dummy[3] = 0x1759e;
dummy[2] = 0xa01f1ded;
dummy[1] = 0xa212e58e;
dummy[0] = 0xadae6c7f;
Kset_uipoly_wide((*(generator_multiples2 + 44))->m_U0, dummy, 4);

dummy[3] = 0xbc11;
dummy[2] = 0x78a42f4a;
dummy[1] = 0xcb7a374c;
dummy[0] = 0x3a9451ca;
Kset_uipoly_wide((*(generator_multiples2 + 44))->m_V1, dummy, 4);

dummy[3] = 0x1269f;
dummy[2] = 0x615680a9;
dummy[1] = 0xb7df10ee;
dummy[0] = 0xc2b4a2e3;
Kset_uipoly_wide((*(generator_multiples2 + 44))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 44))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 44))->m_z, 1);

dummy[3] = 0x5569;
dummy[2] = 0x5aff40ba;
dummy[1] = 0x737c26b1;
dummy[0] = 0xc4bd6072;
Kset_uipoly_wide((*(generator_multiples1 + 45))->m_U1, dummy, 4);

dummy[3] = 0x191;
dummy[2] = 0x69c0f616;
dummy[1] = 0x79c3c276;
dummy[0] = 0x3ac024e9;
Kset_uipoly_wide((*(generator_multiples1 + 45))->m_U0, dummy, 4);

dummy[3] = 0x18d16;
dummy[2] = 0x119c0682;
dummy[1] = 0x283cb6a4;
dummy[0] = 0xc69e70ed;
Kset_uipoly_wide((*(generator_multiples1 + 45))->m_V1, dummy, 4);

dummy[3] = 0x1fceb;
dummy[2] = 0x97dc0329;
dummy[1] = 0x9d584019;
dummy[0] = 0x85f43845;
Kset_uipoly_wide((*(generator_multiples1 + 45))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 45))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 45))->m_z, 1);

dummy[3] = 0xf1e6;
dummy[2] = 0x7151c2a6;
dummy[1] = 0xc3c0064e;
dummy[0] = 0xb58c6f51;
Kset_uipoly_wide((*(generator_multiples2 + 45))->m_U1, dummy, 4);

dummy[3] = 0x7003;
dummy[2] = 0xc4f85cbd;
dummy[1] = 0x8ea7fcc6;
dummy[0] = 0xe282c253;
Kset_uipoly_wide((*(generator_multiples2 + 45))->m_U0, dummy, 4);

dummy[3] = 0x1bb40;
dummy[2] = 0x26d02f83;
dummy[1] = 0x9f417a56;
dummy[0] = 0x37fe2f7d;
Kset_uipoly_wide((*(generator_multiples2 + 45))->m_V1, dummy, 4);

dummy[3] = 0x1665e;
dummy[2] = 0x71838e83;
dummy[1] = 0xa8e4b0c8;
dummy[0] = 0xfad01e18;
Kset_uipoly_wide((*(generator_multiples2 + 45))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 45))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 45))->m_z, 1);

dummy[3] = 0x11141;
dummy[2] = 0x9ca0aaaa;
dummy[1] = 0x74621bb6;
dummy[0] = 0x1c06db79;
Kset_uipoly_wide((*(generator_multiples1 + 46))->m_U1, dummy, 4);

dummy[3] = 0x7cdb;
dummy[2] = 0xc6d5eedb;
dummy[1] = 0x1507228f;
dummy[0] = 0x99c304d4;
Kset_uipoly_wide((*(generator_multiples1 + 46))->m_U0, dummy, 4);

dummy[3] = 0xe87c;
dummy[2] = 0x8524c005;
dummy[1] = 0xcf96ef5f;
dummy[0] = 0x80626f34;
Kset_uipoly_wide((*(generator_multiples1 + 46))->m_V1, dummy, 4);

dummy[3] = 0x1ec01;
dummy[2] = 0x79582c6f;
dummy[1] = 0x83aa4262;
dummy[0] = 0x2cbfedda;
Kset_uipoly_wide((*(generator_multiples1 + 46))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 46))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 46))->m_z, 1);

dummy[3] = 0x16a4a;
dummy[2] = 0x62e3e7a8;
dummy[1] = 0xe40cd827;
dummy[0] = 0x7f173c3d;
Kset_uipoly_wide((*(generator_multiples2 + 46))->m_U1, dummy, 4);

dummy[3] = 0xdd8b;
dummy[2] = 0x749c81ca;
dummy[1] = 0xdf64f001;
dummy[0] = 0x5ac7c7e1;
Kset_uipoly_wide((*(generator_multiples2 + 46))->m_U0, dummy, 4);

dummy[3] = 0xed41;
dummy[2] = 0x367e7f74;
dummy[1] = 0xc1e93794;
dummy[0] = 0x8dafcba8;
Kset_uipoly_wide((*(generator_multiples2 + 46))->m_V1, dummy, 4);

dummy[3] = 0x16540;
dummy[2] = 0xa3092d99;
dummy[1] = 0xa62e8c4;
dummy[0] = 0x452d0f88;
Kset_uipoly_wide((*(generator_multiples2 + 46))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 46))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 46))->m_z, 1);

dummy[3] = 0xbf88;
dummy[2] = 0x949dc23c;
dummy[1] = 0x37dcefd0;
dummy[0] = 0xd12c5849;
Kset_uipoly_wide((*(generator_multiples1 + 47))->m_U1, dummy, 4);

dummy[3] = 0x1c6f;
dummy[2] = 0x9d7f2ac7;
dummy[1] = 0xf4c7a2a3;
dummy[0] = 0xf2990108;
Kset_uipoly_wide((*(generator_multiples1 + 47))->m_U0, dummy, 4);

dummy[3] = 0x5ed7;
dummy[2] = 0x406f3e92;
dummy[1] = 0x24ea2490;
dummy[0] = 0x684eb5b2;
Kset_uipoly_wide((*(generator_multiples1 + 47))->m_V1, dummy, 4);

dummy[3] = 0xa1b0;
dummy[2] = 0xdf258e44;
dummy[1] = 0x42668142;
dummy[0] = 0xa63b3feb;
Kset_uipoly_wide((*(generator_multiples1 + 47))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 47))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 47))->m_z, 1);

dummy[3] = 0x2451;
dummy[2] = 0xa732c1f1;
dummy[1] = 0xb71a645c;
dummy[0] = 0xa2b00ac2;
Kset_uipoly_wide((*(generator_multiples2 + 47))->m_U1, dummy, 4);

dummy[3] = 0x16d76;
dummy[2] = 0xb4ea92a8;
dummy[1] = 0xb35664f0;
dummy[0] = 0xf511e1f5;
Kset_uipoly_wide((*(generator_multiples2 + 47))->m_U0, dummy, 4);

dummy[3] = 0x1ec9f;
dummy[2] = 0x562129;
dummy[1] = 0x54fa2402;
dummy[0] = 0x87815b5;
Kset_uipoly_wide((*(generator_multiples2 + 47))->m_V1, dummy, 4);

dummy[3] = 0x14ac6;
dummy[2] = 0xddb5d650;
dummy[1] = 0x1894445d;
dummy[0] = 0x88c734be;
Kset_uipoly_wide((*(generator_multiples2 + 47))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 47))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 47))->m_z, 1);

dummy[3] = 0xaef0;
dummy[2] = 0xb309e754;
dummy[1] = 0x9ad662a7;
dummy[0] = 0xa9d59b32;
Kset_uipoly_wide((*(generator_multiples1 + 48))->m_U1, dummy, 4);

dummy[3] = 0x6895;
dummy[2] = 0x3b0bd979;
dummy[1] = 0x404cb2d0;
dummy[0] = 0xeaa68605;
Kset_uipoly_wide((*(generator_multiples1 + 48))->m_U0, dummy, 4);

dummy[3] = 0x1c9a5;
dummy[2] = 0x7af7936e;
dummy[1] = 0x3881e439;
dummy[0] = 0xde66387d;
Kset_uipoly_wide((*(generator_multiples1 + 48))->m_V1, dummy, 4);

dummy[3] = 0xa3da;
dummy[2] = 0x920ce09a;
dummy[1] = 0x80e57953;
dummy[0] = 0x6185b32e;
Kset_uipoly_wide((*(generator_multiples1 + 48))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 48))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 48))->m_z, 1);

dummy[3] = 0x3bbe;
dummy[2] = 0xe56049d4;
dummy[1] = 0xd116975;
dummy[0] = 0x35f7c2cb;
Kset_uipoly_wide((*(generator_multiples2 + 48))->m_U1, dummy, 4);

dummy[3] = 0x15178;
dummy[2] = 0xbdd14941;
dummy[1] = 0x4d8cec1e;
dummy[0] = 0xce9c5c45;
Kset_uipoly_wide((*(generator_multiples2 + 48))->m_U0, dummy, 4);

dummy[3] = 0x5a17;
dummy[2] = 0x29a1d37c;
dummy[1] = 0x41f3be5e;
dummy[0] = 0x99a4725b;
Kset_uipoly_wide((*(generator_multiples2 + 48))->m_V1, dummy, 4);

dummy[3] = 0x12f06;
dummy[2] = 0xe7a48e35;
dummy[1] = 0xbe0a3866;
dummy[0] = 0x4c3d648e;
Kset_uipoly_wide((*(generator_multiples2 + 48))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 48))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 48))->m_z, 1);

dummy[3] = 0x1bfe5;
dummy[2] = 0xe6047caf;
dummy[1] = 0x1fc17774;
dummy[0] = 0x3faa3d81;
Kset_uipoly_wide((*(generator_multiples1 + 49))->m_U1, dummy, 4);

dummy[3] = 0x133e3;
dummy[2] = 0xc721ac9a;
dummy[1] = 0xd7972d5b;
dummy[0] = 0xe1ae943a;
Kset_uipoly_wide((*(generator_multiples1 + 49))->m_U0, dummy, 4);

dummy[3] = 0x15c85;
dummy[2] = 0x6dd7143d;
dummy[1] = 0x9bab7edf;
dummy[0] = 0x11e412f2;
Kset_uipoly_wide((*(generator_multiples1 + 49))->m_V1, dummy, 4);

dummy[3] = 0x1f626;
dummy[2] = 0x6edbc33d;
dummy[1] = 0x78977121;
dummy[0] = 0x7dfb1c6d;
Kset_uipoly_wide((*(generator_multiples1 + 49))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 49))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 49))->m_z, 1);

dummy[3] = 0x15657;
dummy[2] = 0x48c79dda;
dummy[1] = 0x2dc3b683;
dummy[0] = 0x6d04ef50;
Kset_uipoly_wide((*(generator_multiples2 + 49))->m_U1, dummy, 4);

dummy[3] = 0x1995;
dummy[2] = 0x18e99dec;
dummy[1] = 0xd0dd95e3;
dummy[0] = 0x3609aa09;
Kset_uipoly_wide((*(generator_multiples2 + 49))->m_U0, dummy, 4);

dummy[3] = 0x19357;
dummy[2] = 0xbf7c3298;
dummy[1] = 0xea0fb42d;
dummy[0] = 0xbfc0d029;
Kset_uipoly_wide((*(generator_multiples2 + 49))->m_V1, dummy, 4);

dummy[3] = 0x1f38f;
dummy[2] = 0x9f7bf25e;
dummy[1] = 0x4f9fe09e;
dummy[0] = 0x6ce36dc1;
Kset_uipoly_wide((*(generator_multiples2 + 49))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 49))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 49))->m_z, 1);

dummy[3] = 0x78d4;
dummy[2] = 0xdc60add1;
dummy[1] = 0x5653623b;
dummy[0] = 0x4216bec7;
Kset_uipoly_wide((*(generator_multiples1 + 50))->m_U1, dummy, 4);

dummy[3] = 0x1deaf;
dummy[2] = 0x7d83c028;
dummy[1] = 0x202d3411;
dummy[0] = 0xba109ba1;
Kset_uipoly_wide((*(generator_multiples1 + 50))->m_U0, dummy, 4);

dummy[3] = 0x18ab;
dummy[2] = 0x9f488081;
dummy[1] = 0x8bdb8584;
dummy[0] = 0x6e3ee08e;
Kset_uipoly_wide((*(generator_multiples1 + 50))->m_V1, dummy, 4);

dummy[3] = 0x1b29;
dummy[2] = 0x6003312b;
dummy[1] = 0xcc7351a6;
dummy[0] = 0xbb70c29d;
Kset_uipoly_wide((*(generator_multiples1 + 50))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 50))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 50))->m_z, 1);

dummy[3] = 0xe0c1;
dummy[2] = 0x10ae45ce;
dummy[1] = 0xd73a8d21;
dummy[0] = 0xfe9cac59;
Kset_uipoly_wide((*(generator_multiples2 + 50))->m_U1, dummy, 4);

dummy[3] = 0xb8e9;
dummy[2] = 0xff68e1d;
dummy[1] = 0xedb0548e;
dummy[0] = 0xff3b4e8a;
Kset_uipoly_wide((*(generator_multiples2 + 50))->m_U0, dummy, 4);

dummy[3] = 0x97f;
dummy[2] = 0x460e4851;
dummy[1] = 0x50293d5a;
dummy[0] = 0x3e29f6ec;
Kset_uipoly_wide((*(generator_multiples2 + 50))->m_V1, dummy, 4);

dummy[3] = 0x1a68b;
dummy[2] = 0x8cbe618;
dummy[1] = 0xdba7e743;
dummy[0] = 0x385d5994;
Kset_uipoly_wide((*(generator_multiples2 + 50))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 50))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 50))->m_z, 1);

dummy[3] = 0x16a5b;
dummy[2] = 0x5de5a5c7;
dummy[1] = 0xbb3807c4;
dummy[0] = 0xeee81f3e;
Kset_uipoly_wide((*(generator_multiples1 + 51))->m_U1, dummy, 4);

dummy[3] = 0x8be9;
dummy[2] = 0x68cea995;
dummy[1] = 0x3e9101ba;
dummy[0] = 0x8ffdffec;
Kset_uipoly_wide((*(generator_multiples1 + 51))->m_U0, dummy, 4);

dummy[3] = 0x14922;
dummy[2] = 0xb649823;
dummy[1] = 0xaef9e20f;
dummy[0] = 0xa04821be;
Kset_uipoly_wide((*(generator_multiples1 + 51))->m_V1, dummy, 4);

dummy[3] = 0x1a327;
dummy[2] = 0xb450efaf;
dummy[1] = 0x81ab8712;
dummy[0] = 0x27ccc108;
Kset_uipoly_wide((*(generator_multiples1 + 51))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 51))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 51))->m_z, 1);

dummy[3] = 0x19565;
dummy[2] = 0x90dff08a;
dummy[1] = 0x47a60c08;
dummy[0] = 0xfd144dc6;
Kset_uipoly_wide((*(generator_multiples2 + 51))->m_U1, dummy, 4);

dummy[3] = 0x1d64a;
dummy[2] = 0x16c4b5d7;
dummy[1] = 0xd844a725;
dummy[0] = 0xdcaaecfb;
Kset_uipoly_wide((*(generator_multiples2 + 51))->m_U0, dummy, 4);

dummy[3] = 0x3ec3;
dummy[2] = 0xa74564cc;
dummy[1] = 0xe2809dfd;
dummy[0] = 0x233f9fe4;
Kset_uipoly_wide((*(generator_multiples2 + 51))->m_V1, dummy, 4);

dummy[3] = 0x122b3;
dummy[2] = 0xb2821656;
dummy[1] = 0xf85ead3a;
dummy[0] = 0xe07421a4;
Kset_uipoly_wide((*(generator_multiples2 + 51))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 51))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 51))->m_z, 1);

dummy[3] = 0x167cc;
dummy[2] = 0xd29d0f7;
dummy[1] = 0xd6315a53;
dummy[0] = 0x69f586f4;
Kset_uipoly_wide((*(generator_multiples1 + 52))->m_U1, dummy, 4);

dummy[3] = 0x45ea;
dummy[2] = 0x46f2cd64;
dummy[1] = 0xd8daf63e;
dummy[0] = 0xc8ae5653;
Kset_uipoly_wide((*(generator_multiples1 + 52))->m_U0, dummy, 4);

dummy[3] = 0xeebf;
dummy[2] = 0x6d3bb208;
dummy[1] = 0xdee19e91;
dummy[0] = 0x4d7969ec;
Kset_uipoly_wide((*(generator_multiples1 + 52))->m_V1, dummy, 4);

dummy[3] = 0x15046;
dummy[2] = 0xd0f03bba;
dummy[1] = 0x43f57b9d;
dummy[0] = 0x5be61555;
Kset_uipoly_wide((*(generator_multiples1 + 52))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 52))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 52))->m_z, 1);

dummy[3] = 0x1fcf6;
dummy[2] = 0xc603fe73;
dummy[1] = 0xdf0e0bf;
dummy[0] = 0x12fc0191;
Kset_uipoly_wide((*(generator_multiples2 + 52))->m_U1, dummy, 4);

dummy[3] = 0x1e2bf;
dummy[2] = 0xa0c86580;
dummy[1] = 0x1452acf2;
dummy[0] = 0x9a225a3a;
Kset_uipoly_wide((*(generator_multiples2 + 52))->m_U0, dummy, 4);

dummy[3] = 0xd91e;
dummy[2] = 0x3cf652c7;
dummy[1] = 0xe07497bc;
dummy[0] = 0x26afdd76;
Kset_uipoly_wide((*(generator_multiples2 + 52))->m_V1, dummy, 4);

dummy[3] = 0x1bbc9;
dummy[2] = 0x3af18c57;
dummy[1] = 0x1a45ddfc;
dummy[0] = 0x6db3b985;
Kset_uipoly_wide((*(generator_multiples2 + 52))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 52))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 52))->m_z, 1);

dummy[3] = 0x15c0f;
dummy[2] = 0x4a58edd2;
dummy[1] = 0xcef7f7f2;
dummy[0] = 0xaf2eaf7e;
Kset_uipoly_wide((*(generator_multiples1 + 53))->m_U1, dummy, 4);

dummy[3] = 0x32c;
dummy[2] = 0x2cc9bd34;
dummy[1] = 0x7903ee1b;
dummy[0] = 0x9b4be7ce;
Kset_uipoly_wide((*(generator_multiples1 + 53))->m_U0, dummy, 4);

dummy[3] = 0x15e50;
dummy[2] = 0x24a11e1b;
dummy[1] = 0xf6bf544d;
dummy[0] = 0x3daaa753;
Kset_uipoly_wide((*(generator_multiples1 + 53))->m_V1, dummy, 4);

dummy[3] = 0x1ec8c;
dummy[2] = 0xb0a38a7f;
dummy[1] = 0xe385be1b;
dummy[0] = 0x5ac0e1c2;
Kset_uipoly_wide((*(generator_multiples1 + 53))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 53))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 53))->m_z, 1);

dummy[3] = 0x143fe;
dummy[2] = 0x70ef1f35;
dummy[1] = 0xc518c621;
dummy[0] = 0x8466bfda;
Kset_uipoly_wide((*(generator_multiples2 + 53))->m_U1, dummy, 4);

dummy[3] = 0x19a49;
dummy[2] = 0xafd1ec68;
dummy[1] = 0x5c751090;
dummy[0] = 0x21548041;
Kset_uipoly_wide((*(generator_multiples2 + 53))->m_U0, dummy, 4);

dummy[3] = 0x1cb2c;
dummy[2] = 0x6f5486b2;
dummy[1] = 0x6a5bdf32;
dummy[0] = 0xabfe372;
Kset_uipoly_wide((*(generator_multiples2 + 53))->m_V1, dummy, 4);

dummy[3] = 0x1de80;
dummy[2] = 0x6c5c8aa0;
dummy[1] = 0xb04e3682;
dummy[0] = 0xf6acd333;
Kset_uipoly_wide((*(generator_multiples2 + 53))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 53))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 53))->m_z, 1);

dummy[3] = 0xee22;
dummy[2] = 0x4ab4b00d;
dummy[1] = 0xd80093b7;
dummy[0] = 0xe649b46e;
Kset_uipoly_wide((*(generator_multiples1 + 54))->m_U1, dummy, 4);

dummy[3] = 0xfb92;
dummy[2] = 0x5f8b3275;
dummy[1] = 0x5aa165db;
dummy[0] = 0x64a5401f;
Kset_uipoly_wide((*(generator_multiples1 + 54))->m_U0, dummy, 4);

dummy[3] = 0x1980;
dummy[2] = 0x2db5dece;
dummy[1] = 0xcf7051e2;
dummy[0] = 0x49e64ef;
Kset_uipoly_wide((*(generator_multiples1 + 54))->m_V1, dummy, 4);

dummy[3] = 0x1bbad;
dummy[2] = 0xfb09f191;
dummy[1] = 0xab2d164;
dummy[0] = 0xb55e7d04;
Kset_uipoly_wide((*(generator_multiples1 + 54))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 54))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 54))->m_z, 1);

dummy[3] = 0xcf7e;
dummy[2] = 0x3e5e47d6;
dummy[1] = 0x1a754448;
dummy[0] = 0x810ba307;
Kset_uipoly_wide((*(generator_multiples2 + 54))->m_U1, dummy, 4);

dummy[3] = 0x7fd1;
dummy[2] = 0xde491a0f;
dummy[1] = 0xb6478fd6;
dummy[0] = 0x468fdd3b;
Kset_uipoly_wide((*(generator_multiples2 + 54))->m_U0, dummy, 4);

dummy[3] = 0x15304;
dummy[2] = 0xb90af9b9;
dummy[1] = 0xdb0fce16;
dummy[0] = 0x620d95ad;
Kset_uipoly_wide((*(generator_multiples2 + 54))->m_V1, dummy, 4);

dummy[3] = 0x1fef5;
dummy[2] = 0x26bfe7b9;
dummy[1] = 0xc7af5795;
dummy[0] = 0x31a3937b;
Kset_uipoly_wide((*(generator_multiples2 + 54))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 54))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 54))->m_z, 1);

dummy[3] = 0xb54b;
dummy[2] = 0xd97bdeae;
dummy[1] = 0x6dde1e5b;
dummy[0] = 0x7f02edec;
Kset_uipoly_wide((*(generator_multiples1 + 55))->m_U1, dummy, 4);

dummy[3] = 0x12ed2;
dummy[2] = 0x9ff8546d;
dummy[1] = 0x5be89273;
dummy[0] = 0x5d4dcab;
Kset_uipoly_wide((*(generator_multiples1 + 55))->m_U0, dummy, 4);

dummy[3] = 0x2fc3;
dummy[2] = 0x1ec29aa6;
dummy[1] = 0xa562dccb;
dummy[0] = 0xf85538c5;
Kset_uipoly_wide((*(generator_multiples1 + 55))->m_V1, dummy, 4);

dummy[3] = 0x146a3;
dummy[2] = 0x542a0900;
dummy[1] = 0xa60e57c8;
dummy[0] = 0x36e2b2a6;
Kset_uipoly_wide((*(generator_multiples1 + 55))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 55))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 55))->m_z, 1);

dummy[3] = 0x1b3aa;
dummy[2] = 0xcf151586;
dummy[1] = 0xe355b8dc;
dummy[0] = 0x724dd149;
Kset_uipoly_wide((*(generator_multiples2 + 55))->m_U1, dummy, 4);

dummy[3] = 0xe6cb;
dummy[2] = 0xc8bcfc04;
dummy[1] = 0xeb98cb37;
dummy[0] = 0xb3f51702;
Kset_uipoly_wide((*(generator_multiples2 + 55))->m_U0, dummy, 4);

dummy[3] = 0x8e30;
dummy[2] = 0xb9650cbb;
dummy[1] = 0x59d2ce78;
dummy[0] = 0x4b8342ed;
Kset_uipoly_wide((*(generator_multiples2 + 55))->m_V1, dummy, 4);

dummy[3] = 0x2ca4;
dummy[2] = 0xd0418e00;
dummy[1] = 0x9fbb9b3a;
dummy[0] = 0x76d03d1e;
Kset_uipoly_wide((*(generator_multiples2 + 55))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 55))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 55))->m_z, 1);

dummy[3] = 0x184c1;
dummy[2] = 0x59bad9fd;
dummy[1] = 0xec001b10;
dummy[0] = 0x5cb75ee5;
Kset_uipoly_wide((*(generator_multiples1 + 56))->m_U1, dummy, 4);

dummy[3] = 0xdaf;
dummy[2] = 0x6ffe97c8;
dummy[1] = 0x8787be7;
dummy[0] = 0x5a4d577e;
Kset_uipoly_wide((*(generator_multiples1 + 56))->m_U0, dummy, 4);

dummy[3] = 0x8e47;
dummy[2] = 0x55ad69a8;
dummy[1] = 0x18cad91b;
dummy[0] = 0x62892b6c;
Kset_uipoly_wide((*(generator_multiples1 + 56))->m_V1, dummy, 4);

dummy[3] = 0xf278;
dummy[2] = 0x2db70593;
dummy[1] = 0x24c58131;
dummy[0] = 0x8b073f3e;
Kset_uipoly_wide((*(generator_multiples1 + 56))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 56))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 56))->m_z, 1);

dummy[3] = 0x1d459;
dummy[2] = 0x467b4c37;
dummy[1] = 0x2486390e;
dummy[0] = 0x630647e0;
Kset_uipoly_wide((*(generator_multiples2 + 56))->m_U1, dummy, 4);

dummy[3] = 0x1fe07;
dummy[2] = 0x158210b1;
dummy[1] = 0x46f9f91e;
dummy[0] = 0x390f24f7;
Kset_uipoly_wide((*(generator_multiples2 + 56))->m_U0, dummy, 4);

dummy[3] = 0x1eaf1;
dummy[2] = 0xbee18d29;
dummy[1] = 0x8ea836f9;
dummy[0] = 0xe48f586f;
Kset_uipoly_wide((*(generator_multiples2 + 56))->m_V1, dummy, 4);

dummy[3] = 0x167c;
dummy[2] = 0x558cb719;
dummy[1] = 0xb31e766d;
dummy[0] = 0x29e65da8;
Kset_uipoly_wide((*(generator_multiples2 + 56))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 56))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 56))->m_z, 1);

dummy[3] = 0x5186;
dummy[2] = 0xd4ff423d;
dummy[1] = 0x404d0198;
dummy[0] = 0x76000ec6;
Kset_uipoly_wide((*(generator_multiples1 + 57))->m_U1, dummy, 4);

dummy[3] = 0xdd34;
dummy[2] = 0xa05ea786;
dummy[1] = 0x1c2d1ba7;
dummy[0] = 0xdc7b7d68;
Kset_uipoly_wide((*(generator_multiples1 + 57))->m_U0, dummy, 4);

dummy[3] = 0x99d1;
dummy[2] = 0x2c22a7b4;
dummy[1] = 0x325b99d7;
dummy[0] = 0x573f6ace;
Kset_uipoly_wide((*(generator_multiples1 + 57))->m_V1, dummy, 4);

dummy[3] = 0xfd04;
dummy[2] = 0x91fe98ff;
dummy[1] = 0x94f39eff;
dummy[0] = 0x922cf725;
Kset_uipoly_wide((*(generator_multiples1 + 57))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 57))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 57))->m_z, 1);

dummy[3] = 0x1553;
dummy[2] = 0x5d91436;
dummy[1] = 0xbb236b24;
dummy[0] = 0xe8ad2550;
Kset_uipoly_wide((*(generator_multiples2 + 57))->m_U1, dummy, 4);

dummy[3] = 0x16ccc;
dummy[2] = 0x98d16daa;
dummy[1] = 0x2c1fd690;
dummy[0] = 0xd3a25dcf;
Kset_uipoly_wide((*(generator_multiples2 + 57))->m_U0, dummy, 4);

dummy[3] = 0x152da;
dummy[2] = 0xa272f749;
dummy[1] = 0x8598664;
dummy[0] = 0x95566332;
Kset_uipoly_wide((*(generator_multiples2 + 57))->m_V1, dummy, 4);

dummy[3] = 0x171f0;
dummy[2] = 0x84209c41;
dummy[1] = 0xdaf0c19;
dummy[0] = 0x5b4d6fd2;
Kset_uipoly_wide((*(generator_multiples2 + 57))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 57))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 57))->m_z, 1);

dummy[3] = 0x9da3;
dummy[2] = 0x1db4e406;
dummy[1] = 0x80dafd02;
dummy[0] = 0x12bc9d8f;
Kset_uipoly_wide((*(generator_multiples1 + 58))->m_U1, dummy, 4);

dummy[3] = 0x1bf3f;
dummy[2] = 0x6d82ab30;
dummy[1] = 0x21fa9378;
dummy[0] = 0x6e0aa818;
Kset_uipoly_wide((*(generator_multiples1 + 58))->m_U0, dummy, 4);

dummy[3] = 0x2f62;
dummy[2] = 0x98a7e80e;
dummy[1] = 0x8d5a7878;
dummy[0] = 0x6f230dc8;
Kset_uipoly_wide((*(generator_multiples1 + 58))->m_V1, dummy, 4);

dummy[3] = 0x1cfbc;
dummy[2] = 0xe856be86;
dummy[1] = 0x290e264d;
dummy[0] = 0x78e6fe5d;
Kset_uipoly_wide((*(generator_multiples1 + 58))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 58))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 58))->m_z, 1);

dummy[3] = 0x6342;
dummy[2] = 0xf9afb816;
dummy[1] = 0x5bf3e02e;
dummy[0] = 0xefa431f3;
Kset_uipoly_wide((*(generator_multiples2 + 58))->m_U1, dummy, 4);

dummy[3] = 0x7acd;
dummy[2] = 0xa850cb41;
dummy[1] = 0xa5523ba2;
dummy[0] = 0x57721bd3;
Kset_uipoly_wide((*(generator_multiples2 + 58))->m_U0, dummy, 4);

dummy[3] = 0x172cd;
dummy[2] = 0xe9b406e8;
dummy[1] = 0xd948eb37;
dummy[0] = 0xf7923069;
Kset_uipoly_wide((*(generator_multiples2 + 58))->m_V1, dummy, 4);

dummy[3] = 0x16322;
dummy[2] = 0x9f4893de;
dummy[1] = 0x3db9170e;
dummy[0] = 0x897c6838;
Kset_uipoly_wide((*(generator_multiples2 + 58))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 58))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 58))->m_z, 1);

dummy[3] = 0x330a;
dummy[2] = 0x27fbad44;
dummy[1] = 0xe7f7076b;
dummy[0] = 0xabe2f7d5;
Kset_uipoly_wide((*(generator_multiples1 + 59))->m_U1, dummy, 4);

dummy[3] = 0xc55;
dummy[2] = 0x1120e0a2;
dummy[1] = 0xd426ae79;
dummy[0] = 0x4c43bf5b;
Kset_uipoly_wide((*(generator_multiples1 + 59))->m_U0, dummy, 4);

dummy[3] = 0x1b0;
dummy[2] = 0xbeb287a7;
dummy[1] = 0x2fb860f8;
dummy[0] = 0x8b92d79d;
Kset_uipoly_wide((*(generator_multiples1 + 59))->m_V1, dummy, 4);

dummy[3] = 0x1a243;
dummy[2] = 0x3129f2fe;
dummy[1] = 0xc61525d7;
dummy[0] = 0xc5bb8761;
Kset_uipoly_wide((*(generator_multiples1 + 59))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 59))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 59))->m_z, 1);

dummy[3] = 0x1c8a7;
dummy[2] = 0x5132883e;
dummy[1] = 0x89fecbf0;
dummy[0] = 0x700cf355;
Kset_uipoly_wide((*(generator_multiples2 + 59))->m_U1, dummy, 4);

dummy[3] = 0xc283;
dummy[2] = 0x519f6be1;
dummy[1] = 0x496d9cd1;
dummy[0] = 0xaf9940f3;
Kset_uipoly_wide((*(generator_multiples2 + 59))->m_U0, dummy, 4);

dummy[3] = 0xf81e;
dummy[2] = 0xf5c4f81b;
dummy[1] = 0x74d0c23a;
dummy[0] = 0xff91a191;
Kset_uipoly_wide((*(generator_multiples2 + 59))->m_V1, dummy, 4);

dummy[3] = 0x13ec0;
dummy[2] = 0xb85f0cef;
dummy[1] = 0x51b73819;
dummy[0] = 0xbc6df11a;
Kset_uipoly_wide((*(generator_multiples2 + 59))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 59))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 59))->m_z, 1);

dummy[3] = 0x81e2;
dummy[2] = 0xf16e4fe5;
dummy[1] = 0xc3f1b968;
dummy[0] = 0xe5d2414e;
Kset_uipoly_wide((*(generator_multiples1 + 60))->m_U1, dummy, 4);

dummy[3] = 0x15fc6;
dummy[2] = 0x9c44108c;
dummy[1] = 0xaccb7e8;
dummy[0] = 0x60ee8851;
Kset_uipoly_wide((*(generator_multiples1 + 60))->m_U0, dummy, 4);

dummy[3] = 0xc900;
dummy[2] = 0x547154bd;
dummy[1] = 0x5c75980e;
dummy[0] = 0xf22bd977;
Kset_uipoly_wide((*(generator_multiples1 + 60))->m_V1, dummy, 4);

dummy[3] = 0x192f6;
dummy[2] = 0x340ea260;
dummy[1] = 0xe976b455;
dummy[0] = 0x8e1d131f;
Kset_uipoly_wide((*(generator_multiples1 + 60))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 60))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 60))->m_z, 1);

dummy[3] = 0x1da4e;
dummy[2] = 0xa2b4c9c5;
dummy[1] = 0xb6e6ba66;
dummy[0] = 0x435c06a8;
Kset_uipoly_wide((*(generator_multiples2 + 60))->m_U1, dummy, 4);

dummy[3] = 0x9ada;
dummy[2] = 0x25ffe9fc;
dummy[1] = 0xddf7e57;
dummy[0] = 0xbdcd3189;
Kset_uipoly_wide((*(generator_multiples2 + 60))->m_U0, dummy, 4);

dummy[3] = 0xaa94;
dummy[2] = 0xa082e24f;
dummy[1] = 0x1f11a16c;
dummy[0] = 0xd876d70f;
Kset_uipoly_wide((*(generator_multiples2 + 60))->m_V1, dummy, 4);

dummy[3] = 0xc1c7;
dummy[2] = 0xbada1104;
dummy[1] = 0x2ada333b;
dummy[0] = 0x18c5c52b;
Kset_uipoly_wide((*(generator_multiples2 + 60))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 60))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 60))->m_z, 1);

dummy[3] = 0x65d4;
dummy[2] = 0x86baf042;
dummy[1] = 0x8781f34a;
dummy[0] = 0xb7aefa0e;
Kset_uipoly_wide((*(generator_multiples1 + 61))->m_U1, dummy, 4);

dummy[3] = 0x127e8;
dummy[2] = 0xbd1eeb30;
dummy[1] = 0x3b379619;
dummy[0] = 0x3cba0b32;
Kset_uipoly_wide((*(generator_multiples1 + 61))->m_U0, dummy, 4);

dummy[3] = 0x1a340;
dummy[2] = 0x369769bd;
dummy[1] = 0x934624a0;
dummy[0] = 0xa0d4a7b6;
Kset_uipoly_wide((*(generator_multiples1 + 61))->m_V1, dummy, 4);

dummy[3] = 0x145c5;
dummy[2] = 0x3a1cc964;
dummy[1] = 0xc1eed512;
dummy[0] = 0x2cbcfa51;
Kset_uipoly_wide((*(generator_multiples1 + 61))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 61))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 61))->m_z, 1);

dummy[3] = 0x1dba2;
dummy[2] = 0x7ac0be6e;
dummy[1] = 0xc2e6d0c0;
dummy[0] = 0x74d48c14;
Kset_uipoly_wide((*(generator_multiples2 + 61))->m_U1, dummy, 4);

dummy[3] = 0x10e20;
dummy[2] = 0x8edbbe4b;
dummy[1] = 0xba7dd961;
dummy[0] = 0x1c01c640;
Kset_uipoly_wide((*(generator_multiples2 + 61))->m_U0, dummy, 4);

dummy[3] = 0x17751;
dummy[2] = 0x86401f7;
dummy[1] = 0x2da87576;
dummy[0] = 0xef0d6062;
Kset_uipoly_wide((*(generator_multiples2 + 61))->m_V1, dummy, 4);

dummy[3] = 0x9251;
dummy[2] = 0x3b3a65da;
dummy[1] = 0x302eafd2;
dummy[0] = 0xb17949b1;
Kset_uipoly_wide((*(generator_multiples2 + 61))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 61))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 61))->m_z, 1);

dummy[3] = 0x13c73;
dummy[2] = 0x2634b02c;
dummy[1] = 0x9d28eb78;
dummy[0] = 0xfbeb8a9;
Kset_uipoly_wide((*(generator_multiples1 + 62))->m_U1, dummy, 4);

dummy[3] = 0xc183;
dummy[2] = 0x8aef7e7c;
dummy[1] = 0x4b3330d4;
dummy[0] = 0x18165498;
Kset_uipoly_wide((*(generator_multiples1 + 62))->m_U0, dummy, 4);

dummy[3] = 0xf8aa;
dummy[2] = 0xc6a1cd75;
dummy[1] = 0xcea6290b;
dummy[0] = 0xa7e9afc6;
Kset_uipoly_wide((*(generator_multiples1 + 62))->m_V1, dummy, 4);

dummy[3] = 0x9bee;
dummy[2] = 0x5ce3b871;
dummy[1] = 0x810a0bf;
dummy[0] = 0x7a584c37;
Kset_uipoly_wide((*(generator_multiples1 + 62))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 62))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 62))->m_z, 1);

dummy[3] = 0x13a6d;
dummy[2] = 0xcaffce63;
dummy[1] = 0xe007fb44;
dummy[0] = 0x6df6911d;
Kset_uipoly_wide((*(generator_multiples2 + 62))->m_U1, dummy, 4);

dummy[3] = 0xb5c5;
dummy[2] = 0xe7d0674c;
dummy[1] = 0x8ba62a70;
dummy[0] = 0xf223161b;
Kset_uipoly_wide((*(generator_multiples2 + 62))->m_U0, dummy, 4);

dummy[3] = 0x7caf;
dummy[2] = 0xf9880f02;
dummy[1] = 0x1021bdee;
dummy[0] = 0xac50a508;
Kset_uipoly_wide((*(generator_multiples2 + 62))->m_V1, dummy, 4);

dummy[3] = 0xa3fe;
dummy[2] = 0x96266730;
dummy[1] = 0x6f836318;
dummy[0] = 0x4ef8e6d;
Kset_uipoly_wide((*(generator_multiples2 + 62))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 62))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 62))->m_z, 1);

dummy[3] = 0xa064;
dummy[2] = 0xd1238309;
dummy[1] = 0xfff6a259;
dummy[0] = 0xb1374410;
Kset_uipoly_wide((*(generator_multiples1 + 63))->m_U1, dummy, 4);

dummy[3] = 0x9451;
dummy[2] = 0xea4cc1eb;
dummy[1] = 0xcdb1b9d0;
dummy[0] = 0x21dfdbdd;
Kset_uipoly_wide((*(generator_multiples1 + 63))->m_U0, dummy, 4);

dummy[3] = 0x17462;
dummy[2] = 0xae1dd686;
dummy[1] = 0x89cba04;
dummy[0] = 0xc0be96a;
Kset_uipoly_wide((*(generator_multiples1 + 63))->m_V1, dummy, 4);

dummy[3] = 0xe774;
dummy[2] = 0x7e186792;
dummy[1] = 0xed61d3f8;
dummy[0] = 0x3b4f6f11;
Kset_uipoly_wide((*(generator_multiples1 + 63))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 63))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 63))->m_z, 1);

dummy[3] = 0x2e43;
dummy[2] = 0x1937d976;
dummy[1] = 0x53e5974;
dummy[0] = 0x1d1ccae7;
Kset_uipoly_wide((*(generator_multiples2 + 63))->m_U1, dummy, 4);

dummy[3] = 0x3c72;
dummy[2] = 0xac5b5cda;
dummy[1] = 0xe470ff8;
dummy[0] = 0x8fa86611;
Kset_uipoly_wide((*(generator_multiples2 + 63))->m_U0, dummy, 4);

dummy[3] = 0x17422;
dummy[2] = 0xb41ef371;
dummy[1] = 0xa411b224;
dummy[0] = 0x12aba6bf;
Kset_uipoly_wide((*(generator_multiples2 + 63))->m_V1, dummy, 4);

dummy[3] = 0xd9b2;
dummy[2] = 0xb30d9ad1;
dummy[1] = 0xad49f188;
dummy[0] = 0x7debf363;
Kset_uipoly_wide((*(generator_multiples2 + 63))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 63))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 63))->m_z, 1);

dummy[3] = 0x1d93f;
dummy[2] = 0x6e2811c3;
dummy[1] = 0xe500312b;
dummy[0] = 0x72929e4a;
Kset_uipoly_wide((*(generator_multiples1 + 64))->m_U1, dummy, 4);

dummy[3] = 0x19b32;
dummy[2] = 0x6c829bf8;
dummy[1] = 0xfa8ad02f;
dummy[0] = 0x84da15d2;
Kset_uipoly_wide((*(generator_multiples1 + 64))->m_U0, dummy, 4);

dummy[3] = 0x9539;
dummy[2] = 0xda6d6edb;
dummy[1] = 0x575f440a;
dummy[0] = 0x66a9c611;
Kset_uipoly_wide((*(generator_multiples1 + 64))->m_V1, dummy, 4);

dummy[3] = 0x1c10;
dummy[2] = 0xca916269;
dummy[1] = 0x66bb9fc;
dummy[0] = 0x4bf1405e;
Kset_uipoly_wide((*(generator_multiples1 + 64))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 64))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 64))->m_z, 1);

dummy[3] = 0x143f5;
dummy[2] = 0x92292d8a;
dummy[1] = 0xe567b7a9;
dummy[0] = 0xe9b4f101;
Kset_uipoly_wide((*(generator_multiples2 + 64))->m_U1, dummy, 4);

dummy[3] = 0x13133;
dummy[2] = 0x569c6b6f;
dummy[1] = 0x3d9f6af;
dummy[0] = 0xd105d60d;
Kset_uipoly_wide((*(generator_multiples2 + 64))->m_U0, dummy, 4);

dummy[3] = 0x175d7;
dummy[2] = 0x951c0c27;
dummy[1] = 0x57ab2799;
dummy[0] = 0x4a5a5ef8;
Kset_uipoly_wide((*(generator_multiples2 + 64))->m_V1, dummy, 4);

dummy[3] = 0x1bd59;
dummy[2] = 0x698e912e;
dummy[1] = 0xcf86024e;
dummy[0] = 0xe493414f;
Kset_uipoly_wide((*(generator_multiples2 + 64))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 64))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 64))->m_z, 1);

dummy[3] = 0x18875;
dummy[2] = 0xa10e08b1;
dummy[1] = 0xc613850;
dummy[0] = 0x17e5cbe0;
Kset_uipoly_wide((*(generator_multiples1 + 65))->m_U1, dummy, 4);

dummy[3] = 0x1bf8c;
dummy[2] = 0x6e40bbda;
dummy[1] = 0xfdb143fe;
dummy[0] = 0xe555f6e1;
Kset_uipoly_wide((*(generator_multiples1 + 65))->m_U0, dummy, 4);

dummy[3] = 0x3028;
dummy[2] = 0xcd9d28f6;
dummy[1] = 0x909c70c0;
dummy[0] = 0xe996fd74;
Kset_uipoly_wide((*(generator_multiples1 + 65))->m_V1, dummy, 4);

dummy[3] = 0x843a;
dummy[2] = 0x507c7fa8;
dummy[1] = 0xfb1f9305;
dummy[0] = 0xba863718;
Kset_uipoly_wide((*(generator_multiples1 + 65))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 65))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 65))->m_z, 1);

dummy[3] = 0x262a;
dummy[2] = 0x8bdbda71;
dummy[1] = 0xb6a098c5;
dummy[0] = 0x2dcb32be;
Kset_uipoly_wide((*(generator_multiples2 + 65))->m_U1, dummy, 4);

dummy[3] = 0x123bb;
dummy[2] = 0x93cefb1f;
dummy[1] = 0x94a79798;
dummy[0] = 0x982dc816;
Kset_uipoly_wide((*(generator_multiples2 + 65))->m_U0, dummy, 4);

dummy[3] = 0xf998;
dummy[2] = 0xe5bace9f;
dummy[1] = 0x57869b2e;
dummy[0] = 0xdab65ea5;
Kset_uipoly_wide((*(generator_multiples2 + 65))->m_V1, dummy, 4);

dummy[3] = 0x1e78f;
dummy[2] = 0xee6e173d;
dummy[1] = 0xd8c1e5b;
dummy[0] = 0x1722d272;
Kset_uipoly_wide((*(generator_multiples2 + 65))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 65))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 65))->m_z, 1);

dummy[3] = 0x1161e;
dummy[2] = 0x1ae3dfd;
dummy[1] = 0x60a3aa91;
dummy[0] = 0x9ccf8eb;
Kset_uipoly_wide((*(generator_multiples1 + 66))->m_U1, dummy, 4);

dummy[3] = 0xcd44;
dummy[2] = 0xa662ae48;
dummy[1] = 0xd9ed8337;
dummy[0] = 0x13415148;
Kset_uipoly_wide((*(generator_multiples1 + 66))->m_U0, dummy, 4);

dummy[3] = 0x1a08e;
dummy[2] = 0x58b2f7a6;
dummy[1] = 0x62339460;
dummy[0] = 0x51fdab33;
Kset_uipoly_wide((*(generator_multiples1 + 66))->m_V1, dummy, 4);

dummy[3] = 0x1f05b;
dummy[2] = 0x8f8797e2;
dummy[1] = 0xc7af9286;
dummy[0] = 0xc1d82a6a;
Kset_uipoly_wide((*(generator_multiples1 + 66))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 66))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 66))->m_z, 1);

dummy[3] = 0x3c24;
dummy[2] = 0xae5bb6f5;
dummy[1] = 0x97b5239e;
dummy[0] = 0xe50aac6d;
Kset_uipoly_wide((*(generator_multiples2 + 66))->m_U1, dummy, 4);

dummy[3] = 0x4324;
dummy[2] = 0x42a17288;
dummy[1] = 0xb4efc794;
dummy[0] = 0xa3094390;
Kset_uipoly_wide((*(generator_multiples2 + 66))->m_U0, dummy, 4);

dummy[3] = 0xae83;
dummy[2] = 0x155ac6f8;
dummy[1] = 0xb44036f4;
dummy[0] = 0x59f96e1e;
Kset_uipoly_wide((*(generator_multiples2 + 66))->m_V1, dummy, 4);

dummy[3] = 0x1cfc9;
dummy[2] = 0xd6b42b3f;
dummy[1] = 0x499c54bd;
dummy[0] = 0x93e2b8bc;
Kset_uipoly_wide((*(generator_multiples2 + 66))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 66))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 66))->m_z, 1);

dummy[3] = 0x1a457;
dummy[2] = 0xb197003d;
dummy[1] = 0x4903a9f5;
dummy[0] = 0x5278dfeb;
Kset_uipoly_wide((*(generator_multiples1 + 67))->m_U1, dummy, 4);

dummy[3] = 0x18efb;
dummy[2] = 0x1c0f0755;
dummy[1] = 0x38dbdfbc;
dummy[0] = 0x28f9ce87;
Kset_uipoly_wide((*(generator_multiples1 + 67))->m_U0, dummy, 4);

dummy[3] = 0x1bfcf;
dummy[2] = 0x533fb5ae;
dummy[1] = 0xec0d7667;
dummy[0] = 0x924ecfed;
Kset_uipoly_wide((*(generator_multiples1 + 67))->m_V1, dummy, 4);

dummy[3] = 0x3de8;
dummy[2] = 0xfcb6fd09;
dummy[1] = 0xa3115b98;
dummy[0] = 0xf547e4bc;
Kset_uipoly_wide((*(generator_multiples1 + 67))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 67))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 67))->m_z, 1);

dummy[3] = 0x1f668;
dummy[2] = 0x51250fbd;
dummy[1] = 0x19bfb8f3;
dummy[0] = 0xfc1e1f10;
Kset_uipoly_wide((*(generator_multiples2 + 67))->m_U1, dummy, 4);

dummy[3] = 0x7f8b;
dummy[2] = 0x4967975e;
dummy[1] = 0x83095cc5;
dummy[0] = 0xdbdf2a7c;
Kset_uipoly_wide((*(generator_multiples2 + 67))->m_U0, dummy, 4);

dummy[3] = 0x8b32;
dummy[2] = 0x56ce157f;
dummy[1] = 0xcfde7490;
dummy[0] = 0x8d4e9b22;
Kset_uipoly_wide((*(generator_multiples2 + 67))->m_V1, dummy, 4);

dummy[3] = 0x14db;
dummy[2] = 0x9e342a75;
dummy[1] = 0xb54ecb6e;
dummy[0] = 0xbded18d9;
Kset_uipoly_wide((*(generator_multiples2 + 67))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 67))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 67))->m_z, 1);

dummy[3] = 0xa77d;
dummy[2] = 0x1e82dbc;
dummy[1] = 0xcdabdbc1;
dummy[0] = 0xe84f2839;
Kset_uipoly_wide((*(generator_multiples1 + 68))->m_U1, dummy, 4);

dummy[3] = 0x353a;
dummy[2] = 0xc1dbb400;
dummy[1] = 0xf3298bd4;
dummy[0] = 0x7f4374cb;
Kset_uipoly_wide((*(generator_multiples1 + 68))->m_U0, dummy, 4);

dummy[3] = 0x15767;
dummy[2] = 0x629f2b40;
dummy[1] = 0xff70e5c3;
dummy[0] = 0xd1565be3;
Kset_uipoly_wide((*(generator_multiples1 + 68))->m_V1, dummy, 4);

dummy[3] = 0x18cd9;
dummy[2] = 0xd8056825;
dummy[1] = 0xa3015152;
dummy[0] = 0x14251661;
Kset_uipoly_wide((*(generator_multiples1 + 68))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 68))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 68))->m_z, 1);

dummy[3] = 0x1d733;
dummy[2] = 0xd455ea3c;
dummy[1] = 0x6a126dfe;
dummy[0] = 0xd516fb85;
Kset_uipoly_wide((*(generator_multiples2 + 68))->m_U1, dummy, 4);

dummy[3] = 0xe91c;
dummy[2] = 0x6efd736;
dummy[1] = 0x359b508;
dummy[0] = 0xb23dad73;
Kset_uipoly_wide((*(generator_multiples2 + 68))->m_U0, dummy, 4);

dummy[3] = 0x18241;
dummy[2] = 0x96303fb2;
dummy[1] = 0x40809b81;
dummy[0] = 0x96469dda;
Kset_uipoly_wide((*(generator_multiples2 + 68))->m_V1, dummy, 4);

dummy[3] = 0x127f2;
dummy[2] = 0x63082744;
dummy[1] = 0x8f963027;
dummy[0] = 0x671d741b;
Kset_uipoly_wide((*(generator_multiples2 + 68))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 68))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 68))->m_z, 1);

dummy[3] = 0x1e172;
dummy[2] = 0x72452309;
dummy[1] = 0xb7a2335b;
dummy[0] = 0x25b22457;
Kset_uipoly_wide((*(generator_multiples1 + 69))->m_U1, dummy, 4);

dummy[3] = 0x13f34;
dummy[2] = 0x555f2ee7;
dummy[1] = 0x629ecb41;
dummy[0] = 0x74a94293;
Kset_uipoly_wide((*(generator_multiples1 + 69))->m_U0, dummy, 4);

dummy[3] = 0x7506;
dummy[2] = 0x408b7c5f;
dummy[1] = 0x35385288;
dummy[0] = 0xb110b31e;
Kset_uipoly_wide((*(generator_multiples1 + 69))->m_V1, dummy, 4);

dummy[3] = 0x15c8a;
dummy[2] = 0xa46fcbd6;
dummy[1] = 0xd75c74d5;
dummy[0] = 0x5be31744;
Kset_uipoly_wide((*(generator_multiples1 + 69))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 69))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 69))->m_z, 1);

dummy[3] = 0x40e5;
dummy[2] = 0x62c76944;
dummy[1] = 0x10f52e11;
dummy[0] = 0x27a85909;
Kset_uipoly_wide((*(generator_multiples2 + 69))->m_U1, dummy, 4);

dummy[3] = 0x10857;
dummy[2] = 0x78fc427a;
dummy[1] = 0x8e56b576;
dummy[0] = 0xe3facc34;
Kset_uipoly_wide((*(generator_multiples2 + 69))->m_U0, dummy, 4);

dummy[3] = 0x6fa5;
dummy[2] = 0x60aefc12;
dummy[1] = 0x49bf926;
dummy[0] = 0xbdaa414b;
Kset_uipoly_wide((*(generator_multiples2 + 69))->m_V1, dummy, 4);

dummy[3] = 0x8e24;
dummy[2] = 0x42cddd58;
dummy[1] = 0x27ead981;
dummy[0] = 0xd80edae4;
Kset_uipoly_wide((*(generator_multiples2 + 69))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 69))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 69))->m_z, 1);

dummy[3] = 0x18f3b;
dummy[2] = 0x1b361e0;
dummy[1] = 0x649ce3e7;
dummy[0] = 0x60696b43;
Kset_uipoly_wide((*(generator_multiples1 + 70))->m_U1, dummy, 4);

dummy[3] = 0x15c92;
dummy[2] = 0x651730fc;
dummy[1] = 0x59156da6;
dummy[0] = 0x6941c6ba;
Kset_uipoly_wide((*(generator_multiples1 + 70))->m_U0, dummy, 4);

dummy[3] = 0x684c;
dummy[2] = 0x76801ed2;
dummy[1] = 0xf5be6cd1;
dummy[0] = 0xfed3fd44;
Kset_uipoly_wide((*(generator_multiples1 + 70))->m_V1, dummy, 4);

dummy[3] = 0x234;
dummy[2] = 0xc61f1784;
dummy[1] = 0x7f5cf104;
dummy[0] = 0x62a90648;
Kset_uipoly_wide((*(generator_multiples1 + 70))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 70))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 70))->m_z, 1);

dummy[3] = 0xe338;
dummy[2] = 0x51d98040;
dummy[1] = 0xb00767a;
dummy[0] = 0xf7fd3f98;
Kset_uipoly_wide((*(generator_multiples2 + 70))->m_U1, dummy, 4);

dummy[3] = 0x10b1b;
dummy[2] = 0x6dc0daf5;
dummy[1] = 0x86c6c32b;
dummy[0] = 0xf51fe4a2;
Kset_uipoly_wide((*(generator_multiples2 + 70))->m_U0, dummy, 4);

dummy[3] = 0x6859;
dummy[2] = 0xbf55452a;
dummy[1] = 0xf041544a;
dummy[0] = 0xd6afde9f;
Kset_uipoly_wide((*(generator_multiples2 + 70))->m_V1, dummy, 4);

dummy[3] = 0x6217;
dummy[2] = 0xbb8dbc91;
dummy[1] = 0x98a305c6;
dummy[0] = 0x7c2404f3;
Kset_uipoly_wide((*(generator_multiples2 + 70))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 70))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 70))->m_z, 1);

dummy[3] = 0x6b7e;
dummy[2] = 0x72c6392a;
dummy[1] = 0xa893e46d;
dummy[0] = 0x1dc03927;
Kset_uipoly_wide((*(generator_multiples1 + 71))->m_U1, dummy, 4);

dummy[3] = 0x503a;
dummy[2] = 0x5ff8dc9f;
dummy[1] = 0x3d5bc372;
dummy[0] = 0x83a14b37;
Kset_uipoly_wide((*(generator_multiples1 + 71))->m_U0, dummy, 4);

dummy[3] = 0x1fa27;
dummy[2] = 0xc7798b45;
dummy[1] = 0x813a129c;
dummy[0] = 0x568c0d8c;
Kset_uipoly_wide((*(generator_multiples1 + 71))->m_V1, dummy, 4);

dummy[3] = 0x1b019;
dummy[2] = 0x509616c;
dummy[1] = 0x6643439;
dummy[0] = 0x6f1111eb;
Kset_uipoly_wide((*(generator_multiples1 + 71))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 71))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 71))->m_z, 1);

dummy[3] = 0xf06e;
dummy[2] = 0x8948a49d;
dummy[1] = 0xdaff20a1;
dummy[0] = 0x921568db;
Kset_uipoly_wide((*(generator_multiples2 + 71))->m_U1, dummy, 4);

dummy[3] = 0x10e16;
dummy[2] = 0xbc754a1;
dummy[1] = 0x73288f4a;
dummy[0] = 0x39804e64;
Kset_uipoly_wide((*(generator_multiples2 + 71))->m_U0, dummy, 4);

dummy[3] = 0x1eb25;
dummy[2] = 0xfa8f2b4a;
dummy[1] = 0xaf91beac;
dummy[0] = 0x906517dc;
Kset_uipoly_wide((*(generator_multiples2 + 71))->m_V1, dummy, 4);

dummy[3] = 0x19091;
dummy[2] = 0xdb0203cc;
dummy[1] = 0xd174b1db;
dummy[0] = 0x3a8d8d16;
Kset_uipoly_wide((*(generator_multiples2 + 71))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 71))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 71))->m_z, 1);

dummy[3] = 0x8b9c;
dummy[2] = 0xc4bd2bee;
dummy[1] = 0x5cf1642a;
dummy[0] = 0x7b66ae3d;
Kset_uipoly_wide((*(generator_multiples1 + 72))->m_U1, dummy, 4);

dummy[3] = 0xe55;
dummy[2] = 0x8687d14b;
dummy[1] = 0x4be494f0;
dummy[0] = 0x2a7b6f01;
Kset_uipoly_wide((*(generator_multiples1 + 72))->m_U0, dummy, 4);

dummy[3] = 0x15d42;
dummy[2] = 0x146a105a;
dummy[1] = 0xac15eb7d;
dummy[0] = 0xa50c9f7e;
Kset_uipoly_wide((*(generator_multiples1 + 72))->m_V1, dummy, 4);

dummy[3] = 0x663e;
dummy[2] = 0x56e5469c;
dummy[1] = 0xe2f6c674;
dummy[0] = 0x546ec7b8;
Kset_uipoly_wide((*(generator_multiples1 + 72))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 72))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 72))->m_z, 1);

dummy[3] = 0x13649;
dummy[2] = 0xa167e029;
dummy[1] = 0xcd111bc6;
dummy[0] = 0xf226f760;
Kset_uipoly_wide((*(generator_multiples2 + 72))->m_U1, dummy, 4);

dummy[3] = 0x13169;
dummy[2] = 0x54fff743;
dummy[1] = 0x7487fa7e;
dummy[0] = 0x6d24b816;
Kset_uipoly_wide((*(generator_multiples2 + 72))->m_U0, dummy, 4);

dummy[3] = 0xf7;
dummy[2] = 0xd2c6a6e5;
dummy[1] = 0xb709e66;
dummy[0] = 0xecff5d51;
Kset_uipoly_wide((*(generator_multiples2 + 72))->m_V1, dummy, 4);

dummy[3] = 0x2edb;
dummy[2] = 0x91991e54;
dummy[1] = 0x43a32888;
dummy[0] = 0xda751118;
Kset_uipoly_wide((*(generator_multiples2 + 72))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 72))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 72))->m_z, 1);

dummy[3] = 0x1e970;
dummy[2] = 0xb478a25e;
dummy[1] = 0x6edcce6b;
dummy[0] = 0x62997ed7;
Kset_uipoly_wide((*(generator_multiples1 + 73))->m_U1, dummy, 4);

dummy[3] = 0x10af1;
dummy[2] = 0x80fea207;
dummy[1] = 0x95bb0ac9;
dummy[0] = 0xfc0fd95b;
Kset_uipoly_wide((*(generator_multiples1 + 73))->m_U0, dummy, 4);

dummy[3] = 0x11bc6;
dummy[2] = 0x14da3630;
dummy[1] = 0x71b3f932;
dummy[0] = 0x2d1d298;
Kset_uipoly_wide((*(generator_multiples1 + 73))->m_V1, dummy, 4);

dummy[3] = 0xe1b6;
dummy[2] = 0x70b9b1c3;
dummy[1] = 0xe05d3f87;
dummy[0] = 0x52e4bd3d;
Kset_uipoly_wide((*(generator_multiples1 + 73))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 73))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 73))->m_z, 1);

dummy[3] = 0x18343;
dummy[2] = 0x723d59b5;
dummy[1] = 0xbd94f362;
dummy[0] = 0xb93cc70f;
Kset_uipoly_wide((*(generator_multiples2 + 73))->m_U1, dummy, 4);

dummy[3] = 0x15c06;
dummy[2] = 0xb5d4e207;
dummy[1] = 0xa5d1cfae;
dummy[0] = 0xec526710;
Kset_uipoly_wide((*(generator_multiples2 + 73))->m_U0, dummy, 4);

dummy[3] = 0x10e11;
dummy[2] = 0xaeca4eee;
dummy[1] = 0xe10d7df5;
dummy[0] = 0xe383c40f;
Kset_uipoly_wide((*(generator_multiples2 + 73))->m_V1, dummy, 4);

dummy[3] = 0x1b29d;
dummy[2] = 0xc13a49cb;
dummy[1] = 0x79b4ab20;
dummy[0] = 0xfc055068;
Kset_uipoly_wide((*(generator_multiples2 + 73))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 73))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 73))->m_z, 1);

dummy[3] = 0xaf17;
dummy[2] = 0x98007639;
dummy[1] = 0xd462c360;
dummy[0] = 0xc2a26a13;
Kset_uipoly_wide((*(generator_multiples1 + 74))->m_U1, dummy, 4);

dummy[3] = 0x17376;
dummy[2] = 0x339ba58b;
dummy[1] = 0x7d32f887;
dummy[0] = 0xb10c1a53;
Kset_uipoly_wide((*(generator_multiples1 + 74))->m_U0, dummy, 4);

dummy[3] = 0xcd42;
dummy[2] = 0xc766bb79;
dummy[1] = 0xf23726f1;
dummy[0] = 0x8bcdb2fb;
Kset_uipoly_wide((*(generator_multiples1 + 74))->m_V1, dummy, 4);

dummy[3] = 0x1e109;
dummy[2] = 0xc0d820df;
dummy[1] = 0xf0140fee;
dummy[0] = 0x354de31b;
Kset_uipoly_wide((*(generator_multiples1 + 74))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 74))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 74))->m_z, 1);

dummy[3] = 0x4818;
dummy[2] = 0x77d81713;
dummy[1] = 0xe35f6f0c;
dummy[0] = 0x21b6fc80;
Kset_uipoly_wide((*(generator_multiples2 + 74))->m_U1, dummy, 4);

dummy[3] = 0x9782;
dummy[2] = 0x6ef43dc9;
dummy[1] = 0xb9cf3898;
dummy[0] = 0xf87060b3;
Kset_uipoly_wide((*(generator_multiples2 + 74))->m_U0, dummy, 4);

dummy[3] = 0x15f7;
dummy[2] = 0x222ae89;
dummy[1] = 0xf5ad2dc;
dummy[0] = 0xae728b66;
Kset_uipoly_wide((*(generator_multiples2 + 74))->m_V1, dummy, 4);

dummy[3] = 0x173d7;
dummy[2] = 0x9fbf3ce;
dummy[1] = 0x2b0f7bd3;
dummy[0] = 0x24252c2a;
Kset_uipoly_wide((*(generator_multiples2 + 74))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 74))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 74))->m_z, 1);

dummy[3] = 0x24f8;
dummy[2] = 0x9593a70d;
dummy[1] = 0xd51ace62;
dummy[0] = 0xf7f9f267;
Kset_uipoly_wide((*(generator_multiples1 + 75))->m_U1, dummy, 4);

dummy[3] = 0xcf09;
dummy[2] = 0x86d50b6f;
dummy[1] = 0xde223b0b;
dummy[0] = 0xabd4d74;
Kset_uipoly_wide((*(generator_multiples1 + 75))->m_U0, dummy, 4);

dummy[3] = 0x1ca2;
dummy[2] = 0x892db916;
dummy[1] = 0x6dbaa19e;
dummy[0] = 0x99c72129;
Kset_uipoly_wide((*(generator_multiples1 + 75))->m_V1, dummy, 4);

dummy[3] = 0x16deb;
dummy[2] = 0xd5e661a1;
dummy[1] = 0xf128ce16;
dummy[0] = 0xcdc4c73b;
Kset_uipoly_wide((*(generator_multiples1 + 75))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 75))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 75))->m_z, 1);

dummy[3] = 0xd2bc;
dummy[2] = 0xad918ed5;
dummy[1] = 0x6978a900;
dummy[0] = 0x19f8fb62;
Kset_uipoly_wide((*(generator_multiples2 + 75))->m_U1, dummy, 4);

dummy[3] = 0x1adce;
dummy[2] = 0x4d949f42;
dummy[1] = 0x24f56ee;
dummy[0] = 0x87039899;
Kset_uipoly_wide((*(generator_multiples2 + 75))->m_U0, dummy, 4);

dummy[3] = 0x4bd9;
dummy[2] = 0xe8f9cc95;
dummy[1] = 0xeae15401;
dummy[0] = 0x7670265d;
Kset_uipoly_wide((*(generator_multiples2 + 75))->m_V1, dummy, 4);

dummy[3] = 0x1708a;
dummy[2] = 0x7a8a9476;
dummy[1] = 0x49e398cf;
dummy[0] = 0xb827078e;
Kset_uipoly_wide((*(generator_multiples2 + 75))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 75))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 75))->m_z, 1);

dummy[3] = 0x7b15;
dummy[2] = 0xe15aa68d;
dummy[1] = 0xf420a5e3;
dummy[0] = 0x42fc6602;
Kset_uipoly_wide((*(generator_multiples1 + 76))->m_U1, dummy, 4);

dummy[3] = 0xe8f7;
dummy[2] = 0x4b6c9d55;
dummy[1] = 0x363841dd;
dummy[0] = 0x269cd1f9;
Kset_uipoly_wide((*(generator_multiples1 + 76))->m_U0, dummy, 4);

dummy[3] = 0x1ce70;
dummy[2] = 0x45c2298e;
dummy[1] = 0xa7c98a50;
dummy[0] = 0xa91cd57c;
Kset_uipoly_wide((*(generator_multiples1 + 76))->m_V1, dummy, 4);

dummy[3] = 0xe0dd;
dummy[2] = 0xea39675d;
dummy[1] = 0x6b1e3e81;
dummy[0] = 0x88ee3865;
Kset_uipoly_wide((*(generator_multiples1 + 76))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 76))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 76))->m_z, 1);

dummy[3] = 0x16fd2;
dummy[2] = 0x15060a33;
dummy[1] = 0xa568db4e;
dummy[0] = 0xc74a38e6;
Kset_uipoly_wide((*(generator_multiples2 + 76))->m_U1, dummy, 4);

dummy[3] = 0xd8ef;
dummy[2] = 0x877dec42;
dummy[1] = 0x900e570f;
dummy[0] = 0xc35e22f7;
Kset_uipoly_wide((*(generator_multiples2 + 76))->m_U0, dummy, 4);

dummy[3] = 0x13be1;
dummy[2] = 0xcd4e1ba;
dummy[1] = 0x7fe5a71a;
dummy[0] = 0x5f668d0f;
Kset_uipoly_wide((*(generator_multiples2 + 76))->m_V1, dummy, 4);

dummy[3] = 0x1cb04;
dummy[2] = 0xd4f41de3;
dummy[1] = 0x179fc61a;
dummy[0] = 0xd02128bd;
Kset_uipoly_wide((*(generator_multiples2 + 76))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 76))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 76))->m_z, 1);

dummy[3] = 0xad66;
dummy[2] = 0x3af72efa;
dummy[1] = 0xf6033338;
dummy[0] = 0x5061fbcc;
Kset_uipoly_wide((*(generator_multiples1 + 77))->m_U1, dummy, 4);

dummy[3] = 0x18a65;
dummy[2] = 0xc1449553;
dummy[1] = 0x3b57a28b;
dummy[0] = 0x20275f38;
Kset_uipoly_wide((*(generator_multiples1 + 77))->m_U0, dummy, 4);

dummy[3] = 0x1f7d3;
dummy[2] = 0x89f69e4d;
dummy[1] = 0x13d5267e;
dummy[0] = 0xe186190a;
Kset_uipoly_wide((*(generator_multiples1 + 77))->m_V1, dummy, 4);

dummy[3] = 0x1a399;
dummy[2] = 0x929f81c2;
dummy[1] = 0xdac1ec28;
dummy[0] = 0xaaf9631d;
Kset_uipoly_wide((*(generator_multiples1 + 77))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 77))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 77))->m_z, 1);

dummy[3] = 0x18299;
dummy[2] = 0xfa9c9433;
dummy[1] = 0xcb92743d;
dummy[0] = 0x406e3f8c;
Kset_uipoly_wide((*(generator_multiples2 + 77))->m_U1, dummy, 4);

dummy[3] = 0x1d494;
dummy[2] = 0x498ab2cb;
dummy[1] = 0x26a7e5b8;
dummy[0] = 0x70cf6e75;
Kset_uipoly_wide((*(generator_multiples2 + 77))->m_U0, dummy, 4);

dummy[3] = 0xb335;
dummy[2] = 0xbfc6fdcf;
dummy[1] = 0xa0cc0adc;
dummy[0] = 0xd59c559;
Kset_uipoly_wide((*(generator_multiples2 + 77))->m_V1, dummy, 4);

dummy[3] = 0xcb4f;
dummy[2] = 0x4b71535d;
dummy[1] = 0xc646de53;
dummy[0] = 0x9556b673;
Kset_uipoly_wide((*(generator_multiples2 + 77))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 77))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 77))->m_z, 1);

dummy[3] = 0xd278;
dummy[2] = 0x89720ddc;
dummy[1] = 0x4c281ac5;
dummy[0] = 0x4ebdb54;
Kset_uipoly_wide((*(generator_multiples1 + 78))->m_U1, dummy, 4);

dummy[3] = 0x1b094;
dummy[2] = 0xd6123acb;
dummy[1] = 0xac940007;
dummy[0] = 0xc11a626f;
Kset_uipoly_wide((*(generator_multiples1 + 78))->m_U0, dummy, 4);

dummy[3] = 0xd1;
dummy[2] = 0xed60b383;
dummy[1] = 0x5eace166;
dummy[0] = 0x5c277da4;
Kset_uipoly_wide((*(generator_multiples1 + 78))->m_V1, dummy, 4);

dummy[3] = 0x13692;
dummy[2] = 0x40a38793;
dummy[1] = 0x905735fa;
dummy[0] = 0xb4f07f5;
Kset_uipoly_wide((*(generator_multiples1 + 78))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 78))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 78))->m_z, 1);

dummy[3] = 0x1b8c4;
dummy[2] = 0xe154cc1a;
dummy[1] = 0x4aca74f2;
dummy[0] = 0xddab4099;
Kset_uipoly_wide((*(generator_multiples2 + 78))->m_U1, dummy, 4);

dummy[3] = 0x10ee1;
dummy[2] = 0xa835e95c;
dummy[1] = 0xe2c56c4d;
dummy[0] = 0x97b52937;
Kset_uipoly_wide((*(generator_multiples2 + 78))->m_U0, dummy, 4);

dummy[3] = 0x10f8d;
dummy[2] = 0x706eff58;
dummy[1] = 0xc33acb80;
dummy[0] = 0x8282c616;
Kset_uipoly_wide((*(generator_multiples2 + 78))->m_V1, dummy, 4);

dummy[3] = 0xc64d;
dummy[2] = 0x8d932b1f;
dummy[1] = 0x5fb9c45e;
dummy[0] = 0xb42c12a3;
Kset_uipoly_wide((*(generator_multiples2 + 78))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 78))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 78))->m_z, 1);

dummy[3] = 0xe149;
dummy[2] = 0xab3ca61e;
dummy[1] = 0xa262f591;
dummy[0] = 0xfe995f69;
Kset_uipoly_wide((*(generator_multiples1 + 79))->m_U1, dummy, 4);

dummy[3] = 0x1a887;
dummy[2] = 0xbf7f3f0c;
dummy[1] = 0x2085d6e6;
dummy[0] = 0xdeb9b18d;
Kset_uipoly_wide((*(generator_multiples1 + 79))->m_U0, dummy, 4);

dummy[3] = 0x18e7b;
dummy[2] = 0x4987f96e;
dummy[1] = 0xd8556c71;
dummy[0] = 0x17b53ee0;
Kset_uipoly_wide((*(generator_multiples1 + 79))->m_V1, dummy, 4);

dummy[3] = 0x6906;
dummy[2] = 0x941040a1;
dummy[1] = 0x9cc1b34a;
dummy[0] = 0xb7454b09;
Kset_uipoly_wide((*(generator_multiples1 + 79))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 79))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 79))->m_z, 1);

dummy[3] = 0x3b4a;
dummy[2] = 0xd105f665;
dummy[1] = 0x1090f71b;
dummy[0] = 0x3afea889;
Kset_uipoly_wide((*(generator_multiples2 + 79))->m_U1, dummy, 4);

dummy[3] = 0xc1f3;
dummy[2] = 0x39f2bfe7;
dummy[1] = 0xdfa91be0;
dummy[0] = 0x2afb1642;
Kset_uipoly_wide((*(generator_multiples2 + 79))->m_U0, dummy, 4);

dummy[3] = 0xe137;
dummy[2] = 0x889ee300;
dummy[1] = 0x1edcce2a;
dummy[0] = 0x569402fb;
Kset_uipoly_wide((*(generator_multiples2 + 79))->m_V1, dummy, 4);

dummy[3] = 0x8315;
dummy[2] = 0x6ce67b27;
dummy[1] = 0x7fd5f8c9;
dummy[0] = 0x8646b571;
Kset_uipoly_wide((*(generator_multiples2 + 79))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 79))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 79))->m_z, 1);

dummy[3] = 0xa880;
dummy[2] = 0x8dc485d1;
dummy[1] = 0x793dc62;
dummy[0] = 0xaf0b37ee;
Kset_uipoly_wide((*(generator_multiples1 + 80))->m_U1, dummy, 4);

dummy[3] = 0x1b94f;
dummy[2] = 0xac9cb5a9;
dummy[1] = 0x799b34ac;
dummy[0] = 0x954d3d5;
Kset_uipoly_wide((*(generator_multiples1 + 80))->m_U0, dummy, 4);

dummy[3] = 0xb1c3;
dummy[2] = 0x578fd6b0;
dummy[1] = 0x924e4aca;
dummy[0] = 0xf66889eb;
Kset_uipoly_wide((*(generator_multiples1 + 80))->m_V1, dummy, 4);

dummy[3] = 0x18103;
dummy[2] = 0x24587f6c;
dummy[1] = 0xbce9ad9a;
dummy[0] = 0x8240453b;
Kset_uipoly_wide((*(generator_multiples1 + 80))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 80))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 80))->m_z, 1);

dummy[3] = 0xaadd;
dummy[2] = 0xb7d5c799;
dummy[1] = 0x9ca2b9c;
dummy[0] = 0x9cb2ac7a;
Kset_uipoly_wide((*(generator_multiples2 + 80))->m_U1, dummy, 4);

dummy[3] = 0x733d;
dummy[2] = 0xda5384f5;
dummy[1] = 0x18773525;
dummy[0] = 0xe10c3de6;
Kset_uipoly_wide((*(generator_multiples2 + 80))->m_U0, dummy, 4);

dummy[3] = 0x12c62;
dummy[2] = 0x84452a5f;
dummy[1] = 0x1d463ec4;
dummy[0] = 0xe344ab83;
Kset_uipoly_wide((*(generator_multiples2 + 80))->m_V1, dummy, 4);

dummy[3] = 0x84ea;
dummy[2] = 0x8d1595e6;
dummy[1] = 0xa2a6ec8f;
dummy[0] = 0xa0d625c4;
Kset_uipoly_wide((*(generator_multiples2 + 80))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 80))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 80))->m_z, 1);

dummy[3] = 0x1541;
dummy[2] = 0x149c43db;
dummy[1] = 0x10642df8;
dummy[0] = 0x7271e0d8;
Kset_uipoly_wide((*(generator_multiples1 + 81))->m_U1, dummy, 4);

dummy[3] = 0xbd80;
dummy[2] = 0x5f01c3e0;
dummy[1] = 0x3c961d8;
dummy[0] = 0xa35b1f4a;
Kset_uipoly_wide((*(generator_multiples1 + 81))->m_U0, dummy, 4);

dummy[3] = 0x114b5;
dummy[2] = 0xc695a090;
dummy[1] = 0xd20de902;
dummy[0] = 0x24bbc9a4;
Kset_uipoly_wide((*(generator_multiples1 + 81))->m_V1, dummy, 4);

dummy[3] = 0x16a25;
dummy[2] = 0xbb8b9194;
dummy[1] = 0xf415f022;
dummy[0] = 0xff873065;
Kset_uipoly_wide((*(generator_multiples1 + 81))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 81))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 81))->m_z, 1);

dummy[3] = 0x1e5a5;
dummy[2] = 0xca57daeb;
dummy[1] = 0xc0d050db;
dummy[0] = 0xebea312;
Kset_uipoly_wide((*(generator_multiples2 + 81))->m_U1, dummy, 4);

dummy[3] = 0x1ae3;
dummy[2] = 0x70103abb;
dummy[1] = 0x96e96c9e;
dummy[0] = 0xf929eee1;
Kset_uipoly_wide((*(generator_multiples2 + 81))->m_U0, dummy, 4);

dummy[3] = 0x3f5c;
dummy[2] = 0x15e7fad9;
dummy[1] = 0xa0afa7eb;
dummy[0] = 0xe543acb1;
Kset_uipoly_wide((*(generator_multiples2 + 81))->m_V1, dummy, 4);

dummy[3] = 0x1f936;
dummy[2] = 0x2b2e4311;
dummy[1] = 0xbfda6dfc;
dummy[0] = 0x39ec6599;
Kset_uipoly_wide((*(generator_multiples2 + 81))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 81))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 81))->m_z, 1);

dummy[3] = 0xb8e3;
dummy[2] = 0x6e047101;
dummy[1] = 0x4911afb9;
dummy[0] = 0x41405ffe;
Kset_uipoly_wide((*(generator_multiples1 + 82))->m_U1, dummy, 4);

dummy[3] = 0x300;
dummy[2] = 0x9f401458;
dummy[1] = 0xea566ade;
dummy[0] = 0xb3a5f927;
Kset_uipoly_wide((*(generator_multiples1 + 82))->m_U0, dummy, 4);

dummy[3] = 0x1814a;
dummy[2] = 0x7fd19766;
dummy[1] = 0x354630a6;
dummy[0] = 0x8cf93dac;
Kset_uipoly_wide((*(generator_multiples1 + 82))->m_V1, dummy, 4);

dummy[3] = 0x1760a;
dummy[2] = 0xd6108982;
dummy[1] = 0x1183f54b;
dummy[0] = 0xb0b6409d;
Kset_uipoly_wide((*(generator_multiples1 + 82))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 82))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 82))->m_z, 1);

dummy[3] = 0xa1e6;
dummy[2] = 0xf4565638;
dummy[1] = 0x29b55d50;
dummy[0] = 0xbb191b0e;
Kset_uipoly_wide((*(generator_multiples2 + 82))->m_U1, dummy, 4);

dummy[3] = 0x145b2;
dummy[2] = 0x9e0eb9ec;
dummy[1] = 0x7bd8edba;
dummy[0] = 0xb0c123aa;
Kset_uipoly_wide((*(generator_multiples2 + 82))->m_U0, dummy, 4);

dummy[3] = 0x12fd6;
dummy[2] = 0x68a11175;
dummy[1] = 0xd679675d;
dummy[0] = 0x9f196d5c;
Kset_uipoly_wide((*(generator_multiples2 + 82))->m_V1, dummy, 4);

dummy[3] = 0x202b;
dummy[2] = 0xf8f35904;
dummy[1] = 0x10c4f1b6;
dummy[0] = 0x81383fe8;
Kset_uipoly_wide((*(generator_multiples2 + 82))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 82))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 82))->m_z, 1);

dummy[3] = 0x17d1d;
dummy[2] = 0x810ae098;
dummy[1] = 0x999c23e;
dummy[0] = 0xf8241d28;
Kset_uipoly_wide((*(generator_multiples1 + 83))->m_U1, dummy, 4);

dummy[3] = 0x1b0c;
dummy[2] = 0x95f3d521;
dummy[1] = 0x5c082c41;
dummy[0] = 0x326dd47d;
Kset_uipoly_wide((*(generator_multiples1 + 83))->m_U0, dummy, 4);

dummy[3] = 0x14447;
dummy[2] = 0x5cea0490;
dummy[1] = 0xfcde7219;
dummy[0] = 0xb155959d;
Kset_uipoly_wide((*(generator_multiples1 + 83))->m_V1, dummy, 4);

dummy[3] = 0xb6dd;
dummy[2] = 0x25ae1e36;
dummy[1] = 0x5f722558;
dummy[0] = 0x1a393f6;
Kset_uipoly_wide((*(generator_multiples1 + 83))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 83))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 83))->m_z, 1);

dummy[3] = 0x9c02;
dummy[2] = 0x38aea250;
dummy[1] = 0x2ca7a5da;
dummy[0] = 0xbcdf83c1;
Kset_uipoly_wide((*(generator_multiples2 + 83))->m_U1, dummy, 4);

dummy[3] = 0x17fce;
dummy[2] = 0xdaa306ba;
dummy[1] = 0xb4ea885f;
dummy[0] = 0xbe397489;
Kset_uipoly_wide((*(generator_multiples2 + 83))->m_U0, dummy, 4);

dummy[3] = 0x81d8;
dummy[2] = 0x8c236273;
dummy[1] = 0xe2301878;
dummy[0] = 0xebf28537;
Kset_uipoly_wide((*(generator_multiples2 + 83))->m_V1, dummy, 4);

dummy[3] = 0x11b4b;
dummy[2] = 0x8fb8ec08;
dummy[1] = 0xcdd12221;
dummy[0] = 0x5e828976;
Kset_uipoly_wide((*(generator_multiples2 + 83))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 83))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 83))->m_z, 1);

dummy[3] = 0x1700a;
dummy[2] = 0x5f752404;
dummy[1] = 0xf2cc2333;
dummy[0] = 0xbddd29e7;
Kset_uipoly_wide((*(generator_multiples1 + 84))->m_U1, dummy, 4);

dummy[3] = 0xfe9f;
dummy[2] = 0xf311b347;
dummy[1] = 0xd9b9134b;
dummy[0] = 0x2c5c6399;
Kset_uipoly_wide((*(generator_multiples1 + 84))->m_U0, dummy, 4);

dummy[3] = 0xc759;
dummy[2] = 0x9d569854;
dummy[1] = 0xfe63db8e;
dummy[0] = 0xfa5b6b8d;
Kset_uipoly_wide((*(generator_multiples1 + 84))->m_V1, dummy, 4);

dummy[3] = 0x1f9b0;
dummy[2] = 0x835a694;
dummy[1] = 0x9543d056;
dummy[0] = 0xafad2d1c;
Kset_uipoly_wide((*(generator_multiples1 + 84))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 84))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 84))->m_z, 1);

dummy[3] = 0x12b0e;
dummy[2] = 0xfc819466;
dummy[1] = 0xd879b503;
dummy[0] = 0x7e1c3c54;
Kset_uipoly_wide((*(generator_multiples2 + 84))->m_U1, dummy, 4);

dummy[3] = 0x163f0;
dummy[2] = 0x6a64e73d;
dummy[1] = 0x2cfdc7c6;
dummy[0] = 0x41de9f5d;
Kset_uipoly_wide((*(generator_multiples2 + 84))->m_U0, dummy, 4);

dummy[3] = 0x154fc;
dummy[2] = 0x1839137f;
dummy[1] = 0x5001438b;
dummy[0] = 0x5397be52;
Kset_uipoly_wide((*(generator_multiples2 + 84))->m_V1, dummy, 4);

dummy[3] = 0x92c1;
dummy[2] = 0x6b53e270;
dummy[1] = 0xb1b8d265;
dummy[0] = 0xa7464ade;
Kset_uipoly_wide((*(generator_multiples2 + 84))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 84))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 84))->m_z, 1);

dummy[3] = 0x1ee84;
dummy[2] = 0x6213fcf5;
dummy[1] = 0x7a1bd76f;
dummy[0] = 0x7d0241ea;
Kset_uipoly_wide((*(generator_multiples1 + 85))->m_U1, dummy, 4);

dummy[3] = 0x27f9;
dummy[2] = 0x52ccc40;
dummy[1] = 0x71d0f26d;
dummy[0] = 0xe4813be6;
Kset_uipoly_wide((*(generator_multiples1 + 85))->m_U0, dummy, 4);

dummy[3] = 0xee3d;
dummy[2] = 0xd8e6e8a3;
dummy[1] = 0x2a136e77;
dummy[0] = 0x8731e86;
Kset_uipoly_wide((*(generator_multiples1 + 85))->m_V1, dummy, 4);

dummy[3] = 0x1c28;
dummy[2] = 0x409d3a41;
dummy[1] = 0x8578c860;
dummy[0] = 0x54957b65;
Kset_uipoly_wide((*(generator_multiples1 + 85))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 85))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 85))->m_z, 1);

dummy[3] = 0x1f402;
dummy[2] = 0x3d9280c8;
dummy[1] = 0x1a8b5662;
dummy[0] = 0x3c3d15fb;
Kset_uipoly_wide((*(generator_multiples2 + 85))->m_U1, dummy, 4);

dummy[3] = 0x15669;
dummy[2] = 0xaae49292;
dummy[1] = 0x4524af5b;
dummy[0] = 0xb8eeccd3;
Kset_uipoly_wide((*(generator_multiples2 + 85))->m_U0, dummy, 4);

dummy[3] = 0x184a0;
dummy[2] = 0x5bde1465;
dummy[1] = 0x72d10699;
dummy[0] = 0xd8f4507e;
Kset_uipoly_wide((*(generator_multiples2 + 85))->m_V1, dummy, 4);

dummy[3] = 0x69c8;
dummy[2] = 0xf2bfc4e9;
dummy[1] = 0xd8cd67a3;
dummy[0] = 0x885bcb64;
Kset_uipoly_wide((*(generator_multiples2 + 85))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 85))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 85))->m_z, 1);

dummy[3] = 0x12e99;
dummy[2] = 0x8da3c9fa;
dummy[1] = 0x3213cc3;
dummy[0] = 0x6837429c;
Kset_uipoly_wide((*(generator_multiples1 + 86))->m_U1, dummy, 4);

dummy[3] = 0x1da16;
dummy[2] = 0xb1a02b14;
dummy[1] = 0x9aa167ef;
dummy[0] = 0xf3939baa;
Kset_uipoly_wide((*(generator_multiples1 + 86))->m_U0, dummy, 4);

dummy[3] = 0x78a2;
dummy[2] = 0xc6f37074;
dummy[1] = 0x928e0057;
dummy[0] = 0x9721b70d;
Kset_uipoly_wide((*(generator_multiples1 + 86))->m_V1, dummy, 4);

dummy[3] = 0x194d5;
dummy[2] = 0x592cff8e;
dummy[1] = 0xcb19fa1e;
dummy[0] = 0x9f137eec;
Kset_uipoly_wide((*(generator_multiples1 + 86))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 86))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 86))->m_z, 1);

dummy[3] = 0x5513;
dummy[2] = 0x7e488547;
dummy[1] = 0x32b562b6;
dummy[0] = 0xa9c93ea3;
Kset_uipoly_wide((*(generator_multiples2 + 86))->m_U1, dummy, 4);

dummy[3] = 0x67a3;
dummy[2] = 0x7e07e980;
dummy[1] = 0x2b3b4d3;
dummy[0] = 0xca524fb1;
Kset_uipoly_wide((*(generator_multiples2 + 86))->m_U0, dummy, 4);

dummy[3] = 0x16588;
dummy[2] = 0xbb48ad73;
dummy[1] = 0x6853b32d;
dummy[0] = 0x632a24b6;
Kset_uipoly_wide((*(generator_multiples2 + 86))->m_V1, dummy, 4);

dummy[3] = 0xfe3b;
dummy[2] = 0x9d5bed8c;
dummy[1] = 0x8162f463;
dummy[0] = 0x7e7b512f;
Kset_uipoly_wide((*(generator_multiples2 + 86))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 86))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 86))->m_z, 1);

dummy[3] = 0x17fa2;
dummy[2] = 0xede18c52;
dummy[1] = 0xb0766bcb;
dummy[0] = 0xaf38b989;
Kset_uipoly_wide((*(generator_multiples1 + 87))->m_U1, dummy, 4);

dummy[3] = 0x44cd;
dummy[2] = 0xb04415cf;
dummy[1] = 0xa7e09408;
dummy[0] = 0x91fdadba;
Kset_uipoly_wide((*(generator_multiples1 + 87))->m_U0, dummy, 4);

dummy[3] = 0x7aa8;
dummy[2] = 0x7c0d7ddb;
dummy[1] = 0xae9a54b3;
dummy[0] = 0xaf53de38;
Kset_uipoly_wide((*(generator_multiples1 + 87))->m_V1, dummy, 4);

dummy[3] = 0x1a0de;
dummy[2] = 0x4885d257;
dummy[1] = 0xac1eb471;
dummy[0] = 0x401e6dd7;
Kset_uipoly_wide((*(generator_multiples1 + 87))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 87))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 87))->m_z, 1);

dummy[3] = 0x12c7e;
dummy[2] = 0xfd4a30af;
dummy[1] = 0x9d5d3eb;
dummy[0] = 0xe1328d11;
Kset_uipoly_wide((*(generator_multiples2 + 87))->m_U1, dummy, 4);

dummy[3] = 0x97ed;
dummy[2] = 0xf902547;
dummy[1] = 0xfbdf7c2c;
dummy[0] = 0x7f4f4e7e;
Kset_uipoly_wide((*(generator_multiples2 + 87))->m_U0, dummy, 4);

dummy[3] = 0x1f83d;
dummy[2] = 0x5833eabb;
dummy[1] = 0x93c5054b;
dummy[0] = 0x8f12d68a;
Kset_uipoly_wide((*(generator_multiples2 + 87))->m_V1, dummy, 4);

dummy[3] = 0x167ae;
dummy[2] = 0x9bbb0657;
dummy[1] = 0xb181d6a0;
dummy[0] = 0x801a22f0;
Kset_uipoly_wide((*(generator_multiples2 + 87))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 87))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 87))->m_z, 1);

dummy[3] = 0x191a1;
dummy[2] = 0x5e973cac;
dummy[1] = 0x37759340;
dummy[0] = 0x34a08971;
Kset_uipoly_wide((*(generator_multiples1 + 88))->m_U1, dummy, 4);

dummy[3] = 0x84be;
dummy[2] = 0x17c8be6b;
dummy[1] = 0x9e58bbdf;
dummy[0] = 0xc7efc7b9;
Kset_uipoly_wide((*(generator_multiples1 + 88))->m_U0, dummy, 4);

dummy[3] = 0x10cbd;
dummy[2] = 0xe0993cef;
dummy[1] = 0x5b665859;
dummy[0] = 0x837bdde8;
Kset_uipoly_wide((*(generator_multiples1 + 88))->m_V1, dummy, 4);

dummy[3] = 0x1623d;
dummy[2] = 0x79070055;
dummy[1] = 0xd36af336;
dummy[0] = 0xb9d72ef1;
Kset_uipoly_wide((*(generator_multiples1 + 88))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 88))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 88))->m_z, 1);

dummy[3] = 0x16dd5;
dummy[2] = 0xd2a8fd68;
dummy[1] = 0xf9b64d58;
dummy[0] = 0x305042ae;
Kset_uipoly_wide((*(generator_multiples2 + 88))->m_U1, dummy, 4);

dummy[3] = 0x14d61;
dummy[2] = 0x923b1ce3;
dummy[1] = 0xa661c7c8;
dummy[0] = 0xe637ac14;
Kset_uipoly_wide((*(generator_multiples2 + 88))->m_U0, dummy, 4);

dummy[3] = 0x18106;
dummy[2] = 0x1a81f242;
dummy[1] = 0xeeb72f2b;
dummy[0] = 0x4e1d7d48;
Kset_uipoly_wide((*(generator_multiples2 + 88))->m_V1, dummy, 4);

dummy[3] = 0x2cb4;
dummy[2] = 0x71185478;
dummy[1] = 0xe2e48fce;
dummy[0] = 0xde089a2c;
Kset_uipoly_wide((*(generator_multiples2 + 88))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 88))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 88))->m_z, 1);

dummy[3] = 0x76e4;
dummy[2] = 0x4b53711f;
dummy[1] = 0x68325e57;
dummy[0] = 0x561bb92e;
Kset_uipoly_wide((*(generator_multiples1 + 89))->m_U1, dummy, 4);

dummy[3] = 0x569d;
dummy[2] = 0xefd16c6d;
dummy[1] = 0x82d6c25a;
dummy[0] = 0x62c9fed4;
Kset_uipoly_wide((*(generator_multiples1 + 89))->m_U0, dummy, 4);

dummy[3] = 0x7ea4;
dummy[2] = 0xd7cfb4c6;
dummy[1] = 0x1cba7b5d;
dummy[0] = 0x7712db60;
Kset_uipoly_wide((*(generator_multiples1 + 89))->m_V1, dummy, 4);

dummy[3] = 0x18762;
dummy[2] = 0x607a162f;
dummy[1] = 0x24c60a11;
dummy[0] = 0x9ff43c1e;
Kset_uipoly_wide((*(generator_multiples1 + 89))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 89))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 89))->m_z, 1);

dummy[3] = 0x14c62;
dummy[2] = 0x5365a52e;
dummy[1] = 0xf8d954f9;
dummy[0] = 0xbb708e1f;
Kset_uipoly_wide((*(generator_multiples2 + 89))->m_U1, dummy, 4);

dummy[3] = 0x11f06;
dummy[2] = 0x33a0435d;
dummy[1] = 0xd15032a4;
dummy[0] = 0x9c422c40;
Kset_uipoly_wide((*(generator_multiples2 + 89))->m_U0, dummy, 4);

dummy[3] = 0x1bf55;
dummy[2] = 0x4a643a60;
dummy[1] = 0x3178ff11;
dummy[0] = 0x43ca3b91;
Kset_uipoly_wide((*(generator_multiples2 + 89))->m_V1, dummy, 4);

dummy[3] = 0x12b29;
dummy[2] = 0xa72b54ae;
dummy[1] = 0x93cbda42;
dummy[0] = 0x90b853a2;
Kset_uipoly_wide((*(generator_multiples2 + 89))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 89))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 89))->m_z, 1);

dummy[3] = 0x66f6;
dummy[2] = 0xf3b8c240;
dummy[1] = 0x2bad1842;
dummy[0] = 0x13db4950;
Kset_uipoly_wide((*(generator_multiples1 + 90))->m_U1, dummy, 4);

dummy[3] = 0x1deb9;
dummy[2] = 0xbaecfb2e;
dummy[1] = 0x96fc4adc;
dummy[0] = 0xb6d4ffd2;
Kset_uipoly_wide((*(generator_multiples1 + 90))->m_U0, dummy, 4);

dummy[3] = 0x73aa;
dummy[2] = 0x7df7aca2;
dummy[1] = 0x8c019218;
dummy[0] = 0x833528f4;
Kset_uipoly_wide((*(generator_multiples1 + 90))->m_V1, dummy, 4);

dummy[3] = 0x8b31;
dummy[2] = 0xd93fb385;
dummy[1] = 0x82f742cb;
dummy[0] = 0x1307d145;
Kset_uipoly_wide((*(generator_multiples1 + 90))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 90))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 90))->m_z, 1);

dummy[3] = 0x1bccb;
dummy[2] = 0xe40026c0;
dummy[1] = 0x946d62f6;
dummy[0] = 0x6703d2e5;
Kset_uipoly_wide((*(generator_multiples2 + 90))->m_U1, dummy, 4);

dummy[3] = 0x1218d;
dummy[2] = 0x1789b790;
dummy[1] = 0xe0c8d4bb;
dummy[0] = 0xf54a0bf;
Kset_uipoly_wide((*(generator_multiples2 + 90))->m_U0, dummy, 4);

dummy[3] = 0xf731;
dummy[2] = 0x2f64d062;
dummy[1] = 0x6f79ca1f;
dummy[0] = 0x17b86d9d;
Kset_uipoly_wide((*(generator_multiples2 + 90))->m_V1, dummy, 4);

dummy[3] = 0x1a705;
dummy[2] = 0x15bd9922;
dummy[1] = 0xa76b003;
dummy[0] = 0xc90c95c5;
Kset_uipoly_wide((*(generator_multiples2 + 90))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 90))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 90))->m_z, 1);

dummy[3] = 0x14fb6;
dummy[2] = 0x5deadad3;
dummy[1] = 0xf6b51ad9;
dummy[0] = 0xa61a8a61;
Kset_uipoly_wide((*(generator_multiples1 + 91))->m_U1, dummy, 4);

dummy[3] = 0x2a85;
dummy[2] = 0xf0135015;
dummy[1] = 0xde556f09;
dummy[0] = 0x5951646;
Kset_uipoly_wide((*(generator_multiples1 + 91))->m_U0, dummy, 4);

dummy[3] = 0x1c008;
dummy[2] = 0xe0ebef05;
dummy[1] = 0x14e69a66;
dummy[0] = 0xd73dbe3a;
Kset_uipoly_wide((*(generator_multiples1 + 91))->m_V1, dummy, 4);

dummy[3] = 0xa8e8;
dummy[2] = 0xc0f7925;
dummy[1] = 0x613d0ef;
dummy[0] = 0xeee74a4d;
Kset_uipoly_wide((*(generator_multiples1 + 91))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 91))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 91))->m_z, 1);

dummy[3] = 0x10f8f;
dummy[2] = 0xb47f4c35;
dummy[1] = 0x64c904e1;
dummy[0] = 0x94fc0b3f;
Kset_uipoly_wide((*(generator_multiples2 + 91))->m_U1, dummy, 4);

dummy[3] = 0x100d0;
dummy[2] = 0xf1740c5f;
dummy[1] = 0xb8a71c39;
dummy[0] = 0xa954bd98;
Kset_uipoly_wide((*(generator_multiples2 + 91))->m_U0, dummy, 4);

dummy[3] = 0x5ea5;
dummy[2] = 0x3f45274f;
dummy[1] = 0xb790decb;
dummy[0] = 0xe61df45c;
Kset_uipoly_wide((*(generator_multiples2 + 91))->m_V1, dummy, 4);

dummy[3] = 0x829c;
dummy[2] = 0x4fe32b87;
dummy[1] = 0xceeadef9;
dummy[0] = 0x49dd5146;
Kset_uipoly_wide((*(generator_multiples2 + 91))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 91))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 91))->m_z, 1);

dummy[3] = 0x1f280;
dummy[2] = 0xa668597e;
dummy[1] = 0x2b6c3e6;
dummy[0] = 0xeb3c65fa;
Kset_uipoly_wide((*(generator_multiples1 + 92))->m_U1, dummy, 4);

dummy[3] = 0x1e542;
dummy[2] = 0x38c8176a;
dummy[1] = 0xd92cc2d9;
dummy[0] = 0x3fe11cfb;
Kset_uipoly_wide((*(generator_multiples1 + 92))->m_U0, dummy, 4);

dummy[3] = 0x1b18c;
dummy[2] = 0x588fb1e;
dummy[1] = 0x330ce3bb;
dummy[0] = 0xb0c210bb;
Kset_uipoly_wide((*(generator_multiples1 + 92))->m_V1, dummy, 4);

dummy[3] = 0x14d1;
dummy[2] = 0x1d3b0b95;
dummy[1] = 0xa9b8bd1b;
dummy[0] = 0x4b76710e;
Kset_uipoly_wide((*(generator_multiples1 + 92))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 92))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 92))->m_z, 1);

dummy[3] = 0x4976;
dummy[2] = 0x320db9fc;
dummy[1] = 0x9cd28f50;
dummy[0] = 0x3653dc7;
Kset_uipoly_wide((*(generator_multiples2 + 92))->m_U1, dummy, 4);

dummy[3] = 0x14acf;
dummy[2] = 0x3c65dd90;
dummy[1] = 0xf2920af3;
dummy[0] = 0xdc3092df;
Kset_uipoly_wide((*(generator_multiples2 + 92))->m_U0, dummy, 4);

dummy[3] = 0x11bff;
dummy[2] = 0xdccb847f;
dummy[1] = 0x7816d3d1;
dummy[0] = 0x6727f76d;
Kset_uipoly_wide((*(generator_multiples2 + 92))->m_V1, dummy, 4);

dummy[3] = 0x118fc;
dummy[2] = 0x2fc4d243;
dummy[1] = 0x5711e63f;
dummy[0] = 0x12f076ce;
Kset_uipoly_wide((*(generator_multiples2 + 92))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 92))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 92))->m_z, 1);

dummy[3] = 0x1d931;
dummy[2] = 0x6575d4cf;
dummy[1] = 0x9c64ca9f;
dummy[0] = 0xeae653ca;
Kset_uipoly_wide((*(generator_multiples1 + 93))->m_U1, dummy, 4);

dummy[3] = 0x5029;
dummy[2] = 0x56d62285;
dummy[1] = 0xc0cd536d;
dummy[0] = 0x412071e5;
Kset_uipoly_wide((*(generator_multiples1 + 93))->m_U0, dummy, 4);

dummy[3] = 0x1599b;
dummy[2] = 0x700f4ac8;
dummy[1] = 0x100c5d19;
dummy[0] = 0x46337324;
Kset_uipoly_wide((*(generator_multiples1 + 93))->m_V1, dummy, 4);

dummy[3] = 0x141f9;
dummy[2] = 0x3236c8fa;
dummy[1] = 0x2935460f;
dummy[0] = 0x46b7b6c5;
Kset_uipoly_wide((*(generator_multiples1 + 93))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 93))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 93))->m_z, 1);

dummy[3] = 0x1a915;
dummy[2] = 0xcb4e3d46;
dummy[1] = 0x3fd81d4b;
dummy[0] = 0x9101a626;
Kset_uipoly_wide((*(generator_multiples2 + 93))->m_U1, dummy, 4);

dummy[3] = 0xced6;
dummy[2] = 0x2a116f70;
dummy[1] = 0xd3642bb9;
dummy[0] = 0x780abb40;
Kset_uipoly_wide((*(generator_multiples2 + 93))->m_U0, dummy, 4);

dummy[3] = 0x1c463;
dummy[2] = 0xd7d8c69e;
dummy[1] = 0xb00dd10;
dummy[0] = 0x5bf3b528;
Kset_uipoly_wide((*(generator_multiples2 + 93))->m_V1, dummy, 4);

dummy[3] = 0x4bb3;
dummy[2] = 0x93f23910;
dummy[1] = 0xe7c914ec;
dummy[0] = 0x26afb97f;
Kset_uipoly_wide((*(generator_multiples2 + 93))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 93))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 93))->m_z, 1);

dummy[3] = 0x470c;
dummy[2] = 0xb160403;
dummy[1] = 0x706ed160;
dummy[0] = 0x95226600;
Kset_uipoly_wide((*(generator_multiples1 + 94))->m_U1, dummy, 4);

dummy[3] = 0x12ad3;
dummy[2] = 0x4f48a509;
dummy[1] = 0xc96ec868;
dummy[0] = 0x7c9e80da;
Kset_uipoly_wide((*(generator_multiples1 + 94))->m_U0, dummy, 4);

dummy[3] = 0xd82;
dummy[2] = 0xdded3ad9;
dummy[1] = 0xdc5c350d;
dummy[0] = 0x1dafa42;
Kset_uipoly_wide((*(generator_multiples1 + 94))->m_V1, dummy, 4);

dummy[3] = 0x107b3;
dummy[2] = 0x5c472e49;
dummy[1] = 0xe447a2a2;
dummy[0] = 0xe0bedbce;
Kset_uipoly_wide((*(generator_multiples1 + 94))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 94))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 94))->m_z, 1);

dummy[3] = 0x18088;
dummy[2] = 0xad20d918;
dummy[1] = 0xfa4b73d2;
dummy[0] = 0xf2f662ff;
Kset_uipoly_wide((*(generator_multiples2 + 94))->m_U1, dummy, 4);

dummy[3] = 0x1baab;
dummy[2] = 0xd9aae6ae;
dummy[1] = 0xac488a6f;
dummy[0] = 0x18f49ee8;
Kset_uipoly_wide((*(generator_multiples2 + 94))->m_U0, dummy, 4);

dummy[3] = 0x6708;
dummy[2] = 0xc5464222;
dummy[1] = 0x15e4ec67;
dummy[0] = 0x86e7c63;
Kset_uipoly_wide((*(generator_multiples2 + 94))->m_V1, dummy, 4);

dummy[3] = 0x5e86;
dummy[2] = 0x382f7770;
dummy[1] = 0x4a90d077;
dummy[0] = 0x66f789ed;
Kset_uipoly_wide((*(generator_multiples2 + 94))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 94))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 94))->m_z, 1);

dummy[3] = 0x148b3;
dummy[2] = 0x13fb07d4;
dummy[1] = 0x5ff925f0;
dummy[0] = 0x20031b8;
Kset_uipoly_wide((*(generator_multiples1 + 95))->m_U1, dummy, 4);

dummy[3] = 0xfbd7;
dummy[2] = 0x938a3a2f;
dummy[1] = 0x919ec417;
dummy[0] = 0x959a709d;
Kset_uipoly_wide((*(generator_multiples1 + 95))->m_U0, dummy, 4);

dummy[3] = 0xa1d0;
dummy[2] = 0xf982d3b9;
dummy[1] = 0xb1da16e6;
dummy[0] = 0x21b03b20;
Kset_uipoly_wide((*(generator_multiples1 + 95))->m_V1, dummy, 4);

dummy[3] = 0x87f0;
dummy[2] = 0xf76f68df;
dummy[1] = 0xe4d34b60;
dummy[0] = 0x814e74c3;
Kset_uipoly_wide((*(generator_multiples1 + 95))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 95))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 95))->m_z, 1);

dummy[3] = 0xf35a;
dummy[2] = 0x43157cb9;
dummy[1] = 0x4d69992a;
dummy[0] = 0x386ee901;
Kset_uipoly_wide((*(generator_multiples2 + 95))->m_U1, dummy, 4);

dummy[3] = 0x157e4;
dummy[2] = 0x8a849dac;
dummy[1] = 0xcf6e23f;
dummy[0] = 0x133a9cbd;
Kset_uipoly_wide((*(generator_multiples2 + 95))->m_U0, dummy, 4);

dummy[3] = 0x4917;
dummy[2] = 0x21fed770;
dummy[1] = 0xc44716f4;
dummy[0] = 0x445babe8;
Kset_uipoly_wide((*(generator_multiples2 + 95))->m_V1, dummy, 4);

dummy[3] = 0x15ba9;
dummy[2] = 0xcc26ad0b;
dummy[1] = 0x63eafe87;
dummy[0] = 0x9818305f;
Kset_uipoly_wide((*(generator_multiples2 + 95))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 95))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 95))->m_z, 1);

dummy[3] = 0xc8a1;
dummy[2] = 0x13ee5b07;
dummy[1] = 0x85c59b39;
dummy[0] = 0xd64b147b;
Kset_uipoly_wide((*(generator_multiples1 + 96))->m_U1, dummy, 4);

dummy[3] = 0x66e7;
dummy[2] = 0xd3ea228e;
dummy[1] = 0x4592d91a;
dummy[0] = 0x75eefa24;
Kset_uipoly_wide((*(generator_multiples1 + 96))->m_U0, dummy, 4);

dummy[3] = 0x1280e;
dummy[2] = 0x88ac338c;
dummy[1] = 0xff742889;
dummy[0] = 0xdd33e1ef;
Kset_uipoly_wide((*(generator_multiples1 + 96))->m_V1, dummy, 4);

dummy[3] = 0x16c3f;
dummy[2] = 0xa41762aa;
dummy[1] = 0x413ca40d;
dummy[0] = 0xa120c930;
Kset_uipoly_wide((*(generator_multiples1 + 96))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 96))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 96))->m_z, 1);

dummy[3] = 0x54ed;
dummy[2] = 0x8b916ce8;
dummy[1] = 0x18d04c7a;
dummy[0] = 0x21b7cfff;
Kset_uipoly_wide((*(generator_multiples2 + 96))->m_U1, dummy, 4);

dummy[3] = 0x18de5;
dummy[2] = 0x228292c1;
dummy[1] = 0xa8b17c0d;
dummy[0] = 0xb0c0d297;
Kset_uipoly_wide((*(generator_multiples2 + 96))->m_U0, dummy, 4);

dummy[3] = 0x169de;
dummy[2] = 0xe0797ab1;
dummy[1] = 0xbf52365c;
dummy[0] = 0xd9234582;
Kset_uipoly_wide((*(generator_multiples2 + 96))->m_V1, dummy, 4);

dummy[3] = 0x184f2;
dummy[2] = 0xc2775b70;
dummy[1] = 0xec91ad67;
dummy[0] = 0xda65cb71;
Kset_uipoly_wide((*(generator_multiples2 + 96))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 96))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 96))->m_z, 1);

dummy[3] = 0x12141;
dummy[2] = 0x4a560d27;
dummy[1] = 0xdecf41e1;
dummy[0] = 0x23d899a6;
Kset_uipoly_wide((*(generator_multiples1 + 97))->m_U1, dummy, 4);

dummy[3] = 0x169e2;
dummy[2] = 0xccf9eba0;
dummy[1] = 0x1eb707ae;
dummy[0] = 0x97db0857;
Kset_uipoly_wide((*(generator_multiples1 + 97))->m_U0, dummy, 4);

dummy[3] = 0x1ead4;
dummy[2] = 0x6da6c43;
dummy[1] = 0xad4be153;
dummy[0] = 0x6e2d0637;
Kset_uipoly_wide((*(generator_multiples1 + 97))->m_V1, dummy, 4);

dummy[3] = 0x7714;
dummy[2] = 0xcac45265;
dummy[1] = 0x7c6023d3;
dummy[0] = 0xe87a1f5;
Kset_uipoly_wide((*(generator_multiples1 + 97))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 97))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 97))->m_z, 1);

dummy[3] = 0x155f5;
dummy[2] = 0xfd969269;
dummy[1] = 0xee20f993;
dummy[0] = 0xe1387b38;
Kset_uipoly_wide((*(generator_multiples2 + 97))->m_U1, dummy, 4);

dummy[3] = 0x14e56;
dummy[2] = 0x3ec220ac;
dummy[1] = 0x94a7fd41;
dummy[0] = 0x3e979191;
Kset_uipoly_wide((*(generator_multiples2 + 97))->m_U0, dummy, 4);

dummy[3] = 0xc005;
dummy[2] = 0xbe24659a;
dummy[1] = 0xe8dbfde1;
dummy[0] = 0x6f5433d6;
Kset_uipoly_wide((*(generator_multiples2 + 97))->m_V1, dummy, 4);

dummy[3] = 0x13696;
dummy[2] = 0xbec017f6;
dummy[1] = 0x75a49030;
dummy[0] = 0x89ae41b9;
Kset_uipoly_wide((*(generator_multiples2 + 97))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 97))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 97))->m_z, 1);

dummy[3] = 0x1e131;
dummy[2] = 0x28d69fec;
dummy[1] = 0x7168a914;
dummy[0] = 0xad76a88c;
Kset_uipoly_wide((*(generator_multiples1 + 98))->m_U1, dummy, 4);

dummy[3] = 0x1bb75;
dummy[2] = 0x2d624cd8;
dummy[1] = 0xb9099514;
dummy[0] = 0xfb960ead;
Kset_uipoly_wide((*(generator_multiples1 + 98))->m_U0, dummy, 4);

dummy[3] = 0x67f1;
dummy[2] = 0x66a435a5;
dummy[1] = 0x2f9fa168;
dummy[0] = 0xda0204ef;
Kset_uipoly_wide((*(generator_multiples1 + 98))->m_V1, dummy, 4);

dummy[3] = 0x186ae;
dummy[2] = 0x45b63ebb;
dummy[1] = 0x3c41456d;
dummy[0] = 0x64e2c14e;
Kset_uipoly_wide((*(generator_multiples1 + 98))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 98))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 98))->m_z, 1);

dummy[3] = 0xcbb2;
dummy[2] = 0x66e67929;
dummy[1] = 0x8b9b4517;
dummy[0] = 0xb5308b18;
Kset_uipoly_wide((*(generator_multiples2 + 98))->m_U1, dummy, 4);

dummy[3] = 0xa80a;
dummy[2] = 0xe04d2d26;
dummy[1] = 0xfa686f76;
dummy[0] = 0xe42dea6c;
Kset_uipoly_wide((*(generator_multiples2 + 98))->m_U0, dummy, 4);

dummy[3] = 0xabcc;
dummy[2] = 0x449b8aad;
dummy[1] = 0x85bf2d5c;
dummy[0] = 0x95869b28;
Kset_uipoly_wide((*(generator_multiples2 + 98))->m_V1, dummy, 4);

dummy[3] = 0x1c64e;
dummy[2] = 0xedac62ee;
dummy[1] = 0xcca5529d;
dummy[0] = 0x991a9eff;
Kset_uipoly_wide((*(generator_multiples2 + 98))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 98))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 98))->m_z, 1);

dummy[3] = 0x12dac;
dummy[2] = 0x1490aa50;
dummy[1] = 0x19dcc61;
dummy[0] = 0xfb607158;
Kset_uipoly_wide((*(generator_multiples1 + 99))->m_U1, dummy, 4);

dummy[3] = 0x13e0e;
dummy[2] = 0x2e6ca2b5;
dummy[1] = 0x5e64d661;
dummy[0] = 0x4b1c4303;
Kset_uipoly_wide((*(generator_multiples1 + 99))->m_U0, dummy, 4);

dummy[3] = 0xa87c;
dummy[2] = 0xdbcaaa9d;
dummy[1] = 0x171cdfc5;
dummy[0] = 0x79ee1e37;
Kset_uipoly_wide((*(generator_multiples1 + 99))->m_V1, dummy, 4);

dummy[3] = 0x1a074;
dummy[2] = 0x4a652cc6;
dummy[1] = 0xb59e4bc9;
dummy[0] = 0x5a591390;
Kset_uipoly_wide((*(generator_multiples1 + 99))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 99))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 99))->m_z, 1);

dummy[3] = 0x15481;
dummy[2] = 0xa4bff7fb;
dummy[1] = 0x920aced0;
dummy[0] = 0x1faf7587;
Kset_uipoly_wide((*(generator_multiples2 + 99))->m_U1, dummy, 4);

dummy[3] = 0x6710;
dummy[2] = 0xaba69837;
dummy[1] = 0x9598ffe9;
dummy[0] = 0x5ec93f40;
Kset_uipoly_wide((*(generator_multiples2 + 99))->m_U0, dummy, 4);

dummy[3] = 0x164e4;
dummy[2] = 0x4f4c30a4;
dummy[1] = 0xff2666e6;
dummy[0] = 0x1c76bf65;
Kset_uipoly_wide((*(generator_multiples2 + 99))->m_V1, dummy, 4);

dummy[3] = 0x1bec7;
dummy[2] = 0x6e1d28b4;
dummy[1] = 0xe4b57720;
dummy[0] = 0x5fed6286;
Kset_uipoly_wide((*(generator_multiples2 + 99))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 99))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 99))->m_z, 1);

dummy[3] = 0x161d1;
dummy[2] = 0xabd38729;
dummy[1] = 0xd46d6d6b;
dummy[0] = 0xe10b7b3e;
Kset_uipoly_wide((*(generator_multiples1 + 100))->m_U1, dummy, 4);

dummy[3] = 0x1dee1;
dummy[2] = 0x5a25e87;
dummy[1] = 0x58e5e373;
dummy[0] = 0x1dc2df3a;
Kset_uipoly_wide((*(generator_multiples1 + 100))->m_U0, dummy, 4);

dummy[3] = 0x7d7a;
dummy[2] = 0x892c5ddb;
dummy[1] = 0xd87815e9;
dummy[0] = 0x432168b0;
Kset_uipoly_wide((*(generator_multiples1 + 100))->m_V1, dummy, 4);

dummy[3] = 0x686b;
dummy[2] = 0x732c02e8;
dummy[1] = 0x9945bae8;
dummy[0] = 0x76ca38c5;
Kset_uipoly_wide((*(generator_multiples1 + 100))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 100))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 100))->m_z, 1);

dummy[3] = 0x118e8;
dummy[2] = 0xb0aa5732;
dummy[1] = 0x50e51a8;
dummy[0] = 0xdfab68ea;
Kset_uipoly_wide((*(generator_multiples2 + 100))->m_U1, dummy, 4);

dummy[3] = 0x1e9e2;
dummy[2] = 0xe00d7d22;
dummy[1] = 0x5385d17e;
dummy[0] = 0x57b202d9;
Kset_uipoly_wide((*(generator_multiples2 + 100))->m_U0, dummy, 4);

dummy[3] = 0x112b7;
dummy[2] = 0xfd49f9da;
dummy[1] = 0x9aca8319;
dummy[0] = 0x4b4d674e;
Kset_uipoly_wide((*(generator_multiples2 + 100))->m_V1, dummy, 4);

dummy[3] = 0x3d28;
dummy[2] = 0x521770e0;
dummy[1] = 0x2727b3e2;
dummy[0] = 0xea3956b4;
Kset_uipoly_wide((*(generator_multiples2 + 100))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 100))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 100))->m_z, 1);

dummy[3] = 0x11589;
dummy[2] = 0x9703753a;
dummy[1] = 0x6f8f5fbe;
dummy[0] = 0xf9686457;
Kset_uipoly_wide((*(generator_multiples1 + 101))->m_U1, dummy, 4);

dummy[3] = 0xd8ec;
dummy[2] = 0x41ea3417;
dummy[1] = 0xfff15636;
dummy[0] = 0x5bfa7854;
Kset_uipoly_wide((*(generator_multiples1 + 101))->m_U0, dummy, 4);

dummy[3] = 0x19543;
dummy[2] = 0x78865595;
dummy[1] = 0xf10cde28;
dummy[0] = 0x5db07da5;
Kset_uipoly_wide((*(generator_multiples1 + 101))->m_V1, dummy, 4);

dummy[3] = 0x1daed;
dummy[2] = 0xbd560079;
dummy[1] = 0x9dc1db04;
dummy[0] = 0xa8e8cf0f;
Kset_uipoly_wide((*(generator_multiples1 + 101))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 101))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 101))->m_z, 1);

dummy[3] = 0x1974a;
dummy[2] = 0x641e8bbf;
dummy[1] = 0xf3843c0f;
dummy[0] = 0x546162fa;
Kset_uipoly_wide((*(generator_multiples2 + 101))->m_U1, dummy, 4);

dummy[3] = 0xd11e;
dummy[2] = 0x66311acd;
dummy[1] = 0x98f4c422;
dummy[0] = 0x3c158829;
Kset_uipoly_wide((*(generator_multiples2 + 101))->m_U0, dummy, 4);

dummy[3] = 0x1716c;
dummy[2] = 0x6f7800;
dummy[1] = 0x2df0b889;
dummy[0] = 0x4b9942d8;
Kset_uipoly_wide((*(generator_multiples2 + 101))->m_V1, dummy, 4);

dummy[3] = 0x9ba3;
dummy[2] = 0xc6aa6a38;
dummy[1] = 0xa6cac398;
dummy[0] = 0xed173f08;
Kset_uipoly_wide((*(generator_multiples2 + 101))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 101))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 101))->m_z, 1);

dummy[3] = 0x1416;
dummy[2] = 0x787017c3;
dummy[1] = 0xfba68a31;
dummy[0] = 0x544279bb;
Kset_uipoly_wide((*(generator_multiples1 + 102))->m_U1, dummy, 4);

dummy[3] = 0x11601;
dummy[2] = 0xde39e484;
dummy[1] = 0x576a0868;
dummy[0] = 0x301115b0;
Kset_uipoly_wide((*(generator_multiples1 + 102))->m_U0, dummy, 4);

dummy[3] = 0x141e7;
dummy[2] = 0xa8b6de9e;
dummy[1] = 0x3dd3a48c;
dummy[0] = 0xdb82d0c0;
Kset_uipoly_wide((*(generator_multiples1 + 102))->m_V1, dummy, 4);

dummy[3] = 0x1ac61;
dummy[2] = 0x428262ab;
dummy[1] = 0xcf83aada;
dummy[0] = 0x503bb790;
Kset_uipoly_wide((*(generator_multiples1 + 102))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 102))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 102))->m_z, 1);

dummy[3] = 0x12e39;
dummy[2] = 0xd46b3aa;
dummy[1] = 0xcf56c817;
dummy[0] = 0x43773741;
Kset_uipoly_wide((*(generator_multiples2 + 102))->m_U1, dummy, 4);

dummy[3] = 0x123b5;
dummy[2] = 0xbb72d107;
dummy[1] = 0xb7a71e90;
dummy[0] = 0x105050fd;
Kset_uipoly_wide((*(generator_multiples2 + 102))->m_U0, dummy, 4);

dummy[3] = 0xa1e3;
dummy[2] = 0x7b1770d6;
dummy[1] = 0x6ba9465b;
dummy[0] = 0x419922ae;
Kset_uipoly_wide((*(generator_multiples2 + 102))->m_V1, dummy, 4);

dummy[3] = 0x1002b;
dummy[2] = 0x4529bb2e;
dummy[1] = 0x99105d0d;
dummy[0] = 0x9cb4c82c;
Kset_uipoly_wide((*(generator_multiples2 + 102))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 102))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 102))->m_z, 1);

dummy[3] = 0x18442;
dummy[2] = 0xad1d2d;
dummy[1] = 0x39ea59cc;
dummy[0] = 0x984af9b8;
Kset_uipoly_wide((*(generator_multiples1 + 103))->m_U1, dummy, 4);

dummy[3] = 0x839e;
dummy[2] = 0x8626f780;
dummy[1] = 0x2109010f;
dummy[0] = 0x71a4e5ce;
Kset_uipoly_wide((*(generator_multiples1 + 103))->m_U0, dummy, 4);

dummy[3] = 0xab61;
dummy[2] = 0x1fa160c3;
dummy[1] = 0x65ddeb56;
dummy[0] = 0x826ad1c6;
Kset_uipoly_wide((*(generator_multiples1 + 103))->m_V1, dummy, 4);

dummy[3] = 0x18365;
dummy[2] = 0x5a89dc44;
dummy[1] = 0x26b231d1;
dummy[0] = 0x60721127;
Kset_uipoly_wide((*(generator_multiples1 + 103))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 103))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 103))->m_z, 1);

dummy[3] = 0x16f5f;
dummy[2] = 0xc638c30f;
dummy[1] = 0xf4f975b1;
dummy[0] = 0x1571e999;
Kset_uipoly_wide((*(generator_multiples2 + 103))->m_U1, dummy, 4);

dummy[3] = 0xaa19;
dummy[2] = 0x37eb0a1;
dummy[1] = 0x53f8b05d;
dummy[0] = 0x5b150764;
Kset_uipoly_wide((*(generator_multiples2 + 103))->m_U0, dummy, 4);

dummy[3] = 0x9f17;
dummy[2] = 0x22ca320e;
dummy[1] = 0x678be442;
dummy[0] = 0x2ed3ce63;
Kset_uipoly_wide((*(generator_multiples2 + 103))->m_V1, dummy, 4);

dummy[3] = 0xe7e;
dummy[2] = 0x3b696303;
dummy[1] = 0x165e135d;
dummy[0] = 0x2f6a6636;
Kset_uipoly_wide((*(generator_multiples2 + 103))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 103))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 103))->m_z, 1);

dummy[3] = 0x15f05;
dummy[2] = 0xc96938b3;
dummy[1] = 0x63f9cd3f;
dummy[0] = 0xcaad22d;
Kset_uipoly_wide((*(generator_multiples1 + 104))->m_U1, dummy, 4);

dummy[3] = 0x6895;
dummy[2] = 0xa5ae2584;
dummy[1] = 0x909c0d5e;
dummy[0] = 0x3665939;
Kset_uipoly_wide((*(generator_multiples1 + 104))->m_U0, dummy, 4);

dummy[3] = 0x1f974;
dummy[2] = 0x813888ef;
dummy[1] = 0xfe2c091f;
dummy[0] = 0x8f8c55fc;
Kset_uipoly_wide((*(generator_multiples1 + 104))->m_V1, dummy, 4);

dummy[3] = 0xbfb4;
dummy[2] = 0xd2afb440;
dummy[1] = 0x580fa50c;
dummy[0] = 0xdbbec6cb;
Kset_uipoly_wide((*(generator_multiples1 + 104))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 104))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 104))->m_z, 1);

dummy[3] = 0x1d801;
dummy[2] = 0xbc972c6a;
dummy[1] = 0xfa01acc7;
dummy[0] = 0xe1bb736a;
Kset_uipoly_wide((*(generator_multiples2 + 104))->m_U1, dummy, 4);

dummy[3] = 0xe5f5;
dummy[2] = 0x1b071ed2;
dummy[1] = 0x30607d4a;
dummy[0] = 0xd435a015;
Kset_uipoly_wide((*(generator_multiples2 + 104))->m_U0, dummy, 4);

dummy[3] = 0x1f8e3;
dummy[2] = 0xcdd7c9fd;
dummy[1] = 0x28d5fdb;
dummy[0] = 0x44dc845f;
Kset_uipoly_wide((*(generator_multiples2 + 104))->m_V1, dummy, 4);

dummy[3] = 0xc321;
dummy[2] = 0x173be11c;
dummy[1] = 0x3617c2c8;
dummy[0] = 0x99ae8e1;
Kset_uipoly_wide((*(generator_multiples2 + 104))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 104))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 104))->m_z, 1);

dummy[3] = 0xf4b1;
dummy[2] = 0x7b838678;
dummy[1] = 0x63c07c32;
dummy[0] = 0xdf17f53e;
Kset_uipoly_wide((*(generator_multiples1 + 105))->m_U1, dummy, 4);

dummy[3] = 0x7bc3;
dummy[2] = 0x7101575;
dummy[1] = 0x4ee8bdd9;
dummy[0] = 0xcb365435;
Kset_uipoly_wide((*(generator_multiples1 + 105))->m_U0, dummy, 4);

dummy[3] = 0x1df83;
dummy[2] = 0x5eac37ab;
dummy[1] = 0xc5ca85bd;
dummy[0] = 0x83c6823b;
Kset_uipoly_wide((*(generator_multiples1 + 105))->m_V1, dummy, 4);

dummy[3] = 0x1cf3;
dummy[2] = 0x56b5bc98;
dummy[1] = 0xf26fc3b8;
dummy[0] = 0xe160d7e;
Kset_uipoly_wide((*(generator_multiples1 + 105))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 105))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 105))->m_z, 1);

dummy[3] = 0xe345;
dummy[2] = 0xd3507bd5;
dummy[1] = 0x475b911;
dummy[0] = 0x31810903;
Kset_uipoly_wide((*(generator_multiples2 + 105))->m_U1, dummy, 4);

dummy[3] = 0x9219;
dummy[2] = 0xb3ae2640;
dummy[1] = 0x67658677;
dummy[0] = 0xaeae17e3;
Kset_uipoly_wide((*(generator_multiples2 + 105))->m_U0, dummy, 4);

dummy[3] = 0x2464;
dummy[2] = 0x8fadbbff;
dummy[1] = 0x5b37227f;
dummy[0] = 0xf2a35d17;
Kset_uipoly_wide((*(generator_multiples2 + 105))->m_V1, dummy, 4);

dummy[3] = 0x14feb;
dummy[2] = 0x91e20dc5;
dummy[1] = 0x1a36f36c;
dummy[0] = 0x860c64d6;
Kset_uipoly_wide((*(generator_multiples2 + 105))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 105))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 105))->m_z, 1);

dummy[3] = 0x13602;
dummy[2] = 0xdef053e6;
dummy[1] = 0xa4a5f518;
dummy[0] = 0xc389457d;
Kset_uipoly_wide((*(generator_multiples1 + 106))->m_U1, dummy, 4);

dummy[3] = 0xbd3a;
dummy[2] = 0x82e81f57;
dummy[1] = 0x191f56c1;
dummy[0] = 0xff39be21;
Kset_uipoly_wide((*(generator_multiples1 + 106))->m_U0, dummy, 4);

dummy[3] = 0x18976;
dummy[2] = 0x5af5199d;
dummy[1] = 0x29728847;
dummy[0] = 0x11ad10ba;
Kset_uipoly_wide((*(generator_multiples1 + 106))->m_V1, dummy, 4);

dummy[3] = 0x9af7;
dummy[2] = 0xb25f290a;
dummy[1] = 0x1e7afb17;
dummy[0] = 0xbe15ec53;
Kset_uipoly_wide((*(generator_multiples1 + 106))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 106))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 106))->m_z, 1);

dummy[3] = 0x18904;
dummy[2] = 0xd8e4441b;
dummy[1] = 0x494dd071;
dummy[0] = 0xb8d6f362;
Kset_uipoly_wide((*(generator_multiples2 + 106))->m_U1, dummy, 4);

dummy[3] = 0x2db6;
dummy[2] = 0x8ee5fdd4;
dummy[1] = 0xf0daea9b;
dummy[0] = 0x537b712;
Kset_uipoly_wide((*(generator_multiples2 + 106))->m_U0, dummy, 4);

dummy[3] = 0x7c71;
dummy[2] = 0x1e62ea72;
dummy[1] = 0xc1b2544b;
dummy[0] = 0xb04c6c79;
Kset_uipoly_wide((*(generator_multiples2 + 106))->m_V1, dummy, 4);

dummy[3] = 0x1a1a6;
dummy[2] = 0xa7ffd864;
dummy[1] = 0xbb64b0ee;
dummy[0] = 0x8cad2a04;
Kset_uipoly_wide((*(generator_multiples2 + 106))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 106))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 106))->m_z, 1);

dummy[3] = 0xfbee;
dummy[2] = 0x70dcec50;
dummy[1] = 0xe8d31fd0;
dummy[0] = 0xb2480c02;
Kset_uipoly_wide((*(generator_multiples1 + 107))->m_U1, dummy, 4);

dummy[3] = 0x1c76c;
dummy[2] = 0x4b243b88;
dummy[1] = 0x2faa224d;
dummy[0] = 0xff82bade;
Kset_uipoly_wide((*(generator_multiples1 + 107))->m_U0, dummy, 4);

dummy[3] = 0x6e71;
dummy[2] = 0x5c1cf732;
dummy[1] = 0x46a04e3;
dummy[0] = 0x30f5c421;
Kset_uipoly_wide((*(generator_multiples1 + 107))->m_V1, dummy, 4);

dummy[3] = 0x12e1f;
dummy[2] = 0x669f2e25;
dummy[1] = 0xccc88baf;
dummy[0] = 0x7c128a69;
Kset_uipoly_wide((*(generator_multiples1 + 107))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 107))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 107))->m_z, 1);

dummy[3] = 0x8370;
dummy[2] = 0x55332411;
dummy[1] = 0xc1aa6234;
dummy[0] = 0x8ad36598;
Kset_uipoly_wide((*(generator_multiples2 + 107))->m_U1, dummy, 4);

dummy[3] = 0xc9dd;
dummy[2] = 0x7cd472a1;
dummy[1] = 0x76a5595e;
dummy[0] = 0xe92885e8;
Kset_uipoly_wide((*(generator_multiples2 + 107))->m_U0, dummy, 4);

dummy[3] = 0x28c3;
dummy[2] = 0x47c48fe6;
dummy[1] = 0x12a4ff61;
dummy[0] = 0x53933aa5;
Kset_uipoly_wide((*(generator_multiples2 + 107))->m_V1, dummy, 4);

dummy[3] = 0x11dd5;
dummy[2] = 0x81f9455f;
dummy[1] = 0x8e27e02f;
dummy[0] = 0xd98ee8dc;
Kset_uipoly_wide((*(generator_multiples2 + 107))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 107))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 107))->m_z, 1);

dummy[3] = 0xf0c9;
dummy[2] = 0x7c18b17e;
dummy[1] = 0x7e01b5e8;
dummy[0] = 0xd0508016;
Kset_uipoly_wide((*(generator_multiples1 + 108))->m_U1, dummy, 4);

dummy[3] = 0x1c555;
dummy[2] = 0x898d8051;
dummy[1] = 0x874c016a;
dummy[0] = 0x42607ece;
Kset_uipoly_wide((*(generator_multiples1 + 108))->m_U0, dummy, 4);

dummy[3] = 0xc69a;
dummy[2] = 0x635d773;
dummy[1] = 0x70c031bf;
dummy[0] = 0x87325ab2;
Kset_uipoly_wide((*(generator_multiples1 + 108))->m_V1, dummy, 4);

dummy[3] = 0x1232c;
dummy[2] = 0x1ad05738;
dummy[1] = 0xb104e042;
dummy[0] = 0xf99b4f80;
Kset_uipoly_wide((*(generator_multiples1 + 108))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 108))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 108))->m_z, 1);

dummy[3] = 0x3745;
dummy[2] = 0xef881fa1;
dummy[1] = 0xf2eb1e66;
dummy[0] = 0x9a3022c9;
Kset_uipoly_wide((*(generator_multiples2 + 108))->m_U1, dummy, 4);

dummy[3] = 0x1b716;
dummy[2] = 0x223b2cf;
dummy[1] = 0x60f939c8;
dummy[0] = 0x44bd6d18;
Kset_uipoly_wide((*(generator_multiples2 + 108))->m_U0, dummy, 4);

dummy[3] = 0x15fef;
dummy[2] = 0x3f99911d;
dummy[1] = 0xe134672e;
dummy[0] = 0x1b042f7a;
Kset_uipoly_wide((*(generator_multiples2 + 108))->m_V1, dummy, 4);

dummy[3] = 0x7aaa;
dummy[2] = 0xaff20d7e;
dummy[1] = 0x6dd77358;
dummy[0] = 0xdd745dd7;
Kset_uipoly_wide((*(generator_multiples2 + 108))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 108))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 108))->m_z, 1);

dummy[3] = 0x114ad;
dummy[2] = 0xa6bb62f2;
dummy[1] = 0x39219459;
dummy[0] = 0xb6090d82;
Kset_uipoly_wide((*(generator_multiples1 + 109))->m_U1, dummy, 4);

dummy[3] = 0x1dd3c;
dummy[2] = 0xa6f6ba2e;
dummy[1] = 0x3a5790ad;
dummy[0] = 0xc89f5890;
Kset_uipoly_wide((*(generator_multiples1 + 109))->m_U0, dummy, 4);

dummy[3] = 0xe2b9;
dummy[2] = 0x90dcefaa;
dummy[1] = 0x658017aa;
dummy[0] = 0x3e5114ec;
Kset_uipoly_wide((*(generator_multiples1 + 109))->m_V1, dummy, 4);

dummy[3] = 0x1fede;
dummy[2] = 0x90c92f34;
dummy[1] = 0xb83c8c85;
dummy[0] = 0xe9930fb6;
Kset_uipoly_wide((*(generator_multiples1 + 109))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 109))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 109))->m_z, 1);

dummy[3] = 0x1b6e4;
dummy[2] = 0x71b0dd5d;
dummy[1] = 0x387ba5e0;
dummy[0] = 0x6a675dc;
Kset_uipoly_wide((*(generator_multiples2 + 109))->m_U1, dummy, 4);

dummy[3] = 0xeaf5;
dummy[2] = 0x3547745;
dummy[1] = 0x8f93d315;
dummy[0] = 0xcc31b4d5;
Kset_uipoly_wide((*(generator_multiples2 + 109))->m_U0, dummy, 4);

dummy[3] = 0x45fc;
dummy[2] = 0x629265d9;
dummy[1] = 0x67f832bc;
dummy[0] = 0xbffe1166;
Kset_uipoly_wide((*(generator_multiples2 + 109))->m_V1, dummy, 4);

dummy[3] = 0x4de8;
dummy[2] = 0x62ac8bc2;
dummy[1] = 0x7dffac2b;
dummy[0] = 0xe0c38cd5;
Kset_uipoly_wide((*(generator_multiples2 + 109))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 109))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 109))->m_z, 1);

dummy[3] = 0x5486;
dummy[2] = 0xc3b69a10;
dummy[1] = 0xd4bbc375;
dummy[0] = 0x8b21bfb7;
Kset_uipoly_wide((*(generator_multiples1 + 110))->m_U1, dummy, 4);

dummy[3] = 0x14dc;
dummy[2] = 0x881a5dac;
dummy[1] = 0x39cd397b;
dummy[0] = 0xb944d0d6;
Kset_uipoly_wide((*(generator_multiples1 + 110))->m_U0, dummy, 4);

dummy[3] = 0x7f41;
dummy[2] = 0xfdaaed4e;
dummy[1] = 0xc6a5878a;
dummy[0] = 0xd8012855;
Kset_uipoly_wide((*(generator_multiples1 + 110))->m_V1, dummy, 4);

dummy[3] = 0x9fac;
dummy[2] = 0xc25c7e8e;
dummy[1] = 0xa560245;
dummy[0] = 0x6c6be1b3;
Kset_uipoly_wide((*(generator_multiples1 + 110))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 110))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 110))->m_z, 1);

dummy[3] = 0xba21;
dummy[2] = 0x49a8e5eb;
dummy[1] = 0xfe3e591;
dummy[0] = 0x2be92c42;
Kset_uipoly_wide((*(generator_multiples2 + 110))->m_U1, dummy, 4);

dummy[3] = 0x1ddcb;
dummy[2] = 0x2c8b14fd;
dummy[1] = 0x99e8622f;
dummy[0] = 0xda6e8aa5;
Kset_uipoly_wide((*(generator_multiples2 + 110))->m_U0, dummy, 4);

dummy[3] = 0xeafc;
dummy[2] = 0x737660ae;
dummy[1] = 0x2c60e1cd;
dummy[0] = 0xd20e8af8;
Kset_uipoly_wide((*(generator_multiples2 + 110))->m_V1, dummy, 4);

dummy[3] = 0x17f26;
dummy[2] = 0xa8f29ee6;
dummy[1] = 0xb4539940;
dummy[0] = 0xbc149b41;
Kset_uipoly_wide((*(generator_multiples2 + 110))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 110))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 110))->m_z, 1);

dummy[3] = 0x6be6;
dummy[2] = 0x5a433405;
dummy[1] = 0xeb7ecc02;
dummy[0] = 0x569f7303;
Kset_uipoly_wide((*(generator_multiples1 + 111))->m_U1, dummy, 4);

dummy[3] = 0x15b6a;
dummy[2] = 0x387bf479;
dummy[1] = 0x5548fe07;
dummy[0] = 0xf9238321;
Kset_uipoly_wide((*(generator_multiples1 + 111))->m_U0, dummy, 4);

dummy[3] = 0x14081;
dummy[2] = 0xa4e2a565;
dummy[1] = 0x19be9862;
dummy[0] = 0xc4981a54;
Kset_uipoly_wide((*(generator_multiples1 + 111))->m_V1, dummy, 4);

dummy[3] = 0x1d3d5;
dummy[2] = 0x42e0a0f6;
dummy[1] = 0xbba48b99;
dummy[0] = 0x8a65e899;
Kset_uipoly_wide((*(generator_multiples1 + 111))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 111))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 111))->m_z, 1);

dummy[3] = 0xc21c;
dummy[2] = 0xa2fea8c5;
dummy[1] = 0x77b9344;
dummy[0] = 0xae3b29ed;
Kset_uipoly_wide((*(generator_multiples2 + 111))->m_U1, dummy, 4);

dummy[3] = 0x738a;
dummy[2] = 0x2f660f6e;
dummy[1] = 0xe78355e7;
dummy[0] = 0xeafe7e9c;
Kset_uipoly_wide((*(generator_multiples2 + 111))->m_U0, dummy, 4);

dummy[3] = 0x6838;
dummy[2] = 0xee61551a;
dummy[1] = 0x938a6e05;
dummy[0] = 0x62a9e863;
Kset_uipoly_wide((*(generator_multiples2 + 111))->m_V1, dummy, 4);

dummy[3] = 0xf3e8;
dummy[2] = 0xc7d7899e;
dummy[1] = 0xc67fbf70;
dummy[0] = 0x7eb2dec4;
Kset_uipoly_wide((*(generator_multiples2 + 111))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 111))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 111))->m_z, 1);

dummy[3] = 0x17ec3;
dummy[2] = 0xf840c6ee;
dummy[1] = 0x14220760;
dummy[0] = 0x63ca966a;
Kset_uipoly_wide((*(generator_multiples1 + 112))->m_U1, dummy, 4);

dummy[3] = 0x13281;
dummy[2] = 0x6adfe24d;
dummy[1] = 0xf8f8ae6c;
dummy[0] = 0xe0a65ea2;
Kset_uipoly_wide((*(generator_multiples1 + 112))->m_U0, dummy, 4);

dummy[3] = 0xfeca;
dummy[2] = 0x60302ffb;
dummy[1] = 0xbfd3ff9b;
dummy[0] = 0xb43e6d7b;
Kset_uipoly_wide((*(generator_multiples1 + 112))->m_V1, dummy, 4);

dummy[3] = 0x3655;
dummy[2] = 0x37383ae9;
dummy[1] = 0xf9f4f069;
dummy[0] = 0xcf3d1498;
Kset_uipoly_wide((*(generator_multiples1 + 112))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 112))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 112))->m_z, 1);

dummy[3] = 0x1f857;
dummy[2] = 0xf45c463a;
dummy[1] = 0xe6c97336;
dummy[0] = 0x906bec8c;
Kset_uipoly_wide((*(generator_multiples2 + 112))->m_U1, dummy, 4);

dummy[3] = 0x20ca;
dummy[2] = 0xc1342ef2;
dummy[1] = 0x58667b89;
dummy[0] = 0x8e5e6264;
Kset_uipoly_wide((*(generator_multiples2 + 112))->m_U0, dummy, 4);

dummy[3] = 0x16ae0;
dummy[2] = 0x47aab8bc;
dummy[1] = 0x97b21bef;
dummy[0] = 0x7a94d165;
Kset_uipoly_wide((*(generator_multiples2 + 112))->m_V1, dummy, 4);

dummy[3] = 0x15a4;
dummy[2] = 0x465e0921;
dummy[1] = 0x39668211;
dummy[0] = 0xbc65e671;
Kset_uipoly_wide((*(generator_multiples2 + 112))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 112))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 112))->m_z, 1);

dummy[3] = 0x7e54;
dummy[2] = 0xb8b4af5c;
dummy[1] = 0x2550789;
dummy[0] = 0xdd8e8212;
Kset_uipoly_wide((*(generator_multiples1 + 113))->m_U1, dummy, 4);

dummy[3] = 0x19e5e;
dummy[2] = 0xe0138df2;
dummy[1] = 0x7d3c08fa;
dummy[0] = 0x33e0ce5f;
Kset_uipoly_wide((*(generator_multiples1 + 113))->m_U0, dummy, 4);

dummy[3] = 0xef0c;
dummy[2] = 0xa9400244;
dummy[1] = 0xae512bce;
dummy[0] = 0x95b18260;
Kset_uipoly_wide((*(generator_multiples1 + 113))->m_V1, dummy, 4);

dummy[3] = 0x6c2f;
dummy[2] = 0xa90a6829;
dummy[1] = 0x22268914;
dummy[0] = 0xd432e53c;
Kset_uipoly_wide((*(generator_multiples1 + 113))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 113))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 113))->m_z, 1);

dummy[3] = 0xa52;
dummy[2] = 0x6542dc30;
dummy[1] = 0x3f52fee6;
dummy[0] = 0x50cfa77a;
Kset_uipoly_wide((*(generator_multiples2 + 113))->m_U1, dummy, 4);

dummy[3] = 0x1a05e;
dummy[2] = 0x2f30d222;
dummy[1] = 0xa0cc6684;
dummy[0] = 0xac11c2ca;
Kset_uipoly_wide((*(generator_multiples2 + 113))->m_U0, dummy, 4);

dummy[3] = 0x1bb09;
dummy[2] = 0x8313e668;
dummy[1] = 0x46c22fbe;
dummy[0] = 0x9da6a18c;
Kset_uipoly_wide((*(generator_multiples2 + 113))->m_V1, dummy, 4);

dummy[3] = 0xe943;
dummy[2] = 0x98b54329;
dummy[1] = 0xae899886;
dummy[0] = 0xf7d86ef8;
Kset_uipoly_wide((*(generator_multiples2 + 113))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 113))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 113))->m_z, 1);

dummy[3] = 0x1eb29;
dummy[2] = 0x29f1c8ea;
dummy[1] = 0x97626cba;
dummy[0] = 0xf87d9110;
Kset_uipoly_wide((*(generator_multiples1 + 114))->m_U1, dummy, 4);

dummy[3] = 0x1c8a4;
dummy[2] = 0x4def8a46;
dummy[1] = 0x61ec2747;
dummy[0] = 0xded19ed1;
Kset_uipoly_wide((*(generator_multiples1 + 114))->m_U0, dummy, 4);

dummy[3] = 0x3208;
dummy[2] = 0x95104f2e;
dummy[1] = 0x95d86024;
dummy[0] = 0xe722ff50;
Kset_uipoly_wide((*(generator_multiples1 + 114))->m_V1, dummy, 4);

dummy[3] = 0x1bf85;
dummy[2] = 0x183d4033;
dummy[1] = 0x3b69d1b4;
dummy[0] = 0xa6c774e0;
Kset_uipoly_wide((*(generator_multiples1 + 114))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 114))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 114))->m_z, 1);

dummy[3] = 0x46ad;
dummy[2] = 0x8ca1e449;
dummy[1] = 0x9adff39a;
dummy[0] = 0x30d25438;
Kset_uipoly_wide((*(generator_multiples2 + 114))->m_U1, dummy, 4);

dummy[3] = 0x1f701;
dummy[2] = 0x586fb636;
dummy[1] = 0xd2d9e895;
dummy[0] = 0x73f3ff62;
Kset_uipoly_wide((*(generator_multiples2 + 114))->m_U0, dummy, 4);

dummy[3] = 0x717b;
dummy[2] = 0x74ba6b34;
dummy[1] = 0xfa45b9e9;
dummy[0] = 0x79912a20;
Kset_uipoly_wide((*(generator_multiples2 + 114))->m_V1, dummy, 4);

dummy[3] = 0x17c87;
dummy[2] = 0xf501d947;
dummy[1] = 0x374ea33f;
dummy[0] = 0xf474420f;
Kset_uipoly_wide((*(generator_multiples2 + 114))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 114))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 114))->m_z, 1);

dummy[3] = 0xbdae;
dummy[2] = 0x316e5a89;
dummy[1] = 0xaea3bd73;
dummy[0] = 0x779fb92f;
Kset_uipoly_wide((*(generator_multiples1 + 115))->m_U1, dummy, 4);

dummy[3] = 0x14a3e;
dummy[2] = 0x97a790f3;
dummy[1] = 0xb0d3697b;
dummy[0] = 0x1f033731;
Kset_uipoly_wide((*(generator_multiples1 + 115))->m_U0, dummy, 4);

dummy[3] = 0x187a0;
dummy[2] = 0x95c22fdd;
dummy[1] = 0xd68ae285;
dummy[0] = 0xb8065fa7;
Kset_uipoly_wide((*(generator_multiples1 + 115))->m_V1, dummy, 4);

dummy[3] = 0x3299;
dummy[2] = 0xcc182fe4;
dummy[1] = 0x487db6;
dummy[0] = 0x14dbb631;
Kset_uipoly_wide((*(generator_multiples1 + 115))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 115))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 115))->m_z, 1);

dummy[3] = 0x12929;
dummy[2] = 0x82b0cc;
dummy[1] = 0x98a7ccd0;
dummy[0] = 0x983a82b0;
Kset_uipoly_wide((*(generator_multiples2 + 115))->m_U1, dummy, 4);

dummy[3] = 0x1c06a;
dummy[2] = 0x7872f16b;
dummy[1] = 0x2cb155a3;
dummy[0] = 0xf629ead5;
Kset_uipoly_wide((*(generator_multiples2 + 115))->m_U0, dummy, 4);

dummy[3] = 0x3fc4;
dummy[2] = 0xe9794aca;
dummy[1] = 0x9843c2ea;
dummy[0] = 0xf534beb0;
Kset_uipoly_wide((*(generator_multiples2 + 115))->m_V1, dummy, 4);

dummy[3] = 0x6f76;
dummy[2] = 0x91ed19e6;
dummy[1] = 0x73b2979a;
dummy[0] = 0x390323c4;
Kset_uipoly_wide((*(generator_multiples2 + 115))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 115))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 115))->m_z, 1);

dummy[3] = 0x1ae31;
dummy[2] = 0x145a179e;
dummy[1] = 0x5b7a6f46;
dummy[0] = 0xb95698de;
Kset_uipoly_wide((*(generator_multiples1 + 116))->m_U1, dummy, 4);

dummy[3] = 0x14749;
dummy[2] = 0x5981dc0e;
dummy[1] = 0xeed0d5e1;
dummy[0] = 0x479a0aef;
Kset_uipoly_wide((*(generator_multiples1 + 116))->m_U0, dummy, 4);

dummy[3] = 0x6b31;
dummy[2] = 0x49ce17e4;
dummy[1] = 0xe6fbff18;
dummy[0] = 0xc496a4c;
Kset_uipoly_wide((*(generator_multiples1 + 116))->m_V1, dummy, 4);

dummy[3] = 0x49f7;
dummy[2] = 0xa0cae7cc;
dummy[1] = 0x55315fe5;
dummy[0] = 0xcb671823;
Kset_uipoly_wide((*(generator_multiples1 + 116))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 116))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 116))->m_z, 1);

dummy[3] = 0x7c2a;
dummy[2] = 0x82a28cb;
dummy[1] = 0x63ff8628;
dummy[0] = 0x866b86db;
Kset_uipoly_wide((*(generator_multiples2 + 116))->m_U1, dummy, 4);

dummy[3] = 0x909b;
dummy[2] = 0x4a66baf8;
dummy[1] = 0x848674be;
dummy[0] = 0xa84325f7;
Kset_uipoly_wide((*(generator_multiples2 + 116))->m_U0, dummy, 4);

dummy[3] = 0x1d2d8;
dummy[2] = 0x11ca5113;
dummy[1] = 0xb9f0c2f8;
dummy[0] = 0xa6fc67d7;
Kset_uipoly_wide((*(generator_multiples2 + 116))->m_V1, dummy, 4);

dummy[3] = 0x1fceb;
dummy[2] = 0x5c7935f7;
dummy[1] = 0x5ee9dc39;
dummy[0] = 0x35175d69;
Kset_uipoly_wide((*(generator_multiples2 + 116))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 116))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 116))->m_z, 1);

dummy[3] = 0x1d896;
dummy[2] = 0x81d886fc;
dummy[1] = 0x317b9946;
dummy[0] = 0x29f0f4dc;
Kset_uipoly_wide((*(generator_multiples1 + 117))->m_U1, dummy, 4);

dummy[3] = 0x13a02;
dummy[2] = 0xcee47c0a;
dummy[1] = 0xb614771d;
dummy[0] = 0x94ce2ac1;
Kset_uipoly_wide((*(generator_multiples1 + 117))->m_U0, dummy, 4);

dummy[3] = 0x19051;
dummy[2] = 0xa086294;
dummy[1] = 0x3fccbe74;
dummy[0] = 0x67c1d4a8;
Kset_uipoly_wide((*(generator_multiples1 + 117))->m_V1, dummy, 4);

dummy[3] = 0x9005;
dummy[2] = 0xda365e0;
dummy[1] = 0xeed3b88a;
dummy[0] = 0xb44c4dab;
Kset_uipoly_wide((*(generator_multiples1 + 117))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 117))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 117))->m_z, 1);

dummy[3] = 0xa06c;
dummy[2] = 0x2ca602ee;
dummy[1] = 0x422196a6;
dummy[0] = 0x448ec1d7;
Kset_uipoly_wide((*(generator_multiples2 + 117))->m_U1, dummy, 4);

dummy[3] = 0x1e9ba;
dummy[2] = 0xd52d3156;
dummy[1] = 0x5c3954d5;
dummy[0] = 0xc21962ca;
Kset_uipoly_wide((*(generator_multiples2 + 117))->m_U0, dummy, 4);

dummy[3] = 0x1c5fd;
dummy[2] = 0x56205e3c;
dummy[1] = 0xa479010c;
dummy[0] = 0x5fe28638;
Kset_uipoly_wide((*(generator_multiples2 + 117))->m_V1, dummy, 4);

dummy[3] = 0xa45;
dummy[2] = 0xd2970063;
dummy[1] = 0x7c4572c1;
dummy[0] = 0xd774fb8d;
Kset_uipoly_wide((*(generator_multiples2 + 117))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 117))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 117))->m_z, 1);

dummy[3] = 0x99e5;
dummy[2] = 0x1329fc50;
dummy[1] = 0x6ef64ef;
dummy[0] = 0xcaeac538;
Kset_uipoly_wide((*(generator_multiples1 + 118))->m_U1, dummy, 4);

dummy[3] = 0x42f7;
dummy[2] = 0xc6131851;
dummy[1] = 0x7cecc33e;
dummy[0] = 0xabf2ed3e;
Kset_uipoly_wide((*(generator_multiples1 + 118))->m_U0, dummy, 4);

dummy[3] = 0xc5e1;
dummy[2] = 0xe0ba042e;
dummy[1] = 0x824e818b;
dummy[0] = 0xdccb8b50;
Kset_uipoly_wide((*(generator_multiples1 + 118))->m_V1, dummy, 4);

dummy[3] = 0x199c0;
dummy[2] = 0x6a9ca639;
dummy[1] = 0x95781b7e;
dummy[0] = 0xa9886fde;
Kset_uipoly_wide((*(generator_multiples1 + 118))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 118))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 118))->m_z, 1);

dummy[3] = 0x10885;
dummy[2] = 0xa7430ef8;
dummy[1] = 0x3a7463af;
dummy[0] = 0x401fb19d;
Kset_uipoly_wide((*(generator_multiples2 + 118))->m_U1, dummy, 4);

dummy[3] = 0xcb76;
dummy[2] = 0xb4e43d3a;
dummy[1] = 0x51d6ad8e;
dummy[0] = 0xe5bc4f1f;
Kset_uipoly_wide((*(generator_multiples2 + 118))->m_U0, dummy, 4);

dummy[3] = 0x1000d;
dummy[2] = 0xfb302be6;
dummy[1] = 0x99f63a60;
dummy[0] = 0x3097173b;
Kset_uipoly_wide((*(generator_multiples2 + 118))->m_V1, dummy, 4);

dummy[3] = 0x4040;
dummy[2] = 0x3f7685b1;
dummy[1] = 0xf7c5db25;
dummy[0] = 0xc9337ce4;
Kset_uipoly_wide((*(generator_multiples2 + 118))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 118))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 118))->m_z, 1);

dummy[3] = 0x10a1c;
dummy[2] = 0xec819e59;
dummy[1] = 0xfb092307;
dummy[0] = 0xddd483eb;
Kset_uipoly_wide((*(generator_multiples1 + 119))->m_U1, dummy, 4);

dummy[3] = 0xd49f;
dummy[2] = 0xc49e7338;
dummy[1] = 0xc43060aa;
dummy[0] = 0x9c85db4d;
Kset_uipoly_wide((*(generator_multiples1 + 119))->m_U0, dummy, 4);

dummy[3] = 0x91f;
dummy[2] = 0x7a9261b3;
dummy[1] = 0x42c0abef;
dummy[0] = 0x188b01a;
Kset_uipoly_wide((*(generator_multiples1 + 119))->m_V1, dummy, 4);

dummy[3] = 0xaa14;
dummy[2] = 0xa0d42865;
dummy[1] = 0xf043b823;
dummy[0] = 0x31aeb92a;
Kset_uipoly_wide((*(generator_multiples1 + 119))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 119))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 119))->m_z, 1);

dummy[3] = 0xec7e;
dummy[2] = 0xf00015e7;
dummy[1] = 0xc37851f1;
dummy[0] = 0xc1e696b5;
Kset_uipoly_wide((*(generator_multiples2 + 119))->m_U1, dummy, 4);

dummy[3] = 0x16fb1;
dummy[2] = 0x8cd052da;
dummy[1] = 0xf82691f0;
dummy[0] = 0x9415ff6a;
Kset_uipoly_wide((*(generator_multiples2 + 119))->m_U0, dummy, 4);

dummy[3] = 0xb2fd;
dummy[2] = 0x4a341c34;
dummy[1] = 0x3ad8bda6;
dummy[0] = 0x3a6a6481;
Kset_uipoly_wide((*(generator_multiples2 + 119))->m_V1, dummy, 4);

dummy[3] = 0x4fe3;
dummy[2] = 0x490d9e52;
dummy[1] = 0xb928fe15;
dummy[0] = 0x5cc1c798;
Kset_uipoly_wide((*(generator_multiples2 + 119))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 119))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 119))->m_z, 1);

dummy[3] = 0x18079;
dummy[2] = 0x30f61e65;
dummy[1] = 0xaf9dff48;
dummy[0] = 0xa1d93eb0;
Kset_uipoly_wide((*(generator_multiples1 + 120))->m_U1, dummy, 4);

dummy[3] = 0x1879;
dummy[2] = 0x108866f8;
dummy[1] = 0xf313ef2;
dummy[0] = 0xab74a757;
Kset_uipoly_wide((*(generator_multiples1 + 120))->m_U0, dummy, 4);

dummy[3] = 0x360e;
dummy[2] = 0x456e60b1;
dummy[1] = 0xf839b0cd;
dummy[0] = 0xe68a7efb;
Kset_uipoly_wide((*(generator_multiples1 + 120))->m_V1, dummy, 4);

dummy[3] = 0x1dc8f;
dummy[2] = 0xd89a0521;
dummy[1] = 0xcdcb9482;
dummy[0] = 0x6c1fe5d3;
Kset_uipoly_wide((*(generator_multiples1 + 120))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 120))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 120))->m_z, 1);

dummy[3] = 0xbd08;
dummy[2] = 0xd81db712;
dummy[1] = 0x147c493f;
dummy[0] = 0x3a5d2b70;
Kset_uipoly_wide((*(generator_multiples2 + 120))->m_U1, dummy, 4);

dummy[3] = 0x183a3;
dummy[2] = 0x358440b3;
dummy[1] = 0xbd9e23d5;
dummy[0] = 0x4d2cae51;
Kset_uipoly_wide((*(generator_multiples2 + 120))->m_U0, dummy, 4);

dummy[3] = 0x18bc;
dummy[2] = 0x5686953c;
dummy[1] = 0x9468fcd0;
dummy[0] = 0x955faad0;
Kset_uipoly_wide((*(generator_multiples2 + 120))->m_V1, dummy, 4);

dummy[3] = 0x9305;
dummy[2] = 0x8eb7f879;
dummy[1] = 0xaca02145;
dummy[0] = 0x729c9a58;
Kset_uipoly_wide((*(generator_multiples2 + 120))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 120))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 120))->m_z, 1);

dummy[3] = 0x152b8;
dummy[2] = 0x7e67a2ee;
dummy[1] = 0xb9f1788;
dummy[0] = 0x434b6963;
Kset_uipoly_wide((*(generator_multiples1 + 121))->m_U1, dummy, 4);

dummy[3] = 0x1cd7b;
dummy[2] = 0xc7b7d12b;
dummy[1] = 0x36699754;
dummy[0] = 0x652914cf;
Kset_uipoly_wide((*(generator_multiples1 + 121))->m_U0, dummy, 4);

dummy[3] = 0x2bbf;
dummy[2] = 0x57a3bdaf;
dummy[1] = 0xf1104d82;
dummy[0] = 0xc898cb0a;
Kset_uipoly_wide((*(generator_multiples1 + 121))->m_V1, dummy, 4);

dummy[3] = 0x120d3;
dummy[2] = 0x6cd7a453;
dummy[1] = 0xd4916774;
dummy[0] = 0xa0af6edc;
Kset_uipoly_wide((*(generator_multiples1 + 121))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 121))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 121))->m_z, 1);

dummy[3] = 0x1227f;
dummy[2] = 0x66eace27;
dummy[1] = 0xa3a6cd39;
dummy[0] = 0x9f0145e8;
Kset_uipoly_wide((*(generator_multiples2 + 121))->m_U1, dummy, 4);

dummy[3] = 0x6021;
dummy[2] = 0x1378607e;
dummy[1] = 0xc006e610;
dummy[0] = 0x91f056bf;
Kset_uipoly_wide((*(generator_multiples2 + 121))->m_U0, dummy, 4);

dummy[3] = 0x1de6e;
dummy[2] = 0x8009f646;
dummy[1] = 0x294d69a9;
dummy[0] = 0xc7fc524f;
Kset_uipoly_wide((*(generator_multiples2 + 121))->m_V1, dummy, 4);

dummy[3] = 0x127ef;
dummy[2] = 0x60a51c07;
dummy[1] = 0x4a538712;
dummy[0] = 0xf719f7d3;
Kset_uipoly_wide((*(generator_multiples2 + 121))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 121))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 121))->m_z, 1);

dummy[3] = 0x9e81;
dummy[2] = 0xbfaee692;
dummy[1] = 0xefd315ef;
dummy[0] = 0x25d3bb93;
Kset_uipoly_wide((*(generator_multiples1 + 122))->m_U1, dummy, 4);

dummy[3] = 0x1c057;
dummy[2] = 0xa98bc1b5;
dummy[1] = 0xa0f4caf1;
dummy[0] = 0x5b1286cc;
Kset_uipoly_wide((*(generator_multiples1 + 122))->m_U0, dummy, 4);

dummy[3] = 0x5e9c;
dummy[2] = 0x9f2ec3a7;
dummy[1] = 0xbf487cf7;
dummy[0] = 0xf53d3bcb;
Kset_uipoly_wide((*(generator_multiples1 + 122))->m_V1, dummy, 4);

dummy[3] = 0x18d34;
dummy[2] = 0x524cd1da;
dummy[1] = 0x518cbf02;
dummy[0] = 0x23a6a935;
Kset_uipoly_wide((*(generator_multiples1 + 122))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 122))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 122))->m_z, 1);

dummy[3] = 0xa37f;
dummy[2] = 0x8dee9018;
dummy[1] = 0x5046cc65;
dummy[0] = 0x37f5a98;
Kset_uipoly_wide((*(generator_multiples2 + 122))->m_U1, dummy, 4);

dummy[3] = 0xbbb6;
dummy[2] = 0x83f33cfd;
dummy[1] = 0xa2d3b51;
dummy[0] = 0xa6c7120;
Kset_uipoly_wide((*(generator_multiples2 + 122))->m_U0, dummy, 4);

dummy[3] = 0x40dc;
dummy[2] = 0x2f733817;
dummy[1] = 0x73fcb8af;
dummy[0] = 0xec540e4e;
Kset_uipoly_wide((*(generator_multiples2 + 122))->m_V1, dummy, 4);

dummy[3] = 0x1620d;
dummy[2] = 0x796ab076;
dummy[1] = 0xe09e0f70;
dummy[0] = 0x65bf06c6;
Kset_uipoly_wide((*(generator_multiples2 + 122))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 122))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 122))->m_z, 1);

dummy[3] = 0x1d59e;
dummy[2] = 0xffef2bb1;
dummy[1] = 0x22c66f9a;
dummy[0] = 0x1434a8cf;
Kset_uipoly_wide((*(generator_multiples1 + 123))->m_U1, dummy, 4);

dummy[3] = 0x10adb;
dummy[2] = 0xa9c270b0;
dummy[1] = 0x3c1de8e9;
dummy[0] = 0x5ea5e799;
Kset_uipoly_wide((*(generator_multiples1 + 123))->m_U0, dummy, 4);

dummy[3] = 0xa5f5;
dummy[2] = 0x205ee5d0;
dummy[1] = 0x8e88b923;
dummy[0] = 0xd483a7d;
Kset_uipoly_wide((*(generator_multiples1 + 123))->m_V1, dummy, 4);

dummy[3] = 0x1a15c;
dummy[2] = 0x6ed5bfda;
dummy[1] = 0x481501c4;
dummy[0] = 0x19c8d44e;
Kset_uipoly_wide((*(generator_multiples1 + 123))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 123))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 123))->m_z, 1);

dummy[3] = 0x10f3d;
dummy[2] = 0x24cd9d6f;
dummy[1] = 0xf4a64251;
dummy[0] = 0x8a8a9889;
Kset_uipoly_wide((*(generator_multiples2 + 123))->m_U1, dummy, 4);

dummy[3] = 0xbc63;
dummy[2] = 0x5b7f6637;
dummy[1] = 0x1337f7a7;
dummy[0] = 0xfdc47a45;
Kset_uipoly_wide((*(generator_multiples2 + 123))->m_U0, dummy, 4);

dummy[3] = 0x1dfca;
dummy[2] = 0x61c65e4;
dummy[1] = 0xa6c5f6d0;
dummy[0] = 0xec824474;
Kset_uipoly_wide((*(generator_multiples2 + 123))->m_V1, dummy, 4);

dummy[3] = 0x84a5;
dummy[2] = 0xd6497437;
dummy[1] = 0x13225b84;
dummy[0] = 0x1cfb467a;
Kset_uipoly_wide((*(generator_multiples2 + 123))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 123))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 123))->m_z, 1);

dummy[3] = 0x8bee;
dummy[2] = 0x217f2dc2;
dummy[1] = 0x72572fa4;
dummy[0] = 0x78605893;
Kset_uipoly_wide((*(generator_multiples1 + 124))->m_U1, dummy, 4);

dummy[3] = 0x10e3e;
dummy[2] = 0x74fbe640;
dummy[1] = 0x75a4bf5e;
dummy[0] = 0x31e1c3a3;
Kset_uipoly_wide((*(generator_multiples1 + 124))->m_U0, dummy, 4);

dummy[3] = 0x1158b;
dummy[2] = 0x56cd04a8;
dummy[1] = 0xf1126936;
dummy[0] = 0xd14a4bc4;
Kset_uipoly_wide((*(generator_multiples1 + 124))->m_V1, dummy, 4);

dummy[3] = 0x110e0;
dummy[2] = 0x960d0af4;
dummy[1] = 0x733ae435;
dummy[0] = 0x209c7c23;
Kset_uipoly_wide((*(generator_multiples1 + 124))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 124))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 124))->m_z, 1);

dummy[3] = 0x133d9;
dummy[2] = 0x286d74db;
dummy[1] = 0xc66c9a38;
dummy[0] = 0x42f1a79d;
Kset_uipoly_wide((*(generator_multiples2 + 124))->m_U1, dummy, 4);

dummy[3] = 0x524d;
dummy[2] = 0x894bc119;
dummy[1] = 0x27bef2cb;
dummy[0] = 0xdff53af9;
Kset_uipoly_wide((*(generator_multiples2 + 124))->m_U0, dummy, 4);

dummy[3] = 0x15f63;
dummy[2] = 0x3410af17;
dummy[1] = 0x5b0b947;
dummy[0] = 0xc663bd31;
Kset_uipoly_wide((*(generator_multiples2 + 124))->m_V1, dummy, 4);

dummy[3] = 0x1a9db;
dummy[2] = 0x6aacfb47;
dummy[1] = 0x8990363f;
dummy[0] = 0x76086a6a;
Kset_uipoly_wide((*(generator_multiples2 + 124))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 124))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 124))->m_z, 1);

dummy[3] = 0x1c8e8;
dummy[2] = 0xb95b51eb;
dummy[1] = 0xd8f1941b;
dummy[0] = 0x99203635;
Kset_uipoly_wide((*(generator_multiples1 + 125))->m_U1, dummy, 4);

dummy[3] = 0x18f11;
dummy[2] = 0x893b1e51;
dummy[1] = 0x30d2dc0d;
dummy[0] = 0xc70c181;
Kset_uipoly_wide((*(generator_multiples1 + 125))->m_U0, dummy, 4);

dummy[3] = 0x635c;
dummy[2] = 0x2e7e017b;
dummy[1] = 0xc0f74967;
dummy[0] = 0x42b46fcb;
Kset_uipoly_wide((*(generator_multiples1 + 125))->m_V1, dummy, 4);

dummy[3] = 0xef46;
dummy[2] = 0x6e43f5b;
dummy[1] = 0x65c8aac9;
dummy[0] = 0xc3aac415;
Kset_uipoly_wide((*(generator_multiples1 + 125))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 125))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 125))->m_z, 1);

dummy[3] = 0x1e682;
dummy[2] = 0xec1065be;
dummy[1] = 0xcdbc7da4;
dummy[0] = 0x43f395c5;
Kset_uipoly_wide((*(generator_multiples2 + 125))->m_U1, dummy, 4);

dummy[3] = 0x2d32;
dummy[2] = 0x11a16c30;
dummy[1] = 0x5ce07680;
dummy[0] = 0xbdb637f8;
Kset_uipoly_wide((*(generator_multiples2 + 125))->m_U0, dummy, 4);

dummy[3] = 0x8429;
dummy[2] = 0x98ff86ab;
dummy[1] = 0x915e783d;
dummy[0] = 0x2f946d3d;
Kset_uipoly_wide((*(generator_multiples2 + 125))->m_V1, dummy, 4);

dummy[3] = 0x7128;
dummy[2] = 0x9e1ce2e9;
dummy[1] = 0x2897cc44;
dummy[0] = 0x1bf6b203;
Kset_uipoly_wide((*(generator_multiples2 + 125))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 125))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 125))->m_z, 1);

dummy[3] = 0x91c9;
dummy[2] = 0xccfea08b;
dummy[1] = 0x2f4329b5;
dummy[0] = 0x37fa4ce5;
Kset_uipoly_wide((*(generator_multiples1 + 126))->m_U1, dummy, 4);

dummy[3] = 0x115;
dummy[2] = 0xad50dbfd;
dummy[1] = 0xeeb33c49;
dummy[0] = 0xafe223ce;
Kset_uipoly_wide((*(generator_multiples1 + 126))->m_U0, dummy, 4);

dummy[3] = 0xf65d;
dummy[2] = 0xa54649d2;
dummy[1] = 0xdc56669c;
dummy[0] = 0x28a724c9;
Kset_uipoly_wide((*(generator_multiples1 + 126))->m_V1, dummy, 4);

dummy[3] = 0xc61d;
dummy[2] = 0xa9f0c906;
dummy[1] = 0x805bcb86;
dummy[0] = 0x28b9ac5c;
Kset_uipoly_wide((*(generator_multiples1 + 126))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 126))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 126))->m_z, 1);

dummy[3] = 0x1dd9e;
dummy[2] = 0x1c66019c;
dummy[1] = 0x19960e5f;
dummy[0] = 0xebd8304a;
Kset_uipoly_wide((*(generator_multiples2 + 126))->m_U1, dummy, 4);

dummy[3] = 0x7139;
dummy[2] = 0x855b10a4;
dummy[1] = 0xf8f0303e;
dummy[0] = 0x31e35388;
Kset_uipoly_wide((*(generator_multiples2 + 126))->m_U0, dummy, 4);

dummy[3] = 0x455e;
dummy[2] = 0x7324918b;
dummy[1] = 0xa3972dc;
dummy[0] = 0x8de3f8f8;
Kset_uipoly_wide((*(generator_multiples2 + 126))->m_V1, dummy, 4);

dummy[3] = 0x95e7;
dummy[2] = 0xf27ee8cb;
dummy[1] = 0x5cb3267c;
dummy[0] = 0xa28a47b2;
Kset_uipoly_wide((*(generator_multiples2 + 126))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 126))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 126))->m_z, 1);

dummy[3] = 0x1fb08;
dummy[2] = 0x97746dc6;
dummy[1] = 0x78acaa6b;
dummy[0] = 0x7c0063bd;
Kset_uipoly_wide((*(generator_multiples1 + 127))->m_U1, dummy, 4);

dummy[3] = 0x2720;
dummy[2] = 0x9cbf6eb2;
dummy[1] = 0x376f017;
dummy[0] = 0x626c6b44;
Kset_uipoly_wide((*(generator_multiples1 + 127))->m_U0, dummy, 4);

dummy[3] = 0x1bcf7;
dummy[2] = 0x3ae4f642;
dummy[1] = 0x871060bd;
dummy[0] = 0x3e37bd0a;
Kset_uipoly_wide((*(generator_multiples1 + 127))->m_V1, dummy, 4);

dummy[3] = 0x19e3e;
dummy[2] = 0xf158aa51;
dummy[1] = 0xecd58e64;
dummy[0] = 0xa4b78739;
Kset_uipoly_wide((*(generator_multiples1 + 127))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 127))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 127))->m_z, 1);

dummy[3] = 0x6478;
dummy[2] = 0x9c4ea3e1;
dummy[1] = 0x43477a17;
dummy[0] = 0xa69e438d;
Kset_uipoly_wide((*(generator_multiples2 + 127))->m_U1, dummy, 4);

dummy[3] = 0x2e80;
dummy[2] = 0xdbcab1c9;
dummy[1] = 0x549c8283;
dummy[0] = 0x2a2d5b7;
Kset_uipoly_wide((*(generator_multiples2 + 127))->m_U0, dummy, 4);

dummy[3] = 0x1bca4;
dummy[2] = 0x73910072;
dummy[1] = 0xea1293da;
dummy[0] = 0x368d9b61;
Kset_uipoly_wide((*(generator_multiples2 + 127))->m_V1, dummy, 4);

dummy[3] = 0x1f316;
dummy[2] = 0x9a931539;
dummy[1] = 0x76f494ed;
dummy[0] = 0x9716c860;
Kset_uipoly_wide((*(generator_multiples2 + 127))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 127))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 127))->m_z, 1);

dummy[3] = 0x18523;
dummy[2] = 0x3b67f7ba;
dummy[1] = 0x6eebb4b8;
dummy[0] = 0x3d3eb19;
Kset_uipoly_wide((*(generator_multiples1 + 128))->m_U1, dummy, 4);

dummy[3] = 0x1ac2c;
dummy[2] = 0xebf67082;
dummy[1] = 0x5ac1d94d;
dummy[0] = 0xca3d51b;
Kset_uipoly_wide((*(generator_multiples1 + 128))->m_U0, dummy, 4);

dummy[3] = 0x17afe;
dummy[2] = 0x1dbbe081;
dummy[1] = 0x26870cc7;
dummy[0] = 0x49b6149;
Kset_uipoly_wide((*(generator_multiples1 + 128))->m_V1, dummy, 4);

dummy[3] = 0x1743a;
dummy[2] = 0xe9bf129;
dummy[1] = 0xeb92ddf6;
dummy[0] = 0xae5accee;
Kset_uipoly_wide((*(generator_multiples1 + 128))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 128))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 128))->m_z, 1);

dummy[3] = 0xf5ab;
dummy[2] = 0xcb06c4d2;
dummy[1] = 0xbfff1653;
dummy[0] = 0xa87815fc;
Kset_uipoly_wide((*(generator_multiples2 + 128))->m_U1, dummy, 4);

dummy[3] = 0x75ae;
dummy[2] = 0xcee87134;
dummy[1] = 0xa1bd259b;
dummy[0] = 0x4278cad0;
Kset_uipoly_wide((*(generator_multiples2 + 128))->m_U0, dummy, 4);

dummy[3] = 0xb5d2;
dummy[2] = 0x48ad24a5;
dummy[1] = 0x9b8090ed;
dummy[0] = 0x3f80d298;
Kset_uipoly_wide((*(generator_multiples2 + 128))->m_V1, dummy, 4);

dummy[3] = 0xdb98;
dummy[2] = 0x1384e181;
dummy[1] = 0xb712331c;
dummy[0] = 0x1f027668;
Kset_uipoly_wide((*(generator_multiples2 + 128))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 128))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 128))->m_z, 1);

dummy[3] = 0x1d96f;
dummy[2] = 0x9f5b2510;
dummy[1] = 0x69de5bc6;
dummy[0] = 0x8761806b;
Kset_uipoly_wide((*(generator_multiples1 + 129))->m_U1, dummy, 4);

dummy[3] = 0x24e3;
dummy[2] = 0x4a00dff1;
dummy[1] = 0x85bb34d8;
dummy[0] = 0x2c5523c4;
Kset_uipoly_wide((*(generator_multiples1 + 129))->m_U0, dummy, 4);

dummy[3] = 0x13406;
dummy[2] = 0xa0ef4243;
dummy[1] = 0xd2f929da;
dummy[0] = 0xea633e21;
Kset_uipoly_wide((*(generator_multiples1 + 129))->m_V1, dummy, 4);

dummy[3] = 0x7e0e;
dummy[2] = 0x84e076cf;
dummy[1] = 0xfea767db;
dummy[0] = 0x3ddce847;
Kset_uipoly_wide((*(generator_multiples1 + 129))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 129))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 129))->m_z, 1);

dummy[3] = 0x13c09;
dummy[2] = 0xc83ecd66;
dummy[1] = 0x5f35b1;
dummy[0] = 0x68f627c7;
Kset_uipoly_wide((*(generator_multiples2 + 129))->m_U1, dummy, 4);

dummy[3] = 0x49c9;
dummy[2] = 0x98bafcd5;
dummy[1] = 0x654e45c6;
dummy[0] = 0x294bde74;
Kset_uipoly_wide((*(generator_multiples2 + 129))->m_U0, dummy, 4);

dummy[3] = 0x19d51;
dummy[2] = 0x9ca5d078;
dummy[1] = 0xbf0400b0;
dummy[0] = 0x5345b81d;
Kset_uipoly_wide((*(generator_multiples2 + 129))->m_V1, dummy, 4);

dummy[3] = 0x333;
dummy[2] = 0x7d890a8a;
dummy[1] = 0xe5e0527e;
dummy[0] = 0x62a7553;
Kset_uipoly_wide((*(generator_multiples2 + 129))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 129))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 129))->m_z, 1);

dummy[3] = 0x116d3;
dummy[2] = 0xf65ee559;
dummy[1] = 0x80976e98;
dummy[0] = 0xa4de8cd2;
Kset_uipoly_wide((*(generator_multiples1 + 130))->m_U1, dummy, 4);

dummy[3] = 0x18803;
dummy[2] = 0x104a3634;
dummy[1] = 0x3508be33;
dummy[0] = 0x1f297e77;
Kset_uipoly_wide((*(generator_multiples1 + 130))->m_U0, dummy, 4);

dummy[3] = 0x1c0aa;
dummy[2] = 0x9f6854a;
dummy[1] = 0x2e2d777;
dummy[0] = 0x664da711;
Kset_uipoly_wide((*(generator_multiples1 + 130))->m_V1, dummy, 4);

dummy[3] = 0x183d8;
dummy[2] = 0xd4d338c7;
dummy[1] = 0xe78801f8;
dummy[0] = 0x6d21ec5b;
Kset_uipoly_wide((*(generator_multiples1 + 130))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 130))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 130))->m_z, 1);

dummy[3] = 0x1a394;
dummy[2] = 0x80ec9e38;
dummy[1] = 0xb869ac02;
dummy[0] = 0x4ba386de;
Kset_uipoly_wide((*(generator_multiples2 + 130))->m_U1, dummy, 4);

dummy[3] = 0x1f6c8;
dummy[2] = 0x3b479d78;
dummy[1] = 0xaceea4c6;
dummy[0] = 0x22a7dffa;
Kset_uipoly_wide((*(generator_multiples2 + 130))->m_U0, dummy, 4);

dummy[3] = 0x114e5;
dummy[2] = 0xaf4090f;
dummy[1] = 0x1e723b1a;
dummy[0] = 0x5506c66a;
Kset_uipoly_wide((*(generator_multiples2 + 130))->m_V1, dummy, 4);

dummy[3] = 0x16c78;
dummy[2] = 0x2407ec60;
dummy[1] = 0xf339fbe4;
dummy[0] = 0xfe6982ac;
Kset_uipoly_wide((*(generator_multiples2 + 130))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 130))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 130))->m_z, 1);

dummy[3] = 0x1fc30;
dummy[2] = 0xb8497778;
dummy[1] = 0xdff4c6df;
dummy[0] = 0xaff19539;
Kset_uipoly_wide((*(generator_multiples1 + 131))->m_U1, dummy, 4);

dummy[3] = 0x1e73b;
dummy[2] = 0x99699947;
dummy[1] = 0x3260f690;
dummy[0] = 0x285bb182;
Kset_uipoly_wide((*(generator_multiples1 + 131))->m_U0, dummy, 4);

dummy[3] = 0x18a0c;
dummy[2] = 0xacf7fee6;
dummy[1] = 0xc57a7710;
dummy[0] = 0x88d6d847;
Kset_uipoly_wide((*(generator_multiples1 + 131))->m_V1, dummy, 4);

dummy[3] = 0x8157;
dummy[2] = 0x76c0d40e;
dummy[1] = 0xcf6a9b53;
dummy[0] = 0x368dee23;
Kset_uipoly_wide((*(generator_multiples1 + 131))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 131))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 131))->m_z, 1);

dummy[3] = 0x95b3;
dummy[2] = 0xa8d48907;
dummy[1] = 0xba278d8f;
dummy[0] = 0x3e55744;
Kset_uipoly_wide((*(generator_multiples2 + 131))->m_U1, dummy, 4);

dummy[3] = 0x8d01;
dummy[2] = 0xd90d69e;
dummy[1] = 0xe548049f;
dummy[0] = 0x86eb6607;
Kset_uipoly_wide((*(generator_multiples2 + 131))->m_U0, dummy, 4);

dummy[3] = 0x3310;
dummy[2] = 0xf634fdaf;
dummy[1] = 0x3ad0119f;
dummy[0] = 0xf31be357;
Kset_uipoly_wide((*(generator_multiples2 + 131))->m_V1, dummy, 4);

dummy[3] = 0x1b45e;
dummy[2] = 0x245b719f;
dummy[1] = 0xa9d0cc46;
dummy[0] = 0x6be2fd71;
Kset_uipoly_wide((*(generator_multiples2 + 131))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 131))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 131))->m_z, 1);

dummy[3] = 0xcb16;
dummy[2] = 0xd4c9fb17;
dummy[1] = 0xeca4f37a;
dummy[0] = 0xe4921c78;
Kset_uipoly_wide((*(generator_multiples1 + 132))->m_U1, dummy, 4);

dummy[3] = 0x6230;
dummy[2] = 0xc6d79ccb;
dummy[1] = 0x202b0cc6;
dummy[0] = 0xd01e4a77;
Kset_uipoly_wide((*(generator_multiples1 + 132))->m_U0, dummy, 4);

dummy[3] = 0x644;
dummy[2] = 0x8e901fbd;
dummy[1] = 0xdefa302f;
dummy[0] = 0xc67379ff;
Kset_uipoly_wide((*(generator_multiples1 + 132))->m_V1, dummy, 4);

dummy[3] = 0x9b21;
dummy[2] = 0xfcdc067a;
dummy[1] = 0xc5b07062;
dummy[0] = 0x42f74af0;
Kset_uipoly_wide((*(generator_multiples1 + 132))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 132))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 132))->m_z, 1);

dummy[3] = 0x4b97;
dummy[2] = 0xe0d4dc70;
dummy[1] = 0x9b21c95d;
dummy[0] = 0xf48f28a0;
Kset_uipoly_wide((*(generator_multiples2 + 132))->m_U1, dummy, 4);

dummy[3] = 0x10b0;
dummy[2] = 0x26404815;
dummy[1] = 0xa66bfcee;
dummy[0] = 0xf0160bbb;
Kset_uipoly_wide((*(generator_multiples2 + 132))->m_U0, dummy, 4);

dummy[3] = 0x104e8;
dummy[2] = 0xd1285105;
dummy[1] = 0x7dc2dfb2;
dummy[0] = 0x2effd09e;
Kset_uipoly_wide((*(generator_multiples2 + 132))->m_V1, dummy, 4);

dummy[3] = 0x11a47;
dummy[2] = 0x658cb079;
dummy[1] = 0x60830437;
dummy[0] = 0x51997189;
Kset_uipoly_wide((*(generator_multiples2 + 132))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 132))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 132))->m_z, 1);

dummy[3] = 0x4c89;
dummy[2] = 0x75e2cd3f;
dummy[1] = 0x5989ab5d;
dummy[0] = 0xb5a0feb4;
Kset_uipoly_wide((*(generator_multiples1 + 133))->m_U1, dummy, 4);

dummy[3] = 0x10c1f;
dummy[2] = 0x4efe1321;
dummy[1] = 0xdb988798;
dummy[0] = 0x71e3c79c;
Kset_uipoly_wide((*(generator_multiples1 + 133))->m_U0, dummy, 4);

dummy[3] = 0x1aa55;
dummy[2] = 0x27331d25;
dummy[1] = 0x9fd4ad8a;
dummy[0] = 0xc3a67911;
Kset_uipoly_wide((*(generator_multiples1 + 133))->m_V1, dummy, 4);

dummy[3] = 0x1d353;
dummy[2] = 0x47df1ab;
dummy[1] = 0xc0311527;
dummy[0] = 0x22a7b145;
Kset_uipoly_wide((*(generator_multiples1 + 133))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 133))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 133))->m_z, 1);

dummy[3] = 0xc4f0;
dummy[2] = 0x7189a6ac;
dummy[1] = 0x568ffaa1;
dummy[0] = 0x8790e285;
Kset_uipoly_wide((*(generator_multiples2 + 133))->m_U1, dummy, 4);

dummy[3] = 0x1c01a;
dummy[2] = 0x6144d32f;
dummy[1] = 0x3f45984c;
dummy[0] = 0x133df6d2;
Kset_uipoly_wide((*(generator_multiples2 + 133))->m_U0, dummy, 4);

dummy[3] = 0xab61;
dummy[2] = 0xf92cc2b1;
dummy[1] = 0xab521f61;
dummy[0] = 0xfb0806d3;
Kset_uipoly_wide((*(generator_multiples2 + 133))->m_V1, dummy, 4);

dummy[3] = 0x1f75a;
dummy[2] = 0xc9d5723f;
dummy[1] = 0x8387c0ca;
dummy[0] = 0x4e619784;
Kset_uipoly_wide((*(generator_multiples2 + 133))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 133))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 133))->m_z, 1);

dummy[3] = 0x1be50;
dummy[2] = 0x2d4d6e9a;
dummy[1] = 0xa1599b37;
dummy[0] = 0xa5463c54;
Kset_uipoly_wide((*(generator_multiples1 + 134))->m_U1, dummy, 4);

dummy[3] = 0x1fccf;
dummy[2] = 0x909e8d4b;
dummy[1] = 0xbf72dc81;
dummy[0] = 0xfa336120;
Kset_uipoly_wide((*(generator_multiples1 + 134))->m_U0, dummy, 4);

dummy[3] = 0x695f;
dummy[2] = 0x8f853f3c;
dummy[1] = 0xb03c6f46;
dummy[0] = 0xf5e1e559;
Kset_uipoly_wide((*(generator_multiples1 + 134))->m_V1, dummy, 4);

dummy[3] = 0xf823;
dummy[2] = 0xf783bb3b;
dummy[1] = 0xce2c8691;
dummy[0] = 0xb967f7e1;
Kset_uipoly_wide((*(generator_multiples1 + 134))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 134))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 134))->m_z, 1);

dummy[3] = 0x4817;
dummy[2] = 0x1706f4b3;
dummy[1] = 0x101fef9a;
dummy[0] = 0xcda149fc;
Kset_uipoly_wide((*(generator_multiples2 + 134))->m_U1, dummy, 4);

dummy[3] = 0xf5a8;
dummy[2] = 0xe7c59310;
dummy[1] = 0x2007c760;
dummy[0] = 0x43b02225;
Kset_uipoly_wide((*(generator_multiples2 + 134))->m_U0, dummy, 4);

dummy[3] = 0x1c659;
dummy[2] = 0x2d6ade5d;
dummy[1] = 0xc55d7c0d;
dummy[0] = 0xb27422f3;
Kset_uipoly_wide((*(generator_multiples2 + 134))->m_V1, dummy, 4);

dummy[3] = 0x5db8;
dummy[2] = 0x6716331;
dummy[1] = 0xbfbc9590;
dummy[0] = 0xf643000c;
Kset_uipoly_wide((*(generator_multiples2 + 134))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 134))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 134))->m_z, 1);

dummy[3] = 0x10a3d;
dummy[2] = 0x58ad1336;
dummy[1] = 0x4443798b;
dummy[0] = 0x92479d1b;
Kset_uipoly_wide((*(generator_multiples1 + 135))->m_U1, dummy, 4);

dummy[3] = 0xd699;
dummy[2] = 0x3e008e0a;
dummy[1] = 0x92adc213;
dummy[0] = 0xfb60a282;
Kset_uipoly_wide((*(generator_multiples1 + 135))->m_U0, dummy, 4);

dummy[3] = 0xcd81;
dummy[2] = 0x8e2041c1;
dummy[1] = 0x5525f104;
dummy[0] = 0x887b7a01;
Kset_uipoly_wide((*(generator_multiples1 + 135))->m_V1, dummy, 4);

dummy[3] = 0xe2b9;
dummy[2] = 0x188f0543;
dummy[1] = 0xd36c50d6;
dummy[0] = 0x5cfa5a3e;
Kset_uipoly_wide((*(generator_multiples1 + 135))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 135))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 135))->m_z, 1);

dummy[3] = 0x19a2;
dummy[2] = 0x67f13bcf;
dummy[1] = 0xf97b9e3c;
dummy[0] = 0xdf4e4e42;
Kset_uipoly_wide((*(generator_multiples2 + 135))->m_U1, dummy, 4);

dummy[3] = 0x903a;
dummy[2] = 0x54bf627;
dummy[1] = 0xe4113070;
dummy[0] = 0xb2c35ac4;
Kset_uipoly_wide((*(generator_multiples2 + 135))->m_U0, dummy, 4);

dummy[3] = 0x610c;
dummy[2] = 0xfca80249;
dummy[1] = 0xd8a2e9fc;
dummy[0] = 0xf85b935f;
Kset_uipoly_wide((*(generator_multiples2 + 135))->m_V1, dummy, 4);

dummy[3] = 0x86c3;
dummy[2] = 0xfce21870;
dummy[1] = 0xdfdc01de;
dummy[0] = 0xf0ddd3e6;
Kset_uipoly_wide((*(generator_multiples2 + 135))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 135))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 135))->m_z, 1);

dummy[3] = 0x1ec03;
dummy[2] = 0xfad3ad8f;
dummy[1] = 0x4c7cce58;
dummy[0] = 0x6e3a3d6d;
Kset_uipoly_wide((*(generator_multiples1 + 136))->m_U1, dummy, 4);

dummy[3] = 0xe324;
dummy[2] = 0x8403c779;
dummy[1] = 0xedbde386;
dummy[0] = 0x5d03acf2;
Kset_uipoly_wide((*(generator_multiples1 + 136))->m_U0, dummy, 4);

dummy[3] = 0x11a4f;
dummy[2] = 0xec3ac5fa;
dummy[1] = 0x6e0ed255;
dummy[0] = 0xccdb17d7;
Kset_uipoly_wide((*(generator_multiples1 + 136))->m_V1, dummy, 4);

dummy[3] = 0x1c7d6;
dummy[2] = 0x77c40fa3;
dummy[1] = 0x9eb51959;
dummy[0] = 0xb5c3d065;
Kset_uipoly_wide((*(generator_multiples1 + 136))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 136))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 136))->m_z, 1);

dummy[3] = 0x1d9e0;
dummy[2] = 0x27a6c963;
dummy[1] = 0x9a3a373c;
dummy[0] = 0x1b8460f1;
Kset_uipoly_wide((*(generator_multiples2 + 136))->m_U1, dummy, 4);

dummy[3] = 0x8b70;
dummy[2] = 0xe8f6cc61;
dummy[1] = 0x2927db68;
dummy[0] = 0xa34eb7a2;
Kset_uipoly_wide((*(generator_multiples2 + 136))->m_U0, dummy, 4);

dummy[3] = 0x12657;
dummy[2] = 0x65e836f0;
dummy[1] = 0xf3e59051;
dummy[0] = 0x7b76c43b;
Kset_uipoly_wide((*(generator_multiples2 + 136))->m_V1, dummy, 4);

dummy[3] = 0x9355;
dummy[2] = 0x4534c440;
dummy[1] = 0x2ee04dcb;
dummy[0] = 0x2fe7334d;
Kset_uipoly_wide((*(generator_multiples2 + 136))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 136))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 136))->m_z, 1);

dummy[3] = 0x1042d;
dummy[2] = 0x3a15feec;
dummy[1] = 0x4745941c;
dummy[0] = 0xc5de7272;
Kset_uipoly_wide((*(generator_multiples1 + 137))->m_U1, dummy, 4);

dummy[3] = 0x392;
dummy[2] = 0x84019b95;
dummy[1] = 0x7939a385;
dummy[0] = 0xf9d7ff88;
Kset_uipoly_wide((*(generator_multiples1 + 137))->m_U0, dummy, 4);

dummy[3] = 0x1b4e4;
dummy[2] = 0x4370b082;
dummy[1] = 0xf149370d;
dummy[0] = 0x200eafa1;
Kset_uipoly_wide((*(generator_multiples1 + 137))->m_V1, dummy, 4);

dummy[3] = 0x4ec;
dummy[2] = 0x375085d9;
dummy[1] = 0xf5a04050;
dummy[0] = 0x41bfe720;
Kset_uipoly_wide((*(generator_multiples1 + 137))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 137))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 137))->m_z, 1);

dummy[3] = 0x3c64;
dummy[2] = 0x16fb4e25;
dummy[1] = 0x40a8b607;
dummy[0] = 0x63447aa;
Kset_uipoly_wide((*(generator_multiples2 + 137))->m_U1, dummy, 4);

dummy[3] = 0x1b652;
dummy[2] = 0x32877b3a;
dummy[1] = 0x4a1fae62;
dummy[0] = 0x641cd416;
Kset_uipoly_wide((*(generator_multiples2 + 137))->m_U0, dummy, 4);

dummy[3] = 0x1cee7;
dummy[2] = 0x763de38;
dummy[1] = 0xc907bfc1;
dummy[0] = 0xf25d858e;
Kset_uipoly_wide((*(generator_multiples2 + 137))->m_V1, dummy, 4);

dummy[3] = 0x18426;
dummy[2] = 0x7529c4da;
dummy[1] = 0x9595914e;
dummy[0] = 0x3f42a012;
Kset_uipoly_wide((*(generator_multiples2 + 137))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 137))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 137))->m_z, 1);

dummy[3] = 0x32b2;
dummy[2] = 0xf845996c;
dummy[1] = 0xfa7ce678;
dummy[0] = 0x4879d77f;
Kset_uipoly_wide((*(generator_multiples1 + 138))->m_U1, dummy, 4);

dummy[3] = 0x14c9b;
dummy[2] = 0x3c523863;
dummy[1] = 0x26d27d4f;
dummy[0] = 0x5848f67c;
Kset_uipoly_wide((*(generator_multiples1 + 138))->m_U0, dummy, 4);

dummy[3] = 0x74f0;
dummy[2] = 0xa92a1a21;
dummy[1] = 0x8b8c0ff4;
dummy[0] = 0x4d5080f5;
Kset_uipoly_wide((*(generator_multiples1 + 138))->m_V1, dummy, 4);

dummy[3] = 0x216c;
dummy[2] = 0xae0db881;
dummy[1] = 0x18493eee;
dummy[0] = 0x9ca851c;
Kset_uipoly_wide((*(generator_multiples1 + 138))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 138))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 138))->m_z, 1);

dummy[3] = 0x1496f;
dummy[2] = 0x6fb634c9;
dummy[1] = 0x632221ec;
dummy[0] = 0x23268106;
Kset_uipoly_wide((*(generator_multiples2 + 138))->m_U1, dummy, 4);

dummy[3] = 0x168fe;
dummy[2] = 0xcbe25818;
dummy[1] = 0xf396190e;
dummy[0] = 0xa71725bf;
Kset_uipoly_wide((*(generator_multiples2 + 138))->m_U0, dummy, 4);

dummy[3] = 0x11dbf;
dummy[2] = 0xe572f118;
dummy[1] = 0xb39e97f2;
dummy[0] = 0x740c0d0c;
Kset_uipoly_wide((*(generator_multiples2 + 138))->m_V1, dummy, 4);

dummy[3] = 0x2a9e;
dummy[2] = 0x867e61d;
dummy[1] = 0x65c0d9a;
dummy[0] = 0xfcc21be8;
Kset_uipoly_wide((*(generator_multiples2 + 138))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 138))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 138))->m_z, 1);

dummy[3] = 0x14ee8;
dummy[2] = 0xa30e8b81;
dummy[1] = 0xa4a5af5a;
dummy[0] = 0x369bad21;
Kset_uipoly_wide((*(generator_multiples1 + 139))->m_U1, dummy, 4);

dummy[3] = 0x11430;
dummy[2] = 0xbffd1aef;
dummy[1] = 0xacc7898d;
dummy[0] = 0x36f9eb73;
Kset_uipoly_wide((*(generator_multiples1 + 139))->m_U0, dummy, 4);

dummy[3] = 0x144f;
dummy[2] = 0xae3aac4d;
dummy[1] = 0xf5a65876;
dummy[0] = 0x562a9ea2;
Kset_uipoly_wide((*(generator_multiples1 + 139))->m_V1, dummy, 4);

dummy[3] = 0xd9db;
dummy[2] = 0xf65a37e1;
dummy[1] = 0x8e07b116;
dummy[0] = 0xa3af2ca1;
Kset_uipoly_wide((*(generator_multiples1 + 139))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 139))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 139))->m_z, 1);

dummy[3] = 0x183fc;
dummy[2] = 0x8c279d1;
dummy[1] = 0x63daa450;
dummy[0] = 0x9666185f;
Kset_uipoly_wide((*(generator_multiples2 + 139))->m_U1, dummy, 4);

dummy[3] = 0x15043;
dummy[2] = 0x888bf1cc;
dummy[1] = 0x3538620e;
dummy[0] = 0x9b6514c5;
Kset_uipoly_wide((*(generator_multiples2 + 139))->m_U0, dummy, 4);

dummy[3] = 0x101aa;
dummy[2] = 0xcd035eb8;
dummy[1] = 0x909865d8;
dummy[0] = 0x8b198657;
Kset_uipoly_wide((*(generator_multiples2 + 139))->m_V1, dummy, 4);

dummy[3] = 0xc144;
dummy[2] = 0xba76f385;
dummy[1] = 0x965ec1da;
dummy[0] = 0xca092f68;
Kset_uipoly_wide((*(generator_multiples2 + 139))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 139))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 139))->m_z, 1);

dummy[3] = 0x7679;
dummy[2] = 0x849cc560;
dummy[1] = 0xa2f839ef;
dummy[0] = 0x1dca85d0;
Kset_uipoly_wide((*(generator_multiples1 + 140))->m_U1, dummy, 4);

dummy[3] = 0x11f67;
dummy[2] = 0xf9433c86;
dummy[1] = 0x51d36314;
dummy[0] = 0xabd820b7;
Kset_uipoly_wide((*(generator_multiples1 + 140))->m_U0, dummy, 4);

dummy[3] = 0x1d44;
dummy[2] = 0x6a0cb8ab;
dummy[1] = 0xe69f6593;
dummy[0] = 0x700ac64f;
Kset_uipoly_wide((*(generator_multiples1 + 140))->m_V1, dummy, 4);

dummy[3] = 0x18f;
dummy[2] = 0x8838a0e4;
dummy[1] = 0x129ceac8;
dummy[0] = 0x91888cf0;
Kset_uipoly_wide((*(generator_multiples1 + 140))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 140))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 140))->m_z, 1);

dummy[3] = 0x112bb;
dummy[2] = 0x6363562e;
dummy[1] = 0x5ac5f43e;
dummy[0] = 0x173671c6;
Kset_uipoly_wide((*(generator_multiples2 + 140))->m_U1, dummy, 4);

dummy[3] = 0x1f857;
dummy[2] = 0x5c8a5bf3;
dummy[1] = 0x4a124b80;
dummy[0] = 0x83b44bfc;
Kset_uipoly_wide((*(generator_multiples2 + 140))->m_U0, dummy, 4);

dummy[3] = 0x1aa91;
dummy[2] = 0xe872be13;
dummy[1] = 0x30e0cc1;
dummy[0] = 0xf8e55716;
Kset_uipoly_wide((*(generator_multiples2 + 140))->m_V1, dummy, 4);

dummy[3] = 0x1c470;
dummy[2] = 0xb2f89d04;
dummy[1] = 0xfc5021d7;
dummy[0] = 0xa2f24cfb;
Kset_uipoly_wide((*(generator_multiples2 + 140))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 140))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 140))->m_z, 1);

dummy[3] = 0x13acd;
dummy[2] = 0x21869290;
dummy[1] = 0x36e2bb00;
dummy[0] = 0x6ded47d9;
Kset_uipoly_wide((*(generator_multiples1 + 141))->m_U1, dummy, 4);

dummy[3] = 0x15352;
dummy[2] = 0xdcacb1d8;
dummy[1] = 0xe7eb3282;
dummy[0] = 0xfdd7ba10;
Kset_uipoly_wide((*(generator_multiples1 + 141))->m_U0, dummy, 4);

dummy[3] = 0xd10b;
dummy[2] = 0x36a8f800;
dummy[1] = 0x5c5d5daf;
dummy[0] = 0x2f0bb228;
Kset_uipoly_wide((*(generator_multiples1 + 141))->m_V1, dummy, 4);

dummy[3] = 0x7454;
dummy[2] = 0xa2c0e9db;
dummy[1] = 0x88e590d9;
dummy[0] = 0xf1f4724e;
Kset_uipoly_wide((*(generator_multiples1 + 141))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 141))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 141))->m_z, 1);

dummy[3] = 0x1555d;
dummy[2] = 0xe84dc67b;
dummy[1] = 0x48d3ef1a;
dummy[0] = 0x5756eff0;
Kset_uipoly_wide((*(generator_multiples2 + 141))->m_U1, dummy, 4);

dummy[3] = 0x1a38a;
dummy[2] = 0x1b6f1954;
dummy[1] = 0xb31c2a82;
dummy[0] = 0xb90240e7;
Kset_uipoly_wide((*(generator_multiples2 + 141))->m_U0, dummy, 4);

dummy[3] = 0x13765;
dummy[2] = 0x6101ea03;
dummy[1] = 0xf1a63796;
dummy[0] = 0x91ce59c3;
Kset_uipoly_wide((*(generator_multiples2 + 141))->m_V1, dummy, 4);

dummy[3] = 0x103d9;
dummy[2] = 0x5e970511;
dummy[1] = 0xf4da3742;
dummy[0] = 0x909407a;
Kset_uipoly_wide((*(generator_multiples2 + 141))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 141))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 141))->m_z, 1);

dummy[3] = 0x1221b;
dummy[2] = 0x2ade5746;
dummy[1] = 0x15eaed34;
dummy[0] = 0xd3f6046c;
Kset_uipoly_wide((*(generator_multiples1 + 142))->m_U1, dummy, 4);

dummy[3] = 0x8c20;
dummy[2] = 0xfc866de4;
dummy[1] = 0x4602bbc0;
dummy[0] = 0x7b74e98e;
Kset_uipoly_wide((*(generator_multiples1 + 142))->m_U0, dummy, 4);

dummy[3] = 0xa5a9;
dummy[2] = 0x3f1a7aeb;
dummy[1] = 0xff105dd2;
dummy[0] = 0x8376f491;
Kset_uipoly_wide((*(generator_multiples1 + 142))->m_V1, dummy, 4);

dummy[3] = 0x272d;
dummy[2] = 0x726770b0;
dummy[1] = 0x12745b51;
dummy[0] = 0x63dc71ee;
Kset_uipoly_wide((*(generator_multiples1 + 142))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 142))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 142))->m_z, 1);

dummy[3] = 0x15455;
dummy[2] = 0xb7207319;
dummy[1] = 0xcd7699eb;
dummy[0] = 0x9c287855;
Kset_uipoly_wide((*(generator_multiples2 + 142))->m_U1, dummy, 4);

dummy[3] = 0x1c016;
dummy[2] = 0x5421a41e;
dummy[1] = 0xb87b3501;
dummy[0] = 0x855818fc;
Kset_uipoly_wide((*(generator_multiples2 + 142))->m_U0, dummy, 4);

dummy[3] = 0x10072;
dummy[2] = 0x985e341a;
dummy[1] = 0x8f7b6985;
dummy[0] = 0xfd3f9680;
Kset_uipoly_wide((*(generator_multiples2 + 142))->m_V1, dummy, 4);

dummy[3] = 0x12268;
dummy[2] = 0x439d8996;
dummy[1] = 0x75bf1e2f;
dummy[0] = 0x8361be32;
Kset_uipoly_wide((*(generator_multiples2 + 142))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 142))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 142))->m_z, 1);

dummy[3] = 0x18e4;
dummy[2] = 0xd3d4d9bd;
dummy[1] = 0xb4157e32;
dummy[0] = 0x1f9f226f;
Kset_uipoly_wide((*(generator_multiples1 + 143))->m_U1, dummy, 4);

dummy[3] = 0xfa32;
dummy[2] = 0x3f75fc90;
dummy[1] = 0xf0709e14;
dummy[0] = 0x607a1778;
Kset_uipoly_wide((*(generator_multiples1 + 143))->m_U0, dummy, 4);

dummy[3] = 0x1c4a7;
dummy[2] = 0x480cb74d;
dummy[1] = 0xd030daf3;
dummy[0] = 0x6226c091;
Kset_uipoly_wide((*(generator_multiples1 + 143))->m_V1, dummy, 4);

dummy[3] = 0x3358;
dummy[2] = 0xbf4ebb4a;
dummy[1] = 0x5cb3b886;
dummy[0] = 0xbbef04b1;
Kset_uipoly_wide((*(generator_multiples1 + 143))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 143))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 143))->m_z, 1);

dummy[3] = 0xb1f;
dummy[2] = 0x787e9070;
dummy[1] = 0x6bcb114c;
dummy[0] = 0x429e408b;
Kset_uipoly_wide((*(generator_multiples2 + 143))->m_U1, dummy, 4);

dummy[3] = 0x1d070;
dummy[2] = 0x45b0df10;
dummy[1] = 0xcec86380;
dummy[0] = 0xca54995b;
Kset_uipoly_wide((*(generator_multiples2 + 143))->m_U0, dummy, 4);

dummy[3] = 0x193e7;
dummy[2] = 0x4c67b24a;
dummy[1] = 0xc7cc62ee;
dummy[0] = 0x7cb9dcfc;
Kset_uipoly_wide((*(generator_multiples2 + 143))->m_V1, dummy, 4);

dummy[3] = 0x146e4;
dummy[2] = 0x7ca0630c;
dummy[1] = 0x2c40d571;
dummy[0] = 0xa51c8ea7;
Kset_uipoly_wide((*(generator_multiples2 + 143))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 143))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 143))->m_z, 1);

dummy[3] = 0x62ea;
dummy[2] = 0x5d3c8965;
dummy[1] = 0x9090c337;
dummy[0] = 0x85d83179;
Kset_uipoly_wide((*(generator_multiples1 + 144))->m_U1, dummy, 4);

dummy[3] = 0xc192;
dummy[2] = 0x15a0b9e7;
dummy[1] = 0xd0373ddd;
dummy[0] = 0xe42a41f7;
Kset_uipoly_wide((*(generator_multiples1 + 144))->m_U0, dummy, 4);

dummy[3] = 0x4b14;
dummy[2] = 0xfd39e18e;
dummy[1] = 0x7e151532;
dummy[0] = 0x6691b3b9;
Kset_uipoly_wide((*(generator_multiples1 + 144))->m_V1, dummy, 4);

dummy[3] = 0xd79a;
dummy[2] = 0x500b3b8e;
dummy[1] = 0xb63d9524;
dummy[0] = 0x8dc42690;
Kset_uipoly_wide((*(generator_multiples1 + 144))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 144))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 144))->m_z, 1);

dummy[3] = 0x9380;
dummy[2] = 0xbad962f;
dummy[1] = 0xfaa816de;
dummy[0] = 0x8d188d48;
Kset_uipoly_wide((*(generator_multiples2 + 144))->m_U1, dummy, 4);

dummy[3] = 0x7c79;
dummy[2] = 0xe5fb1709;
dummy[1] = 0x8fe0968c;
dummy[0] = 0xbfaa14f0;
Kset_uipoly_wide((*(generator_multiples2 + 144))->m_U0, dummy, 4);

dummy[3] = 0x10fe5;
dummy[2] = 0x389dc32b;
dummy[1] = 0xcdee8a5b;
dummy[0] = 0x8e12f2d1;
Kset_uipoly_wide((*(generator_multiples2 + 144))->m_V1, dummy, 4);

dummy[3] = 0x1acdd;
dummy[2] = 0xd3b24a41;
dummy[1] = 0x7581d484;
dummy[0] = 0x4c35f362;
Kset_uipoly_wide((*(generator_multiples2 + 144))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 144))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 144))->m_z, 1);

dummy[3] = 0x32e1;
dummy[2] = 0x317e57f7;
dummy[1] = 0xc1349825;
dummy[0] = 0xfa1713e4;
Kset_uipoly_wide((*(generator_multiples1 + 145))->m_U1, dummy, 4);

dummy[3] = 0x1e784;
dummy[2] = 0x45ff786a;
dummy[1] = 0x3f705903;
dummy[0] = 0x2eb631ca;
Kset_uipoly_wide((*(generator_multiples1 + 145))->m_U0, dummy, 4);

dummy[3] = 0x744e;
dummy[2] = 0x7d9427d2;
dummy[1] = 0xe7c7b3f5;
dummy[0] = 0x4ee98ee;
Kset_uipoly_wide((*(generator_multiples1 + 145))->m_V1, dummy, 4);

dummy[3] = 0x10e57;
dummy[2] = 0x735fcbc8;
dummy[1] = 0xda994fbe;
dummy[0] = 0x7349e793;
Kset_uipoly_wide((*(generator_multiples1 + 145))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 145))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 145))->m_z, 1);

dummy[3] = 0xddc5;
dummy[2] = 0xe49aec74;
dummy[1] = 0x12576462;
dummy[0] = 0x993e7872;
Kset_uipoly_wide((*(generator_multiples2 + 145))->m_U1, dummy, 4);

dummy[3] = 0xc992;
dummy[2] = 0xbae6249;
dummy[1] = 0x474083d7;
dummy[0] = 0xf172fbfe;
Kset_uipoly_wide((*(generator_multiples2 + 145))->m_U0, dummy, 4);

dummy[3] = 0x7ab7;
dummy[2] = 0xbbc03c9b;
dummy[1] = 0x977e8069;
dummy[0] = 0xd5982a0e;
Kset_uipoly_wide((*(generator_multiples2 + 145))->m_V1, dummy, 4);

dummy[3] = 0xb2f3;
dummy[2] = 0xd49217d2;
dummy[1] = 0x6303044b;
dummy[0] = 0xb5838d3f;
Kset_uipoly_wide((*(generator_multiples2 + 145))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 145))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 145))->m_z, 1);

dummy[3] = 0x1018;
dummy[2] = 0xce9b5570;
dummy[1] = 0xa642438f;
dummy[0] = 0x89222250;
Kset_uipoly_wide((*(generator_multiples1 + 146))->m_U1, dummy, 4);

dummy[3] = 0x1fc1a;
dummy[2] = 0x8b72ed48;
dummy[1] = 0x254f66eb;
dummy[0] = 0xfcc2bba5;
Kset_uipoly_wide((*(generator_multiples1 + 146))->m_U0, dummy, 4);

dummy[3] = 0x1e678;
dummy[2] = 0x69365df6;
dummy[1] = 0x71b7f379;
dummy[0] = 0xd76c44a;
Kset_uipoly_wide((*(generator_multiples1 + 146))->m_V1, dummy, 4);

dummy[3] = 0x8cf6;
dummy[2] = 0x14c9f3c3;
dummy[1] = 0xb9a54505;
dummy[0] = 0x9a70691f;
Kset_uipoly_wide((*(generator_multiples1 + 146))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 146))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 146))->m_z, 1);

dummy[3] = 0xccfc;
dummy[2] = 0xa2a0ce6e;
dummy[1] = 0xc3f501c8;
dummy[0] = 0xf8d7d434;
Kset_uipoly_wide((*(generator_multiples2 + 146))->m_U1, dummy, 4);

dummy[3] = 0x2ef4;
dummy[2] = 0x282ff50;
dummy[1] = 0xea214bc8;
dummy[0] = 0x44f1fd45;
Kset_uipoly_wide((*(generator_multiples2 + 146))->m_U0, dummy, 4);

dummy[3] = 0x129c;
dummy[2] = 0x3d75573d;
dummy[1] = 0x438fa964;
dummy[0] = 0xdd491a29;
Kset_uipoly_wide((*(generator_multiples2 + 146))->m_V1, dummy, 4);

dummy[3] = 0x145e3;
dummy[2] = 0x355aa4bd;
dummy[1] = 0x54b70b6d;
dummy[0] = 0x98040a6;
Kset_uipoly_wide((*(generator_multiples2 + 146))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 146))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 146))->m_z, 1);

dummy[3] = 0x7405;
dummy[2] = 0x6bb44234;
dummy[1] = 0x5e4f4e3f;
dummy[0] = 0x46957008;
Kset_uipoly_wide((*(generator_multiples1 + 147))->m_U1, dummy, 4);

dummy[3] = 0x17a1e;
dummy[2] = 0x51c3cc92;
dummy[1] = 0xbfc3c4b5;
dummy[0] = 0x1dc796ab;
Kset_uipoly_wide((*(generator_multiples1 + 147))->m_U0, dummy, 4);

dummy[3] = 0x13e82;
dummy[2] = 0xb93c5eef;
dummy[1] = 0x2f5641b4;
dummy[0] = 0xea621af4;
Kset_uipoly_wide((*(generator_multiples1 + 147))->m_V1, dummy, 4);

dummy[3] = 0xa403;
dummy[2] = 0x68a745d8;
dummy[1] = 0xf55f9d7c;
dummy[0] = 0xbf8e136e;
Kset_uipoly_wide((*(generator_multiples1 + 147))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 147))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 147))->m_z, 1);

dummy[3] = 0x1b1f1;
dummy[2] = 0x827a8388;
dummy[1] = 0x939019a3;
dummy[0] = 0x32f8742a;
Kset_uipoly_wide((*(generator_multiples2 + 147))->m_U1, dummy, 4);

dummy[3] = 0x9da3;
dummy[2] = 0x556f4418;
dummy[1] = 0xf84aa659;
dummy[0] = 0xccf68db7;
Kset_uipoly_wide((*(generator_multiples2 + 147))->m_U0, dummy, 4);

dummy[3] = 0x1fb53;
dummy[2] = 0xd816c944;
dummy[1] = 0x21a71740;
dummy[0] = 0x9fa8d8ec;
Kset_uipoly_wide((*(generator_multiples2 + 147))->m_V1, dummy, 4);

dummy[3] = 0x4fa4;
dummy[2] = 0x5614c07b;
dummy[1] = 0xbbc2193;
dummy[0] = 0xf3476a4b;
Kset_uipoly_wide((*(generator_multiples2 + 147))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 147))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 147))->m_z, 1);

dummy[3] = 0x15666;
dummy[2] = 0xc292cc42;
dummy[1] = 0x2f72cad2;
dummy[0] = 0x133f3872;
Kset_uipoly_wide((*(generator_multiples1 + 148))->m_U1, dummy, 4);

dummy[3] = 0xc8e5;
dummy[2] = 0xd47b10da;
dummy[1] = 0x6e60755e;
dummy[0] = 0xbca221a2;
Kset_uipoly_wide((*(generator_multiples1 + 148))->m_U0, dummy, 4);

dummy[3] = 0x180e3;
dummy[2] = 0xcec86c49;
dummy[1] = 0x279d599e;
dummy[0] = 0x9b97ec3f;
Kset_uipoly_wide((*(generator_multiples1 + 148))->m_V1, dummy, 4);

dummy[3] = 0x190de;
dummy[2] = 0x7fa96cd;
dummy[1] = 0xc7802b7e;
dummy[0] = 0x996277f3;
Kset_uipoly_wide((*(generator_multiples1 + 148))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 148))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 148))->m_z, 1);

dummy[3] = 0xb63f;
dummy[2] = 0xb84b816c;
dummy[1] = 0xe3aafbaa;
dummy[0] = 0xa03de581;
Kset_uipoly_wide((*(generator_multiples2 + 148))->m_U1, dummy, 4);

dummy[3] = 0x129fb;
dummy[2] = 0xd6b2a220;
dummy[1] = 0x896f26e3;
dummy[0] = 0x2400ca70;
Kset_uipoly_wide((*(generator_multiples2 + 148))->m_U0, dummy, 4);

dummy[3] = 0x13b26;
dummy[2] = 0x43b6b615;
dummy[1] = 0xad5b978c;
dummy[0] = 0x2f01ff34;
Kset_uipoly_wide((*(generator_multiples2 + 148))->m_V1, dummy, 4);

dummy[3] = 0x187ce;
dummy[2] = 0xc6c4ed1f;
dummy[1] = 0xbddfb4b1;
dummy[0] = 0xefdaa920;
Kset_uipoly_wide((*(generator_multiples2 + 148))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 148))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 148))->m_z, 1);

dummy[3] = 0x10b2c;
dummy[2] = 0xf24da082;
dummy[1] = 0x2e6c259f;
dummy[0] = 0x910170e8;
Kset_uipoly_wide((*(generator_multiples1 + 149))->m_U1, dummy, 4);

dummy[3] = 0x1ff66;
dummy[2] = 0x3d52ce03;
dummy[1] = 0x2a3f9913;
dummy[0] = 0xe6eb6e0e;
Kset_uipoly_wide((*(generator_multiples1 + 149))->m_U0, dummy, 4);

dummy[3] = 0x747a;
dummy[2] = 0x1745f49;
dummy[1] = 0x76c5554f;
dummy[0] = 0xf08120d1;
Kset_uipoly_wide((*(generator_multiples1 + 149))->m_V1, dummy, 4);

dummy[3] = 0x5823;
dummy[2] = 0xb23206fa;
dummy[1] = 0x4a775850;
dummy[0] = 0xf4bd7e29;
Kset_uipoly_wide((*(generator_multiples1 + 149))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 149))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 149))->m_z, 1);

dummy[3] = 0x1f1fe;
dummy[2] = 0x50fca3b6;
dummy[1] = 0xc5548dd6;
dummy[0] = 0xfa5af702;
Kset_uipoly_wide((*(generator_multiples2 + 149))->m_U1, dummy, 4);

dummy[3] = 0x171ae;
dummy[2] = 0xb2cb734;
dummy[1] = 0xf0dbef92;
dummy[0] = 0x49daf044;
Kset_uipoly_wide((*(generator_multiples2 + 149))->m_U0, dummy, 4);

dummy[3] = 0x168ed;
dummy[2] = 0x98012dba;
dummy[1] = 0xa11f702;
dummy[0] = 0x8bf4c07c;
Kset_uipoly_wide((*(generator_multiples2 + 149))->m_V1, dummy, 4);

dummy[3] = 0x81c9;
dummy[2] = 0xb06be0f8;
dummy[1] = 0xefd39be7;
dummy[0] = 0x6c7f4038;
Kset_uipoly_wide((*(generator_multiples2 + 149))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 149))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 149))->m_z, 1);

dummy[3] = 0x3ec9;
dummy[2] = 0x33c45716;
dummy[1] = 0x1f913ef0;
dummy[0] = 0x32a3771;
Kset_uipoly_wide((*(generator_multiples1 + 150))->m_U1, dummy, 4);

dummy[3] = 0xe4e9;
dummy[2] = 0xc647f71b;
dummy[1] = 0x94a5c1cf;
dummy[0] = 0x5e6efc9a;
Kset_uipoly_wide((*(generator_multiples1 + 150))->m_U0, dummy, 4);

dummy[3] = 0x1f43f;
dummy[2] = 0x83c3a568;
dummy[1] = 0x32d9584b;
dummy[0] = 0xe1cda28f;
Kset_uipoly_wide((*(generator_multiples1 + 150))->m_V1, dummy, 4);

dummy[3] = 0x1f36b;
dummy[2] = 0x1c602fc8;
dummy[1] = 0x988027e2;
dummy[0] = 0x14b374c0;
Kset_uipoly_wide((*(generator_multiples1 + 150))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 150))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 150))->m_z, 1);

dummy[3] = 0x14ed7;
dummy[2] = 0xae70c3e6;
dummy[1] = 0xc0299b6a;
dummy[0] = 0xcabd4de2;
Kset_uipoly_wide((*(generator_multiples2 + 150))->m_U1, dummy, 4);

dummy[3] = 0x1e377;
dummy[2] = 0x5293e01e;
dummy[1] = 0x46c3c513;
dummy[0] = 0x581198de;
Kset_uipoly_wide((*(generator_multiples2 + 150))->m_U0, dummy, 4);

dummy[3] = 0x1fb7f;
dummy[2] = 0xa9946635;
dummy[1] = 0xee22f9d4;
dummy[0] = 0xabea775a;
Kset_uipoly_wide((*(generator_multiples2 + 150))->m_V1, dummy, 4);

dummy[3] = 0x1a11e;
dummy[2] = 0x324ed9a8;
dummy[1] = 0x6af7124b;
dummy[0] = 0x1af31401;
Kset_uipoly_wide((*(generator_multiples2 + 150))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 150))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 150))->m_z, 1);

dummy[3] = 0x1631;
dummy[2] = 0x4b5b88b9;
dummy[1] = 0xbd1c13bf;
dummy[0] = 0x1b067b60;
Kset_uipoly_wide((*(generator_multiples1 + 151))->m_U1, dummy, 4);

dummy[3] = 0x1169e;
dummy[2] = 0xb9f9cdd3;
dummy[1] = 0xd720e9c;
dummy[0] = 0x2d23b1ae;
Kset_uipoly_wide((*(generator_multiples1 + 151))->m_U0, dummy, 4);

dummy[3] = 0x191ba;
dummy[2] = 0x552ee886;
dummy[1] = 0x14dd70bb;
dummy[0] = 0xc6424264;
Kset_uipoly_wide((*(generator_multiples1 + 151))->m_V1, dummy, 4);

dummy[3] = 0x1981d;
dummy[2] = 0x4d73715c;
dummy[1] = 0x97e15be1;
dummy[0] = 0xfdc4e314;
Kset_uipoly_wide((*(generator_multiples1 + 151))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 151))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 151))->m_z, 1);

dummy[3] = 0x91d2;
dummy[2] = 0x9a2c99ae;
dummy[1] = 0x53720ba8;
dummy[0] = 0x8e9546d3;
Kset_uipoly_wide((*(generator_multiples2 + 151))->m_U1, dummy, 4);

dummy[3] = 0x182;
dummy[2] = 0x4d710bfa;
dummy[1] = 0x14bd6067;
dummy[0] = 0x140edac8;
Kset_uipoly_wide((*(generator_multiples2 + 151))->m_U0, dummy, 4);

dummy[3] = 0xcb44;
dummy[2] = 0xe9971e45;
dummy[1] = 0x24b285b9;
dummy[0] = 0xbb5748d7;
Kset_uipoly_wide((*(generator_multiples2 + 151))->m_V1, dummy, 4);

dummy[3] = 0x1e5c3;
dummy[2] = 0x6a8ebc9f;
dummy[1] = 0xac0068c8;
dummy[0] = 0xe9fdd537;
Kset_uipoly_wide((*(generator_multiples2 + 151))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 151))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 151))->m_z, 1);

dummy[3] = 0x3eef;
dummy[2] = 0x4e8bf6f7;
dummy[1] = 0x6acc11d6;
dummy[0] = 0x3753963b;
Kset_uipoly_wide((*(generator_multiples1 + 152))->m_U1, dummy, 4);

dummy[3] = 0x9d57;
dummy[2] = 0x35111639;
dummy[1] = 0x650818e3;
dummy[0] = 0x807ed37d;
Kset_uipoly_wide((*(generator_multiples1 + 152))->m_U0, dummy, 4);

dummy[3] = 0x1d9b8;
dummy[2] = 0x1b86a8e3;
dummy[1] = 0x1573e195;
dummy[0] = 0x185f1a74;
Kset_uipoly_wide((*(generator_multiples1 + 152))->m_V1, dummy, 4);

dummy[3] = 0x150f2;
dummy[2] = 0xfafe0151;
dummy[1] = 0xf45aac66;
dummy[0] = 0x13e62f9f;
Kset_uipoly_wide((*(generator_multiples1 + 152))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 152))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 152))->m_z, 1);

dummy[3] = 0x18069;
dummy[2] = 0x1006e753;
dummy[1] = 0x370db6ba;
dummy[0] = 0x51c73c72;
Kset_uipoly_wide((*(generator_multiples2 + 152))->m_U1, dummy, 4);

dummy[3] = 0xa5d8;
dummy[2] = 0xf39be769;
dummy[1] = 0x837b2aa7;
dummy[0] = 0x3beb9b1a;
Kset_uipoly_wide((*(generator_multiples2 + 152))->m_U0, dummy, 4);

dummy[3] = 0x11875;
dummy[2] = 0x3c3ca3c3;
dummy[1] = 0x5a6e7968;
dummy[0] = 0xc911f623;
Kset_uipoly_wide((*(generator_multiples2 + 152))->m_V1, dummy, 4);

dummy[3] = 0x7d3;
dummy[2] = 0xc1746e5e;
dummy[1] = 0x70f45d60;
dummy[0] = 0xbcacfb3d;
Kset_uipoly_wide((*(generator_multiples2 + 152))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 152))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 152))->m_z, 1);

dummy[3] = 0xcc27;
dummy[2] = 0x36c29aeb;
dummy[1] = 0x2cc2c8d;
dummy[0] = 0xa86efd70;
Kset_uipoly_wide((*(generator_multiples1 + 153))->m_U1, dummy, 4);

dummy[3] = 0x1de63;
dummy[2] = 0xdd07ad21;
dummy[1] = 0xdfb0a68a;
dummy[0] = 0x772c963c;
Kset_uipoly_wide((*(generator_multiples1 + 153))->m_U0, dummy, 4);

dummy[3] = 0xc7a6;
dummy[2] = 0x5104d20c;
dummy[1] = 0x49f526fb;
dummy[0] = 0xda30b08c;
Kset_uipoly_wide((*(generator_multiples1 + 153))->m_V1, dummy, 4);

dummy[3] = 0x18226;
dummy[2] = 0x13d300b5;
dummy[1] = 0x81c448d;
dummy[0] = 0x24bac009;
Kset_uipoly_wide((*(generator_multiples1 + 153))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 153))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 153))->m_z, 1);

dummy[3] = 0x9bb;
dummy[2] = 0x759aa349;
dummy[1] = 0x591a39;
dummy[0] = 0x8a388ba5;
Kset_uipoly_wide((*(generator_multiples2 + 153))->m_U1, dummy, 4);

dummy[3] = 0xc710;
dummy[2] = 0xde63c3a1;
dummy[1] = 0xb09181ae;
dummy[0] = 0xfce3009;
Kset_uipoly_wide((*(generator_multiples2 + 153))->m_U0, dummy, 4);

dummy[3] = 0x1757e;
dummy[2] = 0x8c065fd0;
dummy[1] = 0xda719490;
dummy[0] = 0x9bfbecf2;
Kset_uipoly_wide((*(generator_multiples2 + 153))->m_V1, dummy, 4);

dummy[3] = 0x13d9e;
dummy[2] = 0x7ea948b3;
dummy[1] = 0x43beb135;
dummy[0] = 0x2c2ff322;
Kset_uipoly_wide((*(generator_multiples2 + 153))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 153))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 153))->m_z, 1);

dummy[3] = 0x16658;
dummy[2] = 0x87e1dc9e;
dummy[1] = 0x1be5852;
dummy[0] = 0xe7b9d07d;
Kset_uipoly_wide((*(generator_multiples1 + 154))->m_U1, dummy, 4);

dummy[3] = 0x12c93;
dummy[2] = 0xe231445b;
dummy[1] = 0x1f1f7d88;
dummy[0] = 0xa3cbd04d;
Kset_uipoly_wide((*(generator_multiples1 + 154))->m_U0, dummy, 4);

dummy[3] = 0x728f;
dummy[2] = 0x4674f3ec;
dummy[1] = 0xada1b6d5;
dummy[0] = 0x75d58403;
Kset_uipoly_wide((*(generator_multiples1 + 154))->m_V1, dummy, 4);

dummy[3] = 0x102ec;
dummy[2] = 0xd1b9dbf8;
dummy[1] = 0xe1ca9266;
dummy[0] = 0xad98b7fa;
Kset_uipoly_wide((*(generator_multiples1 + 154))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 154))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 154))->m_z, 1);

dummy[3] = 0x1c1b2;
dummy[2] = 0x68e98993;
dummy[1] = 0x72e0fa6e;
dummy[0] = 0x32d1df4e;
Kset_uipoly_wide((*(generator_multiples2 + 154))->m_U1, dummy, 4);

dummy[3] = 0x11ce7;
dummy[2] = 0xbdecae10;
dummy[1] = 0x8c63f964;
dummy[0] = 0x9520723d;
Kset_uipoly_wide((*(generator_multiples2 + 154))->m_U0, dummy, 4);

dummy[3] = 0x1449c;
dummy[2] = 0xcb8b3d64;
dummy[1] = 0x55fe1dd1;
dummy[0] = 0x297834f5;
Kset_uipoly_wide((*(generator_multiples2 + 154))->m_V1, dummy, 4);

dummy[3] = 0x43e2;
dummy[2] = 0x1ca9c079;
dummy[1] = 0x350f34b4;
dummy[0] = 0x58e2833;
Kset_uipoly_wide((*(generator_multiples2 + 154))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 154))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 154))->m_z, 1);

dummy[3] = 0xb682;
dummy[2] = 0x70865526;
dummy[1] = 0xb8955b7a;
dummy[0] = 0x89af6800;
Kset_uipoly_wide((*(generator_multiples1 + 155))->m_U1, dummy, 4);

dummy[3] = 0x178fb;
dummy[2] = 0x4790e6d;
dummy[1] = 0xcd0bcc2f;
dummy[0] = 0x46064044;
Kset_uipoly_wide((*(generator_multiples1 + 155))->m_U0, dummy, 4);

dummy[3] = 0x18b43;
dummy[2] = 0x9ff2b4e1;
dummy[1] = 0x2b8364cb;
dummy[0] = 0xace48cf2;
Kset_uipoly_wide((*(generator_multiples1 + 155))->m_V1, dummy, 4);

dummy[3] = 0x1627a;
dummy[2] = 0xf7b7db7c;
dummy[1] = 0x85068ea9;
dummy[0] = 0xd7404339;
Kset_uipoly_wide((*(generator_multiples1 + 155))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 155))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 155))->m_z, 1);

dummy[3] = 0x4e45;
dummy[2] = 0x1f9cebe1;
dummy[1] = 0xacd1e7b1;
dummy[0] = 0x9cf21dd2;
Kset_uipoly_wide((*(generator_multiples2 + 155))->m_U1, dummy, 4);

dummy[3] = 0x10d8a;
dummy[2] = 0x9680f277;
dummy[1] = 0xc6e8b8c1;
dummy[0] = 0x8a6a7fd6;
Kset_uipoly_wide((*(generator_multiples2 + 155))->m_U0, dummy, 4);

dummy[3] = 0xa6b9;
dummy[2] = 0x2c9fd6b0;
dummy[1] = 0x7f0322a6;
dummy[0] = 0xa7281a5e;
Kset_uipoly_wide((*(generator_multiples2 + 155))->m_V1, dummy, 4);

dummy[3] = 0xa921;
dummy[2] = 0xa99eb509;
dummy[1] = 0x3b8b51e3;
dummy[0] = 0x137b3b35;
Kset_uipoly_wide((*(generator_multiples2 + 155))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 155))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 155))->m_z, 1);

dummy[3] = 0x1a777;
dummy[2] = 0xc60348d;
dummy[1] = 0x1dac8184;
dummy[0] = 0xa3b72b1d;
Kset_uipoly_wide((*(generator_multiples1 + 156))->m_U1, dummy, 4);

dummy[3] = 0x1dfe8;
dummy[2] = 0x23ebff8d;
dummy[1] = 0xb2234c1a;
dummy[0] = 0x5898c1fd;
Kset_uipoly_wide((*(generator_multiples1 + 156))->m_U0, dummy, 4);

dummy[3] = 0xfdd6;
dummy[2] = 0xe1b1a46b;
dummy[1] = 0xa11db59e;
dummy[0] = 0x587104f2;
Kset_uipoly_wide((*(generator_multiples1 + 156))->m_V1, dummy, 4);

dummy[3] = 0x4848;
dummy[2] = 0xa65171fd;
dummy[1] = 0xb79c4757;
dummy[0] = 0x14e0862b;
Kset_uipoly_wide((*(generator_multiples1 + 156))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 156))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 156))->m_z, 1);

dummy[3] = 0x142a4;
dummy[2] = 0x5bc4052d;
dummy[1] = 0x63c42a2a;
dummy[0] = 0xad1a32be;
Kset_uipoly_wide((*(generator_multiples2 + 156))->m_U1, dummy, 4);

dummy[3] = 0x127c9;
dummy[2] = 0xc87c1a48;
dummy[1] = 0x85b0cd77;
dummy[0] = 0xfeee291a;
Kset_uipoly_wide((*(generator_multiples2 + 156))->m_U0, dummy, 4);

dummy[3] = 0x1346a;
dummy[2] = 0xea535240;
dummy[1] = 0x94e504a2;
dummy[0] = 0x75fa1fc;
Kset_uipoly_wide((*(generator_multiples2 + 156))->m_V1, dummy, 4);

dummy[3] = 0xb1d5;
dummy[2] = 0x5b68aecb;
dummy[1] = 0x7a143a92;
dummy[0] = 0x3827afa5;
Kset_uipoly_wide((*(generator_multiples2 + 156))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 156))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 156))->m_z, 1);

dummy[3] = 0x1005e;
dummy[2] = 0xa9e8f498;
dummy[1] = 0xf2a0327c;
dummy[0] = 0x4d55e6e;
Kset_uipoly_wide((*(generator_multiples1 + 157))->m_U1, dummy, 4);

dummy[3] = 0x10640;
dummy[2] = 0xfe928772;
dummy[1] = 0x2468dd18;
dummy[0] = 0xc15b34b1;
Kset_uipoly_wide((*(generator_multiples1 + 157))->m_U0, dummy, 4);

dummy[3] = 0xa469;
dummy[2] = 0xd9f1099c;
dummy[1] = 0xe49f2ba4;
dummy[0] = 0xeb2bd26a;
Kset_uipoly_wide((*(generator_multiples1 + 157))->m_V1, dummy, 4);

dummy[3] = 0xc935;
dummy[2] = 0x369ee489;
dummy[1] = 0x347fef74;
dummy[0] = 0x345b978c;
Kset_uipoly_wide((*(generator_multiples1 + 157))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 157))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 157))->m_z, 1);

dummy[3] = 0x1bee4;
dummy[2] = 0xcec4b4d9;
dummy[1] = 0xb8e55b4f;
dummy[0] = 0x2cde4434;
Kset_uipoly_wide((*(generator_multiples2 + 157))->m_U1, dummy, 4);

dummy[3] = 0x15d2e;
dummy[2] = 0x8631bbc3;
dummy[1] = 0x325c1c96;
dummy[0] = 0x3a51f142;
Kset_uipoly_wide((*(generator_multiples2 + 157))->m_U0, dummy, 4);

dummy[3] = 0xee3e;
dummy[2] = 0x78e24e7;
dummy[1] = 0xd4af15ef;
dummy[0] = 0x416c9a56;
Kset_uipoly_wide((*(generator_multiples2 + 157))->m_V1, dummy, 4);

dummy[3] = 0xebe5;
dummy[2] = 0xb3bc292d;
dummy[1] = 0xf0b8be24;
dummy[0] = 0x4c8c0a99;
Kset_uipoly_wide((*(generator_multiples2 + 157))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 157))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 157))->m_z, 1);

dummy[3] = 0x1fe76;
dummy[2] = 0x4b3b5925;
dummy[1] = 0x75c7a64a;
dummy[0] = 0xe688a236;
Kset_uipoly_wide((*(generator_multiples1 + 158))->m_U1, dummy, 4);

dummy[3] = 0x4844;
dummy[2] = 0x9fd9fedc;
dummy[1] = 0x34b2171b;
dummy[0] = 0xa593db6b;
Kset_uipoly_wide((*(generator_multiples1 + 158))->m_U0, dummy, 4);

dummy[3] = 0x1c984;
dummy[2] = 0xa5b9eab5;
dummy[1] = 0x3ce2e31d;
dummy[0] = 0x157a4f47;
Kset_uipoly_wide((*(generator_multiples1 + 158))->m_V1, dummy, 4);

dummy[3] = 0x12e8d;
dummy[2] = 0x24568846;
dummy[1] = 0x397f7dc0;
dummy[0] = 0xb9540ab4;
Kset_uipoly_wide((*(generator_multiples1 + 158))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 158))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 158))->m_z, 1);

dummy[3] = 0x5ab2;
dummy[2] = 0xa518ac9;
dummy[1] = 0x1a00f21c;
dummy[0] = 0x776415c6;
Kset_uipoly_wide((*(generator_multiples2 + 158))->m_U1, dummy, 4);

dummy[3] = 0x1c869;
dummy[2] = 0x9425c8e;
dummy[1] = 0x2fca7803;
dummy[0] = 0xf8ec478d;
Kset_uipoly_wide((*(generator_multiples2 + 158))->m_U0, dummy, 4);

dummy[3] = 0x1a3de;
dummy[2] = 0x3e5d322e;
dummy[1] = 0x119ea7e1;
dummy[0] = 0x62da908c;
Kset_uipoly_wide((*(generator_multiples2 + 158))->m_V1, dummy, 4);

dummy[3] = 0x11a38;
dummy[2] = 0x4c7a6bf2;
dummy[1] = 0xb45b773e;
dummy[0] = 0x3515367a;
Kset_uipoly_wide((*(generator_multiples2 + 158))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 158))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 158))->m_z, 1);

dummy[3] = 0x1e15d;
dummy[2] = 0x5355843f;
dummy[1] = 0x269f8edf;
dummy[0] = 0xf63a96e8;
Kset_uipoly_wide((*(generator_multiples1 + 159))->m_U1, dummy, 4);

dummy[3] = 0x18ff9;
dummy[2] = 0x90bcf005;
dummy[1] = 0xcb01fc0e;
dummy[0] = 0x23706544;
Kset_uipoly_wide((*(generator_multiples1 + 159))->m_U0, dummy, 4);

dummy[3] = 0x1495c;
dummy[2] = 0xc02a7c30;
dummy[1] = 0xff2e2e98;
dummy[0] = 0x345917d3;
Kset_uipoly_wide((*(generator_multiples1 + 159))->m_V1, dummy, 4);

dummy[3] = 0x107d9;
dummy[2] = 0x729d53f2;
dummy[1] = 0x13236409;
dummy[0] = 0xd83f95a6;
Kset_uipoly_wide((*(generator_multiples1 + 159))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 159))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 159))->m_z, 1);

dummy[3] = 0x6a1d;
dummy[2] = 0x31b1034f;
dummy[1] = 0x8814d954;
dummy[0] = 0xb573ad34;
Kset_uipoly_wide((*(generator_multiples2 + 159))->m_U1, dummy, 4);

dummy[3] = 0x1f32;
dummy[2] = 0x8ff16db9;
dummy[1] = 0xaf020964;
dummy[0] = 0xa455c7d4;
Kset_uipoly_wide((*(generator_multiples2 + 159))->m_U0, dummy, 4);

dummy[3] = 0x11139;
dummy[2] = 0x199d0b83;
dummy[1] = 0x29b46e50;
dummy[0] = 0x6532a9f7;
Kset_uipoly_wide((*(generator_multiples2 + 159))->m_V1, dummy, 4);

dummy[3] = 0xe69d;
dummy[2] = 0xcbbdb1d3;
dummy[1] = 0x5d6a2981;
dummy[0] = 0x916eefa0;
Kset_uipoly_wide((*(generator_multiples2 + 159))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 159))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 159))->m_z, 1);

dummy[3] = 0x16907;
dummy[2] = 0xea3ffe2c;
dummy[1] = 0xfd8c5df6;
dummy[0] = 0xa1844f3d;
Kset_uipoly_wide((*(generator_multiples1 + 160))->m_U1, dummy, 4);

dummy[3] = 0xa660;
dummy[2] = 0xf9d6d3c9;
dummy[1] = 0x2aa0b279;
dummy[0] = 0x71b6174b;
Kset_uipoly_wide((*(generator_multiples1 + 160))->m_U0, dummy, 4);

dummy[3] = 0xf8e5;
dummy[2] = 0xee6076f5;
dummy[1] = 0x2bde4039;
dummy[0] = 0x4ea4c960;
Kset_uipoly_wide((*(generator_multiples1 + 160))->m_V1, dummy, 4);

dummy[3] = 0x4d1e;
dummy[2] = 0x2fc9ae32;
dummy[1] = 0x861a8ce4;
dummy[0] = 0x8b95dd73;
Kset_uipoly_wide((*(generator_multiples1 + 160))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 160))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 160))->m_z, 1);

dummy[3] = 0x66d3;
dummy[2] = 0xf6bb508;
dummy[1] = 0x8390d072;
dummy[0] = 0x792d9bae;
Kset_uipoly_wide((*(generator_multiples2 + 160))->m_U1, dummy, 4);

dummy[3] = 0xfedf;
dummy[2] = 0x76d0bbe6;
dummy[1] = 0xe3f06e7;
dummy[0] = 0x6f20a2b6;
Kset_uipoly_wide((*(generator_multiples2 + 160))->m_U0, dummy, 4);

dummy[3] = 0x1da1f;
dummy[2] = 0x72bc9656;
dummy[1] = 0x845144d9;
dummy[0] = 0x285ea432;
Kset_uipoly_wide((*(generator_multiples2 + 160))->m_V1, dummy, 4);

dummy[3] = 0x10c24;
dummy[2] = 0x9bb92dbb;
dummy[1] = 0xa87771cc;
dummy[0] = 0x70093591;
Kset_uipoly_wide((*(generator_multiples2 + 160))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 160))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 160))->m_z, 1);

dummy[3] = 0xc3e8;
dummy[2] = 0xa3d26667;
dummy[1] = 0xf7288a75;
dummy[0] = 0xf358a47f;
Kset_uipoly_wide((*(generator_multiples1 + 161))->m_U1, dummy, 4);

dummy[3] = 0x12783;
dummy[2] = 0x224665aa;
dummy[1] = 0x3334bb0d;
dummy[0] = 0x307351fa;
Kset_uipoly_wide((*(generator_multiples1 + 161))->m_U0, dummy, 4);

dummy[3] = 0xe85;
dummy[2] = 0xb98fb14c;
dummy[1] = 0xbab72b89;
dummy[0] = 0x236d5b4d;
Kset_uipoly_wide((*(generator_multiples1 + 161))->m_V1, dummy, 4);

dummy[3] = 0x4ae8;
dummy[2] = 0xbaec19d9;
dummy[1] = 0x4b2cb63b;
dummy[0] = 0x750e20ba;
Kset_uipoly_wide((*(generator_multiples1 + 161))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 161))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 161))->m_z, 1);

dummy[3] = 0x5641;
dummy[2] = 0x9c08f548;
dummy[1] = 0x59125da0;
dummy[0] = 0x4fd362cc;
Kset_uipoly_wide((*(generator_multiples2 + 161))->m_U1, dummy, 4);

dummy[3] = 0x87c2;
dummy[2] = 0x9e7caa6a;
dummy[1] = 0xe982c7fc;
dummy[0] = 0xcc4843e8;
Kset_uipoly_wide((*(generator_multiples2 + 161))->m_U0, dummy, 4);

dummy[3] = 0x66ab;
dummy[2] = 0x4d1071de;
dummy[1] = 0x64ac99ef;
dummy[0] = 0xa78bf2db;
Kset_uipoly_wide((*(generator_multiples2 + 161))->m_V1, dummy, 4);

dummy[3] = 0x1c625;
dummy[2] = 0xdfef22f8;
dummy[1] = 0x2b7a7814;
dummy[0] = 0x629f4166;
Kset_uipoly_wide((*(generator_multiples2 + 161))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 161))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 161))->m_z, 1);

dummy[3] = 0x10e3a;
dummy[2] = 0x5f4bac87;
dummy[1] = 0x8533b435;
dummy[0] = 0xe3b3d797;
Kset_uipoly_wide((*(generator_multiples1 + 162))->m_U1, dummy, 4);

dummy[3] = 0x4549;
dummy[2] = 0x3ac5687a;
dummy[1] = 0xbabde650;
dummy[0] = 0xcedbbc6;
Kset_uipoly_wide((*(generator_multiples1 + 162))->m_U0, dummy, 4);

dummy[3] = 0xd14f;
dummy[2] = 0x8ebb0419;
dummy[1] = 0x6800fee0;
dummy[0] = 0x7dca0d4e;
Kset_uipoly_wide((*(generator_multiples1 + 162))->m_V1, dummy, 4);

dummy[3] = 0x7401;
dummy[2] = 0xacbe5fec;
dummy[1] = 0xca005d9e;
dummy[0] = 0x22d20a35;
Kset_uipoly_wide((*(generator_multiples1 + 162))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 162))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 162))->m_z, 1);

dummy[3] = 0xd017;
dummy[2] = 0xb9e11421;
dummy[1] = 0xc90e52bc;
dummy[0] = 0x8a36153;
Kset_uipoly_wide((*(generator_multiples2 + 162))->m_U1, dummy, 4);

dummy[3] = 0x1ee28;
dummy[2] = 0xeb8bf18b;
dummy[1] = 0x9c453f4a;
dummy[0] = 0xb9598f36;
Kset_uipoly_wide((*(generator_multiples2 + 162))->m_U0, dummy, 4);

dummy[3] = 0x74b2;
dummy[2] = 0x36958f01;
dummy[1] = 0xa99a7928;
dummy[0] = 0x1a88b606;
Kset_uipoly_wide((*(generator_multiples2 + 162))->m_V1, dummy, 4);

dummy[3] = 0x85e2;
dummy[2] = 0xeb003114;
dummy[1] = 0x40a9e359;
dummy[0] = 0x1dc12f44;
Kset_uipoly_wide((*(generator_multiples2 + 162))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 162))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 162))->m_z, 1);

dummy[3] = 0x7b4a;
dummy[2] = 0x76b2e0a0;
dummy[1] = 0x6fbfe192;
dummy[0] = 0x6f552542;
Kset_uipoly_wide((*(generator_multiples1 + 163))->m_U1, dummy, 4);

dummy[3] = 0x2c95;
dummy[2] = 0x3a879dcb;
dummy[1] = 0xe6ac8164;
dummy[0] = 0x92f9aa08;
Kset_uipoly_wide((*(generator_multiples1 + 163))->m_U0, dummy, 4);

dummy[3] = 0xc728;
dummy[2] = 0x20953d65;
dummy[1] = 0xc270b411;
dummy[0] = 0xb26941a3;
Kset_uipoly_wide((*(generator_multiples1 + 163))->m_V1, dummy, 4);

dummy[3] = 0xa9f9;
dummy[2] = 0x5116d9c0;
dummy[1] = 0x4c56b605;
dummy[0] = 0xb36673ef;
Kset_uipoly_wide((*(generator_multiples1 + 163))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 163))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 163))->m_z, 1);

dummy[3] = 0x831;
dummy[2] = 0x1ea3799c;
dummy[1] = 0x94f66984;
dummy[0] = 0xf4c16a0e;
Kset_uipoly_wide((*(generator_multiples2 + 163))->m_U1, dummy, 4);

dummy[3] = 0x14d2e;
dummy[2] = 0xa95628b8;
dummy[1] = 0x445fbb0a;
dummy[0] = 0x611e47fa;
Kset_uipoly_wide((*(generator_multiples2 + 163))->m_U0, dummy, 4);

dummy[3] = 0x553b;
dummy[2] = 0xbf556d5d;
dummy[1] = 0x674e4406;
dummy[0] = 0xfe27683b;
Kset_uipoly_wide((*(generator_multiples2 + 163))->m_V1, dummy, 4);

dummy[3] = 0x22fd;
dummy[2] = 0x29e365d6;
dummy[1] = 0xa503d441;
dummy[0] = 0x2665512b;
Kset_uipoly_wide((*(generator_multiples2 + 163))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 163))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 163))->m_z, 1);

dummy[3] = 0x16da0;
dummy[2] = 0x1d992f4c;
dummy[1] = 0x13d0a037;
dummy[0] = 0xe8158045;
Kset_uipoly_wide((*(generator_multiples1 + 164))->m_U1, dummy, 4);

dummy[3] = 0x19500;
dummy[2] = 0x26c2a47e;
dummy[1] = 0xc9cf70af;
dummy[0] = 0x7ff40e99;
Kset_uipoly_wide((*(generator_multiples1 + 164))->m_U0, dummy, 4);

dummy[3] = 0x5355;
dummy[2] = 0x321eb66;
dummy[1] = 0x72d1f6b9;
dummy[0] = 0x20bf0265;
Kset_uipoly_wide((*(generator_multiples1 + 164))->m_V1, dummy, 4);

dummy[3] = 0x39d2;
dummy[2] = 0xf686ec91;
dummy[1] = 0x8b084cca;
dummy[0] = 0xd4f2dc8;
Kset_uipoly_wide((*(generator_multiples1 + 164))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 164))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 164))->m_z, 1);

dummy[3] = 0x8294;
dummy[2] = 0x20c4e006;
dummy[1] = 0xe49ab7d2;
dummy[0] = 0x58f2f2fc;
Kset_uipoly_wide((*(generator_multiples2 + 164))->m_U1, dummy, 4);

dummy[3] = 0x14d39;
dummy[2] = 0xda0bc4b;
dummy[1] = 0xe2bad80;
dummy[0] = 0x66631a3;
Kset_uipoly_wide((*(generator_multiples2 + 164))->m_U0, dummy, 4);

dummy[3] = 0x1283e;
dummy[2] = 0xdd5a7537;
dummy[1] = 0xf7695a08;
dummy[0] = 0x8a512e3c;
Kset_uipoly_wide((*(generator_multiples2 + 164))->m_V1, dummy, 4);

dummy[3] = 0x18a7d;
dummy[2] = 0x9c38c8f0;
dummy[1] = 0x189dce58;
dummy[0] = 0xd2c05853;
Kset_uipoly_wide((*(generator_multiples2 + 164))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 164))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 164))->m_z, 1);

dummy[3] = 0x9a54;
dummy[2] = 0xd4a8a752;
dummy[1] = 0x45c7c6a9;
dummy[0] = 0x2ec19ff8;
Kset_uipoly_wide((*(generator_multiples1 + 165))->m_U1, dummy, 4);

dummy[3] = 0x14eb4;
dummy[2] = 0xef879412;
dummy[1] = 0x42220766;
dummy[0] = 0xb98cbcc0;
Kset_uipoly_wide((*(generator_multiples1 + 165))->m_U0, dummy, 4);

dummy[3] = 0x5af9;
dummy[2] = 0xf7304adb;
dummy[1] = 0x23597dc0;
dummy[0] = 0xaae3dbfe;
Kset_uipoly_wide((*(generator_multiples1 + 165))->m_V1, dummy, 4);

dummy[3] = 0xa82f;
dummy[2] = 0x892bff47;
dummy[1] = 0xe5622e36;
dummy[0] = 0x1782d131;
Kset_uipoly_wide((*(generator_multiples1 + 165))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 165))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 165))->m_z, 1);

dummy[3] = 0x1e0fe;
dummy[2] = 0x89c037d6;
dummy[1] = 0x311594ef;
dummy[0] = 0xbbe7b002;
Kset_uipoly_wide((*(generator_multiples2 + 165))->m_U1, dummy, 4);

dummy[3] = 0x4132;
dummy[2] = 0xdb320da8;
dummy[1] = 0xf6e84d10;
dummy[0] = 0x6252fd9a;
Kset_uipoly_wide((*(generator_multiples2 + 165))->m_U0, dummy, 4);

dummy[3] = 0x138fc;
dummy[2] = 0x3c193286;
dummy[1] = 0x809ad4c3;
dummy[0] = 0x3104cf33;
Kset_uipoly_wide((*(generator_multiples2 + 165))->m_V1, dummy, 4);

dummy[3] = 0xd213;
dummy[2] = 0x92c1c85;
dummy[1] = 0x83098aa2;
dummy[0] = 0xf39419f3;
Kset_uipoly_wide((*(generator_multiples2 + 165))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 165))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 165))->m_z, 1);

dummy[3] = 0x24a;
dummy[2] = 0x39a3098;
dummy[1] = 0xbcf511d6;
dummy[0] = 0xdc1bc1d8;
Kset_uipoly_wide((*(generator_multiples1 + 166))->m_U1, dummy, 4);

dummy[3] = 0x1f969;
dummy[2] = 0x8cdf24ed;
dummy[1] = 0x1352a669;
dummy[0] = 0xb7c171ef;
Kset_uipoly_wide((*(generator_multiples1 + 166))->m_U0, dummy, 4);

dummy[3] = 0x6fb9;
dummy[2] = 0x1fcf4636;
dummy[1] = 0x8b82453c;
dummy[0] = 0x79a3e927;
Kset_uipoly_wide((*(generator_multiples1 + 166))->m_V1, dummy, 4);

dummy[3] = 0x29d8;
dummy[2] = 0xa1cd80a7;
dummy[1] = 0xa5222f48;
dummy[0] = 0xf8969b23;
Kset_uipoly_wide((*(generator_multiples1 + 166))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 166))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 166))->m_z, 1);

dummy[3] = 0x1bd36;
dummy[2] = 0x5f70fd3d;
dummy[1] = 0x2149641f;
dummy[0] = 0x49bc255c;
Kset_uipoly_wide((*(generator_multiples2 + 166))->m_U1, dummy, 4);

dummy[3] = 0x8b03;
dummy[2] = 0xc72ca49f;
dummy[1] = 0xf583bb63;
dummy[0] = 0x9b829bdd;
Kset_uipoly_wide((*(generator_multiples2 + 166))->m_U0, dummy, 4);

dummy[3] = 0x6d8;
dummy[2] = 0xb297d1f4;
dummy[1] = 0x7f8317d;
dummy[0] = 0xb116de62;
Kset_uipoly_wide((*(generator_multiples2 + 166))->m_V1, dummy, 4);

dummy[3] = 0x29fb;
dummy[2] = 0x992c620f;
dummy[1] = 0xa4985b61;
dummy[0] = 0xf43f827b;
Kset_uipoly_wide((*(generator_multiples2 + 166))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 166))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 166))->m_z, 1);

dummy[3] = 0x4ef9;
dummy[2] = 0x204df45f;
dummy[1] = 0x2a9cc5e6;
dummy[0] = 0x4d7d0a75;
Kset_uipoly_wide((*(generator_multiples1 + 167))->m_U1, dummy, 4);

dummy[3] = 0x74de;
dummy[2] = 0x6b4bacbe;
dummy[1] = 0xdd5756a8;
dummy[0] = 0x4cfd59ab;
Kset_uipoly_wide((*(generator_multiples1 + 167))->m_U0, dummy, 4);

dummy[3] = 0x1606e;
dummy[2] = 0xec22770c;
dummy[1] = 0x86b9eee2;
dummy[0] = 0x1beb816f;
Kset_uipoly_wide((*(generator_multiples1 + 167))->m_V1, dummy, 4);

dummy[3] = 0x12bd3;
dummy[2] = 0x79657294;
dummy[1] = 0x559cb1f9;
dummy[0] = 0xbd3541b1;
Kset_uipoly_wide((*(generator_multiples1 + 167))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 167))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 167))->m_z, 1);

dummy[3] = 0x5df8;
dummy[2] = 0x627887b6;
dummy[1] = 0xbfd84f6;
dummy[0] = 0x9bb65fbb;
Kset_uipoly_wide((*(generator_multiples2 + 167))->m_U1, dummy, 4);

dummy[3] = 0x140c8;
dummy[2] = 0x129b7c3e;
dummy[1] = 0xf208332a;
dummy[0] = 0xf7514d2c;
Kset_uipoly_wide((*(generator_multiples2 + 167))->m_U0, dummy, 4);

dummy[3] = 0x16024;
dummy[2] = 0x7c64c661;
dummy[1] = 0x224b2e86;
dummy[0] = 0x16f440f8;
Kset_uipoly_wide((*(generator_multiples2 + 167))->m_V1, dummy, 4);

dummy[3] = 0x133d6;
dummy[2] = 0x442e0a47;
dummy[1] = 0xd1b63cc1;
dummy[0] = 0xee3810a1;
Kset_uipoly_wide((*(generator_multiples2 + 167))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 167))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 167))->m_z, 1);

dummy[3] = 0xc8cd;
dummy[2] = 0xccb62604;
dummy[1] = 0x7c01712e;
dummy[0] = 0x3c6f4dc5;
Kset_uipoly_wide((*(generator_multiples1 + 168))->m_U1, dummy, 4);

dummy[3] = 0xd9c9;
dummy[2] = 0x6c64cf8b;
dummy[1] = 0x294bb876;
dummy[0] = 0x750915c4;
Kset_uipoly_wide((*(generator_multiples1 + 168))->m_U0, dummy, 4);

dummy[3] = 0x1de88;
dummy[2] = 0x261ae353;
dummy[1] = 0x6edd8b20;
dummy[0] = 0xcb26b0e8;
Kset_uipoly_wide((*(generator_multiples1 + 168))->m_V1, dummy, 4);

dummy[3] = 0x21fe;
dummy[2] = 0xf8b354bd;
dummy[1] = 0x848be429;
dummy[0] = 0x5193f1f4;
Kset_uipoly_wide((*(generator_multiples1 + 168))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 168))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 168))->m_z, 1);

dummy[3] = 0x161e8;
dummy[2] = 0xae635c83;
dummy[1] = 0x97a5c15e;
dummy[0] = 0x92af6e6;
Kset_uipoly_wide((*(generator_multiples2 + 168))->m_U1, dummy, 4);

dummy[3] = 0xdfbc;
dummy[2] = 0x6dc0e914;
dummy[1] = 0x4830cf6c;
dummy[0] = 0x37b9883f;
Kset_uipoly_wide((*(generator_multiples2 + 168))->m_U0, dummy, 4);

dummy[3] = 0xa514;
dummy[2] = 0x3fb1faf8;
dummy[1] = 0x506a24ee;
dummy[0] = 0xe6ed02de;
Kset_uipoly_wide((*(generator_multiples2 + 168))->m_V1, dummy, 4);

dummy[3] = 0xed1e;
dummy[2] = 0x60f3f66d;
dummy[1] = 0xd8706609;
dummy[0] = 0xf163c525;
Kset_uipoly_wide((*(generator_multiples2 + 168))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 168))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 168))->m_z, 1);

dummy[3] = 0xe69c;
dummy[2] = 0x4ba72449;
dummy[1] = 0xef9dd904;
dummy[0] = 0x58507d20;
Kset_uipoly_wide((*(generator_multiples1 + 169))->m_U1, dummy, 4);

dummy[3] = 0xa1f;
dummy[2] = 0xa9611b91;
dummy[1] = 0x791b332b;
dummy[0] = 0x22cea88e;
Kset_uipoly_wide((*(generator_multiples1 + 169))->m_U0, dummy, 4);

dummy[3] = 0x1a3d1;
dummy[2] = 0xcf5a3c47;
dummy[1] = 0x8641b6c1;
dummy[0] = 0xa070816c;
Kset_uipoly_wide((*(generator_multiples1 + 169))->m_V1, dummy, 4);

dummy[3] = 0x56f7;
dummy[2] = 0xb15b8af1;
dummy[1] = 0x995cca7f;
dummy[0] = 0x6836f885;
Kset_uipoly_wide((*(generator_multiples1 + 169))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 169))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 169))->m_z, 1);

dummy[3] = 0x10a67;
dummy[2] = 0xa0e53cb5;
dummy[1] = 0x9575df27;
dummy[0] = 0xb4982b05;
Kset_uipoly_wide((*(generator_multiples2 + 169))->m_U1, dummy, 4);

dummy[3] = 0x1e504;
dummy[2] = 0x9803e91;
dummy[1] = 0xe5a773b4;
dummy[0] = 0x71e46c39;
Kset_uipoly_wide((*(generator_multiples2 + 169))->m_U0, dummy, 4);

dummy[3] = 0x11eab;
dummy[2] = 0xddde2c35;
dummy[1] = 0x83651101;
dummy[0] = 0x4de623f;
Kset_uipoly_wide((*(generator_multiples2 + 169))->m_V1, dummy, 4);

dummy[3] = 0xbed0;
dummy[2] = 0xb1fac731;
dummy[1] = 0x76c9a925;
dummy[0] = 0x6c78f198;
Kset_uipoly_wide((*(generator_multiples2 + 169))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 169))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 169))->m_z, 1);

dummy[3] = 0xf98;
dummy[2] = 0x75afd8da;
dummy[1] = 0x4c0f38ce;
dummy[0] = 0xe77fdda8;
Kset_uipoly_wide((*(generator_multiples1 + 170))->m_U1, dummy, 4);

dummy[3] = 0x6ed5;
dummy[2] = 0xaee207df;
dummy[1] = 0xfcbaff62;
dummy[0] = 0x1aab710d;
Kset_uipoly_wide((*(generator_multiples1 + 170))->m_U0, dummy, 4);

dummy[3] = 0x1e056;
dummy[2] = 0xf9353221;
dummy[1] = 0x5c3ee7ec;
dummy[0] = 0x63970da;
Kset_uipoly_wide((*(generator_multiples1 + 170))->m_V1, dummy, 4);

dummy[3] = 0x14bda;
dummy[2] = 0x2f8c9fff;
dummy[1] = 0xb06fc0e8;
dummy[0] = 0x9010bf9;
Kset_uipoly_wide((*(generator_multiples1 + 170))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 170))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 170))->m_z, 1);

dummy[3] = 0x30f;
dummy[2] = 0xc453bcac;
dummy[1] = 0x98987cbf;
dummy[0] = 0xba1a3b5;
Kset_uipoly_wide((*(generator_multiples2 + 170))->m_U1, dummy, 4);

dummy[3] = 0xd32;
dummy[2] = 0x6b1f4abf;
dummy[1] = 0xaf03f162;
dummy[0] = 0x566bbba;
Kset_uipoly_wide((*(generator_multiples2 + 170))->m_U0, dummy, 4);

dummy[3] = 0x84a8;
dummy[2] = 0x76a68dd5;
dummy[1] = 0x38fa9bce;
dummy[0] = 0xddade925;
Kset_uipoly_wide((*(generator_multiples2 + 170))->m_V1, dummy, 4);

dummy[3] = 0x1b137;
dummy[2] = 0xa2293ad;
dummy[1] = 0xb1d653c9;
dummy[0] = 0x44e4705;
Kset_uipoly_wide((*(generator_multiples2 + 170))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 170))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 170))->m_z, 1);

dummy[3] = 0x1ccbc;
dummy[2] = 0xcca23998;
dummy[1] = 0x89d3c81a;
dummy[0] = 0x8acda4f;
Kset_uipoly_wide((*(generator_multiples1 + 171))->m_U1, dummy, 4);

dummy[3] = 0x5d53;
dummy[2] = 0xbede7577;
dummy[1] = 0xc05fd8a7;
dummy[0] = 0x1bfa5c7b;
Kset_uipoly_wide((*(generator_multiples1 + 171))->m_U0, dummy, 4);

dummy[3] = 0x4991;
dummy[2] = 0x47a98c68;
dummy[1] = 0xa9ec2dbc;
dummy[0] = 0xcfa49178;
Kset_uipoly_wide((*(generator_multiples1 + 171))->m_V1, dummy, 4);

dummy[3] = 0x5c6;
dummy[2] = 0x892117ba;
dummy[1] = 0x75aaba8b;
dummy[0] = 0x448d8e10;
Kset_uipoly_wide((*(generator_multiples1 + 171))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 171))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 171))->m_z, 1);

dummy[3] = 0x37db;
dummy[2] = 0x52bde5c7;
dummy[1] = 0x7f7ae5fa;
dummy[0] = 0xc29553e6;
Kset_uipoly_wide((*(generator_multiples2 + 171))->m_U1, dummy, 4);

dummy[3] = 0x1bd7d;
dummy[2] = 0x20e94787;
dummy[1] = 0x1f38afef;
dummy[0] = 0xb017b983;
Kset_uipoly_wide((*(generator_multiples2 + 171))->m_U0, dummy, 4);

dummy[3] = 0x1c0d5;
dummy[2] = 0x37beeb0d;
dummy[1] = 0xeec69b48;
dummy[0] = 0xe97d7992;
Kset_uipoly_wide((*(generator_multiples2 + 171))->m_V1, dummy, 4);

dummy[3] = 0x1d472;
dummy[2] = 0xb93ca595;
dummy[1] = 0x35901d8e;
dummy[0] = 0xc778a9c8;
Kset_uipoly_wide((*(generator_multiples2 + 171))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 171))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 171))->m_z, 1);

dummy[3] = 0xb51e;
dummy[2] = 0x6e02e1d;
dummy[1] = 0x1e918274;
dummy[0] = 0x5b8b9f3c;
Kset_uipoly_wide((*(generator_multiples1 + 172))->m_U1, dummy, 4);

dummy[3] = 0xac5f;
dummy[2] = 0xfc845374;
dummy[1] = 0xadc74eb5;
dummy[0] = 0x1b4603f7;
Kset_uipoly_wide((*(generator_multiples1 + 172))->m_U0, dummy, 4);

dummy[3] = 0x18969;
dummy[2] = 0x97d63e13;
dummy[1] = 0x8ec419c8;
dummy[0] = 0x7718a858;
Kset_uipoly_wide((*(generator_multiples1 + 172))->m_V1, dummy, 4);

dummy[3] = 0x673e;
dummy[2] = 0x1f5daf69;
dummy[1] = 0x30ac07b3;
dummy[0] = 0xfe66e9fe;
Kset_uipoly_wide((*(generator_multiples1 + 172))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 172))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 172))->m_z, 1);

dummy[3] = 0x5880;
dummy[2] = 0x22cf1f82;
dummy[1] = 0x3135fb7;
dummy[0] = 0x8632d466;
Kset_uipoly_wide((*(generator_multiples2 + 172))->m_U1, dummy, 4);

dummy[3] = 0x15d2b;
dummy[2] = 0x39b4a97c;
dummy[1] = 0xe42c55c3;
dummy[0] = 0xd1742936;
Kset_uipoly_wide((*(generator_multiples2 + 172))->m_U0, dummy, 4);

dummy[3] = 0x11751;
dummy[2] = 0x4ae457bd;
dummy[1] = 0xab1f8305;
dummy[0] = 0xf24b27a3;
Kset_uipoly_wide((*(generator_multiples2 + 172))->m_V1, dummy, 4);

dummy[3] = 0x129e2;
dummy[2] = 0x526db728;
dummy[1] = 0xf7a0a4d9;
dummy[0] = 0x2b97abb;
Kset_uipoly_wide((*(generator_multiples2 + 172))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 172))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 172))->m_z, 1);

dummy[3] = 0x19c32;
dummy[2] = 0x5d3b9545;
dummy[1] = 0x8be70b13;
dummy[0] = 0xae626b97;
Kset_uipoly_wide((*(generator_multiples1 + 173))->m_U1, dummy, 4);

dummy[3] = 0xb6c;
dummy[2] = 0x80ff75d7;
dummy[1] = 0x5fbcb287;
dummy[0] = 0x2053e750;
Kset_uipoly_wide((*(generator_multiples1 + 173))->m_U0, dummy, 4);

dummy[3] = 0x707d;
dummy[2] = 0x682227c1;
dummy[1] = 0x148c4ff7;
dummy[0] = 0x76bb21b9;
Kset_uipoly_wide((*(generator_multiples1 + 173))->m_V1, dummy, 4);

dummy[3] = 0x9cdf;
dummy[2] = 0x4aadfd92;
dummy[1] = 0x812050d0;
dummy[0] = 0x69c07ac9;
Kset_uipoly_wide((*(generator_multiples1 + 173))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 173))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 173))->m_z, 1);

dummy[3] = 0x1527f;
dummy[2] = 0x26cca1d8;
dummy[1] = 0xc6b9f220;
dummy[0] = 0x81fe068d;
Kset_uipoly_wide((*(generator_multiples2 + 173))->m_U1, dummy, 4);

dummy[3] = 0xfc68;
dummy[2] = 0x650a771d;
dummy[1] = 0x43a52c98;
dummy[0] = 0x4ed345e5;
Kset_uipoly_wide((*(generator_multiples2 + 173))->m_U0, dummy, 4);

dummy[3] = 0xe142;
dummy[2] = 0x6b00786d;
dummy[1] = 0x660cd98e;
dummy[0] = 0x583eca54;
Kset_uipoly_wide((*(generator_multiples2 + 173))->m_V1, dummy, 4);

dummy[3] = 0x11f6f;
dummy[2] = 0xd61a4bac;
dummy[1] = 0xbf717e6;
dummy[0] = 0xf13ba6bc;
Kset_uipoly_wide((*(generator_multiples2 + 173))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 173))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 173))->m_z, 1);

dummy[3] = 0x3c8a;
dummy[2] = 0xcad67a37;
dummy[1] = 0x41076893;
dummy[0] = 0xaaa0f981;
Kset_uipoly_wide((*(generator_multiples1 + 174))->m_U1, dummy, 4);

dummy[3] = 0x1c6d0;
dummy[2] = 0xc6e4e2a5;
dummy[1] = 0xc00a5ee6;
dummy[0] = 0x49a6b3d2;
Kset_uipoly_wide((*(generator_multiples1 + 174))->m_U0, dummy, 4);

dummy[3] = 0x3894;
dummy[2] = 0xd30e5734;
dummy[1] = 0xfa22bd3c;
dummy[0] = 0x83596f09;
Kset_uipoly_wide((*(generator_multiples1 + 174))->m_V1, dummy, 4);

dummy[3] = 0x16c89;
dummy[2] = 0x7f374c73;
dummy[1] = 0x83e0806d;
dummy[0] = 0x87d154b3;
Kset_uipoly_wide((*(generator_multiples1 + 174))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 174))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 174))->m_z, 1);

dummy[3] = 0x852;
dummy[2] = 0x4c7abcd8;
dummy[1] = 0x1731fc0e;
dummy[0] = 0x577d0493;
Kset_uipoly_wide((*(generator_multiples2 + 174))->m_U1, dummy, 4);

dummy[3] = 0xe2b9;
dummy[2] = 0xb5976d68;
dummy[1] = 0x86e5ee4;
dummy[0] = 0x657aa274;
Kset_uipoly_wide((*(generator_multiples2 + 174))->m_U0, dummy, 4);

dummy[3] = 0xa4fb;
dummy[2] = 0x5fff431c;
dummy[1] = 0xd1e9e0c1;
dummy[0] = 0x96190986;
Kset_uipoly_wide((*(generator_multiples2 + 174))->m_V1, dummy, 4);

dummy[3] = 0x16748;
dummy[2] = 0x956f18a2;
dummy[1] = 0xa18bcb88;
dummy[0] = 0xf5acbcab;
Kset_uipoly_wide((*(generator_multiples2 + 174))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 174))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 174))->m_z, 1);

dummy[3] = 0x6639;
dummy[2] = 0x5a2fccc5;
dummy[1] = 0x129094b3;
dummy[0] = 0x871ec39c;
Kset_uipoly_wide((*(generator_multiples1 + 175))->m_U1, dummy, 4);

dummy[3] = 0x10737;
dummy[2] = 0x9280f0a8;
dummy[1] = 0xa47cf8f6;
dummy[0] = 0x7b735d91;
Kset_uipoly_wide((*(generator_multiples1 + 175))->m_U0, dummy, 4);

dummy[3] = 0x108c2;
dummy[2] = 0x5b6f5eff;
dummy[1] = 0x727713ed;
dummy[0] = 0xa34b4478;
Kset_uipoly_wide((*(generator_multiples1 + 175))->m_V1, dummy, 4);

dummy[3] = 0xf8d2;
dummy[2] = 0x5d9abce9;
dummy[1] = 0xaacde91f;
dummy[0] = 0xc8603d33;
Kset_uipoly_wide((*(generator_multiples1 + 175))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 175))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 175))->m_z, 1);

dummy[3] = 0x1052e;
dummy[2] = 0xc46e17cf;
dummy[1] = 0x3e1b507a;
dummy[0] = 0x4c415207;
Kset_uipoly_wide((*(generator_multiples2 + 175))->m_U1, dummy, 4);

dummy[3] = 0x1d3d8;
dummy[2] = 0x9daaf2e0;
dummy[1] = 0xcb529cda;
dummy[0] = 0x28749cab;
Kset_uipoly_wide((*(generator_multiples2 + 175))->m_U0, dummy, 4);

dummy[3] = 0xefa9;
dummy[2] = 0x528ddf26;
dummy[1] = 0x9b1205db;
dummy[0] = 0xa9b020f4;
Kset_uipoly_wide((*(generator_multiples2 + 175))->m_V1, dummy, 4);

dummy[3] = 0xdda;
dummy[2] = 0xdf730c2c;
dummy[1] = 0x68e278da;
dummy[0] = 0x72cf0b34;
Kset_uipoly_wide((*(generator_multiples2 + 175))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 175))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 175))->m_z, 1);

dummy[3] = 0xb794;
dummy[2] = 0x83ff82b4;
dummy[1] = 0xc437b1d2;
dummy[0] = 0xec458e56;
Kset_uipoly_wide((*(generator_multiples1 + 176))->m_U1, dummy, 4);

dummy[3] = 0x1b1fc;
dummy[2] = 0x355a207;
dummy[1] = 0xaee8f4c;
dummy[0] = 0x19c6d6f3;
Kset_uipoly_wide((*(generator_multiples1 + 176))->m_U0, dummy, 4);

dummy[3] = 0xdee4;
dummy[2] = 0xbe829777;
dummy[1] = 0x706f1bb0;
dummy[0] = 0xfdc12007;
Kset_uipoly_wide((*(generator_multiples1 + 176))->m_V1, dummy, 4);

dummy[3] = 0x18488;
dummy[2] = 0x9c30e48d;
dummy[1] = 0xd36562a4;
dummy[0] = 0x181896d3;
Kset_uipoly_wide((*(generator_multiples1 + 176))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 176))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 176))->m_z, 1);

dummy[3] = 0x1ce2d;
dummy[2] = 0x498bd536;
dummy[1] = 0x4ea2d;
dummy[0] = 0x11d34dc;
Kset_uipoly_wide((*(generator_multiples2 + 176))->m_U1, dummy, 4);

dummy[3] = 0x9bd5;
dummy[2] = 0x25703af2;
dummy[1] = 0x933218f;
dummy[0] = 0x6c324056;
Kset_uipoly_wide((*(generator_multiples2 + 176))->m_U0, dummy, 4);

dummy[3] = 0xa419;
dummy[2] = 0x17d3f1c5;
dummy[1] = 0x7f0b4e11;
dummy[0] = 0x642e0949;
Kset_uipoly_wide((*(generator_multiples2 + 176))->m_V1, dummy, 4);

dummy[3] = 0xb3cd;
dummy[2] = 0x46268cd3;
dummy[1] = 0x3d36ed2a;
dummy[0] = 0x82501069;
Kset_uipoly_wide((*(generator_multiples2 + 176))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 176))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 176))->m_z, 1);

dummy[3] = 0x435d;
dummy[2] = 0x24aca023;
dummy[1] = 0x3aad287e;
dummy[0] = 0x71b7428;
Kset_uipoly_wide((*(generator_multiples1 + 177))->m_U1, dummy, 4);

dummy[3] = 0x41b4;
dummy[2] = 0xad6edf1b;
dummy[1] = 0x30ca5e20;
dummy[0] = 0x64e65947;
Kset_uipoly_wide((*(generator_multiples1 + 177))->m_U0, dummy, 4);

dummy[3] = 0x100ea;
dummy[2] = 0x9bd45cb9;
dummy[1] = 0x7076d2a5;
dummy[0] = 0x3055e81a;
Kset_uipoly_wide((*(generator_multiples1 + 177))->m_V1, dummy, 4);

dummy[3] = 0xdd4d;
dummy[2] = 0xd82eb4d;
dummy[1] = 0xeb1bb05;
dummy[0] = 0x44523a4a;
Kset_uipoly_wide((*(generator_multiples1 + 177))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 177))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 177))->m_z, 1);

dummy[3] = 0x48f9;
dummy[2] = 0xe9de1d6d;
dummy[1] = 0xacca2c5d;
dummy[0] = 0x2b532a72;
Kset_uipoly_wide((*(generator_multiples2 + 177))->m_U1, dummy, 4);

dummy[3] = 0x9bf2;
dummy[2] = 0x8391bb2c;
dummy[1] = 0x8fcbd740;
dummy[0] = 0x9135b6af;
Kset_uipoly_wide((*(generator_multiples2 + 177))->m_U0, dummy, 4);

dummy[3] = 0x18410;
dummy[2] = 0xfad99741;
dummy[1] = 0xf5538c09;
dummy[0] = 0x5b37418f;
Kset_uipoly_wide((*(generator_multiples2 + 177))->m_V1, dummy, 4);

dummy[3] = 0x1cebe;
dummy[2] = 0xb7074c56;
dummy[1] = 0x64bad5e;
dummy[0] = 0x1e3f7c1e;
Kset_uipoly_wide((*(generator_multiples2 + 177))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 177))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 177))->m_z, 1);

dummy[3] = 0x1580a;
dummy[2] = 0x45014955;
dummy[1] = 0xbda2e6;
dummy[0] = 0xac9a2f1d;
Kset_uipoly_wide((*(generator_multiples1 + 178))->m_U1, dummy, 4);

dummy[3] = 0xd54d;
dummy[2] = 0x31d093ae;
dummy[1] = 0xdde9caa8;
dummy[0] = 0x7089fe26;
Kset_uipoly_wide((*(generator_multiples1 + 178))->m_U0, dummy, 4);

dummy[3] = 0xe78a;
dummy[2] = 0xc9d4761;
dummy[1] = 0xa3824307;
dummy[0] = 0xf4140648;
Kset_uipoly_wide((*(generator_multiples1 + 178))->m_V1, dummy, 4);

dummy[3] = 0x6081;
dummy[2] = 0xc91e93f2;
dummy[1] = 0x6777549c;
dummy[0] = 0x1fb9b548;
Kset_uipoly_wide((*(generator_multiples1 + 178))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 178))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 178))->m_z, 1);

dummy[3] = 0x19bc3;
dummy[2] = 0xe0c7ac0d;
dummy[1] = 0x7fd2a8f7;
dummy[0] = 0xd83626;
Kset_uipoly_wide((*(generator_multiples2 + 178))->m_U1, dummy, 4);

dummy[3] = 0x1552b;
dummy[2] = 0xfd862f67;
dummy[1] = 0xc5047324;
dummy[0] = 0x7ecc8d53;
Kset_uipoly_wide((*(generator_multiples2 + 178))->m_U0, dummy, 4);

dummy[3] = 0x133c2;
dummy[2] = 0xffc44ab4;
dummy[1] = 0xabe5aec9;
dummy[0] = 0x522daeb3;
Kset_uipoly_wide((*(generator_multiples2 + 178))->m_V1, dummy, 4);

dummy[3] = 0x1e64;
dummy[2] = 0xc4b351e9;
dummy[1] = 0xd3dbe3ff;
dummy[0] = 0x60c6a7d3;
Kset_uipoly_wide((*(generator_multiples2 + 178))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 178))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 178))->m_z, 1);

dummy[3] = 0x162ca;
dummy[2] = 0xda15c8d9;
dummy[1] = 0x83bec7c6;
dummy[0] = 0xbe042d13;
Kset_uipoly_wide((*(generator_multiples1 + 179))->m_U1, dummy, 4);

dummy[3] = 0x373d;
dummy[2] = 0xa565c951;
dummy[1] = 0x235e4af;
dummy[0] = 0x12c9b624;
Kset_uipoly_wide((*(generator_multiples1 + 179))->m_U0, dummy, 4);

dummy[3] = 0xf4ad;
dummy[2] = 0x671e4bf;
dummy[1] = 0x26033688;
dummy[0] = 0x65ef2a2a;
Kset_uipoly_wide((*(generator_multiples1 + 179))->m_V1, dummy, 4);

dummy[3] = 0x11788;
dummy[2] = 0xf795d33e;
dummy[1] = 0x3b2a359;
dummy[0] = 0xab3bb147;
Kset_uipoly_wide((*(generator_multiples1 + 179))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 179))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 179))->m_z, 1);

dummy[3] = 0x18414;
dummy[2] = 0x41ecda5c;
dummy[1] = 0x6bf44985;
dummy[0] = 0xbae1f8ab;
Kset_uipoly_wide((*(generator_multiples2 + 179))->m_U1, dummy, 4);

dummy[3] = 0x1bdec;
dummy[2] = 0xb3f0af23;
dummy[1] = 0x4c6912c3;
dummy[0] = 0xf6a788f8;
Kset_uipoly_wide((*(generator_multiples2 + 179))->m_U0, dummy, 4);

dummy[3] = 0x5835;
dummy[2] = 0x45c46abd;
dummy[1] = 0xffe4f312;
dummy[0] = 0x1592025a;
Kset_uipoly_wide((*(generator_multiples2 + 179))->m_V1, dummy, 4);

dummy[3] = 0x127ff;
dummy[2] = 0x210d13a1;
dummy[1] = 0xac1f6e65;
dummy[0] = 0x60156c45;
Kset_uipoly_wide((*(generator_multiples2 + 179))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 179))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 179))->m_z, 1);

dummy[3] = 0xd759;
dummy[2] = 0xa964c455;
dummy[1] = 0xbe345302;
dummy[0] = 0x51fecc21;
Kset_uipoly_wide((*(generator_multiples1 + 180))->m_U1, dummy, 4);

dummy[3] = 0x1b4d;
dummy[2] = 0x7b6ab799;
dummy[1] = 0x175358b8;
dummy[0] = 0xeb99318f;
Kset_uipoly_wide((*(generator_multiples1 + 180))->m_U0, dummy, 4);

dummy[3] = 0x1c2d3;
dummy[2] = 0x6826bccb;
dummy[1] = 0x48788f55;
dummy[0] = 0xe0ca0a07;
Kset_uipoly_wide((*(generator_multiples1 + 180))->m_V1, dummy, 4);

dummy[3] = 0x14145;
dummy[2] = 0x437c79c7;
dummy[1] = 0x72fe6ec5;
dummy[0] = 0x13b43f35;
Kset_uipoly_wide((*(generator_multiples1 + 180))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 180))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 180))->m_z, 1);

dummy[3] = 0xffcb;
dummy[2] = 0x4022204d;
dummy[1] = 0x59949df3;
dummy[0] = 0x2255e8d8;
Kset_uipoly_wide((*(generator_multiples2 + 180))->m_U1, dummy, 4);

dummy[3] = 0x16d00;
dummy[2] = 0x9474766c;
dummy[1] = 0x3accfc9c;
dummy[0] = 0x11b739f5;
Kset_uipoly_wide((*(generator_multiples2 + 180))->m_U0, dummy, 4);

dummy[3] = 0x1dfde;
dummy[2] = 0x2ec0ac1c;
dummy[1] = 0xde34c669;
dummy[0] = 0xc9cd5d2f;
Kset_uipoly_wide((*(generator_multiples2 + 180))->m_V1, dummy, 4);

dummy[3] = 0x1fd8c;
dummy[2] = 0xa73088c;
dummy[1] = 0x70bd0b27;
dummy[0] = 0x7242963e;
Kset_uipoly_wide((*(generator_multiples2 + 180))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 180))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 180))->m_z, 1);

dummy[3] = 0x2b53;
dummy[2] = 0x5c5c9b08;
dummy[1] = 0x2a349bde;
dummy[0] = 0x4f676095;
Kset_uipoly_wide((*(generator_multiples1 + 181))->m_U1, dummy, 4);

dummy[3] = 0x1684b;
dummy[2] = 0xd5a1ed06;
dummy[1] = 0x459c3878;
dummy[0] = 0xa0bb7c67;
Kset_uipoly_wide((*(generator_multiples1 + 181))->m_U0, dummy, 4);

dummy[3] = 0x331e;
dummy[2] = 0x9acd1b8b;
dummy[1] = 0x145ad48b;
dummy[0] = 0xbcf9b802;
Kset_uipoly_wide((*(generator_multiples1 + 181))->m_V1, dummy, 4);

dummy[3] = 0x1c849;
dummy[2] = 0xfa93daa3;
dummy[1] = 0x6fd6c009;
dummy[0] = 0x6aaa3115;
Kset_uipoly_wide((*(generator_multiples1 + 181))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 181))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 181))->m_z, 1);

dummy[3] = 0x2e3b;
dummy[2] = 0xdb0b239d;
dummy[1] = 0xa01fb0ff;
dummy[0] = 0x9fd82a01;
Kset_uipoly_wide((*(generator_multiples2 + 181))->m_U1, dummy, 4);

dummy[3] = 0x53d0;
dummy[2] = 0x18539e21;
dummy[1] = 0x2bb4afe8;
dummy[0] = 0xb0feca7a;
Kset_uipoly_wide((*(generator_multiples2 + 181))->m_U0, dummy, 4);

dummy[3] = 0x1bc75;
dummy[2] = 0x13d4fcff;
dummy[1] = 0x2a6d811c;
dummy[0] = 0xbdda0096;
Kset_uipoly_wide((*(generator_multiples2 + 181))->m_V1, dummy, 4);

dummy[3] = 0x1c158;
dummy[2] = 0x5e36c40f;
dummy[1] = 0x1aa4b50d;
dummy[0] = 0xb87f3503;
Kset_uipoly_wide((*(generator_multiples2 + 181))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 181))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 181))->m_z, 1);

dummy[3] = 0x1248b;
dummy[2] = 0x3c58dc09;
dummy[1] = 0x2de26e32;
dummy[0] = 0x29d1a1a4;
Kset_uipoly_wide((*(generator_multiples1 + 182))->m_U1, dummy, 4);

dummy[3] = 0x4dff;
dummy[2] = 0x437d15f9;
dummy[1] = 0x53a93448;
dummy[0] = 0x8c2e809b;
Kset_uipoly_wide((*(generator_multiples1 + 182))->m_U0, dummy, 4);

dummy[3] = 0xcd9f;
dummy[2] = 0x48ecb5fd;
dummy[1] = 0x5650d0e3;
dummy[0] = 0xde1d142e;
Kset_uipoly_wide((*(generator_multiples1 + 182))->m_V1, dummy, 4);

dummy[3] = 0x11371;
dummy[2] = 0xb46a131e;
dummy[1] = 0xcbde55a;
dummy[0] = 0x30473f42;
Kset_uipoly_wide((*(generator_multiples1 + 182))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 182))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 182))->m_z, 1);

dummy[3] = 0xf311;
dummy[2] = 0x3af2eb7b;
dummy[1] = 0xd281024e;
dummy[0] = 0xb091099;
Kset_uipoly_wide((*(generator_multiples2 + 182))->m_U1, dummy, 4);

dummy[3] = 0x131f;
dummy[2] = 0xb95e988b;
dummy[1] = 0xcbdd6ab1;
dummy[0] = 0xebb6126e;
Kset_uipoly_wide((*(generator_multiples2 + 182))->m_U0, dummy, 4);

dummy[3] = 0xa1ca;
dummy[2] = 0x23f5cadb;
dummy[1] = 0x86e8cbfa;
dummy[0] = 0xdef4b31e;
Kset_uipoly_wide((*(generator_multiples2 + 182))->m_V1, dummy, 4);

dummy[3] = 0x17179;
dummy[2] = 0x4e926ae9;
dummy[1] = 0xc1dde7ca;
dummy[0] = 0x4dbff702;
Kset_uipoly_wide((*(generator_multiples2 + 182))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 182))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 182))->m_z, 1);

dummy[3] = 0xd2ac;
dummy[2] = 0x75d8966a;
dummy[1] = 0xfbb63c1b;
dummy[0] = 0x68c1375a;
Kset_uipoly_wide((*(generator_multiples1 + 183))->m_U1, dummy, 4);

dummy[3] = 0xc8d2;
dummy[2] = 0x4508773e;
dummy[1] = 0xb3b8db8d;
dummy[0] = 0xd2ec270b;
Kset_uipoly_wide((*(generator_multiples1 + 183))->m_U0, dummy, 4);

dummy[3] = 0x1b502;
dummy[2] = 0xea50987c;
dummy[1] = 0xc3db238e;
dummy[0] = 0x83e11273;
Kset_uipoly_wide((*(generator_multiples1 + 183))->m_V1, dummy, 4);

dummy[3] = 0x17d54;
dummy[2] = 0xb679cc85;
dummy[1] = 0xb42a9b49;
dummy[0] = 0x280ef6a9;
Kset_uipoly_wide((*(generator_multiples1 + 183))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 183))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 183))->m_z, 1);

dummy[3] = 0xe85;
dummy[2] = 0x74f73470;
dummy[1] = 0x5d032eef;
dummy[0] = 0xd8a0630a;
Kset_uipoly_wide((*(generator_multiples2 + 183))->m_U1, dummy, 4);

dummy[3] = 0x12b09;
dummy[2] = 0xdab252df;
dummy[1] = 0x6febcab8;
dummy[0] = 0x1dbf2efe;
Kset_uipoly_wide((*(generator_multiples2 + 183))->m_U0, dummy, 4);

dummy[3] = 0x16cf9;
dummy[2] = 0xfa4a94f2;
dummy[1] = 0x5b179333;
dummy[0] = 0xbb05286b;
Kset_uipoly_wide((*(generator_multiples2 + 183))->m_V1, dummy, 4);

dummy[3] = 0x7514;
dummy[2] = 0x2ee7e07e;
dummy[1] = 0xb89bcbef;
dummy[0] = 0x5dd17339;
Kset_uipoly_wide((*(generator_multiples2 + 183))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 183))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 183))->m_z, 1);

dummy[3] = 0x56e5;
dummy[2] = 0x3af63b56;
dummy[1] = 0xb8bc1be1;
dummy[0] = 0xe0308f9d;
Kset_uipoly_wide((*(generator_multiples1 + 184))->m_U1, dummy, 4);

dummy[3] = 0xcbeb;
dummy[2] = 0xb3486766;
dummy[1] = 0x5d0fd86a;
dummy[0] = 0x86d1a82e;
Kset_uipoly_wide((*(generator_multiples1 + 184))->m_U0, dummy, 4);

dummy[3] = 0x1313;
dummy[2] = 0x89f79022;
dummy[1] = 0xdaf4ad1;
dummy[0] = 0x324a8703;
Kset_uipoly_wide((*(generator_multiples1 + 184))->m_V1, dummy, 4);

dummy[3] = 0x60c8;
dummy[2] = 0xe00f3b76;
dummy[1] = 0x2fe6f8b9;
dummy[0] = 0xa4135fa6;
Kset_uipoly_wide((*(generator_multiples1 + 184))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 184))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 184))->m_z, 1);

dummy[3] = 0x1af09;
dummy[2] = 0xbb853130;
dummy[1] = 0x9033b414;
dummy[0] = 0xd5ad0184;
Kset_uipoly_wide((*(generator_multiples2 + 184))->m_U1, dummy, 4);

dummy[3] = 0x145c4;
dummy[2] = 0xb18d5dc;
dummy[1] = 0xaa7ba42a;
dummy[0] = 0x15ee9196;
Kset_uipoly_wide((*(generator_multiples2 + 184))->m_U0, dummy, 4);

dummy[3] = 0x65d5;
dummy[2] = 0xb6541c7e;
dummy[1] = 0xa718963e;
dummy[0] = 0x66ef1914;
Kset_uipoly_wide((*(generator_multiples2 + 184))->m_V1, dummy, 4);

dummy[3] = 0x5f34;
dummy[2] = 0x4b96efc1;
dummy[1] = 0x7fdb4fc5;
dummy[0] = 0x51da8d09;
Kset_uipoly_wide((*(generator_multiples2 + 184))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 184))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 184))->m_z, 1);

dummy[3] = 0x1db72;
dummy[2] = 0x63459fe4;
dummy[1] = 0xf8f24db;
dummy[0] = 0x565ac670;
Kset_uipoly_wide((*(generator_multiples1 + 185))->m_U1, dummy, 4);

dummy[3] = 0x1596c;
dummy[2] = 0xf0d5a5;
dummy[1] = 0x855ecde2;
dummy[0] = 0x42270951;
Kset_uipoly_wide((*(generator_multiples1 + 185))->m_U0, dummy, 4);

dummy[3] = 0x3be3;
dummy[2] = 0xe8e028fd;
dummy[1] = 0xbea6777;
dummy[0] = 0x43353748;
Kset_uipoly_wide((*(generator_multiples1 + 185))->m_V1, dummy, 4);

dummy[3] = 0x1a0aa;
dummy[2] = 0xae5f7389;
dummy[1] = 0x3407b864;
dummy[0] = 0x531149fb;
Kset_uipoly_wide((*(generator_multiples1 + 185))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 185))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 185))->m_z, 1);

dummy[3] = 0x14ad3;
dummy[2] = 0x1b61287f;
dummy[1] = 0x1c440e3a;
dummy[0] = 0x94087a36;
Kset_uipoly_wide((*(generator_multiples2 + 185))->m_U1, dummy, 4);

dummy[3] = 0x40b2;
dummy[2] = 0x21b6f184;
dummy[1] = 0xc507e494;
dummy[0] = 0xe06ec006;
Kset_uipoly_wide((*(generator_multiples2 + 185))->m_U0, dummy, 4);

dummy[3] = 0x16262;
dummy[2] = 0x8d879902;
dummy[1] = 0x78c5694f;
dummy[0] = 0x847d6d12;
Kset_uipoly_wide((*(generator_multiples2 + 185))->m_V1, dummy, 4);

dummy[3] = 0x1b459;
dummy[2] = 0xb8c8d264;
dummy[1] = 0x24007c40;
dummy[0] = 0xd5468b23;
Kset_uipoly_wide((*(generator_multiples2 + 185))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 185))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 185))->m_z, 1);

dummy[3] = 0x1d67e;
dummy[2] = 0x941ffb95;
dummy[1] = 0x57307e4;
dummy[0] = 0x98ce3fcb;
Kset_uipoly_wide((*(generator_multiples1 + 186))->m_U1, dummy, 4);

dummy[3] = 0xe5f5;
dummy[2] = 0x861902d5;
dummy[1] = 0xfeb278a;
dummy[0] = 0xbe5b4d94;
Kset_uipoly_wide((*(generator_multiples1 + 186))->m_U0, dummy, 4);

dummy[3] = 0x1f2ae;
dummy[2] = 0x408154ab;
dummy[1] = 0x74565bc8;
dummy[0] = 0xa834e0b;
Kset_uipoly_wide((*(generator_multiples1 + 186))->m_V1, dummy, 4);

dummy[3] = 0x7ea9;
dummy[2] = 0xe1f7d6ff;
dummy[1] = 0x638af272;
dummy[0] = 0xddc3ef99;
Kset_uipoly_wide((*(generator_multiples1 + 186))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 186))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 186))->m_z, 1);

dummy[3] = 0x1c44d;
dummy[2] = 0x68e656c1;
dummy[1] = 0x1399f7b4;
dummy[0] = 0xfb190b4b;
Kset_uipoly_wide((*(generator_multiples2 + 186))->m_U1, dummy, 4);

dummy[3] = 0x169e;
dummy[2] = 0x199dd044;
dummy[1] = 0x13194ddd;
dummy[0] = 0xe368f745;
Kset_uipoly_wide((*(generator_multiples2 + 186))->m_U0, dummy, 4);

dummy[3] = 0x83cb;
dummy[2] = 0x8e352cf;
dummy[1] = 0xd8efcb1a;
dummy[0] = 0xa404b7e;
Kset_uipoly_wide((*(generator_multiples2 + 186))->m_V1, dummy, 4);

dummy[3] = 0xda68;
dummy[2] = 0xcb7c53fb;
dummy[1] = 0xef0c2eea;
dummy[0] = 0x2c45d965;
Kset_uipoly_wide((*(generator_multiples2 + 186))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 186))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 186))->m_z, 1);

dummy[3] = 0xd0c7;
dummy[2] = 0x2da3b30f;
dummy[1] = 0xa03ff717;
dummy[0] = 0x13ce842d;
Kset_uipoly_wide((*(generator_multiples1 + 187))->m_U1, dummy, 4);

dummy[3] = 0x16ae3;
dummy[2] = 0x4c3b406b;
dummy[1] = 0x3f82947c;
dummy[0] = 0x287c8367;
Kset_uipoly_wide((*(generator_multiples1 + 187))->m_U0, dummy, 4);

dummy[3] = 0x6f51;
dummy[2] = 0x43ce3bb9;
dummy[1] = 0xf6b2fae9;
dummy[0] = 0x8cf08d31;
Kset_uipoly_wide((*(generator_multiples1 + 187))->m_V1, dummy, 4);

dummy[3] = 0x15bd9;
dummy[2] = 0xf9fff807;
dummy[1] = 0x5c99439a;
dummy[0] = 0x6fd8ba2b;
Kset_uipoly_wide((*(generator_multiples1 + 187))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 187))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 187))->m_z, 1);

dummy[3] = 0xf6d6;
dummy[2] = 0x1851f0c1;
dummy[1] = 0x84632489;
dummy[0] = 0x6f29b6d8;
Kset_uipoly_wide((*(generator_multiples2 + 187))->m_U1, dummy, 4);

dummy[3] = 0x1de03;
dummy[2] = 0x42609a7a;
dummy[1] = 0x576c2b9d;
dummy[0] = 0xfbeadb42;
Kset_uipoly_wide((*(generator_multiples2 + 187))->m_U0, dummy, 4);

dummy[3] = 0x1fa55;
dummy[2] = 0x7e5eca94;
dummy[1] = 0x9f205b16;
dummy[0] = 0xf192ac6;
Kset_uipoly_wide((*(generator_multiples2 + 187))->m_V1, dummy, 4);

dummy[3] = 0x5848;
dummy[2] = 0x11ab1586;
dummy[1] = 0x1fcbd035;
dummy[0] = 0x20501ba4;
Kset_uipoly_wide((*(generator_multiples2 + 187))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 187))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 187))->m_z, 1);

dummy[3] = 0x648b;
dummy[2] = 0x78c13e15;
dummy[1] = 0x40c37901;
dummy[0] = 0xdd61fd6a;
Kset_uipoly_wide((*(generator_multiples1 + 188))->m_U1, dummy, 4);

dummy[3] = 0x21a1;
dummy[2] = 0xb02edf76;
dummy[1] = 0x751cb7da;
dummy[0] = 0xf492bde8;
Kset_uipoly_wide((*(generator_multiples1 + 188))->m_U0, dummy, 4);

dummy[3] = 0x11380;
dummy[2] = 0x10e5ba94;
dummy[1] = 0x71db49c7;
dummy[0] = 0xd462abe8;
Kset_uipoly_wide((*(generator_multiples1 + 188))->m_V1, dummy, 4);

dummy[3] = 0x153cd;
dummy[2] = 0x284def1c;
dummy[1] = 0x5cc9770f;
dummy[0] = 0xde11d2de;
Kset_uipoly_wide((*(generator_multiples1 + 188))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 188))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 188))->m_z, 1);

dummy[3] = 0x1e854;
dummy[2] = 0x25baf9f9;
dummy[1] = 0xc053ce6c;
dummy[0] = 0x43331f88;
Kset_uipoly_wide((*(generator_multiples2 + 188))->m_U1, dummy, 4);

dummy[3] = 0x122b1;
dummy[2] = 0x6603c7c;
dummy[1] = 0x8394be41;
dummy[0] = 0x94403a0b;
Kset_uipoly_wide((*(generator_multiples2 + 188))->m_U0, dummy, 4);

dummy[3] = 0x9cb7;
dummy[2] = 0xb35b41a;
dummy[1] = 0x84504c20;
dummy[0] = 0x5d561537;
Kset_uipoly_wide((*(generator_multiples2 + 188))->m_V1, dummy, 4);

dummy[3] = 0x34f7;
dummy[2] = 0x2ee43823;
dummy[1] = 0x2ec682fb;
dummy[0] = 0xabd6e256;
Kset_uipoly_wide((*(generator_multiples2 + 188))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 188))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 188))->m_z, 1);

dummy[3] = 0xf933;
dummy[2] = 0xdbf5b2a;
dummy[1] = 0x2e373363;
dummy[0] = 0xab2c64b6;
Kset_uipoly_wide((*(generator_multiples1 + 189))->m_U1, dummy, 4);

dummy[3] = 0x3deb;
dummy[2] = 0x9fbd86d7;
dummy[1] = 0xd0432a44;
dummy[0] = 0xcd9e431d;
Kset_uipoly_wide((*(generator_multiples1 + 189))->m_U0, dummy, 4);

dummy[3] = 0x6648;
dummy[2] = 0x8a73b847;
dummy[1] = 0x2a1f0da2;
dummy[0] = 0xf89fea52;
Kset_uipoly_wide((*(generator_multiples1 + 189))->m_V1, dummy, 4);

dummy[3] = 0x3b3;
dummy[2] = 0x8dd7b2e7;
dummy[1] = 0x3545343a;
dummy[0] = 0xb75ad1;
Kset_uipoly_wide((*(generator_multiples1 + 189))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 189))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 189))->m_z, 1);

dummy[3] = 0x691;
dummy[2] = 0xe7009327;
dummy[1] = 0x421d061;
dummy[0] = 0x9b47cef5;
Kset_uipoly_wide((*(generator_multiples2 + 189))->m_U1, dummy, 4);

dummy[3] = 0x18101;
dummy[2] = 0xe9250cde;
dummy[1] = 0x56e2e71;
dummy[0] = 0xe156b2bc;
Kset_uipoly_wide((*(generator_multiples2 + 189))->m_U0, dummy, 4);

dummy[3] = 0x1d9e3;
dummy[2] = 0xb9d3874c;
dummy[1] = 0x90f6ed41;
dummy[0] = 0x56b2aaed;
Kset_uipoly_wide((*(generator_multiples2 + 189))->m_V1, dummy, 4);

dummy[3] = 0x1645a;
dummy[2] = 0xf52fe127;
dummy[1] = 0x87a02a6e;
dummy[0] = 0x941aed65;
Kset_uipoly_wide((*(generator_multiples2 + 189))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 189))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 189))->m_z, 1);

dummy[3] = 0x10183;
dummy[2] = 0x7a46d950;
dummy[1] = 0xd66cc401;
dummy[0] = 0x8f64438d;
Kset_uipoly_wide((*(generator_multiples1 + 190))->m_U1, dummy, 4);

dummy[3] = 0x43b8;
dummy[2] = 0x70b655a3;
dummy[1] = 0x5fa77931;
dummy[0] = 0xca1e30a5;
Kset_uipoly_wide((*(generator_multiples1 + 190))->m_U0, dummy, 4);

dummy[3] = 0x6956;
dummy[2] = 0x61a8cf8;
dummy[1] = 0xc8382a13;
dummy[0] = 0x5223eed7;
Kset_uipoly_wide((*(generator_multiples1 + 190))->m_V1, dummy, 4);

dummy[3] = 0x9d93;
dummy[2] = 0x9af55d6d;
dummy[1] = 0x5e9c42f;
dummy[0] = 0x5dfeec4a;
Kset_uipoly_wide((*(generator_multiples1 + 190))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 190))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 190))->m_z, 1);

dummy[3] = 0xa977;
dummy[2] = 0x8cd6764c;
dummy[1] = 0xd4cf8a9e;
dummy[0] = 0xdaad782d;
Kset_uipoly_wide((*(generator_multiples2 + 190))->m_U1, dummy, 4);

dummy[3] = 0x1634;
dummy[2] = 0xd5ed8a78;
dummy[1] = 0x8ac2ed17;
dummy[0] = 0xbf80c8cd;
Kset_uipoly_wide((*(generator_multiples2 + 190))->m_U0, dummy, 4);

dummy[3] = 0xbf17;
dummy[2] = 0x77fd1438;
dummy[1] = 0xbabcf6f0;
dummy[0] = 0x7107b79b;
Kset_uipoly_wide((*(generator_multiples2 + 190))->m_V1, dummy, 4);

dummy[3] = 0x4094;
dummy[2] = 0xe477b9b8;
dummy[1] = 0xca3d33f4;
dummy[0] = 0xfb8a57cf;
Kset_uipoly_wide((*(generator_multiples2 + 190))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 190))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 190))->m_z, 1);

dummy[3] = 0x1a006;
dummy[2] = 0x3dfec7ec;
dummy[1] = 0x917c27a2;
dummy[0] = 0xa53816af;
Kset_uipoly_wide((*(generator_multiples1 + 191))->m_U1, dummy, 4);

dummy[3] = 0x11983;
dummy[2] = 0x67334289;
dummy[1] = 0xaac746ef;
dummy[0] = 0x171aa434;
Kset_uipoly_wide((*(generator_multiples1 + 191))->m_U0, dummy, 4);

dummy[3] = 0x750;
dummy[2] = 0x27493c14;
dummy[1] = 0xa066744f;
dummy[0] = 0xb2330b26;
Kset_uipoly_wide((*(generator_multiples1 + 191))->m_V1, dummy, 4);

dummy[3] = 0xfd6f;
dummy[2] = 0x46823a2c;
dummy[1] = 0xf8eab73e;
dummy[0] = 0x928ce698;
Kset_uipoly_wide((*(generator_multiples1 + 191))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 191))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 191))->m_z, 1);

dummy[3] = 0xeb97;
dummy[2] = 0xb34581a8;
dummy[1] = 0x27ac9ef0;
dummy[0] = 0xe02e1adc;
Kset_uipoly_wide((*(generator_multiples2 + 191))->m_U1, dummy, 4);

dummy[3] = 0x8942;
dummy[2] = 0xee7a4461;
dummy[1] = 0xb3ff2515;
dummy[0] = 0xf6be44e5;
Kset_uipoly_wide((*(generator_multiples2 + 191))->m_U0, dummy, 4);

dummy[3] = 0x2954;
dummy[2] = 0x32f93d3c;
dummy[1] = 0x4001ac94;
dummy[0] = 0x46fd609d;
Kset_uipoly_wide((*(generator_multiples2 + 191))->m_V1, dummy, 4);

dummy[3] = 0x179ce;
dummy[2] = 0x26fde38f;
dummy[1] = 0xcaf17a2e;
dummy[0] = 0xba4a01b9;
Kset_uipoly_wide((*(generator_multiples2 + 191))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 191))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 191))->m_z, 1);

dummy[3] = 0x57e6;
dummy[2] = 0xfa8757d9;
dummy[1] = 0x1cd0101c;
dummy[0] = 0x8f487dc3;
Kset_uipoly_wide((*(generator_multiples1 + 192))->m_U1, dummy, 4);

dummy[3] = 0x5614;
dummy[2] = 0xd0d75b8d;
dummy[1] = 0x1af30ca7;
dummy[0] = 0xa3f3e9ea;
Kset_uipoly_wide((*(generator_multiples1 + 192))->m_U0, dummy, 4);

dummy[3] = 0x1a29d;
dummy[2] = 0x4c5ecf8d;
dummy[1] = 0x165d248e;
dummy[0] = 0x7486f69c;
Kset_uipoly_wide((*(generator_multiples1 + 192))->m_V1, dummy, 4);

dummy[3] = 0x5a1d;
dummy[2] = 0x564fcfdf;
dummy[1] = 0xe05f5af2;
dummy[0] = 0xef64d679;
Kset_uipoly_wide((*(generator_multiples1 + 192))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 192))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 192))->m_z, 1);

dummy[3] = 0x1dec4;
dummy[2] = 0x278bbfc4;
dummy[1] = 0xca3269e4;
dummy[0] = 0x23b85cf0;
Kset_uipoly_wide((*(generator_multiples2 + 192))->m_U1, dummy, 4);

dummy[3] = 0x7602;
dummy[2] = 0xc6d0de5c;
dummy[1] = 0x3e3cef01;
dummy[0] = 0x5f3c5377;
Kset_uipoly_wide((*(generator_multiples2 + 192))->m_U0, dummy, 4);

dummy[3] = 0x135e8;
dummy[2] = 0xdedbf27;
dummy[1] = 0x437207b0;
dummy[0] = 0xbf2bca22;
Kset_uipoly_wide((*(generator_multiples2 + 192))->m_V1, dummy, 4);

dummy[3] = 0x1d1b2;
dummy[2] = 0x4feddfe0;
dummy[1] = 0xe6adcf8f;
dummy[0] = 0xd8bedd6c;
Kset_uipoly_wide((*(generator_multiples2 + 192))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 192))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 192))->m_z, 1);

dummy[3] = 0x17e6a;
dummy[2] = 0xf8250e9c;
dummy[1] = 0xf21340ea;
dummy[0] = 0x2b95d07b;
Kset_uipoly_wide((*(generator_multiples1 + 193))->m_U1, dummy, 4);

dummy[3] = 0x3a21;
dummy[2] = 0x37638882;
dummy[1] = 0x87486688;
dummy[0] = 0xe8e5fc36;
Kset_uipoly_wide((*(generator_multiples1 + 193))->m_U0, dummy, 4);

dummy[3] = 0x1e9f1;
dummy[2] = 0x2e4ac0c;
dummy[1] = 0x11c76df1;
dummy[0] = 0x43bb2eb2;
Kset_uipoly_wide((*(generator_multiples1 + 193))->m_V1, dummy, 4);

dummy[3] = 0x1ca0c;
dummy[2] = 0xfb5b3c00;
dummy[1] = 0x3674bc94;
dummy[0] = 0x69f68ab8;
Kset_uipoly_wide((*(generator_multiples1 + 193))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 193))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 193))->m_z, 1);

dummy[3] = 0x19460;
dummy[2] = 0x83481de0;
dummy[1] = 0xf39ce28;
dummy[0] = 0xc0aad0fb;
Kset_uipoly_wide((*(generator_multiples2 + 193))->m_U1, dummy, 4);

dummy[3] = 0x1acdc;
dummy[2] = 0x657de3ca;
dummy[1] = 0x13b117f8;
dummy[0] = 0xe7721c04;
Kset_uipoly_wide((*(generator_multiples2 + 193))->m_U0, dummy, 4);

dummy[3] = 0x10ca;
dummy[2] = 0x39f2d0fb;
dummy[1] = 0x275a748a;
dummy[0] = 0xdcc10751;
Kset_uipoly_wide((*(generator_multiples2 + 193))->m_V1, dummy, 4);

dummy[3] = 0x49a6;
dummy[2] = 0xc0e9ed87;
dummy[1] = 0x5e5183ed;
dummy[0] = 0xd67726b;
Kset_uipoly_wide((*(generator_multiples2 + 193))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 193))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 193))->m_z, 1);

dummy[3] = 0x1965b;
dummy[2] = 0x592f9ce6;
dummy[1] = 0x22482d28;
dummy[0] = 0x1b63c605;
Kset_uipoly_wide((*(generator_multiples1 + 194))->m_U1, dummy, 4);

dummy[3] = 0x2b63;
dummy[2] = 0x689c162f;
dummy[1] = 0xbbf61310;
dummy[0] = 0xcf7d648f;
Kset_uipoly_wide((*(generator_multiples1 + 194))->m_U0, dummy, 4);

dummy[3] = 0x1a991;
dummy[2] = 0xc34cbdbc;
dummy[1] = 0xd39ad36e;
dummy[0] = 0x34edc385;
Kset_uipoly_wide((*(generator_multiples1 + 194))->m_V1, dummy, 4);

dummy[3] = 0xf83f;
dummy[2] = 0x1912f49d;
dummy[1] = 0xca332aa9;
dummy[0] = 0x45c80d90;
Kset_uipoly_wide((*(generator_multiples1 + 194))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 194))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 194))->m_z, 1);

dummy[3] = 0x15622;
dummy[2] = 0xd24b0b1d;
dummy[1] = 0x1393def3;
dummy[0] = 0x771a3aa4;
Kset_uipoly_wide((*(generator_multiples2 + 194))->m_U1, dummy, 4);

dummy[3] = 0x115e2;
dummy[2] = 0x8e7ee9ce;
dummy[1] = 0x6e27d48;
dummy[0] = 0x4e342eb7;
Kset_uipoly_wide((*(generator_multiples2 + 194))->m_U0, dummy, 4);

dummy[3] = 0x10c7b;
dummy[2] = 0xc8f0f2fa;
dummy[1] = 0x1ade9859;
dummy[0] = 0xb6e13560;
Kset_uipoly_wide((*(generator_multiples2 + 194))->m_V1, dummy, 4);

dummy[3] = 0x51c1;
dummy[2] = 0x7bdc5ae5;
dummy[1] = 0x6bad4a51;
dummy[0] = 0xc4f3bba0;
Kset_uipoly_wide((*(generator_multiples2 + 194))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 194))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 194))->m_z, 1);

dummy[3] = 0x17a1d;
dummy[2] = 0xf03bb7b;
dummy[1] = 0x8e3a743d;
dummy[0] = 0xcd9641f1;
Kset_uipoly_wide((*(generator_multiples1 + 195))->m_U1, dummy, 4);

dummy[3] = 0xa52d;
dummy[2] = 0xab452a13;
dummy[1] = 0xcb8320c7;
dummy[0] = 0xdb9b82bd;
Kset_uipoly_wide((*(generator_multiples1 + 195))->m_U0, dummy, 4);

dummy[3] = 0x1c356;
dummy[2] = 0x7038ad41;
dummy[1] = 0xf1b7b70c;
dummy[0] = 0xba76cd8b;
Kset_uipoly_wide((*(generator_multiples1 + 195))->m_V1, dummy, 4);

dummy[3] = 0x7fba;
dummy[2] = 0xe34868f4;
dummy[1] = 0x26e535f1;
dummy[0] = 0xd912fd2d;
Kset_uipoly_wide((*(generator_multiples1 + 195))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 195))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 195))->m_z, 1);

dummy[3] = 0x198f8;
dummy[2] = 0xcb767c98;
dummy[1] = 0x10c0f02e;
dummy[0] = 0x14b5afef;
Kset_uipoly_wide((*(generator_multiples2 + 195))->m_U1, dummy, 4);

dummy[3] = 0x223d;
dummy[2] = 0x1477c194;
dummy[1] = 0x923270e6;
dummy[0] = 0x8debe3bf;
Kset_uipoly_wide((*(generator_multiples2 + 195))->m_U0, dummy, 4);

dummy[3] = 0x1b42e;
dummy[2] = 0x434649bd;
dummy[1] = 0xa502b836;
dummy[0] = 0x56e6e37;
Kset_uipoly_wide((*(generator_multiples2 + 195))->m_V1, dummy, 4);

dummy[3] = 0x1dee2;
dummy[2] = 0xcb29e277;
dummy[1] = 0x9c379035;
dummy[0] = 0xdff7682f;
Kset_uipoly_wide((*(generator_multiples2 + 195))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 195))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 195))->m_z, 1);

dummy[3] = 0x1048a;
dummy[2] = 0x2bc65ece;
dummy[1] = 0x4ed2e177;
dummy[0] = 0x4511d7d3;
Kset_uipoly_wide((*(generator_multiples1 + 196))->m_U1, dummy, 4);

dummy[3] = 0x4e78;
dummy[2] = 0x3ff8790e;
dummy[1] = 0xd544e0d9;
dummy[0] = 0x656f98d1;
Kset_uipoly_wide((*(generator_multiples1 + 196))->m_U0, dummy, 4);

dummy[3] = 0x1abdc;
dummy[2] = 0x24cec4cc;
dummy[1] = 0xecee8120;
dummy[0] = 0x52adc7e6;
Kset_uipoly_wide((*(generator_multiples1 + 196))->m_V1, dummy, 4);

dummy[3] = 0xc99b;
dummy[2] = 0xfefe951;
dummy[1] = 0x8b0a864b;
dummy[0] = 0x4536b925;
Kset_uipoly_wide((*(generator_multiples1 + 196))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 196))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 196))->m_z, 1);

dummy[3] = 0x1597a;
dummy[2] = 0x8ce8b890;
dummy[1] = 0x41fc44cc;
dummy[0] = 0x811f4ecc;
Kset_uipoly_wide((*(generator_multiples2 + 196))->m_U1, dummy, 4);

dummy[3] = 0x11f6e;
dummy[2] = 0xc2fa2266;
dummy[1] = 0xa75d89f6;
dummy[0] = 0x45b42fd8;
Kset_uipoly_wide((*(generator_multiples2 + 196))->m_U0, dummy, 4);

dummy[3] = 0x108cc;
dummy[2] = 0x691f227c;
dummy[1] = 0x5d75bd30;
dummy[0] = 0x107faa42;
Kset_uipoly_wide((*(generator_multiples2 + 196))->m_V1, dummy, 4);

dummy[3] = 0x1b88c;
dummy[2] = 0x8e7ea841;
dummy[1] = 0xa3a63bcf;
dummy[0] = 0xab3767c5;
Kset_uipoly_wide((*(generator_multiples2 + 196))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 196))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 196))->m_z, 1);

dummy[3] = 0x1e46a;
dummy[2] = 0xfc1f97b5;
dummy[1] = 0x3e381c9c;
dummy[0] = 0x14542bfb;
Kset_uipoly_wide((*(generator_multiples1 + 197))->m_U1, dummy, 4);

dummy[3] = 0x4b7a;
dummy[2] = 0x86c4b242;
dummy[1] = 0x9e29a2a0;
dummy[0] = 0x42b38b88;
Kset_uipoly_wide((*(generator_multiples1 + 197))->m_U0, dummy, 4);

dummy[3] = 0x192ea;
dummy[2] = 0x769750fe;
dummy[1] = 0xa950380d;
dummy[0] = 0x277f6121;
Kset_uipoly_wide((*(generator_multiples1 + 197))->m_V1, dummy, 4);

dummy[3] = 0x342b;
dummy[2] = 0x34ba4cd2;
dummy[1] = 0xae932823;
dummy[0] = 0x321d80fa;
Kset_uipoly_wide((*(generator_multiples1 + 197))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 197))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 197))->m_z, 1);

dummy[3] = 0x1b94;
dummy[2] = 0xa36bc028;
dummy[1] = 0x1741f61e;
dummy[0] = 0x6d0422c4;
Kset_uipoly_wide((*(generator_multiples2 + 197))->m_U1, dummy, 4);

dummy[3] = 0x3a2b;
dummy[2] = 0x104264c6;
dummy[1] = 0x2a72cf18;
dummy[0] = 0xdcb5caeb;
Kset_uipoly_wide((*(generator_multiples2 + 197))->m_U0, dummy, 4);

dummy[3] = 0x47fd;
dummy[2] = 0x26007f27;
dummy[1] = 0xbe4eaed6;
dummy[0] = 0x18a5e5b7;
Kset_uipoly_wide((*(generator_multiples2 + 197))->m_V1, dummy, 4);

dummy[3] = 0x17da8;
dummy[2] = 0xbbffe94c;
dummy[1] = 0xfe9caf9b;
dummy[0] = 0x7ce9381a;
Kset_uipoly_wide((*(generator_multiples2 + 197))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 197))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 197))->m_z, 1);

dummy[3] = 0x6432;
dummy[2] = 0x54413ea7;
dummy[1] = 0xf7815eee;
dummy[0] = 0xd8e66da3;
Kset_uipoly_wide((*(generator_multiples1 + 198))->m_U1, dummy, 4);

dummy[3] = 0x3e58;
dummy[2] = 0xca7522ee;
dummy[1] = 0xd6d7938a;
dummy[0] = 0xb0161a7a;
Kset_uipoly_wide((*(generator_multiples1 + 198))->m_U0, dummy, 4);

dummy[3] = 0x31c6;
dummy[2] = 0xaccd78f8;
dummy[1] = 0xba94de36;
dummy[0] = 0xc62264de;
Kset_uipoly_wide((*(generator_multiples1 + 198))->m_V1, dummy, 4);

dummy[3] = 0xd1bd;
dummy[2] = 0x3c66e41;
dummy[1] = 0xa722687b;
dummy[0] = 0x208ae703;
Kset_uipoly_wide((*(generator_multiples1 + 198))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 198))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 198))->m_z, 1);

dummy[3] = 0x114aa;
dummy[2] = 0xf0e04da0;
dummy[1] = 0xa8e76fb5;
dummy[0] = 0x93e3f20c;
Kset_uipoly_wide((*(generator_multiples2 + 198))->m_U1, dummy, 4);

dummy[3] = 0xd9c1;
dummy[2] = 0xb36780b4;
dummy[1] = 0x6a32fc15;
dummy[0] = 0x41d6bdf2;
Kset_uipoly_wide((*(generator_multiples2 + 198))->m_U0, dummy, 4);

dummy[3] = 0x530;
dummy[2] = 0x8f6bf6f8;
dummy[1] = 0xcd67c979;
dummy[0] = 0x2cae2487;
Kset_uipoly_wide((*(generator_multiples2 + 198))->m_V1, dummy, 4);

dummy[3] = 0x1b4e8;
dummy[2] = 0xbac48c4b;
dummy[1] = 0xc0908bd3;
dummy[0] = 0xe3a57f2;
Kset_uipoly_wide((*(generator_multiples2 + 198))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 198))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 198))->m_z, 1);

dummy[3] = 0x1566e;
dummy[2] = 0x2ec65c01;
dummy[1] = 0x314a5dd5;
dummy[0] = 0xf4c6231f;
Kset_uipoly_wide((*(generator_multiples1 + 199))->m_U1, dummy, 4);

dummy[3] = 0x9298;
dummy[2] = 0x34c73f0b;
dummy[1] = 0xace715a1;
dummy[0] = 0xf45229ba;
Kset_uipoly_wide((*(generator_multiples1 + 199))->m_U0, dummy, 4);

dummy[3] = 0x4c5c;
dummy[2] = 0x5964731;
dummy[1] = 0xa0b6a931;
dummy[0] = 0x3db3e514;
Kset_uipoly_wide((*(generator_multiples1 + 199))->m_V1, dummy, 4);

dummy[3] = 0x9904;
dummy[2] = 0xe669eeb7;
dummy[1] = 0x18353ace;
dummy[0] = 0xc7f503bb;
Kset_uipoly_wide((*(generator_multiples1 + 199))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 199))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 199))->m_z, 1);

dummy[3] = 0x1b78c;
dummy[2] = 0xf4760c82;
dummy[1] = 0x58296e70;
dummy[0] = 0xd5886c7e;
Kset_uipoly_wide((*(generator_multiples2 + 199))->m_U1, dummy, 4);

dummy[3] = 0x15bea;
dummy[2] = 0xbd734b7;
dummy[1] = 0xa8fe0871;
dummy[0] = 0x5c6bbb00;
Kset_uipoly_wide((*(generator_multiples2 + 199))->m_U0, dummy, 4);

dummy[3] = 0xc4e2;
dummy[2] = 0xebe46fb;
dummy[1] = 0xde59a718;
dummy[0] = 0xe4dd4f91;
Kset_uipoly_wide((*(generator_multiples2 + 199))->m_V1, dummy, 4);

dummy[3] = 0x1a97c;
dummy[2] = 0x1da770ee;
dummy[1] = 0x1ead38c1;
dummy[0] = 0x50a0ae11;
Kset_uipoly_wide((*(generator_multiples2 + 199))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 199))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 199))->m_z, 1);

dummy[3] = 0x5aa2;
dummy[2] = 0x205ee02b;
dummy[1] = 0x3c7d2a87;
dummy[0] = 0x843678ad;
Kset_uipoly_wide((*(generator_multiples1 + 200))->m_U1, dummy, 4);

dummy[3] = 0x16d53;
dummy[2] = 0x4681c698;
dummy[1] = 0xd8ebbc7f;
dummy[0] = 0x83341af5;
Kset_uipoly_wide((*(generator_multiples1 + 200))->m_U0, dummy, 4);

dummy[3] = 0x4d33;
dummy[2] = 0xd5c226f0;
dummy[1] = 0x6492ae02;
dummy[0] = 0x529c31e;
Kset_uipoly_wide((*(generator_multiples1 + 200))->m_V1, dummy, 4);

dummy[3] = 0x15442;
dummy[2] = 0x41a9cf53;
dummy[1] = 0x40c2c0ef;
dummy[0] = 0x3acb1abc;
Kset_uipoly_wide((*(generator_multiples1 + 200))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 200))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 200))->m_z, 1);

dummy[3] = 0xb3c1;
dummy[2] = 0x9d6d32bb;
dummy[1] = 0xa5a276ad;
dummy[0] = 0xaec42c20;
Kset_uipoly_wide((*(generator_multiples2 + 200))->m_U1, dummy, 4);

dummy[3] = 0x8f2e;
dummy[2] = 0x553a97c9;
dummy[1] = 0xac2c4e41;
dummy[0] = 0x431e6488;
Kset_uipoly_wide((*(generator_multiples2 + 200))->m_U0, dummy, 4);

dummy[3] = 0x4cac;
dummy[2] = 0xb3b95426;
dummy[1] = 0x3daca5f3;
dummy[0] = 0x329886f8;
Kset_uipoly_wide((*(generator_multiples2 + 200))->m_V1, dummy, 4);

dummy[3] = 0x367b;
dummy[2] = 0x1483face;
dummy[1] = 0x988f381a;
dummy[0] = 0x3063f4f9;
Kset_uipoly_wide((*(generator_multiples2 + 200))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 200))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 200))->m_z, 1);

dummy[3] = 0x8aa7;
dummy[2] = 0x306ea26;
dummy[1] = 0xbce5b02f;
dummy[0] = 0xf1fcb0b5;
Kset_uipoly_wide((*(generator_multiples1 + 201))->m_U1, dummy, 4);

dummy[3] = 0x15ed8;
dummy[2] = 0x5130c3a;
dummy[1] = 0x76bc48a6;
dummy[0] = 0xdbdb3636;
Kset_uipoly_wide((*(generator_multiples1 + 201))->m_U0, dummy, 4);

dummy[3] = 0x108fe;
dummy[2] = 0xc8fc393f;
dummy[1] = 0x80ceff6b;
dummy[0] = 0x56d0e5ce;
Kset_uipoly_wide((*(generator_multiples1 + 201))->m_V1, dummy, 4);

dummy[3] = 0x8ba6;
dummy[2] = 0xfcce08d6;
dummy[1] = 0x3378b652;
dummy[0] = 0xf17bc174;
Kset_uipoly_wide((*(generator_multiples1 + 201))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 201))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 201))->m_z, 1);

dummy[3] = 0x13771;
dummy[2] = 0xc6bb007b;
dummy[1] = 0x2f54bb2;
dummy[0] = 0x4d2b9daf;
Kset_uipoly_wide((*(generator_multiples2 + 201))->m_U1, dummy, 4);

dummy[3] = 0x164d4;
dummy[2] = 0x165b1cf5;
dummy[1] = 0x1d703f77;
dummy[0] = 0xdb8402c7;
Kset_uipoly_wide((*(generator_multiples2 + 201))->m_U0, dummy, 4);

dummy[3] = 0x1da5f;
dummy[2] = 0x90f4688d;
dummy[1] = 0x40cb7a11;
dummy[0] = 0x36fd745c;
Kset_uipoly_wide((*(generator_multiples2 + 201))->m_V1, dummy, 4);

dummy[3] = 0x106c2;
dummy[2] = 0x98f22064;
dummy[1] = 0x3a63bbc4;
dummy[0] = 0x7e0e55df;
Kset_uipoly_wide((*(generator_multiples2 + 201))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 201))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 201))->m_z, 1);

dummy[3] = 0xd5b4;
dummy[2] = 0x2c743d3b;
dummy[1] = 0x4f9cbf86;
dummy[0] = 0x7181aa06;
Kset_uipoly_wide((*(generator_multiples1 + 202))->m_U1, dummy, 4);

dummy[3] = 0x18c6f;
dummy[2] = 0xc007ee93;
dummy[1] = 0x1b426cba;
dummy[0] = 0x9f87d7cc;
Kset_uipoly_wide((*(generator_multiples1 + 202))->m_U0, dummy, 4);

dummy[3] = 0x13dd7;
dummy[2] = 0xb563e7e2;
dummy[1] = 0x6f77362b;
dummy[0] = 0x2819d8e2;
Kset_uipoly_wide((*(generator_multiples1 + 202))->m_V1, dummy, 4);

dummy[3] = 0x3945;
dummy[2] = 0xb3c48e4b;
dummy[1] = 0x2fd68baa;
dummy[0] = 0x3423269d;
Kset_uipoly_wide((*(generator_multiples1 + 202))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 202))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 202))->m_z, 1);

dummy[3] = 0x39a2;
dummy[2] = 0x53c65dbc;
dummy[1] = 0x759f1aea;
dummy[0] = 0x1659f906;
Kset_uipoly_wide((*(generator_multiples2 + 202))->m_U1, dummy, 4);

dummy[3] = 0x2b41;
dummy[2] = 0x2c62cf78;
dummy[1] = 0xc7fdae28;
dummy[0] = 0x14228ca2;
Kset_uipoly_wide((*(generator_multiples2 + 202))->m_U0, dummy, 4);

dummy[3] = 0xbdc9;
dummy[2] = 0x997e0510;
dummy[1] = 0x45e9044b;
dummy[0] = 0x1a437932;
Kset_uipoly_wide((*(generator_multiples2 + 202))->m_V1, dummy, 4);

dummy[3] = 0x121a0;
dummy[2] = 0xd1d5d8e9;
dummy[1] = 0xe8e19f70;
dummy[0] = 0x4cef3b2d;
Kset_uipoly_wide((*(generator_multiples2 + 202))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 202))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 202))->m_z, 1);

dummy[3] = 0xcab4;
dummy[2] = 0x9dbec19d;
dummy[1] = 0xf2ab07db;
dummy[0] = 0x8cf086e4;
Kset_uipoly_wide((*(generator_multiples1 + 203))->m_U1, dummy, 4);

dummy[3] = 0x16c8f;
dummy[2] = 0x991c15bd;
dummy[1] = 0x99c6afe6;
dummy[0] = 0x3262900;
Kset_uipoly_wide((*(generator_multiples1 + 203))->m_U0, dummy, 4);

dummy[3] = 0xeb8a;
dummy[2] = 0x8a9cbfc9;
dummy[1] = 0xaac6c626;
dummy[0] = 0xd446fc9d;
Kset_uipoly_wide((*(generator_multiples1 + 203))->m_V1, dummy, 4);

dummy[3] = 0xb873;
dummy[2] = 0x42f35394;
dummy[1] = 0xf350c04;
dummy[0] = 0x628fba55;
Kset_uipoly_wide((*(generator_multiples1 + 203))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 203))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 203))->m_z, 1);

dummy[3] = 0x1fc48;
dummy[2] = 0x71ae4edb;
dummy[1] = 0x48595eec;
dummy[0] = 0x8d14e7eb;
Kset_uipoly_wide((*(generator_multiples2 + 203))->m_U1, dummy, 4);

dummy[3] = 0x6e1a;
dummy[2] = 0xa3befd49;
dummy[1] = 0xb3885347;
dummy[0] = 0x9ed43145;
Kset_uipoly_wide((*(generator_multiples2 + 203))->m_U0, dummy, 4);

dummy[3] = 0x10db7;
dummy[2] = 0xbae2a685;
dummy[1] = 0x404b2887;
dummy[0] = 0x34247e0f;
Kset_uipoly_wide((*(generator_multiples2 + 203))->m_V1, dummy, 4);

dummy[3] = 0xa468;
dummy[2] = 0x96a6bdbe;
dummy[1] = 0x4af88924;
dummy[0] = 0xcf74015c;
Kset_uipoly_wide((*(generator_multiples2 + 203))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 203))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 203))->m_z, 1);

dummy[3] = 0x1a80;
dummy[2] = 0xbf6d90b2;
dummy[1] = 0x1b812d8e;
dummy[0] = 0x9f4c2ae8;
Kset_uipoly_wide((*(generator_multiples1 + 204))->m_U1, dummy, 4);

dummy[3] = 0x17f99;
dummy[2] = 0xef246628;
dummy[1] = 0x3228dcf6;
dummy[0] = 0xde66c188;
Kset_uipoly_wide((*(generator_multiples1 + 204))->m_U0, dummy, 4);

dummy[3] = 0x119bd;
dummy[2] = 0xc2d9249d;
dummy[1] = 0xb786f1d6;
dummy[0] = 0x79714332;
Kset_uipoly_wide((*(generator_multiples1 + 204))->m_V1, dummy, 4);

dummy[3] = 0x1a15a;
dummy[2] = 0xc532dd40;
dummy[1] = 0x608226ed;
dummy[0] = 0x4339ec08;
Kset_uipoly_wide((*(generator_multiples1 + 204))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 204))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 204))->m_z, 1);

dummy[3] = 0x170a0;
dummy[2] = 0xaaf0cfd8;
dummy[1] = 0x4c8aa682;
dummy[0] = 0x83b003c3;
Kset_uipoly_wide((*(generator_multiples2 + 204))->m_U1, dummy, 4);

dummy[3] = 0x215f;
dummy[2] = 0x1eba54dc;
dummy[1] = 0x381d39b1;
dummy[0] = 0x189981b5;
Kset_uipoly_wide((*(generator_multiples2 + 204))->m_U0, dummy, 4);

dummy[3] = 0x4fa5;
dummy[2] = 0xfdd78fee;
dummy[1] = 0x3cfb2b52;
dummy[0] = 0x82896c86;
Kset_uipoly_wide((*(generator_multiples2 + 204))->m_V1, dummy, 4);

dummy[3] = 0x14a22;
dummy[2] = 0x1c4f9b97;
dummy[1] = 0x8fe080ac;
dummy[0] = 0x62deb28c;
Kset_uipoly_wide((*(generator_multiples2 + 204))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 204))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 204))->m_z, 1);

dummy[3] = 0xb018;
dummy[2] = 0xf86aa94d;
dummy[1] = 0x670d833f;
dummy[0] = 0x74db0c6d;
Kset_uipoly_wide((*(generator_multiples1 + 205))->m_U1, dummy, 4);

dummy[3] = 0x173dd;
dummy[2] = 0xe11162ef;
dummy[1] = 0xcdebcbf1;
dummy[0] = 0xb9ac1cb0;
Kset_uipoly_wide((*(generator_multiples1 + 205))->m_U0, dummy, 4);

dummy[3] = 0x2177;
dummy[2] = 0x64f06d8e;
dummy[1] = 0xa850d75c;
dummy[0] = 0xfcf09a5f;
Kset_uipoly_wide((*(generator_multiples1 + 205))->m_V1, dummy, 4);

dummy[3] = 0x986d;
dummy[2] = 0x2cc49e3b;
dummy[1] = 0x9564ff5d;
dummy[0] = 0x6332b59b;
Kset_uipoly_wide((*(generator_multiples1 + 205))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 205))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 205))->m_z, 1);

dummy[3] = 0x7372;
dummy[2] = 0x83f235cc;
dummy[1] = 0x61099a11;
dummy[0] = 0x4a4a8cda;
Kset_uipoly_wide((*(generator_multiples2 + 205))->m_U1, dummy, 4);

dummy[3] = 0x65e3;
dummy[2] = 0x8dc8f9ef;
dummy[1] = 0x4cbb472f;
dummy[0] = 0x15435a6c;
Kset_uipoly_wide((*(generator_multiples2 + 205))->m_U0, dummy, 4);

dummy[3] = 0x27ea;
dummy[2] = 0x3eee4c92;
dummy[1] = 0x39312768;
dummy[0] = 0xa6301409;
Kset_uipoly_wide((*(generator_multiples2 + 205))->m_V1, dummy, 4);

dummy[3] = 0xe5ce;
dummy[2] = 0xd1ade42f;
dummy[1] = 0x2bd6f94a;
dummy[0] = 0xbbd7c3e7;
Kset_uipoly_wide((*(generator_multiples2 + 205))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 205))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 205))->m_z, 1);

dummy[3] = 0x80cc;
dummy[2] = 0x6aa863bf;
dummy[1] = 0x2fac25ca;
dummy[0] = 0x9b5f1fa1;
Kset_uipoly_wide((*(generator_multiples1 + 206))->m_U1, dummy, 4);

dummy[3] = 0x1411f;
dummy[2] = 0x955c766b;
dummy[1] = 0xf4635afe;
dummy[0] = 0x6d744c08;
Kset_uipoly_wide((*(generator_multiples1 + 206))->m_U0, dummy, 4);

dummy[3] = 0x554e;
dummy[2] = 0x5188ab47;
dummy[1] = 0x820d62e5;
dummy[0] = 0x743d4682;
Kset_uipoly_wide((*(generator_multiples1 + 206))->m_V1, dummy, 4);

dummy[3] = 0x15181;
dummy[2] = 0xe969a9a8;
dummy[1] = 0xf0b2c588;
dummy[0] = 0xf4d3750b;
Kset_uipoly_wide((*(generator_multiples1 + 206))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 206))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 206))->m_z, 1);

dummy[3] = 0x94d5;
dummy[2] = 0xc43eb7e7;
dummy[1] = 0x6f8ef500;
dummy[0] = 0x3dbb0075;
Kset_uipoly_wide((*(generator_multiples2 + 206))->m_U1, dummy, 4);

dummy[3] = 0x3c8a;
dummy[2] = 0x3c5b1f22;
dummy[1] = 0xeaf834e4;
dummy[0] = 0x1be5fca;
Kset_uipoly_wide((*(generator_multiples2 + 206))->m_U0, dummy, 4);

dummy[3] = 0x1c1a6;
dummy[2] = 0xb31671c9;
dummy[1] = 0xb7631f05;
dummy[0] = 0x37314c9;
Kset_uipoly_wide((*(generator_multiples2 + 206))->m_V1, dummy, 4);

dummy[3] = 0x16148;
dummy[2] = 0x30491d44;
dummy[1] = 0xb571dde1;
dummy[0] = 0x5cf36b01;
Kset_uipoly_wide((*(generator_multiples2 + 206))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 206))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 206))->m_z, 1);

dummy[3] = 0x17650;
dummy[2] = 0x7524ff93;
dummy[1] = 0x864b690d;
dummy[0] = 0x178d60e;
Kset_uipoly_wide((*(generator_multiples1 + 207))->m_U1, dummy, 4);

dummy[3] = 0x77d0;
dummy[2] = 0x40ad22ff;
dummy[1] = 0x62636dba;
dummy[0] = 0x388b494f;
Kset_uipoly_wide((*(generator_multiples1 + 207))->m_U0, dummy, 4);

dummy[3] = 0x9732;
dummy[2] = 0x2cdfa459;
dummy[1] = 0x117b2b61;
dummy[0] = 0xf17c87fd;
Kset_uipoly_wide((*(generator_multiples1 + 207))->m_V1, dummy, 4);

dummy[3] = 0xa2bb;
dummy[2] = 0x95491dd0;
dummy[1] = 0x2de8b437;
dummy[0] = 0xb924b169;
Kset_uipoly_wide((*(generator_multiples1 + 207))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 207))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 207))->m_z, 1);

dummy[3] = 0x74c0;
dummy[2] = 0x3f230016;
dummy[1] = 0xdbeb224a;
dummy[0] = 0x5fdcca12;
Kset_uipoly_wide((*(generator_multiples2 + 207))->m_U1, dummy, 4);

dummy[3] = 0x15cf3;
dummy[2] = 0xa7c2490b;
dummy[1] = 0x5fdd600d;
dummy[0] = 0x8f48ede9;
Kset_uipoly_wide((*(generator_multiples2 + 207))->m_U0, dummy, 4);

dummy[3] = 0xa662;
dummy[2] = 0x5220aaa6;
dummy[1] = 0x3da30233;
dummy[0] = 0x3b0ef23a;
Kset_uipoly_wide((*(generator_multiples2 + 207))->m_V1, dummy, 4);

dummy[3] = 0x10ee5;
dummy[2] = 0xb1641691;
dummy[1] = 0x877dc3fd;
dummy[0] = 0xd8c668af;
Kset_uipoly_wide((*(generator_multiples2 + 207))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 207))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 207))->m_z, 1);

dummy[3] = 0x77cc;
dummy[2] = 0x48016704;
dummy[1] = 0xc3c88845;
dummy[0] = 0xb6aecf37;
Kset_uipoly_wide((*(generator_multiples1 + 208))->m_U1, dummy, 4);

dummy[3] = 0x87b2;
dummy[2] = 0x4708eb7b;
dummy[1] = 0x4061696d;
dummy[0] = 0xdc503e8b;
Kset_uipoly_wide((*(generator_multiples1 + 208))->m_U0, dummy, 4);

dummy[3] = 0x18a26;
dummy[2] = 0xffef5ebf;
dummy[1] = 0x7f78d36a;
dummy[0] = 0x533278ec;
Kset_uipoly_wide((*(generator_multiples1 + 208))->m_V1, dummy, 4);

dummy[3] = 0xaa58;
dummy[2] = 0xf2d113b6;
dummy[1] = 0x5cd18aa6;
dummy[0] = 0xcc6ce915;
Kset_uipoly_wide((*(generator_multiples1 + 208))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 208))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 208))->m_z, 1);

dummy[3] = 0x15b4a;
dummy[2] = 0x9ef2bab1;
dummy[1] = 0x507c0dc3;
dummy[0] = 0x2d493401;
Kset_uipoly_wide((*(generator_multiples2 + 208))->m_U1, dummy, 4);

dummy[3] = 0x6ea9;
dummy[2] = 0x85c68c1c;
dummy[1] = 0x6953a879;
dummy[0] = 0x3654e83f;
Kset_uipoly_wide((*(generator_multiples2 + 208))->m_U0, dummy, 4);

dummy[3] = 0xb686;
dummy[2] = 0x7bd97f7c;
dummy[1] = 0x15a5a1d5;
dummy[0] = 0xacd84a35;
Kset_uipoly_wide((*(generator_multiples2 + 208))->m_V1, dummy, 4);

dummy[3] = 0x1292b;
dummy[2] = 0x1a2abd96;
dummy[1] = 0xccadd4b;
dummy[0] = 0x8853a63f;
Kset_uipoly_wide((*(generator_multiples2 + 208))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 208))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 208))->m_z, 1);

dummy[3] = 0x160f0;
dummy[2] = 0x2b279449;
dummy[1] = 0x904b5eee;
dummy[0] = 0xcf81527d;
Kset_uipoly_wide((*(generator_multiples1 + 209))->m_U1, dummy, 4);

dummy[3] = 0x1cd0b;
dummy[2] = 0xc5b55c2a;
dummy[1] = 0x524999e3;
dummy[0] = 0x1ef56c80;
Kset_uipoly_wide((*(generator_multiples1 + 209))->m_U0, dummy, 4);

dummy[3] = 0x1d6ea;
dummy[2] = 0x3c80d5d2;
dummy[1] = 0x45163d77;
dummy[0] = 0xdd83e9c6;
Kset_uipoly_wide((*(generator_multiples1 + 209))->m_V1, dummy, 4);

dummy[3] = 0x17d00;
dummy[2] = 0xf3fc4f38;
dummy[1] = 0x959cc1b;
dummy[0] = 0x3c600557;
Kset_uipoly_wide((*(generator_multiples1 + 209))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 209))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 209))->m_z, 1);

dummy[3] = 0x1134d;
dummy[2] = 0x1baad6f9;
dummy[1] = 0xf1891d78;
dummy[0] = 0xca549eb5;
Kset_uipoly_wide((*(generator_multiples2 + 209))->m_U1, dummy, 4);

dummy[3] = 0x1747;
dummy[2] = 0xc98a05bb;
dummy[1] = 0x623939fc;
dummy[0] = 0x2a9063b6;
Kset_uipoly_wide((*(generator_multiples2 + 209))->m_U0, dummy, 4);

dummy[3] = 0x88d3;
dummy[2] = 0xe5da6794;
dummy[1] = 0xfb95066;
dummy[0] = 0x407f0ce;
Kset_uipoly_wide((*(generator_multiples2 + 209))->m_V1, dummy, 4);

dummy[3] = 0x1d00b;
dummy[2] = 0x58c00f60;
dummy[1] = 0x5d7ff48d;
dummy[0] = 0x200bbfe9;
Kset_uipoly_wide((*(generator_multiples2 + 209))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 209))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 209))->m_z, 1);

dummy[3] = 0x9a81;
dummy[2] = 0x72db995a;
dummy[1] = 0xd270700f;
dummy[0] = 0x9fbbec79;
Kset_uipoly_wide((*(generator_multiples1 + 210))->m_U1, dummy, 4);

dummy[3] = 0x53aa;
dummy[2] = 0x12038853;
dummy[1] = 0x931c7d57;
dummy[0] = 0xb6b056a6;
Kset_uipoly_wide((*(generator_multiples1 + 210))->m_U0, dummy, 4);

dummy[3] = 0xe09f;
dummy[2] = 0x25ac816f;
dummy[1] = 0x22f68513;
dummy[0] = 0x815bd4d3;
Kset_uipoly_wide((*(generator_multiples1 + 210))->m_V1, dummy, 4);

dummy[3] = 0x6265;
dummy[2] = 0x9a66784;
dummy[1] = 0xabfe78cc;
dummy[0] = 0x85be3140;
Kset_uipoly_wide((*(generator_multiples1 + 210))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 210))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 210))->m_z, 1);

dummy[3] = 0x13ea4;
dummy[2] = 0xeb254ff7;
dummy[1] = 0x9250faf0;
dummy[0] = 0xb5e351b7;
Kset_uipoly_wide((*(generator_multiples2 + 210))->m_U1, dummy, 4);

dummy[3] = 0x7942;
dummy[2] = 0x572164e6;
dummy[1] = 0x5e681f92;
dummy[0] = 0x60efa40f;
Kset_uipoly_wide((*(generator_multiples2 + 210))->m_U0, dummy, 4);

dummy[3] = 0x5920;
dummy[2] = 0x90e5b327;
dummy[1] = 0xd6eaa075;
dummy[0] = 0xac2db327;
Kset_uipoly_wide((*(generator_multiples2 + 210))->m_V1, dummy, 4);

dummy[3] = 0x1bac;
dummy[2] = 0x58af7482;
dummy[1] = 0x1d2c76f6;
dummy[0] = 0x81d043f1;
Kset_uipoly_wide((*(generator_multiples2 + 210))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 210))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 210))->m_z, 1);

dummy[3] = 0x189bf;
dummy[2] = 0x4abdace2;
dummy[1] = 0x8c30df41;
dummy[0] = 0x1fa05e4f;
Kset_uipoly_wide((*(generator_multiples1 + 211))->m_U1, dummy, 4);

dummy[3] = 0x1399d;
dummy[2] = 0x80a4de1b;
dummy[1] = 0x739b7cc3;
dummy[0] = 0xe327b12c;
Kset_uipoly_wide((*(generator_multiples1 + 211))->m_U0, dummy, 4);

dummy[3] = 0x6966;
dummy[2] = 0x767676ec;
dummy[1] = 0x6120608b;
dummy[0] = 0x9914dff;
Kset_uipoly_wide((*(generator_multiples1 + 211))->m_V1, dummy, 4);

dummy[3] = 0x10d89;
dummy[2] = 0xefc3485e;
dummy[1] = 0x8deb26b5;
dummy[0] = 0x45f44a1c;
Kset_uipoly_wide((*(generator_multiples1 + 211))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 211))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 211))->m_z, 1);

dummy[3] = 0x14e3c;
dummy[2] = 0x77de2faa;
dummy[1] = 0x61dc5488;
dummy[0] = 0xf18ac4e5;
Kset_uipoly_wide((*(generator_multiples2 + 211))->m_U1, dummy, 4);

dummy[3] = 0x1752e;
dummy[2] = 0x4d1b2344;
dummy[1] = 0x3762c513;
dummy[0] = 0x380423ed;
Kset_uipoly_wide((*(generator_multiples2 + 211))->m_U0, dummy, 4);

dummy[3] = 0x1226d;
dummy[2] = 0xe4a82f58;
dummy[1] = 0xb077ac77;
dummy[0] = 0x39b41f16;
Kset_uipoly_wide((*(generator_multiples2 + 211))->m_V1, dummy, 4);

dummy[3] = 0x1a42;
dummy[2] = 0xafc285ea;
dummy[1] = 0x92ebb615;
dummy[0] = 0x2fa33161;
Kset_uipoly_wide((*(generator_multiples2 + 211))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 211))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 211))->m_z, 1);

dummy[3] = 0x790d;
dummy[2] = 0xfe259fed;
dummy[1] = 0xdb57a4f9;
dummy[0] = 0x445718ee;
Kset_uipoly_wide((*(generator_multiples1 + 212))->m_U1, dummy, 4);

dummy[3] = 0x2294;
dummy[2] = 0xa217545f;
dummy[1] = 0x6286a92d;
dummy[0] = 0x9c6b0f2d;
Kset_uipoly_wide((*(generator_multiples1 + 212))->m_U0, dummy, 4);

dummy[3] = 0x1f44b;
dummy[2] = 0xcf1ed09b;
dummy[1] = 0xdf60277c;
dummy[0] = 0x9381685d;
Kset_uipoly_wide((*(generator_multiples1 + 212))->m_V1, dummy, 4);

dummy[3] = 0xf25f;
dummy[2] = 0x2f520d1e;
dummy[1] = 0x13eebde5;
dummy[0] = 0x8f119adf;
Kset_uipoly_wide((*(generator_multiples1 + 212))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 212))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 212))->m_z, 1);

dummy[3] = 0x10e4a;
dummy[2] = 0xf9acb5a3;
dummy[1] = 0xd3d230e8;
dummy[0] = 0x2e300465;
Kset_uipoly_wide((*(generator_multiples2 + 212))->m_U1, dummy, 4);

dummy[3] = 0x10d3b;
dummy[2] = 0x2875a5e5;
dummy[1] = 0xbd46c974;
dummy[0] = 0xe9931457;
Kset_uipoly_wide((*(generator_multiples2 + 212))->m_U0, dummy, 4);

dummy[3] = 0x529d;
dummy[2] = 0x5e36157c;
dummy[1] = 0xe45a746d;
dummy[0] = 0x1ff44cf3;
Kset_uipoly_wide((*(generator_multiples2 + 212))->m_V1, dummy, 4);

dummy[3] = 0x108e2;
dummy[2] = 0xf285d9d6;
dummy[1] = 0x97285abf;
dummy[0] = 0x5ae3a78f;
Kset_uipoly_wide((*(generator_multiples2 + 212))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 212))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 212))->m_z, 1);

dummy[3] = 0x44e6;
dummy[2] = 0x8d8a234e;
dummy[1] = 0x635c4ea8;
dummy[0] = 0x736652f3;
Kset_uipoly_wide((*(generator_multiples1 + 213))->m_U1, dummy, 4);

dummy[3] = 0x2390;
dummy[2] = 0xabfabcd3;
dummy[1] = 0x9d0356d7;
dummy[0] = 0x9c5bd742;
Kset_uipoly_wide((*(generator_multiples1 + 213))->m_U0, dummy, 4);

dummy[3] = 0x70a3;
dummy[2] = 0x7a5c90ef;
dummy[1] = 0xb7679844;
dummy[0] = 0xa37b6a3f;
Kset_uipoly_wide((*(generator_multiples1 + 213))->m_V1, dummy, 4);

dummy[3] = 0x1e7f0;
dummy[2] = 0xc1ddd69b;
dummy[1] = 0x81a1889f;
dummy[0] = 0x539c036c;
Kset_uipoly_wide((*(generator_multiples1 + 213))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 213))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 213))->m_z, 1);

dummy[3] = 0x1a0ea;
dummy[2] = 0x6011655d;
dummy[1] = 0x189943e4;
dummy[0] = 0x3fc9f99e;
Kset_uipoly_wide((*(generator_multiples2 + 213))->m_U1, dummy, 4);

dummy[3] = 0xbce8;
dummy[2] = 0x2dc41b41;
dummy[1] = 0x9fe6e1c0;
dummy[0] = 0x51990e61;
Kset_uipoly_wide((*(generator_multiples2 + 213))->m_U0, dummy, 4);

dummy[3] = 0x1253;
dummy[2] = 0x4eaebfb2;
dummy[1] = 0xd9aa89a8;
dummy[0] = 0x67ad4434;
Kset_uipoly_wide((*(generator_multiples2 + 213))->m_V1, dummy, 4);

dummy[3] = 0xada3;
dummy[2] = 0xfe57234f;
dummy[1] = 0xa5d38a0f;
dummy[0] = 0xda07367f;
Kset_uipoly_wide((*(generator_multiples2 + 213))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 213))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 213))->m_z, 1);

dummy[3] = 0x1880a;
dummy[2] = 0xd43613a4;
dummy[1] = 0x81927d5d;
dummy[0] = 0xfc64d686;
Kset_uipoly_wide((*(generator_multiples1 + 214))->m_U1, dummy, 4);

dummy[3] = 0xf24b;
dummy[2] = 0xe4092a3a;
dummy[1] = 0x9ffdb7dc;
dummy[0] = 0x19e68e77;
Kset_uipoly_wide((*(generator_multiples1 + 214))->m_U0, dummy, 4);

dummy[3] = 0x1c2c8;
dummy[2] = 0xb556a6cb;
dummy[1] = 0x788a0483;
dummy[0] = 0x99b70a7e;
Kset_uipoly_wide((*(generator_multiples1 + 214))->m_V1, dummy, 4);

dummy[3] = 0xfcc6;
dummy[2] = 0x54692278;
dummy[1] = 0x70f9dd67;
dummy[0] = 0x72efed;
Kset_uipoly_wide((*(generator_multiples1 + 214))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 214))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 214))->m_z, 1);

dummy[3] = 0xd890;
dummy[2] = 0x18f420d9;
dummy[1] = 0x6cb0b84d;
dummy[0] = 0xf7dc005c;
Kset_uipoly_wide((*(generator_multiples2 + 214))->m_U1, dummy, 4);

dummy[3] = 0x3733;
dummy[2] = 0xf2abd591;
dummy[1] = 0x551281d6;
dummy[0] = 0x797d1fc;
Kset_uipoly_wide((*(generator_multiples2 + 214))->m_U0, dummy, 4);

dummy[3] = 0x153ee;
dummy[2] = 0x88121149;
dummy[1] = 0x2b00aea8;
dummy[0] = 0x2873ed30;
Kset_uipoly_wide((*(generator_multiples2 + 214))->m_V1, dummy, 4);

dummy[3] = 0xb52a;
dummy[2] = 0x88a9bf35;
dummy[1] = 0xc6e2aac4;
dummy[0] = 0x340088ba;
Kset_uipoly_wide((*(generator_multiples2 + 214))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 214))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 214))->m_z, 1);

dummy[3] = 0x3f03;
dummy[2] = 0x8b2e2c87;
dummy[1] = 0xde67f345;
dummy[0] = 0xec0f7fb5;
Kset_uipoly_wide((*(generator_multiples1 + 215))->m_U1, dummy, 4);

dummy[3] = 0x24ff;
dummy[2] = 0x7adc026e;
dummy[1] = 0x5381a179;
dummy[0] = 0x23dcc6ce;
Kset_uipoly_wide((*(generator_multiples1 + 215))->m_U0, dummy, 4);

dummy[3] = 0x1276;
dummy[2] = 0xc9598370;
dummy[1] = 0x60b4432f;
dummy[0] = 0xd140b73d;
Kset_uipoly_wide((*(generator_multiples1 + 215))->m_V1, dummy, 4);

dummy[3] = 0x1ed21;
dummy[2] = 0x3d1ce048;
dummy[1] = 0xd5baa25;
dummy[0] = 0xb6679a38;
Kset_uipoly_wide((*(generator_multiples1 + 215))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 215))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 215))->m_z, 1);

dummy[3] = 0x1fe8d;
dummy[2] = 0x4d01d36b;
dummy[1] = 0x98823f36;
dummy[0] = 0x51678ff3;
Kset_uipoly_wide((*(generator_multiples2 + 215))->m_U1, dummy, 4);

dummy[3] = 0x91b7;
dummy[2] = 0xcbc6742;
dummy[1] = 0x88c79056;
dummy[0] = 0x7b832c9b;
Kset_uipoly_wide((*(generator_multiples2 + 215))->m_U0, dummy, 4);

dummy[3] = 0x8da0;
dummy[2] = 0xddbac4de;
dummy[1] = 0x577316c7;
dummy[0] = 0xa16abae8;
Kset_uipoly_wide((*(generator_multiples2 + 215))->m_V1, dummy, 4);

dummy[3] = 0x17003;
dummy[2] = 0x81340467;
dummy[1] = 0xe2421d16;
dummy[0] = 0x2dc002fc;
Kset_uipoly_wide((*(generator_multiples2 + 215))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 215))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 215))->m_z, 1);

dummy[3] = 0xe0fd;
dummy[2] = 0x12d982ac;
dummy[1] = 0x8451f7cd;
dummy[0] = 0x843676ac;
Kset_uipoly_wide((*(generator_multiples1 + 216))->m_U1, dummy, 4);

dummy[3] = 0x17066;
dummy[2] = 0xf7167b24;
dummy[1] = 0xcbd4df8d;
dummy[0] = 0x1de8bb7c;
Kset_uipoly_wide((*(generator_multiples1 + 216))->m_U0, dummy, 4);

dummy[3] = 0x966a;
dummy[2] = 0x8849d307;
dummy[1] = 0x28290cd6;
dummy[0] = 0xeab24e18;
Kset_uipoly_wide((*(generator_multiples1 + 216))->m_V1, dummy, 4);

dummy[3] = 0x1307b;
dummy[2] = 0x847c61b6;
dummy[1] = 0x91e51e52;
dummy[0] = 0x10343284;
Kset_uipoly_wide((*(generator_multiples1 + 216))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 216))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 216))->m_z, 1);

dummy[3] = 0x2326;
dummy[2] = 0x9b9ad6be;
dummy[1] = 0x3c63884a;
dummy[0] = 0x7b4651c7;
Kset_uipoly_wide((*(generator_multiples2 + 216))->m_U1, dummy, 4);

dummy[3] = 0x511;
dummy[2] = 0x6aa104d3;
dummy[1] = 0x1608af6d;
dummy[0] = 0xc6667fe6;
Kset_uipoly_wide((*(generator_multiples2 + 216))->m_U0, dummy, 4);

dummy[3] = 0x1ed4f;
dummy[2] = 0x6fa829c7;
dummy[1] = 0x40f13c3d;
dummy[0] = 0xa1bbc3f6;
Kset_uipoly_wide((*(generator_multiples2 + 216))->m_V1, dummy, 4);

dummy[3] = 0x13d2;
dummy[2] = 0x4e63c596;
dummy[1] = 0x8781a6b5;
dummy[0] = 0xf554fbcc;
Kset_uipoly_wide((*(generator_multiples2 + 216))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 216))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 216))->m_z, 1);

dummy[3] = 0x19567;
dummy[2] = 0x82308d79;
dummy[1] = 0xb720290a;
dummy[0] = 0x3918a59;
Kset_uipoly_wide((*(generator_multiples1 + 217))->m_U1, dummy, 4);

dummy[3] = 0x5c0c;
dummy[2] = 0x740518ee;
dummy[1] = 0xf419847b;
dummy[0] = 0xd9eef93e;
Kset_uipoly_wide((*(generator_multiples1 + 217))->m_U0, dummy, 4);

dummy[3] = 0x912f;
dummy[2] = 0x2028455;
dummy[1] = 0xc22a422d;
dummy[0] = 0xac219d19;
Kset_uipoly_wide((*(generator_multiples1 + 217))->m_V1, dummy, 4);

dummy[3] = 0xf9a4;
dummy[2] = 0x60362061;
dummy[1] = 0xb07263e8;
dummy[0] = 0x2cb895bf;
Kset_uipoly_wide((*(generator_multiples1 + 217))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 217))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 217))->m_z, 1);

dummy[3] = 0x7d45;
dummy[2] = 0xd3bc78ba;
dummy[1] = 0xc5d7e26;
dummy[0] = 0xcc98257e;
Kset_uipoly_wide((*(generator_multiples2 + 217))->m_U1, dummy, 4);

dummy[3] = 0x1ae42;
dummy[2] = 0x400c455;
dummy[1] = 0xd855e561;
dummy[0] = 0x12d19446;
Kset_uipoly_wide((*(generator_multiples2 + 217))->m_U0, dummy, 4);

dummy[3] = 0x16941;
dummy[2] = 0x9de8ede2;
dummy[1] = 0xfa1d2054;
dummy[0] = 0x3d4ee1eb;
Kset_uipoly_wide((*(generator_multiples2 + 217))->m_V1, dummy, 4);

dummy[3] = 0x1c7ab;
dummy[2] = 0x1bf25365;
dummy[1] = 0xb355c51b;
dummy[0] = 0x904287c0;
Kset_uipoly_wide((*(generator_multiples2 + 217))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 217))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 217))->m_z, 1);

dummy[3] = 0x1606c;
dummy[2] = 0xbff3af82;
dummy[1] = 0x29665b1c;
dummy[0] = 0x680ca37d;
Kset_uipoly_wide((*(generator_multiples1 + 218))->m_U1, dummy, 4);

dummy[3] = 0xa18c;
dummy[2] = 0xc5956e48;
dummy[1] = 0x68eceb96;
dummy[0] = 0x72025cce;
Kset_uipoly_wide((*(generator_multiples1 + 218))->m_U0, dummy, 4);

dummy[3] = 0xf92c;
dummy[2] = 0xe5980623;
dummy[1] = 0x67c3f5a6;
dummy[0] = 0x7e5053fc;
Kset_uipoly_wide((*(generator_multiples1 + 218))->m_V1, dummy, 4);

dummy[3] = 0xbe06;
dummy[2] = 0xa240f8c1;
dummy[1] = 0x416e1858;
dummy[0] = 0x3bef5ad2;
Kset_uipoly_wide((*(generator_multiples1 + 218))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 218))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 218))->m_z, 1);

dummy[3] = 0x160bc;
dummy[2] = 0xe4ecdbc6;
dummy[1] = 0xdc536ed2;
dummy[0] = 0x21185c9f;
Kset_uipoly_wide((*(generator_multiples2 + 218))->m_U1, dummy, 4);

dummy[3] = 0x19aee;
dummy[2] = 0xb0179917;
dummy[1] = 0x3060856f;
dummy[0] = 0xe2775b1d;
Kset_uipoly_wide((*(generator_multiples2 + 218))->m_U0, dummy, 4);

dummy[3] = 0x1e760;
dummy[2] = 0xcc4f80ab;
dummy[1] = 0xbe62ecf4;
dummy[0] = 0xd35e26a5;
Kset_uipoly_wide((*(generator_multiples2 + 218))->m_V1, dummy, 4);

dummy[3] = 0x5128;
dummy[2] = 0x86f10999;
dummy[1] = 0xeb12cdb2;
dummy[0] = 0xcaf5d89c;
Kset_uipoly_wide((*(generator_multiples2 + 218))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 218))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 218))->m_z, 1);

dummy[3] = 0x1f603;
dummy[2] = 0x795216b4;
dummy[1] = 0x3a0bd3c6;
dummy[0] = 0xcc6b7c8c;
Kset_uipoly_wide((*(generator_multiples1 + 219))->m_U1, dummy, 4);

dummy[3] = 0x9171;
dummy[2] = 0x2c32ed83;
dummy[1] = 0xfa8d29f8;
dummy[0] = 0x3b4099ab;
Kset_uipoly_wide((*(generator_multiples1 + 219))->m_U0, dummy, 4);

dummy[3] = 0x5c19;
dummy[2] = 0xe8bed8d7;
dummy[1] = 0xd109bd68;
dummy[0] = 0x64f4b178;
Kset_uipoly_wide((*(generator_multiples1 + 219))->m_V1, dummy, 4);

dummy[3] = 0x13bbf;
dummy[2] = 0x90ccf5b2;
dummy[1] = 0x18913065;
dummy[0] = 0xf3cceca1;
Kset_uipoly_wide((*(generator_multiples1 + 219))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 219))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 219))->m_z, 1);

dummy[3] = 0x3fab;
dummy[2] = 0x9c538315;
dummy[1] = 0xe3ac6b63;
dummy[0] = 0x79a0b43a;
Kset_uipoly_wide((*(generator_multiples2 + 219))->m_U1, dummy, 4);

dummy[3] = 0xcc;
dummy[2] = 0xa932befc;
dummy[1] = 0x918edf5e;
dummy[0] = 0x2e2902db;
Kset_uipoly_wide((*(generator_multiples2 + 219))->m_U0, dummy, 4);

dummy[3] = 0xb237;
dummy[2] = 0x211191ae;
dummy[1] = 0x5001c563;
dummy[0] = 0xece9674f;
Kset_uipoly_wide((*(generator_multiples2 + 219))->m_V1, dummy, 4);

dummy[3] = 0x1c97f;
dummy[2] = 0x7cfde1f2;
dummy[1] = 0x787a8d6b;
dummy[0] = 0x7717e5a1;
Kset_uipoly_wide((*(generator_multiples2 + 219))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 219))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 219))->m_z, 1);

dummy[3] = 0x2cda;
dummy[2] = 0x7f0060b7;
dummy[1] = 0xf39a2047;
dummy[0] = 0xa98a242d;
Kset_uipoly_wide((*(generator_multiples1 + 220))->m_U1, dummy, 4);

dummy[3] = 0x3ab0;
dummy[2] = 0x3de76e0d;
dummy[1] = 0x17e6e443;
dummy[0] = 0xc5bc2797;
Kset_uipoly_wide((*(generator_multiples1 + 220))->m_U0, dummy, 4);

dummy[3] = 0x1a75e;
dummy[2] = 0x3c863b02;
dummy[1] = 0x9a83ff2;
dummy[0] = 0x4e8c91de;
Kset_uipoly_wide((*(generator_multiples1 + 220))->m_V1, dummy, 4);

dummy[3] = 0x4b74;
dummy[2] = 0x1cc5ecb8;
dummy[1] = 0xc0aedabf;
dummy[0] = 0x84ee3e42;
Kset_uipoly_wide((*(generator_multiples1 + 220))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 220))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 220))->m_z, 1);

dummy[3] = 0x4170;
dummy[2] = 0xe35c1257;
dummy[1] = 0x803369e7;
dummy[0] = 0x9d288ad8;
Kset_uipoly_wide((*(generator_multiples2 + 220))->m_U1, dummy, 4);

dummy[3] = 0x1a6d2;
dummy[2] = 0x73269373;
dummy[1] = 0xadbd048f;
dummy[0] = 0x59335505;
Kset_uipoly_wide((*(generator_multiples2 + 220))->m_U0, dummy, 4);

dummy[3] = 0x168d7;
dummy[2] = 0xb0874b8b;
dummy[1] = 0x2de2b26f;
dummy[0] = 0x6184fdf4;
Kset_uipoly_wide((*(generator_multiples2 + 220))->m_V1, dummy, 4);

dummy[3] = 0x15fc7;
dummy[2] = 0x3f1a8778;
dummy[1] = 0xe24f96c7;
dummy[0] = 0x9f53b7cb;
Kset_uipoly_wide((*(generator_multiples2 + 220))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 220))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 220))->m_z, 1);

dummy[3] = 0x16530;
dummy[2] = 0xb9215136;
dummy[1] = 0xd9ee42e7;
dummy[0] = 0x29658132;
Kset_uipoly_wide((*(generator_multiples1 + 221))->m_U1, dummy, 4);

dummy[3] = 0x1444b;
dummy[2] = 0xcb4b7d78;
dummy[1] = 0x38c61233;
dummy[0] = 0x1124ac0c;
Kset_uipoly_wide((*(generator_multiples1 + 221))->m_U0, dummy, 4);

dummy[3] = 0xa6ce;
dummy[2] = 0x4f58185d;
dummy[1] = 0xb7cc221c;
dummy[0] = 0xbd9843e5;
Kset_uipoly_wide((*(generator_multiples1 + 221))->m_V1, dummy, 4);

dummy[3] = 0x610c;
dummy[2] = 0x6c5e4cf9;
dummy[1] = 0x474c2fcf;
dummy[0] = 0x75f65028;
Kset_uipoly_wide((*(generator_multiples1 + 221))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 221))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 221))->m_z, 1);

dummy[3] = 0xbd04;
dummy[2] = 0x30f35283;
dummy[1] = 0xc96fffc6;
dummy[0] = 0xf10c778d;
Kset_uipoly_wide((*(generator_multiples2 + 221))->m_U1, dummy, 4);

dummy[3] = 0xccd8;
dummy[2] = 0x3cce696;
dummy[1] = 0xdf015860;
dummy[0] = 0x59ed2252;
Kset_uipoly_wide((*(generator_multiples2 + 221))->m_U0, dummy, 4);

dummy[3] = 0xa406;
dummy[2] = 0x4ecec7e9;
dummy[1] = 0xe2a3bc40;
dummy[0] = 0x744b05d6;
Kset_uipoly_wide((*(generator_multiples2 + 221))->m_V1, dummy, 4);

dummy[3] = 0xe2c2;
dummy[2] = 0x66f7913c;
dummy[1] = 0x333f371f;
dummy[0] = 0xda3ef8e0;
Kset_uipoly_wide((*(generator_multiples2 + 221))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 221))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 221))->m_z, 1);

dummy[3] = 0x15e1b;
dummy[2] = 0xab1ba890;
dummy[1] = 0x514e9c08;
dummy[0] = 0xb70a5eec;
Kset_uipoly_wide((*(generator_multiples1 + 222))->m_U1, dummy, 4);

dummy[3] = 0x5920;
dummy[2] = 0x75558e95;
dummy[1] = 0xc8759c68;
dummy[0] = 0x989b770;
Kset_uipoly_wide((*(generator_multiples1 + 222))->m_U0, dummy, 4);

dummy[3] = 0x1ce68;
dummy[2] = 0x2d4433c7;
dummy[1] = 0x9033113d;
dummy[0] = 0xfbb2e3a0;
Kset_uipoly_wide((*(generator_multiples1 + 222))->m_V1, dummy, 4);

dummy[3] = 0xd776;
dummy[2] = 0xd3083fce;
dummy[1] = 0x273f0d07;
dummy[0] = 0x321ab8a4;
Kset_uipoly_wide((*(generator_multiples1 + 222))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 222))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 222))->m_z, 1);

dummy[3] = 0x11c36;
dummy[2] = 0x7998b685;
dummy[1] = 0x94448e95;
dummy[0] = 0x9392b75a;
Kset_uipoly_wide((*(generator_multiples2 + 222))->m_U1, dummy, 4);

dummy[3] = 0x2cce;
dummy[2] = 0xb0337d2c;
dummy[1] = 0xa7a8ca7f;
dummy[0] = 0x5e58b0b0;
Kset_uipoly_wide((*(generator_multiples2 + 222))->m_U0, dummy, 4);

dummy[3] = 0x41d3;
dummy[2] = 0xd64f6c0b;
dummy[1] = 0x1706054f;
dummy[0] = 0x9605dad5;
Kset_uipoly_wide((*(generator_multiples2 + 222))->m_V1, dummy, 4);

dummy[3] = 0x1f381;
dummy[2] = 0x8f1deb88;
dummy[1] = 0xb0133341;
dummy[0] = 0xd1db6e67;
Kset_uipoly_wide((*(generator_multiples2 + 222))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 222))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 222))->m_z, 1);

dummy[3] = 0x1f7f6;
dummy[2] = 0x8cdf38ad;
dummy[1] = 0x6991c88d;
dummy[0] = 0x84aedaa7;
Kset_uipoly_wide((*(generator_multiples1 + 223))->m_U1, dummy, 4);

dummy[3] = 0x130da;
dummy[2] = 0xe9c88bdd;
dummy[1] = 0x52082555;
dummy[0] = 0x28f9854f;
Kset_uipoly_wide((*(generator_multiples1 + 223))->m_U0, dummy, 4);

dummy[3] = 0x1b67;
dummy[2] = 0xab6aa552;
dummy[1] = 0x9f82328b;
dummy[0] = 0x19eaaf94;
Kset_uipoly_wide((*(generator_multiples1 + 223))->m_V1, dummy, 4);

dummy[3] = 0x50d4;
dummy[2] = 0x1a8969b7;
dummy[1] = 0x3b2d0923;
dummy[0] = 0xa7209d7;
Kset_uipoly_wide((*(generator_multiples1 + 223))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 223))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 223))->m_z, 1);

dummy[3] = 0x1aab8;
dummy[2] = 0x48d72655;
dummy[1] = 0xe7b07f36;
dummy[0] = 0x118f40d4;
Kset_uipoly_wide((*(generator_multiples2 + 223))->m_U1, dummy, 4);

dummy[3] = 0xb69f;
dummy[2] = 0xb228e56e;
dummy[1] = 0x5f56b24;
dummy[0] = 0x6625cc89;
Kset_uipoly_wide((*(generator_multiples2 + 223))->m_U0, dummy, 4);

dummy[3] = 0x16a8;
dummy[2] = 0x93bed135;
dummy[1] = 0x75c99d37;
dummy[0] = 0xba246719;
Kset_uipoly_wide((*(generator_multiples2 + 223))->m_V1, dummy, 4);

dummy[3] = 0xf33a;
dummy[2] = 0x5aca69ff;
dummy[1] = 0x56194de8;
dummy[0] = 0xcd987d88;
Kset_uipoly_wide((*(generator_multiples2 + 223))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 223))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 223))->m_z, 1);

dummy[3] = 0x912c;
dummy[2] = 0x33185ebb;
dummy[1] = 0xf9e23ef2;
dummy[0] = 0xff294ae2;
Kset_uipoly_wide((*(generator_multiples1 + 224))->m_U1, dummy, 4);

dummy[3] = 0x9a19;
dummy[2] = 0xc38b9c32;
dummy[1] = 0x6e5e70b1;
dummy[0] = 0xd482931d;
Kset_uipoly_wide((*(generator_multiples1 + 224))->m_U0, dummy, 4);

dummy[3] = 0xb506;
dummy[2] = 0x7a600789;
dummy[1] = 0xc00529e2;
dummy[0] = 0x835f777f;
Kset_uipoly_wide((*(generator_multiples1 + 224))->m_V1, dummy, 4);

dummy[3] = 0xbec5;
dummy[2] = 0xc83fa054;
dummy[1] = 0x33ddc8d3;
dummy[0] = 0x1bcf8eea;
Kset_uipoly_wide((*(generator_multiples1 + 224))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 224))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 224))->m_z, 1);

dummy[3] = 0x7498;
dummy[2] = 0x17ad59a4;
dummy[1] = 0x1aa08eb;
dummy[0] = 0x60c79917;
Kset_uipoly_wide((*(generator_multiples2 + 224))->m_U1, dummy, 4);

dummy[3] = 0x15e15;
dummy[2] = 0x34f7d974;
dummy[1] = 0x888f2bc;
dummy[0] = 0x76bc7463;
Kset_uipoly_wide((*(generator_multiples2 + 224))->m_U0, dummy, 4);

dummy[3] = 0xc917;
dummy[2] = 0x239dc456;
dummy[1] = 0x89e81e9c;
dummy[0] = 0x10bba2f5;
Kset_uipoly_wide((*(generator_multiples2 + 224))->m_V1, dummy, 4);

dummy[3] = 0x12205;
dummy[2] = 0xb09a7c96;
dummy[1] = 0x8627a5;
dummy[0] = 0x3df3b229;
Kset_uipoly_wide((*(generator_multiples2 + 224))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 224))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 224))->m_z, 1);

dummy[3] = 0x1ef90;
dummy[2] = 0xfd84a3be;
dummy[1] = 0x791bc7cb;
dummy[0] = 0x3ca3eb2d;
Kset_uipoly_wide((*(generator_multiples1 + 225))->m_U1, dummy, 4);

dummy[3] = 0xe339;
dummy[2] = 0x4c473634;
dummy[1] = 0x7eacf3df;
dummy[0] = 0xe1cfe70;
Kset_uipoly_wide((*(generator_multiples1 + 225))->m_U0, dummy, 4);

dummy[3] = 0xdf3e;
dummy[2] = 0xe42b0d66;
dummy[1] = 0xca7dd0db;
dummy[0] = 0x3a047733;
Kset_uipoly_wide((*(generator_multiples1 + 225))->m_V1, dummy, 4);

dummy[3] = 0x1065d;
dummy[2] = 0xbe5685c3;
dummy[1] = 0xe9c0c75;
dummy[0] = 0xd10ae435;
Kset_uipoly_wide((*(generator_multiples1 + 225))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 225))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 225))->m_z, 1);

dummy[3] = 0x1310c;
dummy[2] = 0x3c0f8a81;
dummy[1] = 0x75de1f80;
dummy[0] = 0xe57cbf56;
Kset_uipoly_wide((*(generator_multiples2 + 225))->m_U1, dummy, 4);

dummy[3] = 0x6a3d;
dummy[2] = 0x1d3a58d8;
dummy[1] = 0xcf289fcb;
dummy[0] = 0xf1432c23;
Kset_uipoly_wide((*(generator_multiples2 + 225))->m_U0, dummy, 4);

dummy[3] = 0x20f9;
dummy[2] = 0x6e96f7ca;
dummy[1] = 0xf956df5;
dummy[0] = 0xd1219eb6;
Kset_uipoly_wide((*(generator_multiples2 + 225))->m_V1, dummy, 4);

dummy[3] = 0x18ddb;
dummy[2] = 0xf8447d89;
dummy[1] = 0x2d83f895;
dummy[0] = 0xf77516f3;
Kset_uipoly_wide((*(generator_multiples2 + 225))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 225))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 225))->m_z, 1);

dummy[3] = 0xf62c;
dummy[2] = 0xdc4a223c;
dummy[1] = 0x53dfc36d;
dummy[0] = 0x1aab36e7;
Kset_uipoly_wide((*(generator_multiples1 + 226))->m_U1, dummy, 4);

dummy[3] = 0xe6c9;
dummy[2] = 0xd3ca13a9;
dummy[1] = 0xf1e74442;
dummy[0] = 0xf0a0a040;
Kset_uipoly_wide((*(generator_multiples1 + 226))->m_U0, dummy, 4);

dummy[3] = 0xe5fb;
dummy[2] = 0xb9189df3;
dummy[1] = 0x568fd33e;
dummy[0] = 0x7dde2d98;
Kset_uipoly_wide((*(generator_multiples1 + 226))->m_V1, dummy, 4);

dummy[3] = 0x3daf;
dummy[2] = 0xd61e2936;
dummy[1] = 0xc19faaed;
dummy[0] = 0x5f5a5a;
Kset_uipoly_wide((*(generator_multiples1 + 226))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 226))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 226))->m_z, 1);

dummy[3] = 0xc361;
dummy[2] = 0xfac06432;
dummy[1] = 0xc7a3a12f;
dummy[0] = 0xc94187b3;
Kset_uipoly_wide((*(generator_multiples2 + 226))->m_U1, dummy, 4);

dummy[3] = 0x12e78;
dummy[2] = 0x7e6536c3;
dummy[1] = 0xeae11d2a;
dummy[0] = 0xfef3a566;
Kset_uipoly_wide((*(generator_multiples2 + 226))->m_U0, dummy, 4);

dummy[3] = 0xccde;
dummy[2] = 0x83c85b76;
dummy[1] = 0x6dc73239;
dummy[0] = 0x1180c00f;
Kset_uipoly_wide((*(generator_multiples2 + 226))->m_V1, dummy, 4);

dummy[3] = 0x785a;
dummy[2] = 0xe755ac81;
dummy[1] = 0xfa4a6fd0;
dummy[0] = 0x61e13d89;
Kset_uipoly_wide((*(generator_multiples2 + 226))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 226))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 226))->m_z, 1);

dummy[3] = 0x574b;
dummy[2] = 0xadfada71;
dummy[1] = 0x1fdf7689;
dummy[0] = 0xc4ecad63;
Kset_uipoly_wide((*(generator_multiples1 + 227))->m_U1, dummy, 4);

dummy[3] = 0x14f17;
dummy[2] = 0xd7c340b1;
dummy[1] = 0x59af9ea4;
dummy[0] = 0x61c5fae8;
Kset_uipoly_wide((*(generator_multiples1 + 227))->m_U0, dummy, 4);

dummy[3] = 0x1df86;
dummy[2] = 0xa913cf7a;
dummy[1] = 0x3a282c97;
dummy[0] = 0x5b5b6b4f;
Kset_uipoly_wide((*(generator_multiples1 + 227))->m_V1, dummy, 4);

dummy[3] = 0x8d05;
dummy[2] = 0x8780d1b0;
dummy[1] = 0xf0d69f1b;
dummy[0] = 0xa8f12ce1;
Kset_uipoly_wide((*(generator_multiples1 + 227))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 227))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 227))->m_z, 1);

dummy[3] = 0xb389;
dummy[2] = 0xf9a65cd;
dummy[1] = 0x5ae2034d;
dummy[0] = 0x57d2e50b;
Kset_uipoly_wide((*(generator_multiples2 + 227))->m_U1, dummy, 4);

dummy[3] = 0x40d;
dummy[2] = 0xb89b6a29;
dummy[1] = 0x8d662785;
dummy[0] = 0x6dabae93;
Kset_uipoly_wide((*(generator_multiples2 + 227))->m_U0, dummy, 4);

dummy[3] = 0x8968;
dummy[2] = 0x508f8e3d;
dummy[1] = 0xe85f9d7f;
dummy[0] = 0x50b2c7bd;
Kset_uipoly_wide((*(generator_multiples2 + 227))->m_V1, dummy, 4);

dummy[3] = 0xfe62;
dummy[2] = 0xcb117af0;
dummy[1] = 0x928c4735;
dummy[0] = 0xfa9b8f6f;
Kset_uipoly_wide((*(generator_multiples2 + 227))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 227))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 227))->m_z, 1);

dummy[3] = 0x1bea0;
dummy[2] = 0x61fa9894;
dummy[1] = 0x337fb47c;
dummy[0] = 0x5cf8277;
Kset_uipoly_wide((*(generator_multiples1 + 228))->m_U1, dummy, 4);

dummy[3] = 0x4d9b;
dummy[2] = 0xc1a9bc41;
dummy[1] = 0x7a437ae;
dummy[0] = 0x258e7361;
Kset_uipoly_wide((*(generator_multiples1 + 228))->m_U0, dummy, 4);

dummy[3] = 0xdb42;
dummy[2] = 0x27d6e6ea;
dummy[1] = 0xb215ec74;
dummy[0] = 0x25a86d3d;
Kset_uipoly_wide((*(generator_multiples1 + 228))->m_V1, dummy, 4);

dummy[3] = 0x3e4;
dummy[2] = 0xaacfdb0;
dummy[1] = 0x3dafd466;
dummy[0] = 0x3aa2c79f;
Kset_uipoly_wide((*(generator_multiples1 + 228))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 228))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 228))->m_z, 1);

dummy[3] = 0x1ee51;
dummy[2] = 0xa407644;
dummy[1] = 0x4c9d493f;
dummy[0] = 0x8b0a7276;
Kset_uipoly_wide((*(generator_multiples2 + 228))->m_U1, dummy, 4);

dummy[3] = 0x10f32;
dummy[2] = 0x9774d48b;
dummy[1] = 0x6a517c37;
dummy[0] = 0xf8278552;
Kset_uipoly_wide((*(generator_multiples2 + 228))->m_U0, dummy, 4);

dummy[3] = 0xba42;
dummy[2] = 0x877f2dec;
dummy[1] = 0xba105866;
dummy[0] = 0xc62a1bff;
Kset_uipoly_wide((*(generator_multiples2 + 228))->m_V1, dummy, 4);

dummy[3] = 0x144dd;
dummy[2] = 0x897fe2b5;
dummy[1] = 0xfd786548;
dummy[0] = 0x4eef14b5;
Kset_uipoly_wide((*(generator_multiples2 + 228))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 228))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 228))->m_z, 1);

dummy[3] = 0x14257;
dummy[2] = 0xe23e1b2a;
dummy[1] = 0x4e50436;
dummy[0] = 0xdb32ea1f;
Kset_uipoly_wide((*(generator_multiples1 + 229))->m_U1, dummy, 4);

dummy[3] = 0xdafb;
dummy[2] = 0xa57bbe7c;
dummy[1] = 0x259cbcd8;
dummy[0] = 0xb2e0be8d;
Kset_uipoly_wide((*(generator_multiples1 + 229))->m_U0, dummy, 4);

dummy[3] = 0xd4e3;
dummy[2] = 0xbcffe596;
dummy[1] = 0x755fe028;
dummy[0] = 0x1558b1c1;
Kset_uipoly_wide((*(generator_multiples1 + 229))->m_V1, dummy, 4);

dummy[3] = 0x1e1ca;
dummy[2] = 0x8b5a947f;
dummy[1] = 0x1d60d54;
dummy[0] = 0x8782d629;
Kset_uipoly_wide((*(generator_multiples1 + 229))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 229))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 229))->m_z, 1);

dummy[3] = 0x14192;
dummy[2] = 0xedc7d177;
dummy[1] = 0x9ca37414;
dummy[0] = 0xc4a3a098;
Kset_uipoly_wide((*(generator_multiples2 + 229))->m_U1, dummy, 4);

dummy[3] = 0x19b11;
dummy[2] = 0xbb65b790;
dummy[1] = 0xa2a23be1;
dummy[0] = 0x315f20cb;
Kset_uipoly_wide((*(generator_multiples2 + 229))->m_U0, dummy, 4);

dummy[3] = 0x173f3;
dummy[2] = 0x47831bcf;
dummy[1] = 0xa52d14e7;
dummy[0] = 0xbc5b020c;
Kset_uipoly_wide((*(generator_multiples2 + 229))->m_V1, dummy, 4);

dummy[3] = 0x200b;
dummy[2] = 0xda6cfac3;
dummy[1] = 0x52c55c01;
dummy[0] = 0x323d6fd9;
Kset_uipoly_wide((*(generator_multiples2 + 229))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 229))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 229))->m_z, 1);

dummy[3] = 0xb632;
dummy[2] = 0xa08a8279;
dummy[1] = 0xd84917e0;
dummy[0] = 0xc83fe06e;
Kset_uipoly_wide((*(generator_multiples1 + 230))->m_U1, dummy, 4);

dummy[3] = 0x2d0a;
dummy[2] = 0x3a127366;
dummy[1] = 0xcc6c1432;
dummy[0] = 0xcd96e31f;
Kset_uipoly_wide((*(generator_multiples1 + 230))->m_U0, dummy, 4);

dummy[3] = 0xe71f;
dummy[2] = 0x341c5553;
dummy[1] = 0x2707eb2;
dummy[0] = 0x98a5b392;
Kset_uipoly_wide((*(generator_multiples1 + 230))->m_V1, dummy, 4);

dummy[3] = 0x18adc;
dummy[2] = 0x58abff3;
dummy[1] = 0xae94a5dd;
dummy[0] = 0xc71991a6;
Kset_uipoly_wide((*(generator_multiples1 + 230))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 230))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 230))->m_z, 1);

dummy[3] = 0x164f;
dummy[2] = 0x78a5d0e6;
dummy[1] = 0x9d3f67a5;
dummy[0] = 0xf64bcd62;
Kset_uipoly_wide((*(generator_multiples2 + 230))->m_U1, dummy, 4);

dummy[3] = 0x5364;
dummy[2] = 0x21788d90;
dummy[1] = 0x1559cbd9;
dummy[0] = 0x40ab0b8d;
Kset_uipoly_wide((*(generator_multiples2 + 230))->m_U0, dummy, 4);

dummy[3] = 0x1b6c6;
dummy[2] = 0xd048a10d;
dummy[1] = 0xe7fc29f0;
dummy[0] = 0x3c8d2d92;
Kset_uipoly_wide((*(generator_multiples2 + 230))->m_V1, dummy, 4);

dummy[3] = 0x1e3b7;
dummy[2] = 0x2b9ca3ff;
dummy[1] = 0x3f73d779;
dummy[0] = 0x2962ce68;
Kset_uipoly_wide((*(generator_multiples2 + 230))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 230))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 230))->m_z, 1);

dummy[3] = 0x1df06;
dummy[2] = 0x4ba93782;
dummy[1] = 0x9efec2ef;
dummy[0] = 0x799c7171;
Kset_uipoly_wide((*(generator_multiples1 + 231))->m_U1, dummy, 4);

dummy[3] = 0xc9cb;
dummy[2] = 0xdcc8c061;
dummy[1] = 0xd7b3d304;
dummy[0] = 0x2abd106;
Kset_uipoly_wide((*(generator_multiples1 + 231))->m_U0, dummy, 4);

dummy[3] = 0x19cbf;
dummy[2] = 0xa4dffffb;
dummy[1] = 0xd06afa22;
dummy[0] = 0x2d3d68c4;
Kset_uipoly_wide((*(generator_multiples1 + 231))->m_V1, dummy, 4);

dummy[3] = 0x179da;
dummy[2] = 0xc351b765;
dummy[1] = 0x95a0ad0a;
dummy[0] = 0xeecaa1e7;
Kset_uipoly_wide((*(generator_multiples1 + 231))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 231))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 231))->m_z, 1);

dummy[3] = 0x31a9;
dummy[2] = 0x64b53866;
dummy[1] = 0xcf8e3b28;
dummy[0] = 0xe54cbefa;
Kset_uipoly_wide((*(generator_multiples2 + 231))->m_U1, dummy, 4);

dummy[3] = 0x6df6;
dummy[2] = 0x94429f74;
dummy[1] = 0xf32fa18;
dummy[0] = 0x44f342a0;
Kset_uipoly_wide((*(generator_multiples2 + 231))->m_U0, dummy, 4);

dummy[3] = 0x1dafc;
dummy[2] = 0x54cdf0a0;
dummy[1] = 0x188efae;
dummy[0] = 0x9de3cd8;
Kset_uipoly_wide((*(generator_multiples2 + 231))->m_V1, dummy, 4);

dummy[3] = 0x3804;
dummy[2] = 0xab4b6286;
dummy[1] = 0x599e6c28;
dummy[0] = 0x832d6acb;
Kset_uipoly_wide((*(generator_multiples2 + 231))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 231))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 231))->m_z, 1);

dummy[3] = 0x7abf;
dummy[2] = 0x97da17c3;
dummy[1] = 0x430ff0e;
dummy[0] = 0xee02a00e;
Kset_uipoly_wide((*(generator_multiples1 + 232))->m_U1, dummy, 4);

dummy[3] = 0x1f14a;
dummy[2] = 0xaa36e0df;
dummy[1] = 0x95cfc4bf;
dummy[0] = 0x5868a455;
Kset_uipoly_wide((*(generator_multiples1 + 232))->m_U0, dummy, 4);

dummy[3] = 0xe02a;
dummy[2] = 0xc93f5e66;
dummy[1] = 0x8addbe52;
dummy[0] = 0xb157c156;
Kset_uipoly_wide((*(generator_multiples1 + 232))->m_V1, dummy, 4);

dummy[3] = 0x1861;
dummy[2] = 0x22706c2a;
dummy[1] = 0xf8e4a80a;
dummy[0] = 0x1fe6c04e;
Kset_uipoly_wide((*(generator_multiples1 + 232))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 232))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 232))->m_z, 1);

dummy[3] = 0x11681;
dummy[2] = 0xcc137d8f;
dummy[1] = 0x769859ce;
dummy[0] = 0xe03b40b9;
Kset_uipoly_wide((*(generator_multiples2 + 232))->m_U1, dummy, 4);

dummy[3] = 0x1b5f3;
dummy[2] = 0x49acf59;
dummy[1] = 0x79e07732;
dummy[0] = 0x5429ef0e;
Kset_uipoly_wide((*(generator_multiples2 + 232))->m_U0, dummy, 4);

dummy[3] = 0x1393f;
dummy[2] = 0x7661f430;
dummy[1] = 0x5f1718e7;
dummy[0] = 0x965c38a5;
Kset_uipoly_wide((*(generator_multiples2 + 232))->m_V1, dummy, 4);

dummy[3] = 0x474b;
dummy[2] = 0xef5957e8;
dummy[1] = 0x322fcaa4;
dummy[0] = 0x3e0a824e;
Kset_uipoly_wide((*(generator_multiples2 + 232))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 232))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 232))->m_z, 1);

dummy[3] = 0x8457;
dummy[2] = 0x67807fa2;
dummy[1] = 0x6445e565;
dummy[0] = 0x25658386;
Kset_uipoly_wide((*(generator_multiples1 + 233))->m_U1, dummy, 4);

dummy[3] = 0x1511e;
dummy[2] = 0xf9796cae;
dummy[1] = 0x6c61061e;
dummy[0] = 0x44b92a7f;
Kset_uipoly_wide((*(generator_multiples1 + 233))->m_U0, dummy, 4);

dummy[3] = 0xe2e2;
dummy[2] = 0x408447c7;
dummy[1] = 0xe1bfe499;
dummy[0] = 0xe042c414;
Kset_uipoly_wide((*(generator_multiples1 + 233))->m_V1, dummy, 4);

dummy[3] = 0x283e;
dummy[2] = 0x7b4a9e18;
dummy[1] = 0xcb0b324f;
dummy[0] = 0xfaabf8ba;
Kset_uipoly_wide((*(generator_multiples1 + 233))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 233))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 233))->m_z, 1);

dummy[3] = 0x1d5ef;
dummy[2] = 0x7a31ec79;
dummy[1] = 0xc9f3e2a9;
dummy[0] = 0x92f7d28b;
Kset_uipoly_wide((*(generator_multiples2 + 233))->m_U1, dummy, 4);

dummy[3] = 0xfafa;
dummy[2] = 0xdc52e5e7;
dummy[1] = 0x1cd48d2f;
dummy[0] = 0xb400ae43;
Kset_uipoly_wide((*(generator_multiples2 + 233))->m_U0, dummy, 4);

dummy[3] = 0xa8e8;
dummy[2] = 0x8114c802;
dummy[1] = 0x1116164e;
dummy[0] = 0xe7aab6d3;
Kset_uipoly_wide((*(generator_multiples2 + 233))->m_V1, dummy, 4);

dummy[3] = 0x15723;
dummy[2] = 0x29656db9;
dummy[1] = 0xd0c2e932;
dummy[0] = 0xb6f28203;
Kset_uipoly_wide((*(generator_multiples2 + 233))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 233))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 233))->m_z, 1);

dummy[3] = 0x12b2f;
dummy[2] = 0x3b0f1127;
dummy[1] = 0x3f5fdac2;
dummy[0] = 0xfe6125af;
Kset_uipoly_wide((*(generator_multiples1 + 234))->m_U1, dummy, 4);

dummy[3] = 0x7697;
dummy[2] = 0x7fcad0a2;
dummy[1] = 0x69ea66;
dummy[0] = 0x7592f13e;
Kset_uipoly_wide((*(generator_multiples1 + 234))->m_U0, dummy, 4);

dummy[3] = 0x1ed36;
dummy[2] = 0xb0eab5b6;
dummy[1] = 0x93e6e193;
dummy[0] = 0x364bfbdc;
Kset_uipoly_wide((*(generator_multiples1 + 234))->m_V1, dummy, 4);

dummy[3] = 0x13722;
dummy[2] = 0x38d9a1d7;
dummy[1] = 0xa7d12445;
dummy[0] = 0xae5c945a;
Kset_uipoly_wide((*(generator_multiples1 + 234))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 234))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 234))->m_z, 1);

dummy[3] = 0x10852;
dummy[2] = 0x75fd0a12;
dummy[1] = 0x54c91263;
dummy[0] = 0x20559358;
Kset_uipoly_wide((*(generator_multiples2 + 234))->m_U1, dummy, 4);

dummy[3] = 0xba33;
dummy[2] = 0x24fd908b;
dummy[1] = 0x841daf7c;
dummy[0] = 0x663ef435;
Kset_uipoly_wide((*(generator_multiples2 + 234))->m_U0, dummy, 4);

dummy[3] = 0x2281;
dummy[2] = 0x44191e37;
dummy[1] = 0x1e799de3;
dummy[0] = 0x54124248;
Kset_uipoly_wide((*(generator_multiples2 + 234))->m_V1, dummy, 4);

dummy[3] = 0x1a407;
dummy[2] = 0xa7600e39;
dummy[1] = 0x710b4de9;
dummy[0] = 0x56ec0846;
Kset_uipoly_wide((*(generator_multiples2 + 234))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 234))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 234))->m_z, 1);

dummy[3] = 0x1ad1a;
dummy[2] = 0x41798c3a;
dummy[1] = 0xc61c7c96;
dummy[0] = 0x1a2774bd;
Kset_uipoly_wide((*(generator_multiples1 + 235))->m_U1, dummy, 4);

dummy[3] = 0x10e4;
dummy[2] = 0xc07d76d1;
dummy[1] = 0x4697c787;
dummy[0] = 0x9b27b5dc;
Kset_uipoly_wide((*(generator_multiples1 + 235))->m_U0, dummy, 4);

dummy[3] = 0xa038;
dummy[2] = 0x3c4be41a;
dummy[1] = 0xf2eef5cf;
dummy[0] = 0xb499923a;
Kset_uipoly_wide((*(generator_multiples1 + 235))->m_V1, dummy, 4);

dummy[3] = 0x192fd;
dummy[2] = 0x25befbd8;
dummy[1] = 0xe753a1dc;
dummy[0] = 0x65cffdca;
Kset_uipoly_wide((*(generator_multiples1 + 235))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 235))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 235))->m_z, 1);

dummy[3] = 0x1dcd0;
dummy[2] = 0xfb1120ce;
dummy[1] = 0x8c9bee9b;
dummy[0] = 0x68413739;
Kset_uipoly_wide((*(generator_multiples2 + 235))->m_U1, dummy, 4);

dummy[3] = 0x1a564;
dummy[2] = 0xf9729287;
dummy[1] = 0x8552c01d;
dummy[0] = 0x3d41f982;
Kset_uipoly_wide((*(generator_multiples2 + 235))->m_U0, dummy, 4);

dummy[3] = 0x14c62;
dummy[2] = 0x86de0e75;
dummy[1] = 0x8ed3109e;
dummy[0] = 0x3705d28e;
Kset_uipoly_wide((*(generator_multiples2 + 235))->m_V1, dummy, 4);

dummy[3] = 0xb5fc;
dummy[2] = 0x695db681;
dummy[1] = 0x609e15d;
dummy[0] = 0xcfe5715c;
Kset_uipoly_wide((*(generator_multiples2 + 235))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 235))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 235))->m_z, 1);

dummy[3] = 0x38c4;
dummy[2] = 0xd77f9c96;
dummy[1] = 0x2377e05d;
dummy[0] = 0x9c80d483;
Kset_uipoly_wide((*(generator_multiples1 + 236))->m_U1, dummy, 4);

dummy[3] = 0x8112;
dummy[2] = 0x29295527;
dummy[1] = 0x4c566cb5;
dummy[0] = 0x8419b6e5;
Kset_uipoly_wide((*(generator_multiples1 + 236))->m_U0, dummy, 4);

dummy[3] = 0x7160;
dummy[2] = 0x83257cd2;
dummy[1] = 0xb45c1cbb;
dummy[0] = 0xadd0d246;
Kset_uipoly_wide((*(generator_multiples1 + 236))->m_V1, dummy, 4);

dummy[3] = 0x1e9a5;
dummy[2] = 0x30fe48e;
dummy[1] = 0x2ffa6273;
dummy[0] = 0x44b8b8a9;
Kset_uipoly_wide((*(generator_multiples1 + 236))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 236))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 236))->m_z, 1);

dummy[3] = 0x1e7c1;
dummy[2] = 0xcccd65f9;
dummy[1] = 0x55328ba4;
dummy[0] = 0x80af54c6;
Kset_uipoly_wide((*(generator_multiples2 + 236))->m_U1, dummy, 4);

dummy[3] = 0x10618;
dummy[2] = 0x28b02f56;
dummy[1] = 0xafb9e30a;
dummy[0] = 0xbb991913;
Kset_uipoly_wide((*(generator_multiples2 + 236))->m_U0, dummy, 4);

dummy[3] = 0xb30c;
dummy[2] = 0xfb761f8b;
dummy[1] = 0xc8721472;
dummy[0] = 0xe84c6707;
Kset_uipoly_wide((*(generator_multiples2 + 236))->m_V1, dummy, 4);

dummy[3] = 0x10d23;
dummy[2] = 0x4e17cc1c;
dummy[1] = 0xdacc7b6d;
dummy[0] = 0xcbef53cd;
Kset_uipoly_wide((*(generator_multiples2 + 236))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 236))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 236))->m_z, 1);

dummy[3] = 0x9878;
dummy[2] = 0x4b6a180;
dummy[1] = 0x50ea9591;
dummy[0] = 0xcc97fd79;
Kset_uipoly_wide((*(generator_multiples1 + 237))->m_U1, dummy, 4);

dummy[3] = 0xeff2;
dummy[2] = 0xbc73450;
dummy[1] = 0x523ee7e7;
dummy[0] = 0xbfec117;
Kset_uipoly_wide((*(generator_multiples1 + 237))->m_U0, dummy, 4);

dummy[3] = 0xc22d;
dummy[2] = 0xe2b3896f;
dummy[1] = 0xc5f07b74;
dummy[0] = 0x43c0f1d1;
Kset_uipoly_wide((*(generator_multiples1 + 237))->m_V1, dummy, 4);

dummy[3] = 0x1218c;
dummy[2] = 0x4db3f175;
dummy[1] = 0xb8f92518;
dummy[0] = 0x9c029c79;
Kset_uipoly_wide((*(generator_multiples1 + 237))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 237))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 237))->m_z, 1);

dummy[3] = 0x1a0e3;
dummy[2] = 0x18825114;
dummy[1] = 0xe94325ef;
dummy[0] = 0x486a4185;
Kset_uipoly_wide((*(generator_multiples2 + 237))->m_U1, dummy, 4);

dummy[3] = 0x15c1d;
dummy[2] = 0x120e5421;
dummy[1] = 0xb34c6f52;
dummy[0] = 0xb1f8a5be;
Kset_uipoly_wide((*(generator_multiples2 + 237))->m_U0, dummy, 4);

dummy[3] = 0x1acdd;
dummy[2] = 0x92d1d89;
dummy[1] = 0xebf7304e;
dummy[0] = 0x225c815a;
Kset_uipoly_wide((*(generator_multiples2 + 237))->m_V1, dummy, 4);

dummy[3] = 0x1a1d7;
dummy[2] = 0x1c9fd2ff;
dummy[1] = 0x4f455564;
dummy[0] = 0x4e658e3a;
Kset_uipoly_wide((*(generator_multiples2 + 237))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 237))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 237))->m_z, 1);

dummy[3] = 0x8f26;
dummy[2] = 0x5909c4ee;
dummy[1] = 0xd6d71877;
dummy[0] = 0xdcff3cb4;
Kset_uipoly_wide((*(generator_multiples1 + 238))->m_U1, dummy, 4);

dummy[3] = 0x84e;
dummy[2] = 0x4aab63f0;
dummy[1] = 0x7d3cbad0;
dummy[0] = 0x9047d2ae;
Kset_uipoly_wide((*(generator_multiples1 + 238))->m_U0, dummy, 4);

dummy[3] = 0x197e3;
dummy[2] = 0x83ab044d;
dummy[1] = 0xe0a80675;
dummy[0] = 0x2ecabd4e;
Kset_uipoly_wide((*(generator_multiples1 + 238))->m_V1, dummy, 4);

dummy[3] = 0x1e03e;
dummy[2] = 0x98fa7b85;
dummy[1] = 0x1d5a0224;
dummy[0] = 0x65622cac;
Kset_uipoly_wide((*(generator_multiples1 + 238))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 238))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 238))->m_z, 1);

dummy[3] = 0x15cde;
dummy[2] = 0xe2886d44;
dummy[1] = 0x965f0b2;
dummy[0] = 0xbcd6a329;
Kset_uipoly_wide((*(generator_multiples2 + 238))->m_U1, dummy, 4);

dummy[3] = 0xbf81;
dummy[2] = 0x7f5ee98c;
dummy[1] = 0x6b3d6829;
dummy[0] = 0xbf88d992;
Kset_uipoly_wide((*(generator_multiples2 + 238))->m_U0, dummy, 4);

dummy[3] = 0xbc00;
dummy[2] = 0x38aba227;
dummy[1] = 0xeff5ddf1;
dummy[0] = 0xf0d44271;
Kset_uipoly_wide((*(generator_multiples2 + 238))->m_V1, dummy, 4);

dummy[3] = 0x80ef;
dummy[2] = 0x4050d1e3;
dummy[1] = 0x6c825afb;
dummy[0] = 0x93dc0d32;
Kset_uipoly_wide((*(generator_multiples2 + 238))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 238))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 238))->m_z, 1);

dummy[3] = 0xf621;
dummy[2] = 0x6e76ad1e;
dummy[1] = 0xb4682730;
dummy[0] = 0x16a92f02;
Kset_uipoly_wide((*(generator_multiples1 + 239))->m_U1, dummy, 4);

dummy[3] = 0x9f72;
dummy[2] = 0x7cbb03ee;
dummy[1] = 0x455a2f0;
dummy[0] = 0xb3747ec7;
Kset_uipoly_wide((*(generator_multiples1 + 239))->m_U0, dummy, 4);

dummy[3] = 0x3f6b;
dummy[2] = 0x67527615;
dummy[1] = 0xcde943e8;
dummy[0] = 0x1c4afbbb;
Kset_uipoly_wide((*(generator_multiples1 + 239))->m_V1, dummy, 4);

dummy[3] = 0x1fc93;
dummy[2] = 0xdbe4bdb3;
dummy[1] = 0x7f3b687b;
dummy[0] = 0xc48316b5;
Kset_uipoly_wide((*(generator_multiples1 + 239))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 239))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 239))->m_z, 1);

dummy[3] = 0xc45f;
dummy[2] = 0x13363b4e;
dummy[1] = 0x997ceac1;
dummy[0] = 0xb22c7703;
Kset_uipoly_wide((*(generator_multiples2 + 239))->m_U1, dummy, 4);

dummy[3] = 0x127b7;
dummy[2] = 0x60386b39;
dummy[1] = 0xba743ca0;
dummy[0] = 0x28db7f2d;
Kset_uipoly_wide((*(generator_multiples2 + 239))->m_U0, dummy, 4);

dummy[3] = 0xaeea;
dummy[2] = 0xe31eaa93;
dummy[1] = 0xe3c3e648;
dummy[0] = 0x326afb2a;
Kset_uipoly_wide((*(generator_multiples2 + 239))->m_V1, dummy, 4);

dummy[3] = 0x1f76e;
dummy[2] = 0x31fcb1cf;
dummy[1] = 0x9d42effc;
dummy[0] = 0x4f272663;
Kset_uipoly_wide((*(generator_multiples2 + 239))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 239))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 239))->m_z, 1);

dummy[3] = 0x2cd4;
dummy[2] = 0x57babddd;
dummy[1] = 0x7453a3f9;
dummy[0] = 0x1ba5a564;
Kset_uipoly_wide((*(generator_multiples1 + 240))->m_U1, dummy, 4);

dummy[3] = 0x8cf8;
dummy[2] = 0x59fed20c;
dummy[1] = 0x9c76e7a4;
dummy[0] = 0x7a0d3969;
Kset_uipoly_wide((*(generator_multiples1 + 240))->m_U0, dummy, 4);

dummy[3] = 0x7ce1;
dummy[2] = 0xcd8d67e7;
dummy[1] = 0xe01c99a6;
dummy[0] = 0x64865c0e;
Kset_uipoly_wide((*(generator_multiples1 + 240))->m_V1, dummy, 4);

dummy[3] = 0x9dcf;
dummy[2] = 0xee86c598;
dummy[1] = 0xc4f4d400;
dummy[0] = 0x395fd71b;
Kset_uipoly_wide((*(generator_multiples1 + 240))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 240))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 240))->m_z, 1);

dummy[3] = 0x6d86;
dummy[2] = 0x314d3cfe;
dummy[1] = 0x65d1d148;
dummy[0] = 0xaa69a9ba;
Kset_uipoly_wide((*(generator_multiples2 + 240))->m_U1, dummy, 4);

dummy[3] = 0xfaa;
dummy[2] = 0xbe17ac1d;
dummy[1] = 0xbe96c44f;
dummy[0] = 0x561b856f;
Kset_uipoly_wide((*(generator_multiples2 + 240))->m_U0, dummy, 4);

dummy[3] = 0xf192;
dummy[2] = 0x4e64d491;
dummy[1] = 0x8ef41a57;
dummy[0] = 0xedf6e4b7;
Kset_uipoly_wide((*(generator_multiples2 + 240))->m_V1, dummy, 4);

dummy[3] = 0x155cb;
dummy[2] = 0x6cf41969;
dummy[1] = 0xef950ae0;
dummy[0] = 0xfc88a65;
Kset_uipoly_wide((*(generator_multiples2 + 240))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 240))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 240))->m_z, 1);

dummy[3] = 0xa6c2;
dummy[2] = 0x3b3fbd70;
dummy[1] = 0x70cd1cbe;
dummy[0] = 0x5a6435cc;
Kset_uipoly_wide((*(generator_multiples1 + 241))->m_U1, dummy, 4);

dummy[3] = 0x1639b;
dummy[2] = 0x335e7387;
dummy[1] = 0x5c5cc248;
dummy[0] = 0x7d7a4920;
Kset_uipoly_wide((*(generator_multiples1 + 241))->m_U0, dummy, 4);

dummy[3] = 0xc2a6;
dummy[2] = 0xc23f36ef;
dummy[1] = 0x6b623f59;
dummy[0] = 0xa884d15c;
Kset_uipoly_wide((*(generator_multiples1 + 241))->m_V1, dummy, 4);

dummy[3] = 0x17025;
dummy[2] = 0xa2fe0a7b;
dummy[1] = 0xcfa46702;
dummy[0] = 0x5be6923;
Kset_uipoly_wide((*(generator_multiples1 + 241))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 241))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 241))->m_z, 1);

dummy[3] = 0x11cc;
dummy[2] = 0xaa603e2d;
dummy[1] = 0x7fa8303c;
dummy[0] = 0xf834514;
Kset_uipoly_wide((*(generator_multiples2 + 241))->m_U1, dummy, 4);

dummy[3] = 0xe1be;
dummy[2] = 0x5447a9f2;
dummy[1] = 0x67374768;
dummy[0] = 0x3f94e4b;
Kset_uipoly_wide((*(generator_multiples2 + 241))->m_U0, dummy, 4);

dummy[3] = 0x1576d;
dummy[2] = 0xc26c8538;
dummy[1] = 0xe65f4b8a;
dummy[0] = 0x674058eb;
Kset_uipoly_wide((*(generator_multiples2 + 241))->m_V1, dummy, 4);

dummy[3] = 0x10b8a;
dummy[2] = 0xd36f8a3c;
dummy[1] = 0x809b6465;
dummy[0] = 0xe5049e5d;
Kset_uipoly_wide((*(generator_multiples2 + 241))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 241))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 241))->m_z, 1);

dummy[3] = 0x69fc;
dummy[2] = 0x899c969c;
dummy[1] = 0xb04776e8;
dummy[0] = 0x87825c5d;
Kset_uipoly_wide((*(generator_multiples1 + 242))->m_U1, dummy, 4);

dummy[3] = 0x18b8f;
dummy[2] = 0xc2e49b67;
dummy[1] = 0xdcebbdca;
dummy[0] = 0x87f566b5;
Kset_uipoly_wide((*(generator_multiples1 + 242))->m_U0, dummy, 4);

dummy[3] = 0xf656;
dummy[2] = 0x3b71488;
dummy[1] = 0x45105161;
dummy[0] = 0xa96a9f32;
Kset_uipoly_wide((*(generator_multiples1 + 242))->m_V1, dummy, 4);

dummy[3] = 0x12320;
dummy[2] = 0x889de57b;
dummy[1] = 0x28d77a7a;
dummy[0] = 0x827fa78a;
Kset_uipoly_wide((*(generator_multiples1 + 242))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 242))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 242))->m_z, 1);

dummy[3] = 0x12bcd;
dummy[2] = 0xb32c4fdc;
dummy[1] = 0x5f8fc958;
dummy[0] = 0x6e5a8e15;
Kset_uipoly_wide((*(generator_multiples2 + 242))->m_U1, dummy, 4);

dummy[3] = 0xed00;
dummy[2] = 0x3b9c4446;
dummy[1] = 0x5f7967b7;
dummy[0] = 0x31758681;
Kset_uipoly_wide((*(generator_multiples2 + 242))->m_U0, dummy, 4);

dummy[3] = 0x1c540;
dummy[2] = 0xbe08dc50;
dummy[1] = 0xa9735f8e;
dummy[0] = 0xb69bc917;
Kset_uipoly_wide((*(generator_multiples2 + 242))->m_V1, dummy, 4);

dummy[3] = 0x1a5f7;
dummy[2] = 0xe784765e;
dummy[1] = 0x1d21466f;
dummy[0] = 0x8d9fc1cb;
Kset_uipoly_wide((*(generator_multiples2 + 242))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 242))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 242))->m_z, 1);

dummy[3] = 0x51c9;
dummy[2] = 0xac696f5e;
dummy[1] = 0xa0afa838;
dummy[0] = 0xc0ecba50;
Kset_uipoly_wide((*(generator_multiples1 + 243))->m_U1, dummy, 4);

dummy[3] = 0x7fc2;
dummy[2] = 0x97040052;
dummy[1] = 0xc960c2d4;
dummy[0] = 0x2f9a79a4;
Kset_uipoly_wide((*(generator_multiples1 + 243))->m_U0, dummy, 4);

dummy[3] = 0x2d4f;
dummy[2] = 0x2b862c8c;
dummy[1] = 0xccc63972;
dummy[0] = 0xec4f9bca;
Kset_uipoly_wide((*(generator_multiples1 + 243))->m_V1, dummy, 4);

dummy[3] = 0x9219;
dummy[2] = 0x543e2b6;
dummy[1] = 0x42400d34;
dummy[0] = 0x25f19534;
Kset_uipoly_wide((*(generator_multiples1 + 243))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 243))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 243))->m_z, 1);

dummy[3] = 0x1ede5;
dummy[2] = 0x18ba715f;
dummy[1] = 0x7a4e0d21;
dummy[0] = 0xe780772e;
Kset_uipoly_wide((*(generator_multiples2 + 243))->m_U1, dummy, 4);

dummy[3] = 0x1cb10;
dummy[2] = 0x99273a96;
dummy[1] = 0xd4a5d1de;
dummy[0] = 0x294468cc;
Kset_uipoly_wide((*(generator_multiples2 + 243))->m_U0, dummy, 4);

dummy[3] = 0x6127;
dummy[2] = 0xdf756944;
dummy[1] = 0x6ae20145;
dummy[0] = 0x52d21b17;
Kset_uipoly_wide((*(generator_multiples2 + 243))->m_V1, dummy, 4);

dummy[3] = 0xbc1f;
dummy[2] = 0xfa9a1458;
dummy[1] = 0x1ba5664;
dummy[0] = 0x61dfe505;
Kset_uipoly_wide((*(generator_multiples2 + 243))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 243))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 243))->m_z, 1);

dummy[3] = 0x11e2;
dummy[2] = 0xe49e2def;
dummy[1] = 0x1e20d524;
dummy[0] = 0xb950f9bf;
Kset_uipoly_wide((*(generator_multiples1 + 244))->m_U1, dummy, 4);

dummy[3] = 0x3666;
dummy[2] = 0x27fbb1cb;
dummy[1] = 0xa2a91173;
dummy[0] = 0xcc39818f;
Kset_uipoly_wide((*(generator_multiples1 + 244))->m_U0, dummy, 4);

dummy[3] = 0x42f6;
dummy[2] = 0xaba35de3;
dummy[1] = 0xe879e469;
dummy[0] = 0x92d3991a;
Kset_uipoly_wide((*(generator_multiples1 + 244))->m_V1, dummy, 4);

dummy[3] = 0x14f8;
dummy[2] = 0x9f0ffbd5;
dummy[1] = 0xff6af0e6;
dummy[0] = 0x6ac50083;
Kset_uipoly_wide((*(generator_multiples1 + 244))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 244))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 244))->m_z, 1);

dummy[3] = 0x1e3cb;
dummy[2] = 0xfe302c4;
dummy[1] = 0x972720ee;
dummy[0] = 0xfd3322df;
Kset_uipoly_wide((*(generator_multiples2 + 244))->m_U1, dummy, 4);

dummy[3] = 0x1d56c;
dummy[2] = 0xa2b4c3a9;
dummy[1] = 0xa9e40357;
dummy[0] = 0x980ead2d;
Kset_uipoly_wide((*(generator_multiples2 + 244))->m_U0, dummy, 4);

dummy[3] = 0x137f5;
dummy[2] = 0xbba9955e;
dummy[1] = 0x456dd1;
dummy[0] = 0x2e16bb7c;
Kset_uipoly_wide((*(generator_multiples2 + 244))->m_V1, dummy, 4);

dummy[3] = 0x6fe4;
dummy[2] = 0x6a51c7cb;
dummy[1] = 0x77968e02;
dummy[0] = 0xdc7eb129;
Kset_uipoly_wide((*(generator_multiples2 + 244))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 244))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 244))->m_z, 1);

dummy[3] = 0x3bff;
dummy[2] = 0xb94bf755;
dummy[1] = 0x1b901aa0;
dummy[0] = 0xe7f5c295;
Kset_uipoly_wide((*(generator_multiples1 + 245))->m_U1, dummy, 4);

dummy[3] = 0xa66c;
dummy[2] = 0xc5ea1c4f;
dummy[1] = 0x2c7080e2;
dummy[0] = 0xfe789cc7;
Kset_uipoly_wide((*(generator_multiples1 + 245))->m_U0, dummy, 4);

dummy[3] = 0x14ef4;
dummy[2] = 0x850a43e7;
dummy[1] = 0x26e6f552;
dummy[0] = 0x5046236b;
Kset_uipoly_wide((*(generator_multiples1 + 245))->m_V1, dummy, 4);

dummy[3] = 0x1db8c;
dummy[2] = 0x53de2a80;
dummy[1] = 0x6082674;
dummy[0] = 0xeda83d73;
Kset_uipoly_wide((*(generator_multiples1 + 245))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 245))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 245))->m_z, 1);

dummy[3] = 0x19956;
dummy[2] = 0x89b5f073;
dummy[1] = 0x6f58574e;
dummy[0] = 0x85f2989a;
Kset_uipoly_wide((*(generator_multiples2 + 245))->m_U1, dummy, 4);

dummy[3] = 0xaa7d;
dummy[2] = 0x1b3fefa1;
dummy[1] = 0xb4bd6699;
dummy[0] = 0x65b1964c;
Kset_uipoly_wide((*(generator_multiples2 + 245))->m_U0, dummy, 4);

dummy[3] = 0x161b8;
dummy[2] = 0x49979c78;
dummy[1] = 0x4e0f5d45;
dummy[0] = 0x5cfdbe78;
Kset_uipoly_wide((*(generator_multiples2 + 245))->m_V1, dummy, 4);

dummy[3] = 0x10eac;
dummy[2] = 0xcbe11ef1;
dummy[1] = 0x657e34a5;
dummy[0] = 0xd2ccb1da;
Kset_uipoly_wide((*(generator_multiples2 + 245))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 245))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 245))->m_z, 1);

dummy[3] = 0xc7bb;
dummy[2] = 0x2f510167;
dummy[1] = 0x46c683f4;
dummy[0] = 0xce0d18f8;
Kset_uipoly_wide((*(generator_multiples1 + 246))->m_U1, dummy, 4);

dummy[3] = 0x1120a;
dummy[2] = 0x50d399f0;
dummy[1] = 0xfac314f3;
dummy[0] = 0x19986192;
Kset_uipoly_wide((*(generator_multiples1 + 246))->m_U0, dummy, 4);

dummy[3] = 0x2e7b;
dummy[2] = 0xe16e6663;
dummy[1] = 0x5cfc70ba;
dummy[0] = 0xa8c76432;
Kset_uipoly_wide((*(generator_multiples1 + 246))->m_V1, dummy, 4);

dummy[3] = 0x6ec5;
dummy[2] = 0xd7d09a57;
dummy[1] = 0xca004b63;
dummy[0] = 0xade7fa0f;
Kset_uipoly_wide((*(generator_multiples1 + 246))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 246))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 246))->m_z, 1);

dummy[3] = 0x85cb;
dummy[2] = 0xe9d5cd9c;
dummy[1] = 0x62fcfe66;
dummy[0] = 0xa1c43edb;
Kset_uipoly_wide((*(generator_multiples2 + 246))->m_U1, dummy, 4);

dummy[3] = 0x19153;
dummy[2] = 0x3da20d4;
dummy[1] = 0xb5a2ba6c;
dummy[0] = 0x82622d22;
Kset_uipoly_wide((*(generator_multiples2 + 246))->m_U0, dummy, 4);

dummy[3] = 0x11e60;
dummy[2] = 0xbf1ffd90;
dummy[1] = 0x731dcde5;
dummy[0] = 0x3d5abd61;
Kset_uipoly_wide((*(generator_multiples2 + 246))->m_V1, dummy, 4);

dummy[3] = 0x6100;
dummy[2] = 0x1fd66db1;
dummy[1] = 0xe79bb7dc;
dummy[0] = 0x7ab85047;
Kset_uipoly_wide((*(generator_multiples2 + 246))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 246))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 246))->m_z, 1);

dummy[3] = 0x5367;
dummy[2] = 0x36eaac1;
dummy[1] = 0x7d861a2b;
dummy[0] = 0xaceab9dc;
Kset_uipoly_wide((*(generator_multiples1 + 247))->m_U1, dummy, 4);

dummy[3] = 0x511f;
dummy[2] = 0xc760ea20;
dummy[1] = 0xe3c13b1c;
dummy[0] = 0xb274fdee;
Kset_uipoly_wide((*(generator_multiples1 + 247))->m_U0, dummy, 4);

dummy[3] = 0x31ed;
dummy[2] = 0xa1749bca;
dummy[1] = 0x11e1a0ee;
dummy[0] = 0x6957cd9f;
Kset_uipoly_wide((*(generator_multiples1 + 247))->m_V1, dummy, 4);

dummy[3] = 0x75d1;
dummy[2] = 0x6ba0c3eb;
dummy[1] = 0x5af90745;
dummy[0] = 0x3b0a017a;
Kset_uipoly_wide((*(generator_multiples1 + 247))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 247))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 247))->m_z, 1);

dummy[3] = 0x1ed67;
dummy[2] = 0x941e739d;
dummy[1] = 0x4f627f5d;
dummy[0] = 0x5519fe42;
Kset_uipoly_wide((*(generator_multiples2 + 247))->m_U1, dummy, 4);

dummy[3] = 0x1040c;
dummy[2] = 0x25b6d0a8;
dummy[1] = 0x7c737f2e;
dummy[0] = 0x125e6422;
Kset_uipoly_wide((*(generator_multiples2 + 247))->m_U0, dummy, 4);

dummy[3] = 0x124f5;
dummy[2] = 0xdd08c469;
dummy[1] = 0x2938ce18;
dummy[0] = 0x67c517c6;
Kset_uipoly_wide((*(generator_multiples2 + 247))->m_V1, dummy, 4);

dummy[3] = 0x11a72;
dummy[2] = 0xa31ed745;
dummy[1] = 0xcc1469ec;
dummy[0] = 0x364875ed;
Kset_uipoly_wide((*(generator_multiples2 + 247))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 247))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 247))->m_z, 1);

dummy[3] = 0x2d7c;
dummy[2] = 0xc68d8d2c;
dummy[1] = 0x9536278b;
dummy[0] = 0x7cebc159;
Kset_uipoly_wide((*(generator_multiples1 + 248))->m_U1, dummy, 4);

dummy[3] = 0x1ccfd;
dummy[2] = 0x98c86da4;
dummy[1] = 0x5a881bc;
dummy[0] = 0x8a4db5c0;
Kset_uipoly_wide((*(generator_multiples1 + 248))->m_U0, dummy, 4);

dummy[3] = 0x8bb0;
dummy[2] = 0x8aaf30c4;
dummy[1] = 0x73067edd;
dummy[0] = 0xb101159d;
Kset_uipoly_wide((*(generator_multiples1 + 248))->m_V1, dummy, 4);

dummy[3] = 0xcceb;
dummy[2] = 0xa99a16e3;
dummy[1] = 0xbcdc2c7d;
dummy[0] = 0xf58167d5;
Kset_uipoly_wide((*(generator_multiples1 + 248))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 248))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 248))->m_z, 1);

dummy[3] = 0x12b52;
dummy[2] = 0x4a89b518;
dummy[1] = 0x8248f6aa;
dummy[0] = 0xc65b300e;
Kset_uipoly_wide((*(generator_multiples2 + 248))->m_U1, dummy, 4);

dummy[3] = 0x1c41b;
dummy[2] = 0xe78c9002;
dummy[1] = 0x43af6aaa;
dummy[0] = 0xf07e1405;
Kset_uipoly_wide((*(generator_multiples2 + 248))->m_U0, dummy, 4);

dummy[3] = 0x1b608;
dummy[2] = 0x10a5f313;
dummy[1] = 0x96f2b884;
dummy[0] = 0x646f783e;
Kset_uipoly_wide((*(generator_multiples2 + 248))->m_V1, dummy, 4);

dummy[3] = 0x31df;
dummy[2] = 0x1e3deb46;
dummy[1] = 0xa6cf7e48;
dummy[0] = 0x1714b139;
Kset_uipoly_wide((*(generator_multiples2 + 248))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 248))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 248))->m_z, 1);

dummy[3] = 0xed49;
dummy[2] = 0x4b3711d3;
dummy[1] = 0xe7e35709;
dummy[0] = 0x95518e60;
Kset_uipoly_wide((*(generator_multiples1 + 249))->m_U1, dummy, 4);

dummy[3] = 0xa872;
dummy[2] = 0x7caa5a6d;
dummy[1] = 0x81967461;
dummy[0] = 0xb7b2b321;
Kset_uipoly_wide((*(generator_multiples1 + 249))->m_U0, dummy, 4);

dummy[3] = 0x14b33;
dummy[2] = 0x13aec071;
dummy[1] = 0x132ecd96;
dummy[0] = 0xc9833388;
Kset_uipoly_wide((*(generator_multiples1 + 249))->m_V1, dummy, 4);

dummy[3] = 0x1ff01;
dummy[2] = 0x1228294;
dummy[1] = 0xe5a89f91;
dummy[0] = 0x2eb453f0;
Kset_uipoly_wide((*(generator_multiples1 + 249))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 249))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 249))->m_z, 1);

dummy[3] = 0x1b82e;
dummy[2] = 0x20e39b45;
dummy[1] = 0x170abf4;
dummy[0] = 0xa331f5a8;
Kset_uipoly_wide((*(generator_multiples2 + 249))->m_U1, dummy, 4);

dummy[3] = 0xe97a;
dummy[2] = 0x27e0e649;
dummy[1] = 0xd8b43ac1;
dummy[0] = 0x7ae12033;
Kset_uipoly_wide((*(generator_multiples2 + 249))->m_U0, dummy, 4);

dummy[3] = 0x1bb13;
dummy[2] = 0xd790ec4a;
dummy[1] = 0xe4a0f8a7;
dummy[0] = 0x53cc92a2;
Kset_uipoly_wide((*(generator_multiples2 + 249))->m_V1, dummy, 4);

dummy[3] = 0x1dc97;
dummy[2] = 0x84bdd9c4;
dummy[1] = 0x5ab0676;
dummy[0] = 0xdb4b6a0f;
Kset_uipoly_wide((*(generator_multiples2 + 249))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 249))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 249))->m_z, 1);

dummy[3] = 0x4667;
dummy[2] = 0xc4b77c39;
dummy[1] = 0x512d3628;
dummy[0] = 0x7041cff4;
Kset_uipoly_wide((*(generator_multiples1 + 250))->m_U1, dummy, 4);

dummy[3] = 0x16754;
dummy[2] = 0xecf6758;
dummy[1] = 0x4dfc5fc9;
dummy[0] = 0xb2a570be;
Kset_uipoly_wide((*(generator_multiples1 + 250))->m_U0, dummy, 4);

dummy[3] = 0x21b;
dummy[2] = 0xa0fb8047;
dummy[1] = 0xdfca61b8;
dummy[0] = 0xb8286aef;
Kset_uipoly_wide((*(generator_multiples1 + 250))->m_V1, dummy, 4);

dummy[3] = 0x1bc2c;
dummy[2] = 0x1787cceb;
dummy[1] = 0xd65757ef;
dummy[0] = 0x6c3a6a80;
Kset_uipoly_wide((*(generator_multiples1 + 250))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 250))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 250))->m_z, 1);

dummy[3] = 0x14d8f;
dummy[2] = 0xe6f27e3b;
dummy[1] = 0x536c09b;
dummy[0] = 0x50410199;
Kset_uipoly_wide((*(generator_multiples2 + 250))->m_U1, dummy, 4);

dummy[3] = 0x1760c;
dummy[2] = 0x741fb643;
dummy[1] = 0x97c1dabd;
dummy[0] = 0x9dadea28;
Kset_uipoly_wide((*(generator_multiples2 + 250))->m_U0, dummy, 4);

dummy[3] = 0x18eb6;
dummy[2] = 0x29a45cb5;
dummy[1] = 0x9d7a557a;
dummy[0] = 0x56fca9f9;
Kset_uipoly_wide((*(generator_multiples2 + 250))->m_V1, dummy, 4);

dummy[3] = 0x18fc;
dummy[2] = 0xdd5f9281;
dummy[1] = 0xbab211bc;
dummy[0] = 0x9d35112a;
Kset_uipoly_wide((*(generator_multiples2 + 250))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 250))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 250))->m_z, 1);

dummy[3] = 0x8d4;
dummy[2] = 0xf9e740e2;
dummy[1] = 0xa8a70351;
dummy[0] = 0xd0a18f80;
Kset_uipoly_wide((*(generator_multiples1 + 251))->m_U1, dummy, 4);

dummy[3] = 0x87ac;
dummy[2] = 0xff76cacb;
dummy[1] = 0x469f70ba;
dummy[0] = 0x5c22aed5;
Kset_uipoly_wide((*(generator_multiples1 + 251))->m_U0, dummy, 4);

dummy[3] = 0x4195;
dummy[2] = 0xec6c4f0a;
dummy[1] = 0xaf28d95b;
dummy[0] = 0xf07a6a00;
Kset_uipoly_wide((*(generator_multiples1 + 251))->m_V1, dummy, 4);

dummy[3] = 0x15a2d;
dummy[2] = 0x88c71be8;
dummy[1] = 0x62fa92e9;
dummy[0] = 0xd3af18b4;
Kset_uipoly_wide((*(generator_multiples1 + 251))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 251))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 251))->m_z, 1);

dummy[3] = 0x1c63f;
dummy[2] = 0x69975098;
dummy[1] = 0x326e9ad5;
dummy[0] = 0x2c67832e;
Kset_uipoly_wide((*(generator_multiples2 + 251))->m_U1, dummy, 4);

dummy[3] = 0x1d6d5;
dummy[2] = 0x89c97543;
dummy[1] = 0xcbe89a14;
dummy[0] = 0xe4429dc3;
Kset_uipoly_wide((*(generator_multiples2 + 251))->m_U0, dummy, 4);

dummy[3] = 0x175ad;
dummy[2] = 0x8adf2588;
dummy[1] = 0x693b389c;
dummy[0] = 0x4021a23f;
Kset_uipoly_wide((*(generator_multiples2 + 251))->m_V1, dummy, 4);

dummy[3] = 0x19bb;
dummy[2] = 0xa71ac9f4;
dummy[1] = 0x88e40407;
dummy[0] = 0xbc4d6215;
Kset_uipoly_wide((*(generator_multiples2 + 251))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 251))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 251))->m_z, 1);

dummy[3] = 0x6d0a;
dummy[2] = 0x37f6556f;
dummy[1] = 0xaa0cdbd3;
dummy[0] = 0xde61ed53;
Kset_uipoly_wide((*(generator_multiples1 + 252))->m_U1, dummy, 4);

dummy[3] = 0x13f42;
dummy[2] = 0xc7f1e7e3;
dummy[1] = 0xd0973d73;
dummy[0] = 0x6951a7ed;
Kset_uipoly_wide((*(generator_multiples1 + 252))->m_U0, dummy, 4);

dummy[3] = 0x195dd;
dummy[2] = 0xa2c836b;
dummy[1] = 0x1d5a947d;
dummy[0] = 0xf3c5bfe1;
Kset_uipoly_wide((*(generator_multiples1 + 252))->m_V1, dummy, 4);

dummy[3] = 0xbd31;
dummy[2] = 0x332067fb;
dummy[1] = 0xc1e5bb82;
dummy[0] = 0x6c74eb58;
Kset_uipoly_wide((*(generator_multiples1 + 252))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 252))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 252))->m_z, 1);

dummy[3] = 0x1f09c;
dummy[2] = 0xd94437a2;
dummy[1] = 0xab9b7056;
dummy[0] = 0x93a3c64d;
Kset_uipoly_wide((*(generator_multiples2 + 252))->m_U1, dummy, 4);

dummy[3] = 0x10ecb;
dummy[2] = 0x6603e016;
dummy[1] = 0x44483892;
dummy[0] = 0xddbbf736;
Kset_uipoly_wide((*(generator_multiples2 + 252))->m_U0, dummy, 4);

dummy[3] = 0x1317e;
dummy[2] = 0x3be191bc;
dummy[1] = 0x40891865;
dummy[0] = 0x727c94a2;
Kset_uipoly_wide((*(generator_multiples2 + 252))->m_V1, dummy, 4);

dummy[3] = 0x100e3;
dummy[2] = 0xf49566a3;
dummy[1] = 0xe6a06490;
dummy[0] = 0xb8245e56;
Kset_uipoly_wide((*(generator_multiples2 + 252))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 252))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 252))->m_z, 1);

dummy[3] = 0xb204;
dummy[2] = 0xd7774c2e;
dummy[1] = 0x71b02518;
dummy[0] = 0x6120895f;
Kset_uipoly_wide((*(generator_multiples1 + 253))->m_U1, dummy, 4);

dummy[3] = 0xdc43;
dummy[2] = 0x2a9c9d3e;
dummy[1] = 0x765a7424;
dummy[0] = 0x39a3598a;
Kset_uipoly_wide((*(generator_multiples1 + 253))->m_U0, dummy, 4);

dummy[3] = 0x1d29b;
dummy[2] = 0xca957280;
dummy[1] = 0x84d32440;
dummy[0] = 0x7e9157bf;
Kset_uipoly_wide((*(generator_multiples1 + 253))->m_V1, dummy, 4);

dummy[3] = 0x13815;
dummy[2] = 0x3858bdf1;
dummy[1] = 0xacf1188b;
dummy[0] = 0xd59663fe;
Kset_uipoly_wide((*(generator_multiples1 + 253))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 253))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 253))->m_z, 1);

dummy[3] = 0x4614;
dummy[2] = 0x132c80ad;
dummy[1] = 0xa9cd0ed3;
dummy[0] = 0x690c28ce;
Kset_uipoly_wide((*(generator_multiples2 + 253))->m_U1, dummy, 4);

dummy[3] = 0x7b5f;
dummy[2] = 0x823152fa;
dummy[1] = 0x706472f7;
dummy[0] = 0x7d395431;
Kset_uipoly_wide((*(generator_multiples2 + 253))->m_U0, dummy, 4);

dummy[3] = 0x61d4;
dummy[2] = 0xa1fcc76d;
dummy[1] = 0xbf0b5421;
dummy[0] = 0xf52c0d87;
Kset_uipoly_wide((*(generator_multiples2 + 253))->m_V1, dummy, 4);

dummy[3] = 0x19111;
dummy[2] = 0xbf364ede;
dummy[1] = 0x9b4d503a;
dummy[0] = 0x8cb0addf;
Kset_uipoly_wide((*(generator_multiples2 + 253))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 253))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 253))->m_z, 1);

dummy[3] = 0x1ff38;
dummy[2] = 0x49d85f94;
dummy[1] = 0x7853ca91;
dummy[0] = 0xe48488da;
Kset_uipoly_wide((*(generator_multiples1 + 254))->m_U1, dummy, 4);

dummy[3] = 0x5d97;
dummy[2] = 0x9d0f836b;
dummy[1] = 0xd7f1f76b;
dummy[0] = 0x2ec64668;
Kset_uipoly_wide((*(generator_multiples1 + 254))->m_U0, dummy, 4);

dummy[3] = 0xe9ec;
dummy[2] = 0x5329e532;
dummy[1] = 0xe19819ef;
dummy[0] = 0xf6511d5d;
Kset_uipoly_wide((*(generator_multiples1 + 254))->m_V1, dummy, 4);

dummy[3] = 0xee74;
dummy[2] = 0x496883e4;
dummy[1] = 0xd97813f;
dummy[0] = 0x5d3ea941;
Kset_uipoly_wide((*(generator_multiples1 + 254))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 254))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 254))->m_z, 1);

dummy[3] = 0x13495;
dummy[2] = 0x38760c60;
dummy[1] = 0xde5e5e2b;
dummy[0] = 0xa70b250d;
Kset_uipoly_wide((*(generator_multiples2 + 254))->m_U1, dummy, 4);

dummy[3] = 0xe13e;
dummy[2] = 0x36b6b946;
dummy[1] = 0x32fce0bd;
dummy[0] = 0xce32117b;
Kset_uipoly_wide((*(generator_multiples2 + 254))->m_U0, dummy, 4);

dummy[3] = 0xe329;
dummy[2] = 0x13d6240c;
dummy[1] = 0xc2e9cd81;
dummy[0] = 0xc6c1e2d0;
Kset_uipoly_wide((*(generator_multiples2 + 254))->m_V1, dummy, 4);

dummy[3] = 0x1b52b;
dummy[2] = 0x2d0181f1;
dummy[1] = 0xb5247aef;
dummy[0] = 0x5fccbf92;
Kset_uipoly_wide((*(generator_multiples2 + 254))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 254))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 254))->m_z, 1);

dummy[3] = 0x1e1d;
dummy[2] = 0x3bbc6c75;
dummy[1] = 0xd8f9638a;
dummy[0] = 0x5dd1312e;
Kset_uipoly_wide((*(generator_multiples1 + 255))->m_U1, dummy, 4);

dummy[3] = 0x11970;
dummy[2] = 0xa3a890e9;
dummy[1] = 0xb4dbf32f;
dummy[0] = 0xbb083118;
Kset_uipoly_wide((*(generator_multiples1 + 255))->m_U0, dummy, 4);

dummy[3] = 0x73a4;
dummy[2] = 0x51c63d77;
dummy[1] = 0x4f383666;
dummy[0] = 0x3ef16c78;
Kset_uipoly_wide((*(generator_multiples1 + 255))->m_V1, dummy, 4);

dummy[3] = 0x9aab;
dummy[2] = 0xdb957303;
dummy[1] = 0x2ecb9152;
dummy[0] = 0xb14d3e76;
Kset_uipoly_wide((*(generator_multiples1 + 255))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples1 + 255))->m_Z, 1);

Kset_uipoly((*(generator_multiples1 + 255))->m_z, 1);

dummy[3] = 0x1ef30;
dummy[2] = 0x721fd915;
dummy[1] = 0x4526021e;
dummy[0] = 0xaf00c248;
Kset_uipoly_wide((*(generator_multiples2 + 255))->m_U1, dummy, 4);

dummy[3] = 0x16112;
dummy[2] = 0x7eb50fe8;
dummy[1] = 0x892f0e73;
dummy[0] = 0x7dc718f;
Kset_uipoly_wide((*(generator_multiples2 + 255))->m_U0, dummy, 4);

dummy[3] = 0x38dc;
dummy[2] = 0xa12d2d18;
dummy[1] = 0xcc46f326;
dummy[0] = 0x72c6b7d2;
Kset_uipoly_wide((*(generator_multiples2 + 255))->m_V1, dummy, 4);

dummy[3] = 0x61e;
dummy[2] = 0x8f1ea011;
dummy[1] = 0x5b6e6293;
dummy[0] = 0x9b218c81;
Kset_uipoly_wide((*(generator_multiples2 + 255))->m_V0, dummy, 4);

Kset_uipoly((*(generator_multiples2 + 255))->m_Z, 1);

Kset_uipoly((*(generator_multiples2 + 255))->m_z, 1);

