#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#include "crypto_dh.h"

/* #define HAVE_MAIN */ 

#define CACHE_SAFE

#ifdef CACHE_SAFE
#define WINDOW 4
#define PANES  131
#else
#define WINDOW 6
#define PANES 87
#endif

typedef __int128 type128;
typedef int64_t type64;

static const type64 bot58bits = 0x3ffffffffffffff;
static const type64 bot52bits = 0xfffffffffffff;

/* Point Structure */

typedef struct {
type64 x[9];
type64 y[9];
type64 z[9];
type64 t[9];
} ECp;

/* w=x+y */
void gadd(type64 *x,type64 *y,type64 *w)
{
	w[0]=x[0]+y[0];
	w[1]=x[1]+y[1];
	w[2]=x[2]+y[2];
	w[3]=x[3]+y[3];
	w[4]=x[4]+y[4];
	w[5]=x[5]+y[5];
	w[6]=x[6]+y[6];
	w[7]=x[7]+y[7];
	w[8]=x[8]+y[8];
}

/* w=x-y */
void gsub(type64 *x,type64 *y,type64 *w)
{
	w[0]=x[0]-y[0];
	w[1]=x[1]-y[1];
	w[2]=x[2]-y[2];
	w[3]=x[3]-y[3];
	w[4]=x[4]-y[4];
	w[5]=x[5]-y[5];
	w[6]=x[6]-y[6];
	w[7]=x[7]-y[7];
	w[8]=x[8]-y[8];
}

/* w-=x */
void gdec(type64 *x,type64 *w)
{
	w[0]-=x[0];
	w[1]-=x[1];
	w[2]-=x[2];
	w[3]-=x[3];
	w[4]-=x[4];
	w[5]-=x[5];
	w[6]-=x[6];
	w[7]-=x[7];
	w[8]-=x[8];
}

/* w=x */
void gcopy(type64 *x,type64 *w)
{
	w[0]=x[0];
	w[1]=x[1];
	w[2]=x[2];
	w[3]=x[3];
	w[4]=x[4];
	w[5]=x[5];
	w[6]=x[6];
	w[7]=x[7];
	w[8]=x[8];
}

/* w*=2 */
void gmul2(type64 *w)
{
	w[0]*=2;
	w[1]*=2;
	w[2]*=2;
	w[3]*=2;
	w[4]*=2;
	w[5]*=2;
	w[6]*=2;
	w[7]*=2;
	w[8]*=2;
}

/* w-=2*x */
void gsb2(type64 *x,type64 *w)
{
	w[0]-=2*x[0];
	w[1]-=2*x[1];
	w[2]-=2*x[2];
	w[3]-=2*x[3];
	w[4]-=2*x[4];
	w[5]-=2*x[5];
	w[6]-=2*x[6];
	w[7]-=2*x[7];
	w[8]-=2*x[8];
}

/* reduce w - Short Coefficient Reduction */
void scr(type64 *w)
{
	type64 t0,t1,t2;
	t0=w[0]&bot58bits;

	t1=w[1]+(w[0]>>58);
	w[1]=t1&bot58bits;

	t2=w[2]+(t1>>58);
	w[2]=t2&bot58bits;

	t1=w[3]+(t2>>58);
	w[3]=t1&bot58bits;

	t2=w[4]+(t1>>58);
	w[4]=t2&bot58bits;

	t1=w[5]+(t2>>58);
	w[5]=t1&bot58bits;

	t2=w[6]+(t1>>58);
	w[6]=t2&bot58bits;

	t1=w[7]+(t2>>58);
	w[7]=t1&bot58bits;

	t2=w[8]+(t1>>58);
	w[8]=t2&bot58bits;

	w[0]=t0+2*(t2>>58);	
}

/* multiply w by a constant, w*=i */

