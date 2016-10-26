#include <stdio.h>
#include "silc.h"
#include <stdlib.h>

#ifndef __UTILIS_H
#define __UTILIS_H

typedef unsigned int        u32;
typedef unsigned long long  u64;

inline static u64 rdtsc(){
	#if defined(__i386__)
	        u64 cycles;
	        __asm__ volatile (".byte 0x0f, 0x31" : "=A"(cycles));
	        return cycles;
	#else
	#if defined(__x86_64__)
	        u32 hi, lo;
	        __asm__ volatile ("rdtsc" : "=a"(lo), "=d"(hi));
	        return (((u64)lo) | ((u64)(hi) << 32));
	#else
		#error "Unsupported architecture for counting cycles"
	#endif
	#endif
}

#endif