#ifndef _CONVERSION_H_
#define _CONVERSION_H_

#include <stdio.h>
#include <stdlib.h>


typedef unsigned long long uint64;
typedef unsigned int uint32;
typedef unsigned short uint16;
typedef unsigned char uint8;


#define div31__(x) __asm__ __volatile__( \
"movq $595056260442243601, %%r8\n\t" \
"movq %1, %%rax\n\t" \
"mulq %%r8\n\t" \
"addq %1, %%rdx\n\t" \
"rcrq %%rdx\n\t" \
"shrq $4, %%rdx\n\t" \
"movq %%rdx, %0\n\t" \
:"=r"(x) \
:"r"(x) \
:"rax","r8","rdx" );


#define div31_r(x,rr) __asm__ __volatile__ ( \
"movq $595056260442243601, %%r8\n\t" \
"movq %2, %1\n\t" \
"movq %2, %%rax\n\t" \
"mulq %%r8\n\t" \
"addq %2, %%rdx\n\t" \
"rcrq %%rdx\n\t" \
"shrq $4, %%rdx\n\t" \
"movq %%rdx, %0\n\t" \
"shlq $5, %%rdx\n\t" \
"subq %0, %%rdx\n\t" \
"subq %%rdx, %1\n\t" \
:"=r"(x),"=r"(rr) \
:"r"(x) \
:"rax","r8","rdx","rdi" );

template <unsigned num_gf31>
void convert_to_31( uint8 * b , uint64 a )
{
	uint64 tmp;
	for( unsigned i=0;i<num_gf31 ; i++ ) {
		div31_r( a , tmp );
		b[i] = tmp;
	}
}

template <unsigned num_gf31>
void convert_from_31( uint64 & a , uint8 * b )
{
	if( 13 <= num_gf31 ) {
		a = b[12];
		a = ((a<<5)-a) + b[11];
		a = ((a<<5)-a) + b[10];
		a = ((a<<5)-a) + b[9];
		a = ((a<<5)-a) + b[8];
		a = ((a<<5)-a) + b[7];
		a = ((a<<5)-a) + b[6];
		a = ((a<<5)-a) + b[5];
		a = ((a<<5)-a) + b[4];
		a = ((a<<5)-a) + b[3];
		a = ((a<<5)-a) + b[2];
		a = ((a<<5)-a) + b[1];
		a = (a*31) + b[0];
	} 	else {
		a = b[num_gf31-1];
		for( unsigned i = (num_gf31-1) ; i-- ; ) { a = ((a<<5)-a) + b[i]; }
	}
}


#endif