void gmuli(type64 *w,int i)
{
	type128 t;

	t=(type128)w[0]*i;
	w[0]=((type64)t)&bot58bits;

	t=(type128)w[1]*i+(t>>58);
	w[1]=((type64)t)&bot58bits;

	t=(type128)w[2]*i+(t>>58);
	w[2]=((type64)t)&bot58bits;

	t=(type128)w[3]*i+(t>>58);
	w[3]=((type64)t)&bot58bits;

	t=(type128)w[4]*i+(t>>58);
	w[4]=((type64)t)&bot58bits;

	t=(type128)w[5]*i+(t>>58);
	w[5]=((type64)t)&bot58bits;

	t=(type128)w[6]*i+(t>>58);
	w[6]=((type64)t)&bot58bits;

	t=(type128)w[7]*i+(t>>58);
	w[7]=((type64)t)&bot58bits;

	t=(type128)w[8]*i+(t>>58);
	w[8]=((type64)t)&bot58bits;

	w[0]+=2*(t>>58);
}

/* z=x^2 */

void gsqr(type64 *x,type64 *z)
{
	type128 t0,t1,t2;
	t1=2*((type128)x[0]*x[8]+(type128)x[1]*x[7]+(type128)x[2]*x[6]+(type128)x[3]*x[5])   +(type128)x[4]*x[4];
	t0=((type64) t1)&bot58bits;
	t2=4*((type128)x[1]*x[8]+(type128)x[2]*x[7]+(type128)x[3]*x[6]+(type128)x[4]*x[5])   +(type128)x[0]*x[0]+2*(t1>>58);
	z[0]=((type64) t2)&bot58bits;
	t1=4*((type128)x[2]*x[8]+(type128)x[3]*x[7]+(type128)x[4]*x[6])     +2*((type128)x[0]*x[1]+(type128)x[5]*x[5])  +(t2>>58);
	z[1]=((type64) t1)&bot58bits;
	t2=4*((type128)x[3]*x[8]+(type128)x[4]*x[7]+(type128)x[5]*x[6])     +2*(type128)x[0]*x[2]+(type128)x[1]*x[1]+(t1>>58);
	z[2]=((type64) t2)&bot58bits;
	t1=4*((type128)x[4]*x[8]+(type128)x[5]*x[7])      +2*((type128)x[0]*x[3]+(type128)x[1]*x[2]+(type128)x[6]*x[6])  +(t2>>58);
	z[3]=((type64) t1)&bot58bits;
	t2=4*((type128)x[5]*x[8]+(type128)x[6]*x[7])+2*((type128)x[0]*x[4]+(type128)x[1]*x[3])+(type128)x[2]*x[2]+(t1>>58);
	z[4]=((type64) t2)&bot58bits;
	t1=4*(type128)x[6]*x[8]+2*((type128)x[0]*x[5]+(type128)x[1]*x[4]+(type128)x[2]*x[3]+(type128)x[7]*x[7])+(t2>>58);
	z[5]=((type64) t1)&bot58bits;
	t2=4*(type128)x[7]*x[8]+2*((type128)x[0]*x[6]+(type128)x[1]*x[5]+(type128)x[2]*x[4])+(type128)x[3]*x[3]+(t1>>58);
	z[6]=((type64) t2)&bot58bits;
	t1=2*((type128)x[0]*x[7]+(type128)x[1]*x[6]+(type128)x[2]*x[5]+(type128)x[3]*x[4]+(type128)x[8]*x[8])+(t2>>58);
	z[7]=((type64) t1)&bot58bits;
	t0+=(t1>>58);
	z[8]=((type64)t0)&bot58bits;
	z[0]+=2*(type64)(t0>>58);
}

/* z=2x^2 */

