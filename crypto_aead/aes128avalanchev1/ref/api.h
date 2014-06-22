//-------------------------------------------------------------------------------
//-- Title        : AVALANCHE
//-- File         : api.h
//-- Project      : aes128avalanchev1.1
//-- Author       : C4C Development Team
//-- Organization : King Abdulaziz City for Science and Technology (KACST)
//-- Created      : 08.01.2014
//-------------------------------------------------------------------------------
//-- Copyright (C) KACST-C4C
//-- All rights reserved. Reproduction in whole or part is prohibited
//-- without the written permission of the copyright owner.
//-------------------------------------------------------------------------------
#define CRYPTO_KEYBYTES 48
#define CRYPTO_NSECBYTES 0
#define CRYPTO_NPUBBYTES 26 //10 for nonce and 16 for r
#define CRYPTO_ABYTES 48 //16 for r, 16 for tag, 1 for EOT, 15 for padding
#define CRYPTO_NOOVERLAP 1
