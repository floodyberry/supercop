//# Algorithm Name: MCSSHA-6
//# Principal Submitter: Mikhail Maslennikov
//# Revision: 08.06.2009 

#ifndef HEADER_MCSSHA6_MACROS_H
#define HEADER_MCSSHA6_MACROS_H

#define ADD_POINTS \
             x1++; \
             x2++; \
             x3++; \
             x4++

#define MOD_POINTS28 \
             if(x1 == 28)x1=0; \
             if(x2 == 28)x2=0; \
             if(x3 == 28)x3=0; \
             if(x4 == 28)x4=0


#define MOD_POINTS32 \
             x1&= (0x1F); \
             x2&= (0x1F); \
             x3&= (0x1F); \
             x4&= (0x1F)

#define MOD_POINTS48 \
             if(x1 == 48)x1=0; \
             if(x2 == 48)x2=0; \
             if(x3 == 48)x3=0; \
             if(x4 == 48)x4=0

#define MOD_POINTS64 \
             x1&= (0x3F); \
             x2&= (0x3F); \
             x3&= (0x3F); \
             x4&= (0x3F)

#define MOD_POINTS128 \
             x1&= (0x7F); \
             x2&= (0x7F); \
             x3&= (0x7F); \
             x4&= (0x7F)


#define INCREASE_POINTS28 \
	         ADD_POINTS; \
			 MOD_POINTS28

#define INCREASE_POINTS32 \
	         ADD_POINTS; \
			 MOD_POINTS32

#define INCREASE_POINTS48 \
	         ADD_POINTS; \
			 MOD_POINTS48

#define INCREASE_POINTS64 \
	         ADD_POINTS; \
			 MOD_POINTS64

#define INCREASE_POINTS128 \
	         ADD_POINTS; \
			 MOD_POINTS128

#define SUBSTITUTION \
     c->data[x1] = S[(unsigned char)(c->data[x1] - c->data[x2] - c->data[x3] + c->data[x4])]

#define SUBSTITUTION_M(m) \
     SUBSTITUTION + m

#define SUBSTITUTION_FINAL \
     SR[x1] = S[(unsigned char)(SR[x1] - SR[x2] - SR[x3] + SR[x4])]

#define SUBSTITUTION_FINAL_M(m) \
     SUBSTITUTION_FINAL + m


#define DELAY_64 \
     SUBSTITUTION; \
     INCREASE_POINTS64

#define DELAY_128 \
     SUBSTITUTION; \
     INCREASE_POINTS128

#define REMAIN_BITS \
	 empty = last ^ (data[i]>>bits); \
	 last = data[i]<<(8-bits)

#endif	