void gsqr2(type64 *x,type64 *z)
{
	type128 t0,t1,t2;
	t1=4*((type128)x[0]*x[8]+(type128)x[1]*x[7]+(type128)x[2]*x[6]+(type128)x[3]*x[5])   +(type128)x[4]*(2*x[4]);
	t0=((type64) t1)&bot58bits;
	t2=8*((type128)x[1]*x[8]+(type128)x[2]*x[7]+(type128)x[3]*x[6]+(type128)x[4]*x[5])   +2*((type128)x[0]*x[0]+(t1>>58));
	z[0]=((type64) t2)&bot58bits;
	t1=8*((type128)x[2]*x[8]+(type128)x[3]*x[7]+(type128)x[4]*x[6])     +4*((type128)x[0]*x[1]+(type128)x[5]*x[5])  +(t2>>58);
	z[1]=((type64) t1)&bot58bits;
	t2=8*((type128)x[3]*x[8]+(type128)x[4]*x[7]+(type128)x[5]*x[6])     +4*(type128)x[0]*x[2]+(type128)x[1]*(2*x[1])+(t1>>58);
	z[2]=((type64) t2)&bot58bits;
	t1=8*((type128)x[4]*x[8]+(type128)x[5]*x[7])      +4*((type128)x[0]*x[3]+(type128)x[1]*x[2]+(type128)x[6]*x[6])  +(t2>>58);
	z[3]=((type64) t1)&bot58bits;
	t2=8*((type128)x[5]*x[8]+(type128)x[6]*x[7])  +4*((type128)x[0]*x[4]+(type128)x[1]*x[3])  +(type128)x[2]*(2*x[2])  +(t1>>58);
	z[4]=((type64) t2)&bot58bits;
	t1=8*(type128)x[6]*x[8]  +4*((type128)x[0]*x[5]+(type128)x[1]*x[4]+(type128)x[2]*x[3]+(type128)x[7]*x[7])  +(t2>>58);
	z[5]=((type64) t1)&bot58bits;
	t2=8*(type128)x[7]*x[8]  +4*((type128)x[0]*x[6]+(type128)x[1]*x[5]+(type128)x[2]*x[4])  +(type128)x[3]*(2*x[3])  +(t1>>58);
	z[6]=((type64) t2)&bot58bits;
	t1=4*((type128)x[0]*x[7]+(type128)x[1]*x[6]+(type128)x[2]*x[5]+(type128)x[3]*x[4]+(type128)x[8]*x[8])  +(t2>>58);
	z[7]=((type64) t1)&bot58bits;
	t0+=(t1>>58);
	z[8]=((type64)t0)&bot58bits;
	z[0]+=2*(type64)(t0>>58);
}


/* z=x*y - Granger's method */

void gmul(type64 *x,type64 *y,type64 *z)
{
	type128 t0=(type128)x[0]*y[0] + 
		(type128)x[1]*y[1] + 
		(type128)x[2]*y[2] +
		(type128)x[3]*y[3] +
		(type128)x[4]*y[4];
	type128 t2,t3;
	type128 t5=(type128)x[5]*y[5];
	type128 t6=(type128)x[6]*y[6];
	type128 t7=(type128)x[7]*y[7];
	type128 t8=(type128)x[8]*y[8];
	type128 t1=t5+t6+t7+t8;
	t2=t0+t1-(type128)(x[0]-x[8])*(y[0]-y[8])-(type128)(x[1]-x[7])*(y[1]-y[7])
		-(type128)(x[2]-x[6])*(y[2]-y[6])-(type128)(x[3]-x[5])*(y[3]-y[5]);
	t0+=4*t1;

	type128 st1=((type64) t2)&bot58bits;

	t3=t0-(type128)(x[4]-2*x[5])*(y[4]-2*y[5])-(type128)(x[3]-2*x[6])*(y[3]-2*y[6])
	-(type128)(x[2]-2*x[7])*(y[2]-2*y[7])-(type128)(x[1]-2*x[8])*(y[1]-2*y[8])+2*(t2>>58);
	z[0]=((type64) t3)&bot58bits;

	t0-=2*t5;
	t2=t0-(type128)(x[0]-x[1])*(y[0]-y[1])-(type128)(x[4]-2*x[6])*(y[4]-2*y[6])
		-(type128)(x[2]-2*x[8])*(y[2]-2*y[8])-(type128)(x[3]-2*x[7])*(y[3]-2*y[7])+(t3>>58);
	z[1]=((type64) t2)&bot58bits;

	t0-=t5;
	t3=t0-(type128)(x[0]-x[2])*(y[0]-y[2])-(type128)(x[5]-2*x[6])*(y[5]-2*y[6])
		-(type128)(x[3]-2*x[8])*(y[3]-2*y[8])-(type128)(x[4]-2*x[7])*(y[4]-2*y[7])+(t2>>58);
	z[2]=((type64) t3)&bot58bits;

	t0-=2*t6;
	t2=t0-(type128)(x[0]-x[3])*(y[0]-y[3])-(type128)(x[1]-x[2])*(y[1]-y[2])
		-(type128)(x[4]-2*x[8])*(y[4]-2*y[8])-(type128)(x[5]-2*x[7])*(y[5]-2*y[7])+(t3>>58);
	z[3]=((type64) t2)&bot58bits;

	t0-=t6;
	t3=t0-(type128)(x[0]-x[4])*(y[0]-y[4])-(type128)(x[1]-x[3])*(y[1]-y[3])
		-(type128)(x[5]-2*x[8])*(y[5]-2*y[8])-(type128)(x[6]-2*x[7])*(y[6]-2*y[7])+(t2>>58);
	z[4]=((type64) t3)&bot58bits;

	t0-=2*t7;
	t2=t0-(type128)(x[0]-x[5])*(y[0]-y[5])-(type128)(x[1]-x[4])*(y[1]-y[4])
		-(type128)(x[2]-x[3])*(y[2]-y[3])-(type128)(x[6]-2*x[8])*(y[6]-2*y[8])+(t3>>58);
	z[5]=((type64) t2)&bot58bits;

	t0-=t7;
	t3=t0-(type128)(x[0]-x[6])*(y[0]-y[6])-(type128)(x[1]-x[5])*(y[1]-y[5])
		-(type128)(x[2]-x[4])*(y[2]-y[4])-(type128)(x[7]-2*x[8])*(y[7]-2*y[8])+(t2>>58);
	z[6]=((type64) t3)&bot58bits;

	t0-=2*t8;
	t2=t0-(type128)(x[0]-x[7])*(y[0]-y[7])-(type128)(x[1]-x[6])*(y[1]-y[6])
		-(type128)(x[2]-x[5])*(y[2]-y[5])-(type128)(x[3]-x[4])*(y[3]-y[4])+(t3>>58);
	z[7]=((type64) t2)&bot58bits;

	st1+=(t2>>58);
	z[8]=((type64)st1)&bot58bits;
	z[0]+=2*(type64)(st1>>58);
}

