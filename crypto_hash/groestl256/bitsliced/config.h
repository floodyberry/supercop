
//--------------------------------------------------------------------------
// Bit-sliced implementation of Groestl-256 for AMD64/Intel 64
// Author: Stefan Tillich (Stefan.Tillich@iaik.tugraz.at)
//--------------------------------------------------------------------------
// (c) 2009, TU Graz. This file is received from TU Graz for evaluation and
// scientific purposes only. The recipient will not modify or distribute
// this implementation of Groestl without the prior consent of TU-Graz. The
// recipient is aware that any commercial use requires commercial licensing
// from TU Graz or SIC. Additionally, the recipient agrees to put a link to
// TU-Graz-IAIK's research web [1] on any publication that is produced from
// results using the source code.
//
// [1] http://www.iaik.tugraz.at/content/research/
//--------------------------------------------------------------------------


#ifndef CONFIG_H
#define CONFIG_H

// Specify target platform (defined in Makefile)
// - TARGET_LIN64: 64-bit Linux (using gcc)
// - TARGET_WIN64: 64-bit Windows (using mingw64)
//#define TARGET_LIN64
//#define TARGET_WIN64

// Specify the highest available SSE version of the target processor
// - SSSE3: All extensions up to SSSE3 (includes SSE, SSE2, SSE3, SSSE3)
// - SSE41: All extensions up to SSE4.1 (includes SSE, SSE2, SSE3, SSSE3, SSE4.1)
#define SSSE3
//#define SSE41

// Specify whether the memory address message to hash is 16-byte aligned
// - INPUT_ALIGNMENT_16: Input message is aligned to 16-byte boundary, i.e.,
//   the four least significant bit of its address are zero.
// - INPUT_ALIGNMENT_NONE: No aligment of the input message is presumed.
//#define INPUT_ALIGNMENT_16
#define INPUT_ALIGNMENT_NONE

// Specify whether the buffer for writing the message digest is 16-byte aligned
// - OUTPUT_ALIGNMENT_16: The output buffer is aligned to 16-byte boundary, i.e.,
//   the four least significant bit of its address are zero.
// - OUTPUT_ALIGNMENT_NONE: No aligment of the output buffer is presumed.
//#define OUTPUT_ALIGNMENT_16
#define OUTPUT_ALIGNMENT_NONE

// Specify whether to include a correctness check in the main function
// - CORRECTNESS_CHECK: If defined, a correctness check is performed
//#define CORRECTNESS_CHECK


// --------------------------------------------------------

// Set a default target (64-bit Linux) if none is specified.
#ifndef TARGET_LIN64
#ifndef	TARGET_WIN64
#define TARGET_LIN64
#endif
#endif

#endif