/* Inverse x = 1/x = x^(p-2) mod p */

void ginv(type64 *x)
{
	int i;
	type64 x127[9],w[9],t[9],z[9];
	gsqr(x,x127);       /* x127=x^2 */
	gmul(x127,x,t);     /* t=x^3 */
	gsqr(t,x127);       /* x127=x^6 */
	gmul(x127,x,w);     /* w=x^7 */
	gsqr(w,x127);      
	gsqr(x127,t);  
	gsqr(t,x127);       /* x127=x^56 */
	gcopy(x127,t);		/* t=x^56 */
	gmul(w,t,x127);     /* x127=x^63  */ 
	gsqr(x127,t);
	gmul(t,x,x127);     /* x127=x^127 */

	gsqr(x127,t);
	gmul(t,x,z);        /* z=x^255 */

	gcopy(z,w);
	for (i=0;i<4;i++)
	{
		gsqr(z,t);
		gsqr(t,z);
	}         
	gmul(z,w,t);        /* z=z16  */   
  
	gcopy(t,w);
	for (i=0;i<8;i++)
	{
		gsqr(t,z);
		gsqr(z,t);
	}    
	gmul(t,w,z);        /* z=z32  */    

	gcopy(z,w);
	for (i=0;i<16;i++)
	{
		gsqr(z,t);
		gsqr(t,z);
	}    
	gmul(z,w,t);        /* z=z64  */    

	gcopy(t,w);
	for (i=0;i<32;i++)
	{
		gsqr(t,z);
		gsqr(z,t);
	}    
	gmul(t,w,z);        /* z=z128  */   

	gcopy(z,w);
	for (i=0;i<64;i++)
	{
		gsqr(z,t);
		gsqr(t,z);
	}    
	gmul(z,w,t);        /* z=z256  */     

	gcopy(t,w);
	for (i=0;i<128;i++)
	{
		gsqr(t,z);
		gsqr(z,t);
	}    
	gmul(t,w,z);      /* z=z512  */      

	gsqr(z,t);
	gsqr(t,z);
	gsqr(z,t);
	gsqr(t,z);
	gsqr(z,t);
	gsqr(t,z);
	gsqr(z,t);
	gmul(t,x127,z);
	gsqr(z,t);
	gsqr(t,z);
	gmul(z,x,t);
	gcopy(t,x);
}

/* P+=P */

void double_1(ECp *P)
{
	type64 a[9],b[9],e[9],f[9],g[9],h[9];
	gsqr(P->x,a);
	gsqr(P->y,b);
	gcopy(P->t,e);
	gmul2(e);
	gadd(a,b,g);
	gcopy(g,f); f[0]-=2;
	gsub(a,b,h);
	gmul(e,f,P->x); 
	gmul(g,h,P->y); 
	gsqr(g,P->z);
	gsb2(g,P->z);
	gmul(e,h,P->t);  
	scr(P->z);
}

void double_2(ECp *P)
{
	type64 a[9],b[9],c[9],e[9],f[9],g[9],h[9];
	gsqr(P->x,a);
	gsqr(P->y,b); 
	gsqr2(P->z,c); /*gsqr(P->z,c); gmul2(c); */
	gadd(P->x,P->y,g); gsqr(g,e); gdec(a,e); gdec(b,e); 
	gadd(a,b,g); 
	gsub(g,c,f); 
	gsub(a,b,h); 
	gmul(e,f,P->x); 
	gmul(g,h,P->y);
	gmul(f,g,P->z); 
}

void double_3(ECp *P)
{
	type64 a[9],b[9],c[9],e[9],f[9],g[9],h[9];
	gsqr(P->x,a);
	gsqr(P->y,b);
	gsqr2(P->z,c); /*gsqr(P->z,c); gmul2(c); */
	gadd(P->x,P->y,g); gsqr(g,e); gdec(a,e); gdec(b,e); 
	gadd(a,b,g);
	gsub(g,c,f);
	gsub(a,b,h);
	gmul(e,f,P->x); 
	gmul(g,h,P->y); 
	gmul(f,g,P->z);
	gmul(e,h,P->t); 
}

/* P+=Q; */

void add_1(ECp *Q,ECp *P)
{
	type64 a[9],b[9],c[9],d[9],e[9],f[9],g[9],h[9];
	gmul(P->x,Q->x,a);
	gmul(P->y,Q->y,b);
	gmul(P->t,Q->t,c);
	gadd(P->z,c,f);  /* reversed sign as d is negative */
	gsub(P->z,c,g);
	gsub(b,a,h);
	gadd(P->x,P->y,c); gadd(Q->x,Q->y,d); gmul(c,d,e); gdec(a,e); gdec(b,e);
	gmul(e,f,P->x); 
	gmul(g,h,P->y); 
	gmul(f,g,P->z); 
	gmul(e,h,P->t); 
}

void add_2(ECp *Q,ECp *P)
{
	type64 a[9],b[9],c[9],d[9],e[9],f[9],g[9],h[9];
	gmul(P->x,Q->x,a);
	gmul(P->y,Q->y,b);
	gmul(P->t,Q->t,c);
	gmul(P->z,Q->z,d);
	gadd(d,c,f);  /* reversed sign as d is negative */
	gsub(d,c,g);
	gsub(b,a,h);
	gadd(P->x,P->y,c); gadd(Q->x,Q->y,d); gmul(c,d,e); gdec(a,e); gdec(b,e);
	gmul(e,f,P->x); 
	gmul(g,h,P->y); 
	gmul(f,g,P->z); 
}

/* P=0 */

void inf(ECp *P)
{
	int i;
	for (i=0;i<=8;i++)
		P->x[i]=P->y[i]=P->z[i]=P->t[i]=0;
	P->y[0]=P->z[0]=1;
}

/* Initialise P */

void init(type64 *x,type64 *y,ECp *P)
{
	int i;
	for (i=0;i<=8;i++)
	{
		P->x[i]=x[i];
		P->y[i]=y[i];
		P->z[i]=0;
	}
	P->z[0]=1;
	gmul(x,y,P->t);
}

/* P=Q */

void copy(ECp *Q,ECp *P)
{
	int i;
	for (i=0;i<=8;i++)
	{
		P->x[i]=Q->x[i];
		P->y[i]=Q->y[i];
		P->z[i]=Q->z[i];
		P->t[i]=Q->t[i];
	}
}

/* P=-Q */

void neg(ECp *Q,ECp *P)
{
	int i;
	for (i=0;i<=8;i++)
	{
		P->x[i]=-Q->x[i]; 
		P->y[i]=Q->y[i];
		P->z[i]=Q->z[i];
		P->t[i]=-Q->t[i]; 
	}
}

/* Make Affine */

void norm(ECp *P)
{
	type64 w[9],t[9];
	gcopy(P->z,w);
	ginv(w);
	gmul(P->x,w,t); scr(t); gcopy(t,P->x);
	gmul(P->y,w,t); scr(t); gcopy(t,P->y);
	gmul(P->z,w,t); scr(t); gcopy(t,P->z);
	gmul(P->t,w,t); scr(t); gcopy(t,P->t);
}

/* Precomputation */

void precomp(ECp *P,ECp W[])
{
	inf(&W[0]);
	copy(P,&W[1]); gmuli(W[1].t,376014);
	copy(P,&W[2]); double_1(&W[2]);
	copy(&W[2],&W[3]); add_1(&W[1],&W[3]);

	copy(&W[2],&W[4]); double_3(&W[4]);
	copy(&W[4],&W[5]); add_1(&W[1],&W[5]);
	copy(&W[3],&W[6]); double_3(&W[6]);
	copy(&W[6],&W[7]); add_1(&W[1],&W[7]);
	copy(&W[4],&W[8]); double_3(&W[8]);

#if WINDOW>4
	copy(&W[8],&W[9]); add_1(&W[1],&W[9]);

	copy(&W[5],&W[10]); double_3(&W[10]);
	copy(&W[10],&W[11]); add_1(&W[1],&W[11]);

	copy(&W[6],&W[12]); double_3(&W[12]);
	copy(&W[12],&W[13]); add_1(&W[1],&W[13]);

	copy(&W[7],&W[14]); double_3(&W[14]);
	copy(&W[14],&W[15]); add_1(&W[1],&W[15]);

	copy(&W[8],&W[16]); double_3(&W[16]);
#if WINDOW>5
	copy(&W[16],&W[17]); add_1(&W[1],&W[17]);

	copy(&W[9],&W[18]); double_3(&W[18]);
	copy(&W[18],&W[19]); add_1(&W[1],&W[19]);

	copy(&W[10],&W[20]); double_3(&W[20]);
	copy(&W[20],&W[21]); add_1(&W[1],&W[21]);

	copy(&W[11],&W[22]); double_3(&W[22]);
	copy(&W[22],&W[23]); add_1(&W[1],&W[23]);

	copy(&W[12],&W[24]); double_3(&W[24]);
	copy(&W[24],&W[25]); add_1(&W[1],&W[25]);

	copy(&W[13],&W[26]); double_3(&W[26]);
	copy(&W[26],&W[27]); add_1(&W[1],&W[27]);

	copy(&W[14],&W[28]); double_3(&W[28]);
	copy(&W[28],&W[29]); add_1(&W[1],&W[29]);

	copy(&W[15],&W[30]); double_3(&W[30]);
	copy(&W[30],&W[31]); add_1(&W[1],&W[31]);

	copy(&W[16],&W[32]); double_3(&W[32]);
#endif
#endif
/* premultiply t parameter by curve constant */

	gmuli(W[2].t,376014);
	gmuli(W[3].t,376014);
	gmuli(W[4].t,376014);
	gmuli(W[5].t,376014);
	gmuli(W[6].t,376014);
	gmuli(W[7].t,376014);
	gmuli(W[8].t,376014);
#if WINDOW>4
	gmuli(W[9].t,376014);
	gmuli(W[10].t,376014);
	gmuli(W[11].t,376014);
	gmuli(W[12].t,376014);
	gmuli(W[13].t,376014);
	gmuli(W[14].t,376014);
	gmuli(W[15].t,376014);
	gmuli(W[16].t,376014);
#if WINDOW>5
	gmuli(W[17].t,376014);
	gmuli(W[18].t,376014);
	gmuli(W[19].t,376014);
	gmuli(W[20].t,376014);
	gmuli(W[21].t,376014);
	gmuli(W[22].t,376014);
	gmuli(W[23].t,376014);
	gmuli(W[24].t,376014);
	gmuli(W[25].t,376014);
	gmuli(W[26].t,376014);
	gmuli(W[27].t,376014);
	gmuli(W[28].t,376014);
	gmuli(W[29].t,376014);
	gmuli(W[30].t,376014);
	gmuli(W[31].t,376014);
	gmuli(W[32].t,376014);
#endif
#endif
}

/* Windows of width 4-6 */

void window(ECp *Q,ECp *P)
{
	double_2(P);
	double_2(P);
	double_2(P);
#if WINDOW>4
	double_2(P);
#if WINDOW>5
	double_2(P);
#endif
#endif
	double_3(P);
	add_2(Q,P);
}

/*
Constant time table look-up - borrowed from ed25519 
*/

void fe_cmov(type64 f[],type64 g[],int ib)
{
  type64 b=ib;
  b=-b;
  f[0]^=(f[0]^g[0])&b;
  f[1]^=(f[1]^g[1])&b;
  f[2]^=(f[2]^g[2])&b;
  f[3]^=(f[3]^g[3])&b;
  f[4]^=(f[4]^g[4])&b;
  f[5]^=(f[5]^g[5])&b;
  f[6]^=(f[6]^g[6])&b;
  f[7]^=(f[7]^g[7])&b;
  f[8]^=(f[8]^g[8])&b;
}

static void cmov(ECp *w,ECp *u,int b)
{
  fe_cmov(w->x,u->x,b);
  fe_cmov(w->y,u->y,b);
  fe_cmov(w->z,u->z,b);
  fe_cmov(w->t,u->t,b);
}

/* return 1 if b==c, no branching */
static int equal(int b,int c)
{
	int x=b^c;
	x-=1;  /* if x=0, x now -1 */
	return ((x>>31)&1);
}

static void select(ECp *T,ECp W[],int b)
{
  ECp MT; 
  int m=b>>31;
  int babs=(b^m)-m;

  cmov(T,&W[0],equal(babs,0));  /* conditional move */
  cmov(T,&W[1],equal(babs,1));
  cmov(T,&W[2],equal(babs,2));
  cmov(T,&W[3],equal(babs,3));
  cmov(T,&W[4],equal(babs,4));
  cmov(T,&W[5],equal(babs,5));
  cmov(T,&W[6],equal(babs,6));
  cmov(T,&W[7],equal(babs,7));
  cmov(T,&W[8],equal(babs,8)); 
#if WINDOW>4
  cmov(T,&W[9],equal(babs,9));
  cmov(T,&W[10],equal(babs,10));
  cmov(T,&W[11],equal(babs,11));
  cmov(T,&W[12],equal(babs,12));
  cmov(T,&W[13],equal(babs,13));
  cmov(T,&W[14],equal(babs,14));
  cmov(T,&W[15],equal(babs,15));
  cmov(T,&W[16],equal(babs,16)); 
#if WINDOW>5 
  cmov(T,&W[17],equal(babs,17));
  cmov(T,&W[18],equal(babs,18));
  cmov(T,&W[19],equal(babs,19));
  cmov(T,&W[20],equal(babs,20));
  cmov(T,&W[21],equal(babs,21));
  cmov(T,&W[22],equal(babs,22));
  cmov(T,&W[23],equal(babs,23));
  cmov(T,&W[24],equal(babs,24));  
  cmov(T,&W[25],equal(babs,25));
  cmov(T,&W[26],equal(babs,26));
  cmov(T,&W[27],equal(babs,27));
  cmov(T,&W[28],equal(babs,28));
  cmov(T,&W[29],equal(babs,29));
  cmov(T,&W[30],equal(babs,30));
  cmov(T,&W[31],equal(babs,31));
  cmov(T,&W[32],equal(babs,32));
#endif
#endif
  neg(T,&MT);  /* minus t */
  cmov(T,&MT,m&1);
}

/* Point Multiplication - exponent is 519 bits */

void mul(int *w,ECp *P)
{
	ECp W[1+(1<<(WINDOW-1))],S[2],Q;
	int i,j,m;
	precomp(P,W);

	copy(&W[w[PANES-1]],P);  
	for (i=PANES-2;i>=0;i--)
	{
#ifdef CACHE_SAFE
		select(&Q,W,w[i]);
		window(&Q,P);
#else
		m=w[i]>>(8*sizeof(int)-1);
		j=(w[i]^m)-m;  /* j=abs(w[i]) */
		copy(&W[j],&S[0]);
		neg(&W[j],&S[1]);
		window(&S[m&1],P);
#endif
	}
	norm(P); 
}

int crypto_dh_keypair(unsigned char *pk,unsigned char *sk)
{
	int i,x,w[PANES];
	signed char sh;
	type64 xs[9],ys[9];
	ECp P;

#ifdef HAVE_MAIN
	for (i=0;i<PANES-1;i++)
		sk[i]=rand();
#else
	randombytes(sk,PANES-1);
#endif

	for (i=0;i<PANES-1;i++)
	{
		sh=sk[i]; sh<<=4; sh>>=4; sk[i]=sh;
		w[i]=(int)sh;
	}
	w[PANES-1]=1;

/* Base point on Curve (from SafeCurves Website) */

	xs[0]=0x2A940A2F19BA6CLL;
	xs[1]=0x3EC4CD920E2A8CLL;
	xs[2]=0x1D568FC99C6059DLL;
	xs[3]=0x3331C90D2C6BA52LL;
	xs[4]=0xC6203913F6ECC5LL;
	xs[5]=0x1B2063B22FCF270LL;
	xs[6]=0x2878A3BFD9F42FCLL;
	xs[7]=0x6277E432C8A5ACLL;
	xs[8]=0x752CB45C48648BLL;

	ys[0]=0xcLL;
	ys[1]=0x0LL;
	ys[2]=0x0LL;
	ys[3]=0x0LL;
	ys[4]=0x0LL;
	ys[5]=0x0LL;
	ys[6]=0x0LL;
	ys[7]=0x0LL;
	ys[8]=0x0LL;

	init(xs,ys,&P);
	mul(w,&P);

	memcpy(pk,P.x,72);
	memcpy(&pk[72],P.y,72);
	return 0;
}

int crypto_dh(unsigned char *s,const unsigned char *pk,const unsigned char *sk)
{
	int i,x,w[PANES];
	signed char sh;
	type64 xs[9],ys[9];
	ECp P;

	for (i=0;i<PANES-1;i++)
		w[i]=(int)(signed char)sk[i];
	w[PANES-1]=1;

	memcpy(xs,pk,72);
	memcpy(ys,&pk[72],72);

	init(xs,ys,&P);
	mul(w,&P);

	memcpy(s,P.x,72);

	return 0;
}

#ifdef HAVE_MAIN

int main()
{
	int i,j;
	unsigned char ska[130],pka[144],ssa[72];
	unsigned char skb[130],pkb[144],ssb[72];
	unsigned long long skl,pkl;

	for (j=0;j<10;j++)
	{
		crypto_dh_ed521gs_keypair(pka,ska);

		printf("Alice  private= ");
		for (i=0;i<130;i++) printf("%02x",ska[i]);
		printf("\n");
		printf("Alice's public= ");
		for (i=0;i<144;i++) printf("%02x",pka[i]);
		printf("\n");

		if (crypto_dh_ed521gs_keypair(pkb,skb)<0)
		{
			printf("problem\n");
			break;
		}
		printf("Bob  private=   ");
		for (i=0;i<130;i++) printf("%02x",skb[i]);
		printf("\n");
		printf("Bob's public=   ");
		for (i=0;i<144;i++) printf("%02x",pkb[i]);
		printf("\n");

		if (crypto_dh_ed521gs_ref(ssa,pka,skb)<0)
		{
			printf("problem\n");
			break;
		}	

		printf("Alice's secret= ");
		for (i=0;i<72;i++) printf("%02x",ssa[i]);
		printf("\n");

		crypto_dh_ed521gs_ref(ssb,pkb,ska);

		printf("Bob's secret=   ");
		for (i=0;i<72;i++) printf("%02x",ssb[i]);
		printf("\n\n");

	}
	return 0;
}	

#endif

